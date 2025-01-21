const std = @import("std");
const log = std.log.scoped(.server);
const net = std.net;
const posix = std.posix;

const Server = @This();
const Dictionary = @import("Dictionary.zig");
const Router = @import("Router.zig");
const Resp = @import("Resp.zig");
const Request = @import("command.zig").Request;
const ThreadPool = std.Thread.Pool;

/// router is responsible for handling the commands received by the server.
router: Router,

/// allocator is used to allocate memory for the server.
allocator: std.mem.Allocator,

dict: *Dictionary,

/// init allocates memory for the server.
/// Caller should call self.deinit to free the memory.
pub fn init(allocator: std.mem.Allocator) !Server {
    const obj_store = try Dictionary.init(allocator);
    const router = try Router.init(allocator);
    const s = Server{
        .allocator = allocator,
        .router = router,
        .dict = obj_store,
    };
    return s;
}

pub fn deinit(self: *Server) void {
    defer std.debug.print("Server deinitialised", .{});
    self.dict.deinit();
    self.router.deinit();
    self.* = undefined;
}

pub fn listenAndServe(self: *Server, address: std.net.Address) !void {
    const tpe: u32 = posix.SOCK.STREAM;
    const protocol = posix.IPPROTO.TCP;
    const listener = try posix.socket(address.any.family, tpe, protocol);
    defer posix.close(listener);

    try posix.setsockopt(listener, posix.SOL.SOCKET, posix.SO.REUSEADDR, &std.mem.toBytes(@as(c_int, 1)));
    try posix.bind(listener, &address.any, address.getOsSockLen());
    try posix.listen(listener, 128);

    log.info("Server listening on {}", .{address});

    // TODO: Implement ring buffer for reading and writing
    // https://discord.com/channels/1085221098129473637/1179194569800294550/1329122172685516860
    while (true) {
        var client_address: net.Address = undefined;
        var client_address_len: posix.socklen_t = @sizeOf(net.Address);

        const connection = posix.accept(listener, &client_address.any, &client_address_len, 0) catch |err| {
            log.err("Failed to accept connection: {}", .{err});
            return;
        };

        self.handle_connection(connection, client_address);
    }
}

fn handle_connection(self: *Server, connection: posix.socket_t, client_addr: net.Address) void {
    defer posix.close(connection);
    log.info("Client connected: {}", .{client_addr});
    defer log.info("Client connection closed: {}", .{client_addr});

    var buf: [128]u8 = undefined;
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
    const resp_msg = try self.router.route(req);

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
