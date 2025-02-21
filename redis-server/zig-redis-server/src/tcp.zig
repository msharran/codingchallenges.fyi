const std = @import("std");
const std_log = std.log;
const log = std_log.scoped(.server);
const net = std.net;
const posix = std.posix;

const Dictionary = @import("Dictionary.zig");
const Router = @import("Router.zig");
const Resp = @import("Resp.zig");
const Message = Resp.Message;
const Request = @import("command.zig").Request;
const ThreadPool = xev.ThreadPool;
const Task = xev.ThreadPool.Task;
const Batch = xev.ThreadPool.Batch;
const xev = @import("xev");
const TCP = xev.TCP;

// https://zig.news/xq/zig-build-explained-part-3-1ima
// const fio = @cImport({
//     @cInclude("fio.h");
// });
const fio = @import("fio.zig");

const BufferPool = std.heap.MemoryPool([4096]u8);
const ProtocolPool = std.heap.MemoryPool(Protocol);

const Protocol = struct {
    fio_protocol: fio.fio_protocol_s,
    server: *Server,

    pub fn init(server: *Server) *Protocol {
        const p = server.protocol_pool.create() catch unreachable;
        p.* = Protocol{ .server = server, .fio_protocol = fio.fio_protocol_s{
            .on_data = on_data,
            .on_close = on_close,
        } };
        return p;
    }

    pub fn deinit(self: *Protocol) void {
        self.server.protocol_pool.destroy(self);
    }

    fn on_data(uuid: isize, _: [*c]fio.fio_protocol_s) callconv(.C) void {
        // get the parent ptr, ie Protocol from fio_protocol
        // const self: *Protocol = @fieldParentPtr("fio_protocol", fio_protocol);

        // echo buffer
        var buffer: [1024]u8 = undefined;
        // cast buffer to ?*anyopaque for passing to c
        const buffer_ptr: ?*anyopaque = @ptrCast(&buffer);
        while (true) {
            const len: usize = @intCast(fio.fio_read(uuid, buffer_ptr, 1024));
            if (len <= 0) break;

            log.debug("Read ::::: {s}", .{buffer});

            var pong = "+PONG\r\n";
            const pong_ptr: ?*anyopaque = @ptrCast(&pong);
            const pong_len = pong.len;

            const wrote = fio.write2(uuid, .{
                .data = .{ .buffer = pong_ptr },
                .length = pong_len,
                .offset = 0,
                .after = .{ .dealloc = null },
                .urgent = false,
                .is_fd = false,
                .rsv = false,
                .rsv2 = false,
            });
            log.debug("Wrote {d} bytes", .{wrote});

            fio.fio_close(uuid);
        }
    }

    fn on_close(uuid: isize, fio_protocol: *fio.fio_protocol_s) callconv(.C) void {
        // get the parent ptr, ie Protocol from fio_protocol

        const proto: *Protocol = @fieldParentPtr("fio_protocol", fio_protocol);
        log.debug("Connection {d} closed.", .{uuid});
        // deinit self
        proto.deinit();
    }
};

pub const Server = struct {
    // const uuid = @import("uuid");

    /// router is responsible for handling the commands received by the server.
    router: Router,

    /// allocator is used to allocate memory for the server.
    allocator: std.mem.Allocator,

    protocol_pool: ProtocolPool,

    dict: *Dictionary,

    /// pool is used to handle incoming connections concurrently.
    pool: ThreadPool,

    xev_tcp_server: ?*TCP = null,

    /// init allocates memory for the server.
    /// Caller should call self.deinit to free the memory.
    pub fn init(allocator: std.mem.Allocator) !Server {
        const obj_store = try Dictionary.init(allocator);
        const router = try Router.init(allocator);

        return Server{
            .allocator = allocator,
            .router = router,
            .dict = obj_store,
            .pool = ThreadPool.init(.{}),
            .protocol_pool = ProtocolPool.init(allocator),
        };
    }

    pub fn deinit(self: *Server) void {
        defer log.info("Server deinitialised", .{});

        self.protocol_pool.deinit();
        self.dict.deinit();
        self.router.deinit();
        self.* = undefined;
    }

    /////// TEMPPPPPPP

    fn echo_on_open(uuid: isize, udata: ?*anyopaque) callconv(.C) void {
        // Protocol objects MUST be dynamically allocated when multi-threading.
        const self: *Server = @ptrCast(@alignCast(udata));
        const proto = Protocol.init(self);
        log.debug("New connection received", .{});

        fio.fio_attach(uuid, &proto.fio_protocol);
        fio.fio_timeout_set(uuid, 5);
    }

    const StartOptions = struct {
        port: []const u8 = "6377",
    };

    /// Start the IO reactor
    ///
    /// Will start listeners etc.
    pub fn start(self: *Server, _: StartOptions) !void {
        log.info("starting server", .{});

        const args = fio.fio_start_args{
            .threads = 4,
            .workers = 4,
        };

        if (fio.fio_listen(.{
            .port = "6377",
            .on_open = echo_on_open,
            .udata = self,
        }) == -1) {
            return error.NoListeningSocketAvailableForPort;
        }
        fio.fio_start(args);
    }

    // pub fn listenAndServe(self: *Server, address: std.net.Address) !void {
    //     var server = try TCP.init(address);
    //     self.xev_tcp_server = &server;

    //     // Bind and listen
    //     try server.bind(address);
    //     try server.listen(1);

    //     var loop = xev.Loop.init(.{}) catch unreachable;
    //     defer loop.deinit();
    //     // Allocate completion, reuse it in entire connection flow
    //     // accept -> read -> write -> close (valid since we disarm each flow after exec).
    //     // Then deallocate after connection close or at failure points

    //     // const completion = self.allocator.create(xev.Completion) catch unreachable;
    //     var completion: xev.Completion = undefined;

    //     const self_optional: ?*Server = self;
    //     self.xev_tcp_server.?.accept(&loop, &completion, Server, self_optional, onAccept);

    //     loop.run(.until_done) catch unreachable;

    //     // TODO: handle signal and close the server and release memory
    //     // properly
    //     //
    //     // var server_closed = false;
    //     // server.close(&loop, completion, bool, &server_closed, (struct {
    //     //     fn callback(
    //     //         ud: ?*bool,
    //     //         _: *xev.Loop,
    //     //         _: *xev.Completion,
    //     //         _: TCP,
    //     //         r: TCP.CloseError!void,
    //     //     ) xev.CallbackAction {
    //     //         _ = r catch unreachable;
    //     //         ud.?.* = true;
    //     //         return .disarm;
    //     //     }
    //     // }).callback);

    //     // try loop.run(.until_done);

    //     // log.info("server_closed {}", .{server_closed});
    // }

    fn onAccept(
        self: ?*Server,
        loop: *xev.Loop,
        completion: *xev.Completion,
        result: TCP.AcceptError!TCP,
    ) xev.CallbackAction {
        const l = std_log.scoped(.connectionDidAccept);
        log.debug("connection accepted", .{});

        self.?.xev_tcp_server.?.accept(loop, completion, Server, self, onAccept);

        const xev_connection = result catch |err| {
            l.err("failed to accept new connection {}", .{err});
            return .disarm;
        };

        // create connection context to schedule in the thread pool
        // it's associated memory will be deallocated when connection is closed
        const connection = Connection.init(self.?, xev_connection.fd) catch |err| {
            l.err("failed to init connection context {}", .{err});
            return .disarm;
        };
        connection.scheduleOnThreadPool();

        return .disarm;
    }
};

