const std = @import("std");
const std_log = std.log;
const log = std_log.scoped(.server);
const net = std.net;
const posix = std.posix;

const TcpServer = @This();
const Dictionary = @import("Dictionary.zig");
const Router = @import("Router.zig");
const Resp = @import("Resp.zig");
const Request = @import("command.zig").Request;
const ThreadPool = std.Thread.Pool;
const xev = @import("xev");
const TCP = xev.TCP;
const uuid = @import("uuid");

/// router is responsible for handling the commands received by the server.
router: Router,

/// allocator is used to allocate memory for the server.
allocator: std.mem.Allocator,

dict: *Dictionary,

/// pool is used to handle incoming connections concurrently.
pool: *ThreadPool,

tcp: ?*TCP = null,

/// init allocates memory for the server.
/// Caller should call self.deinit to free the memory.
pub fn init(allocator: std.mem.Allocator) !TcpServer {
    const obj_store = try Dictionary.init(allocator);
    const router = try Router.init(allocator);

    const opt = ThreadPool.Options{
        .n_jobs = 4, // TODO: Make this configurable
        .allocator = allocator,
    };
    var pool = try allocator.create(ThreadPool);
    try pool.init(opt);

    return TcpServer{
        .allocator = allocator,
        .router = router,
        .dict = obj_store,
        .pool = pool,
    };
}

pub fn deinit(self: *TcpServer) void {
    defer std.debug.print("Server deinitialised\n", .{});

    self.pool.deinit();
    self.allocator.destroy(self.pool);
    self.dict.deinit();
    self.router.deinit();
    self.* = undefined;
}

pub fn listenAndServe(self: *TcpServer, address: std.net.Address) !void {
    var loop = try xev.Loop.init(.{});
    defer loop.deinit();

    var server = try TCP.init(address);
    self.tcp = &server;

    // Bind and listen
    try server.bind(address);
    try server.listen(1);

    // Completions we need
    // defer self.allocator.destroy(completion);

    const userdata: ?*TcpServer = self;

    while (true) {
        log.debug("accepting connection", .{});

        // Allocate completion, reuse it in entire connection flow
        // accept -> read -> write -> close (valid since we disarm each flow after exec).
        // Then deallocate after connection close or at failure points
        const completion = try self.allocator.create(xev.Completion);
        server.accept(&loop, completion, TcpServer, userdata, connectionDidAccept);

        try loop.run(.until_done);
    }

    // var server_closed = false;
    // server.close(&loop, &completion, bool, &server_closed, (struct {
    //     fn callback(
    //         ud: ?*bool,
    //         _: *xev.Loop,
    //         _: *xev.Completion,
    //         _: TCP,
    //         r: TCP.CloseError!void,
    //     ) xev.CallbackAction {
    //         _ = r catch unreachable;
    //         ud.?.* = true;
    //         return .disarm;
    //     }
    // }).callback);

    // try loop.run(.until_done);

    // log.debug("server_closed {}", .{server_closed});
}

/// handleConnection is reponsible for handling incoming connections.
/// It reads from the client, deserialises the message, routes it to the appropriate handler,
/// and writes the response back to the client.
///
/// Arguments:
///     self: The server instance
///     connection: The socket file descriptor for the client connection
///
/// Returns: void
fn handleConnection(self: *TcpServer, connection: posix.socket_t) void {
    defer posix.close(connection);

    var buf: [4028]u8 = undefined;
    const read = posix.read(connection, &buf) catch |err| {
        log.err("Failed to read from client: {}", .{err});
        return;
    };

    if (read == 0) {
        log.info("Read 0 bytes from client, closing connection", .{});
        return;
    }

    const resp = Resp.init(self.allocator);
    defer resp.deinit();

    const msg = resp.deserialise(buf[0..read]) catch |err| {
        log.err("Failed to deserialise message: {}", .{err});
        return;
    };

    const req = Request{ .message = msg, .dict = self.dict };
    const resp_msg = self.router.route(req);

    const raw_msg = resp.serialise(resp_msg) catch |err| {
        log.err("Failed to serialise message: {}", .{err});
        return;
    };

    writeAll(connection, raw_msg) catch |err| {
        log.err("Failed to write to client: {}", .{err});
    };
}

