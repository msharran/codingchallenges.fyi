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
const ThreadPool = xev.ThreadPool;
const Task = xev.ThreadPool.Task;
const Batch = xev.ThreadPool.Batch;
const xev = @import("xev");
const TCP = xev.TCP;
// const uuid = @import("uuid");

const NTHREAD: usize = 20;

/// router is responsible for handling the commands received by the server.
router: Router,

/// allocator is used to allocate memory for the server.
allocator: std.mem.Allocator,

dict: *Dictionary,

/// pool is used to handle incoming connections concurrently.
pool: ThreadPool,

tcp_server: ?*TCP = null,

/// init allocates memory for the server.
/// Caller should call self.deinit to free the memory.
pub fn init(allocator: std.mem.Allocator) !TcpServer {
    const obj_store = try Dictionary.init(allocator);
    const router = try Router.init(allocator);

    return TcpServer{
        .allocator = allocator,
        .router = router,
        .dict = obj_store,
        .pool = ThreadPool.init(.{}),
    };
}

pub fn deinit(self: *TcpServer) void {
    defer std.debug.print("Server deinitialised\n", .{});

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

    // const completion = self.allocator.create(xev.Completion) catch unreachable;
    var completion: xev.Completion = undefined;

    const self_optional: ?*TcpServer = self;
    self.tcp_server.?.accept(&loop, &completion, TcpServer, self_optional, connectionDidAccept);

    loop.run(.until_done) catch unreachable;

    // TODO: handle signal and close the server and release memory
    // properly
    //
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
    log.debug("connection accepted", .{});

    self.?.tcp_server.?.accept(loop, completion, TcpServer, self, connectionDidAccept);

    const connection = result catch |err| {
        l.err("failed to accept new connection {}", .{err});
        return .disarm;
    };

    // self.?.pool.spawn(handleConnection, .{ self.?, connection.fd }) catch unreachable;
    // const task = ThreadPool.Task
    // const batch = ThreadPool.Batch.from(task);
    // self.?.pool.schedule

    // create connection context to schedule in the thread pool
    // it's associated memory will be deallocated when connection is closed
    const conn_ctx = ConnectionCtx.init(self.?, connection.fd) catch |err| {
        l.err("failed to init connection context {}", .{err});
        return .disarm;
    };
    conn_ctx.scheduleInPool();

    return .disarm;
}

const ConnectionCtx = struct {
    task: Task,
    tcp_server: *TcpServer,
    connection: posix.socket_t,
    const conn_log = std_log.scoped(.connectionCtx);

    pub fn init(tcp_server: *TcpServer, connection: posix.socket_t) !*ConnectionCtx {
        const conn = try tcp_server.allocator.create(ConnectionCtx);
        conn.* = .{
            .tcp_server = tcp_server,
            .connection = connection,
            .task = undefined,
        };
        return conn;
    }

    pub fn deinit(self: *ConnectionCtx) void {
        posix.close(self.connection);
        self.tcp_server.allocator.destroy(self);
    }

    pub fn scheduleInPool(self: *ConnectionCtx) void {
        self.task = Task{ .callback = didSchedule };
        self.tcp_server.pool.schedule(Batch.from(&self.task));
        conn_log.debug("Scheduled task to thread pool", .{});
    }

    fn didSchedule(task_ptr: *Task) void {
        conn_log.debug("Starting task on a thread", .{});
        const self: *ConnectionCtx = @fieldParentPtr("task", task_ptr);
        self.tcp_server.handleConnection(self);
    }
};

fn handleConnection(self: *TcpServer, ctx: *ConnectionCtx) void {
    defer ctx.deinit();

    const l = std_log.scoped(.handleConnection);
    l.debug("handling connection", .{});

    // 2.5 second timeout
    // const timeout = posix.timeval{ .tv_sec = 2, .tv_usec = 500_000 };
    const timeout = posix.timeval{ .tv_sec = 0, .tv_usec = 500_000 };
    posix.setsockopt(ctx.connection, posix.SOL.SOCKET, posix.SO.RCVTIMEO, &std.mem.toBytes(timeout)) catch |err| {
        l.err("Failed to set receive timeout: {}", .{err});
        return;
    };
    posix.setsockopt(ctx.connection, posix.SOL.SOCKET, posix.SO.SNDTIMEO, &std.mem.toBytes(timeout)) catch |err| {
        l.err("Failed to set send timeout: {}", .{err});
        return;
    };

    var buf: [4028]u8 = undefined;
    const read = posix.read(ctx.connection, &buf) catch |err| {
        l.err("Failed to read from client: {}", .{err});
        return;
    };

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

    writeAll(ctx.connection, raw_msg) catch |err| {
        l.err("Failed to write to client: {}", .{err});
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
