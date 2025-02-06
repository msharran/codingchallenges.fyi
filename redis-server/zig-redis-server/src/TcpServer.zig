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

const NTHREAD: usize = 20;

/// router is responsible for handling the commands received by the server.
router: Router,

/// allocator is used to allocate memory for the server.
allocator: std.mem.Allocator,

dict: *Dictionary,

/// pool is used to handle incoming connections concurrently.
pool: *ThreadPool,

tcp_server: ?*TCP = null,

/// init allocates memory for the server.
/// Caller should call self.deinit to free the memory.
pub fn init(allocator: std.mem.Allocator) !TcpServer {
    const obj_store = try Dictionary.init(allocator);
    const router = try Router.init(allocator);

    const opt = ThreadPool.Options{
        .n_jobs = NTHREAD, // TODO: Make this configurable
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
    var server = try TCP.init(address);
    self.tcp_server = &server;

    // Bind and listen
    try server.bind(address);
    try server.listen(1);

    var loop = xev.Loop.init(.{}) catch unreachable;
    defer loop.deinit();
    // Allocate completion, reuse it in entire connection flow
    // accept -> read -> write -> close (valid since we disarm each flow after exec).
    // Then deallocate after connection close or at failure points

    log.info("accepting connection", .{});
    // const completion = self.allocator.create(xev.Completion) catch unreachable;
    var completion: xev.Completion = undefined;

    const self_optional: ?*TcpServer = self;
    self.tcp_server.?.accept(&loop, &completion, TcpServer, self_optional, connectionDidAccept);

    loop.run(.until_done) catch unreachable;

    // var server_closed = false;
    // server.close(&loop, completion, bool, &server_closed, (struct {
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

    // log.info("server_closed {}", .{server_closed});
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
    self.?.tcp_server.?.accept(loop, completion, TcpServer, self, connectionDidAccept);

    const connection = result catch |err| {
        l.err("failed to accept new connection {}", .{err});
        return .disarm;
    };

    l.info("spawning connection handler", .{});
    self.?.pool.spawn(handleConnection, .{ self, connection }) catch unreachable;

    return .disarm;
}

fn handleConnectionSync(self: *TcpServer, connection: posix.socket_t) void {
    defer posix.close(connection);

    const l = std_log.scoped(.handleConnection);

    // 2.5 second timeout
    // const timeout = posix.timeval{ .tv_sec = 2, .tv_usec = 500_000 };
    const timeout = posix.timeval{ .tv_sec = 0, .tv_usec = 500_000 };
    posix.setsockopt(connection, posix.SOL.SOCKET, posix.SO.RCVTIMEO, &std.mem.toBytes(timeout)) catch |err| {
        l.err("Failed to set receive timeout: {}", .{err});
        return;
    };
    posix.setsockopt(connection, posix.SOL.SOCKET, posix.SO.SNDTIMEO, &std.mem.toBytes(timeout)) catch |err| {
        l.err("Failed to set send timeout: {}", .{err});
        return;
    };

    var buf: [4028]u8 = undefined;
    const read = posix.read(connection, &buf) catch |err| {
        l.err("Failed to read from client: {}", .{err});
        return;
    };

    if (read == 0) {
        l.info("Read 0 bytes from client, closing connection", .{});
        return;
    }

    var resp = Resp.init(self.allocator);
    defer resp.deinit();

    const msg = resp.deserialise(buf[0..read]) catch |err| {
        l.err("Failed to deserialise message: {}", .{err});
        return;
    };

    const req = Request{ .message = msg, .dict = self.dict };
    const resp_msg = self.router.route(req);

    const raw_msg = resp.serialise(resp_msg) catch |err| {
        l.err("Failed to serialise message: {}", .{err});
        return;
    };

    writeAll(connection, raw_msg) catch |err| {
        l.err("Failed to write to client: {}", .{err});
    };
}

fn handleConnection(self: ?*TcpServer, connection: TCP) void {
    const l = std_log.scoped(.handleConnection);
    l.info("handling connection {}", .{connection});

    const timeout = posix.timeval{ .tv_sec = 0, .tv_usec = 500_000 };
    posix.setsockopt(connection.fd, posix.SOL.SOCKET, posix.SO.RCVTIMEO, &std.mem.toBytes(timeout)) catch |err| {
        l.err("Failed to set receive timeout: {}", .{err});
        return;
    };
    posix.setsockopt(connection.fd, posix.SOL.SOCKET, posix.SO.SNDTIMEO, &std.mem.toBytes(timeout)) catch |err| {
        l.err("Failed to set send timeout: {}", .{err});
        return;
    };

    // create new loop and completion for handling connections
    // since it's in a different thread'
    var loop = xev.Loop.init(.{}) catch unreachable;
    defer loop.deinit();
    log.info("accepting connection", .{});

    var completion: xev.Completion = undefined;
    var recv_buf: [4068]u8 = undefined;

    connection.read(&loop, &completion, .{ .slice = &recv_buf }, TcpServer, self, connectionDidRead);

    loop.run(.until_done) catch unreachable;
}

fn connectionDidRead(
    self: ?*TcpServer,
    loop: *xev.Loop,
    completion: *xev.Completion,
    connection: TCP,
    read_buf: xev.ReadBuffer,
    result: TCP.ReadError!usize,
) xev.CallbackAction {
    // defer self.?.allocator.free(read_buf.slice);

    const l = std_log.scoped(.connectionDidRead);

    const recv_len = if (result) |len| len else |err| switch (err) {
        error.EOF => 0,
        else => {
            l.err("failed to read, closing connection: {}", .{err});
            connection.close(loop, completion, TcpServer, self, connectionDidClose);
            return .disarm;
        },
    };

    var resp = Resp.init(self.?.allocator);
    defer resp.deinit();

    const msg = resp.deserialise(read_buf.slice[0..recv_len]) catch Resp.Message.err("failed to deserialise");

    const resp_msg = self.?.router.route(Request{ .message = msg, .dict = self.?.dict });

    const raw_msg = resp.serialise(resp_msg) catch "-Err: failed to deserialise\r\n";

    const write_buf = self.?.allocator.alloc(u8, raw_msg.len) catch |err| {
        l.err("failed to allocate write buffer, closing connection: {}", .{err});
        connection.close(loop, completion, TcpServer, self, connectionDidClose);
        return .disarm;
    };

    @memcpy(write_buf, raw_msg);
    connection.write(loop, completion, .{ .slice = write_buf }, TcpServer, self, connectionDidWrite);
    return .disarm;
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
    _: ?*TcpServer,
    _: *xev.Loop,
    _: *xev.Completion,
    _: TCP,
    result: TCP.CloseError!void,
) xev.CallbackAction {
    // self.?.allocator.destroy(completion);

    const l = std_log.scoped(.connectionDidClose);
    if (result) {
        l.debug("successfully closed connection", .{});
    } else |err| {
        l.err("failed to close connection: {}", .{err});
    }
    return .disarm;
}