fn writeAll(socket: posix.socket_t, msg: []const u8) !void {
    var pos: usize = 0;
    while (pos < msg.len) {
        const written = try posix.write(socket, msg[pos..]);
        if (written == 0) {
            return error.Closed;
        }
        pos += written;
    }
}

// for every accepted connection, pass completion, conn id,
// accept -> read
//  -> success -> write
//      -> success -> close
//      -> error -> close
//  -> error -> close
//
// for every accept, generate a conn id and allocate mem on heap,
// deinit in accept callback
// for every read, copy conn id and allocator, allocate new mem on heap
// deinit in read callback
// repeat for write and close

fn connectionDidAccept(
    self: ?*TcpServer,
    loop: *xev.Loop,
    completion: *xev.Completion,
    result: TCP.AcceptError!TCP,
) xev.CallbackAction {
    const l = std_log.scoped(.connectionDidAccept);

    var connection = result catch |err| {
        l.err("failed to accept, deallocating completion {}", .{err});
        self.?.allocator.destroy(completion);
        return .disarm;
    };

    log.debug("accepted connection {}", .{connection});
    const recv_buf = self.?.allocator.alloc(u8, 4068) catch |err| {
        l.err("failed to allocate recv_buf memory, closing connection: {}", .{err});
        connection.close(loop, completion, TcpServer, self, connectionDidClose);
        return .disarm;
    };

    connection.read(loop, completion, .{ .slice = recv_buf }, TcpServer, self, connectionDidRead);
    return .disarm;
}

fn connectionDidRead(
    self: ?*TcpServer,
    loop: *xev.Loop,
    completion: *xev.Completion,
    connection: TCP,
    read_buf: xev.ReadBuffer,
    result: TCP.ReadError!usize,
) xev.CallbackAction {
    defer self.?.allocator.free(read_buf.slice);

    const l = std_log.scoped(.connectionDidRead);

    const recv_len = result catch |err| {
        l.err("failed to read, closing connection: {}", .{err});
        connection.close(loop, completion, TcpServer, self, connectionDidClose);
        return .disarm;
    };

    const resp = Resp.init(self.?.allocator);
    defer resp.deinit();

    const msg = resp.deserialise(read_buf.slice[0..recv_len]) catch |err| {
        l.err("failed to deserialise, closing connection: {}", .{err});
        connection.close(loop, completion, TcpServer, self, connectionDidClose);
        return .disarm;
    };

    const resp_msg = self.?.router.route(Request{ .message = msg, .dict = self.?.dict });

    const raw_msg = resp.serialise(resp_msg) catch |err| {
        l.err("failed to serialise, closing connection: {}", .{err});
        connection.close(loop, completion, TcpServer, self, connectionDidClose);
        return .disarm;
    };

    const write_buf = self.?.allocator.alloc(u8, raw_msg.len) catch |err| {
        l.err("failed to allocate write buffer, closing connection: {}", .{err});
        connection.close(loop, completion, TcpServer, self, connectionDidClose);
        return .disarm;
    };

    @memcpy(write_buf, raw_msg);
    connection.write(loop, completion, .{ .slice = write_buf }, TcpServer, self, connectionDidWrite);
    return .disarm;
}

fn connectionDidWrite(
    self: ?*TcpServer,
    loop: *xev.Loop,
    completion: *xev.Completion,
    connection: TCP,
    write_buf: xev.WriteBuffer,
    result: TCP.WriteError!usize,
) xev.CallbackAction {
    defer self.?.allocator.free(write_buf.slice);

    const l = std_log.scoped(.connectionDidWrite);
    const written = result catch |err| {
        l.err("failed to write, closing connection: {}", .{err});
        connection.close(loop, completion, TcpServer, self, connectionDidClose);
        return .disarm;
    };

    l.debug("wrote {d}, closing connection", .{written});
    connection.close(loop, completion, TcpServer, self, connectionDidClose);
    return .disarm;
}

fn connectionDidClose(
    self: ?*TcpServer,
    _: *xev.Loop,
    completion: *xev.Completion,
    _: TCP,
    result: TCP.CloseError!void,
) xev.CallbackAction {
    self.?.allocator.destroy(completion);

    const l = std_log.scoped(.connectionDidClose);
    if (result) {
        l.debug("successfully closed connection", .{});
    } else |err| {
        l.err("failed to close connection: {}", .{err});
    }
    return .disarm;
}