const Connection = struct {
    task: Task,
    server: *Server,
    connection: posix.socket_t,
    const conn_log = std_log.scoped(.connectionCtx);

    /// init allocates memory for this connection context, caller is responsible for deallocation
    /// with deinit
    pub fn init(svr: *Server, connection: posix.socket_t) !*Connection {
        const conn = try svr.allocator.create(Connection);
        conn.* = .{
            .server = svr,
            .connection = connection,
            .task = undefined,
        };
        return conn;
    }

    /// deinit frees memory associated with this connection context.
    /// Should be called when connection is closed.
    pub fn deinit(self: *Connection) void {
        posix.close(self.connection);
        self.server.allocator.destroy(self);
    }

    /// scheduleOnThread schedules this connection task in the thread pool.
    /// The onScheduled callback will process the request.
    pub fn scheduleOnThreadPool(self: *Connection) void {
        self.task = Task{ .callback = onScheduled };
        self.server.pool.schedule(Batch.from(&self.task));
        conn_log.debug("Scheduled task to thread pool", .{});
    }

    /// onScheduled is the callback that processes the connection's request.
    /// Should not be called directly, called by thread pool when task is scheduled.
    fn onScheduled(task_ptr: *Task) void {
        conn_log.debug("Starting task on a thread", .{});
        const self: *Connection = @fieldParentPtr("task", task_ptr);
        self.handleConnection(self.server);
    }

    fn handleConnection(connection: *Connection, server: *Server) void {
        defer connection.deinit();

        const l = std_log.scoped(.handleConnection);
        l.debug("handling connection", .{});

        // // 2.5 second timeout
        // const timeout = posix.timeval{ .tv_sec = 2, .tv_usec = 500_000 };
        // // const timeout = posix.timeval{ .tv_sec = 0, .tv_usec = 500_000 };
        // posix.setsockopt(ctx.connection, posix.SOL.SOCKET, posix.SO.RCVTIMEO, &std.mem.toBytes(timeout)) catch |err| {
        //     l.err("Failed to set receive timeout: {}", .{err});
        //     return;
        // };
        // posix.setsockopt(ctx.connection, posix.SOL.SOCKET, posix.SO.SNDTIMEO, &std.mem.toBytes(timeout)) catch |err| {
        //     l.err("Failed to set send timeout: {}", .{err});
        //     return;
        // };

        var buf: [4028]u8 = undefined;
        const read = posix.read(connection.connection, &buf) catch |err| {
            l.err("Failed to read from client: {}", .{err});
            return;
        };

        var resp = Resp.init(server.allocator);
        defer resp.deinit();

        const msg = if (read == 0)
            Message.err("empty request")
        else
            resp.deserialise(buf[0..read]) catch Message.err("failed to deserialise");

        var arena = std.heap.ArenaAllocator.init(server.allocator);
        var req = Request.init(&arena, msg, server.dict);
        defer req.deinit();

        const resp_msg = server.router.route(req);

        const raw_msg = resp.serialise(resp_msg) catch "-Err failed to serialise\r\n";
        writeAll(connection.connection, raw_msg) catch |err| {
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
};
