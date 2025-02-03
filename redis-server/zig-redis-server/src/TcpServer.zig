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

    const server = try TCP.init(address);

    // Bind and listen
    try server.bind(address);
    try server.listen(1);

    // Completions we need
    // defer self.allocator.destroy(completion);

    const userdata: ?*TcpServer = self;

    while (true) {
        log.debug("accepting connection", .{});
        const completion = try self.allocator.create(xev.Completion);
        server.accept(&loop, completion, TcpServer, userdata, (struct {
            fn callback(
                svr: ?*TcpServer,
                l: *xev.Loop,
                c: *xev.Completion,
                accept_result: TCP.AcceptError!TCP,
            ) xev.CallbackAction {
                var server_conn = accept_result catch unreachable;

                log.debug("accepted connection {}", .{server_conn});
                // Receive
                const recv_buf = svr.?.allocator.alloc(u8, 4068) catch unreachable; // FIXME: free me

                server_conn.read(l, c, .{ .slice = recv_buf }, TcpServer, svr, (struct {
                    fn callback(
                        rself: ?*TcpServer,
                        rl: *xev.Loop,
                        rc: *xev.Completion,
                        rconn: TCP,
                        rbuf: xev.ReadBuffer,
                        r: TCP.ReadError!usize,
                    ) xev.CallbackAction {
                        defer rself.?.allocator.free(rbuf.slice);
                        const recv_len = r catch unreachable;

                        const resp = Resp.init(rself.?.allocator);
                        defer resp.deinit();
                        const msg = resp.deserialise(rbuf.slice[0..recv_len]) catch Resp.Message.nil();
                        const req = Request{ .message = msg, .dict = rself.?.dict };
                        const resp_msg = rself.?.router.route(req);
                        const raw_msg = resp.serialise(resp_msg) catch "_\r\n";

                        const write_buf = rself.?.allocator.alloc(u8, raw_msg.len) catch unreachable;
                        @memcpy(write_buf, raw_msg);

                        rconn.write(rl, rc, .{ .slice = write_buf }, TcpServer, rself, (struct {
                            fn callback(
                                wself: ?*TcpServer,
                                wl: *xev.Loop,
                                wc: *xev.Completion,
                                wconn: TCP,
                                wbuf: xev.WriteBuffer,
                                _: TCP.WriteError!usize,
                            ) xev.CallbackAction {
                                defer wself.?.allocator.free(wbuf.slice);
                                // Close
                                wconn.close(wl, wc, TcpServer, wself, (struct {
                                    fn callback(
                                        cself: ?*TcpServer,
                                        _: *xev.Loop,
                                        cc: *xev.Completion,
                                        _: TCP,
                                        cr: TCP.CloseError!void,
                                    ) xev.CallbackAction {
                                        _ = cr catch unreachable;
                                        cself.?.allocator.destroy(cc);
                                        return .disarm;
                                    }
                                }).callback);
                                return .disarm;
                            }
                        }).callback);
                        return .disarm;
                    }
                }).callback);

                return .disarm;
            }
        }).callback);

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

// const AcceptCtx = struct {
//     connection_id: [36]u8,
//     allocator: std.mem.Allocator,

//     // allocate them in heap
//     accept_completion: *xev.Completion,

//     pub fn init(allocator: std.mem.Allocator, urn: [36]u8) !AcceptCtx {
//         log.debug("AcceptCtx init for connection {s}", .{urn});
//         return AcceptCtx{
//             .connection_id = urn,
//             .allocator = allocator,
//             .accept_completion = try allocator.create(xev.Completion),
//         };
//     }

//     pub fn deinit(self: *AcceptCtx) void {
//         log.debug("AcceptCtx deinit for connection {s}", .{self.connection_id});
//         self.allocator.destroy(self.accept_completion);
//         self.* = undefined;
//     }
// };

// const ReadCtx = struct {
//     connection_id: [36]u8,
//     allocator: std.mem.Allocator,
//     read_completion: *xev.Completion,
//     buf: [4028]u8,

//     pub fn init(allocator: std.mem.Allocator, urn: [36]u8) !ReadCtx {
//         log.debug("ReadCtx init for connection {s}", .{urn});
//         return ReadCtx{
//             .connection_id = urn,
//             .allocator = allocator,
//             .read_completion = try allocator.create(xev.Completion),
//             .buf = try allocator.alloc(u8, 4028),
//         };
//     }

//     pub fn deinit(self: *ReadCtx) void {
//         log.debug("ReadCtx deinit for connection {s}", .{self.connection_id});
//         self.allocator.destroy(self.read_completion);
//         self.allocator.free(self.buf);
//         self.* = undefined;
//     }
// };

// const WriteCtx = struct {
//     connection_id: [36]u8,
//     allocator: std.mem.Allocator,
//     write_completion: *xev.Completion,
//     buf: []u8,

//     pub fn init(allocator: std.mem.Allocator, urn: [36]u8, buf: []u8) !WriteCtx {
//         log.debug("WriteCtx init for connection {s}", .{urn});
//         return WriteCtx{
//             .connection_id = urn,
//             .allocator = allocator,
//             .write_completion = try allocator.create(xev.Completion),
//             .buf = buf,
//         };
//     }

//     pub fn deinit(self: *WriteCtx) void {
//         log.debug("WriteCtx deinit for connection {s}", .{self.connection_id});
//         self.allocator.destroy(self.write_completion);
//         self.* = undefined;
//     }
// };

// const CloseCtx = struct {
//     connection_id: [36]u8,
//     allocator: std.mem.Allocator,
//     close_completion: *xev.Completion,

//     pub fn init(allocator: std.mem.Allocator, urn: [36]u8) !CloseCtx {
//         log.debug("CloseCtx init for connection {s}", .{urn});
//         return CloseCtx{
//             .connection_id = urn,
//             .allocator = allocator,
//             .close_completion = try allocator.create(xev.Completion),
//         };
//     }

//     pub fn deinit(self: *CloseCtx) void {
//         log.debug("CloseCtx deinit for connection {s}", .{self.connection_id});
//         self.allocator.destroy(self.close_completion);
//         self.* = undefined;
//     }
// };

// fn acceptCallback(
//     a_ctx: ?*AcceptCtx,
//     loop: *xev.Loop,
//     _: *xev.Completion,
//     result: xev.TCP.AcceptError!xev.TCP,
// ) xev.CallbackAction {
//     const l = std_log.scoped(.event_accept);
//     l.debug("accepted connection {?s}", .{a_ctx.?.*.connection_id});
//     defer a_ctx.?.deinit();

//     // Handle accept errors
//     var connection = result catch |err| {
//         l.err("result err: {}", .{err});
//         return .disarm;
//     };

//     connection.read(
//         loop,
//         a_ctx.?.read_completion,
//         .{ .slice = a_ctx.?.*.read_buf },
//         AcceptCtx,
//         a_ctx,
//         readCallback,
//     );

//     // Accept loop

//     // const id = uuid.v7.new();
//     // const urn = uuid.urn.serialize(id);
//     // var ctx_next = Context.init(ctx.?.allocator, urn) catch |err| {
//     //     l.err("result err: {}", .{err});
//     //     ctx.?.deinit();
//     //     return .disarm;
//     // };

//     // log.info("Waiting for incoming connections", .{});
//     // tcp.accept(loop, ctx_next.accept_completion, Context, &ctx_next, acceptCallback);

//     return .disarm;
// }

// fn readCallback(
//     ctx: ?*AcceptCtx,
//     loop: *xev.Loop,
//     _: *xev.Completion,
//     tcp: xev.TCP,
//     _: xev.ReadBuffer,
//     result: xev.TCP.ReadError!usize,
// ) xev.CallbackAction {
//     const l = std_log.scoped(.event_read);
//     l.debug("connection_id={?s}", .{ctx.?.*.connection_id});

//     // Handle read errors
//     const bytes_read = result catch |err| {
//         l.err("read error, closing connection: {}", .{err});
//         tcp.close(loop, ctx.?.close_completion, AcceptCtx, ctx, closeCallback);
//         return .disarm;
//     };

//     // Check for EOF
//     if (bytes_read == 0) {
//         l.err("EOF during read, closing connection", .{});
//         tcp.close(loop, ctx.?.close_completion, AcceptCtx, ctx, closeCallback);
//         return .disarm;
//     }

//     // Write PONG response
//     const write_buf = "+PONG\r\n";
//     l.debug("sending PONG response", .{});

//     tcp.write(
//         loop,
//         ctx.?.write_completion,
//         .{ .slice = write_buf },
//         AcceptCtx,
//         ctx,
//         writeCallback,
//     );

//     // will be rearmed in acceptCallback
//     return .disarm;
// }

// fn writeCallback(
//     ctx: ?*AcceptCtx,
//     loop: *xev.Loop,
//     _: *xev.Completion,
//     tcp: xev.TCP,
//     write_buf: xev.WriteBuffer,
//     result: xev.TCP.WriteError!usize,
// ) xev.CallbackAction {
//     const l = std_log.scoped(.event_write);
//     l.debug("connection_id={?s} ", .{ctx.?.*.connection_id});

//     // Handle write errors
//     const written = result catch |err| {
//         l.err("Write error, closing conn: {}", .{err});
//         tcp.close(loop, ctx.?.close_completion, AcceptCtx, ctx, closeCallback);
//         return .disarm;
//     };

//     l.debug("Wrote data={s}, len={d}, closing connection", .{ write_buf.slice, written });

//     // Since we have successfully written to the connection, we can close it
//     tcp.close(loop, ctx.?.close_completion, AcceptCtx, ctx, closeCallback);

//     return .disarm;
// }

// fn closeCallback(
//     ctx: ?*AcceptCtx,
//     _: *xev.Loop,
//     _: *xev.Completion,
//     _: xev.TCP,
//     result: xev.TCP.CloseError!void,
// ) xev.CallbackAction {
//     const l = std_log.scoped(.event_close);
//     l.debug("connection_id={?s}", .{ctx.?.*.connection_id});

//     if (result) {} else |err| {
//         l.err("Close error: {}", .{err});
//     }

//     l.debug("connection closed, deallocating memory", .{});
//     ctx.?.deinit();
//     return .disarm;
// }
