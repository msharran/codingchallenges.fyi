const std = @import("std");
const net = std.net;
const posix = std.posix;
const RedisProto = @import("RedisProto.zig");
const Router = @import("Router.zig");
const Server = @This();
const log = std.log.scoped(.server);

/// router is responsible for handling the commands received by the server.
router: Router,

/// allocator is used to allocate memory for the server.
allocator: std.mem.Allocator,

/// init allocates memory for the server.
/// Caller should call self.deinit to free the memory.
pub fn init(allocator: std.mem.Allocator) !Server {
    const r = try Router.init(allocator);
    return Server{
        .router = r,
        .allocator = allocator,
    };
}

pub fn deinit(self: *Server) void {
    self.router.deinit();
}

pub fn listenAndServe(self: Server, address: std.net.Address) !void {
    const tpe: u32 = posix.SOCK.STREAM;
    const protocol = posix.IPPROTO.TCP;
    const listener = try posix.socket(address.any.family, tpe, protocol);
    defer posix.close(listener);

    try posix.setsockopt(listener, posix.SOL.SOCKET, posix.SO.REUSEADDR, &std.mem.toBytes(@as(c_int, 1)));
    try posix.bind(listener, &address.any, address.getOsSockLen());
    try posix.listen(listener, 128);

    log.info("Server listening on {}", .{address});

    var buf: [128]u8 = undefined;
    while (true) {
        var client_address: net.Address = undefined;
        var client_address_len: posix.socklen_t = @sizeOf(net.Address);

        const socket = posix.accept(listener, &client_address.any, &client_address_len, 0) catch |err| {
            log.err("Failed to accept connection: {}", .{err});
            continue;
        };
        defer posix.close(socket);

        log.info("Client connected: {}", .{client_address});
        defer log.info("Client disconnected: {}", .{client_address});

        const read = posix.read(socket, &buf) catch |err| {
            log.err("Failed to read from client: {}", .{err});
            continue;
        };

        if (read == 0) {
            log.info("Read 0 bytes from client, closing connection", .{});
            continue;
        }

        // TODO revist using any other allocator instead of
        // arena allocator for proto here.
        // For every new connection, we allocate memory for the message
        // but do not deallocate it. This can lead to excessive memory
        // usage since we only deallocate the memory when the server
        // is deinitialised.

        const resp = RedisProto.init(self.allocator);
        defer resp.deinit();

        const msg = resp.deserialise(buf[0..read]) catch |err| {
            log.err("Failed to deserialise message: {}", .{err});
            continue;
        };

        const resp_msg = try self.router.handle(msg);

        const raw_msg = resp.serialise(resp_msg) catch |err| {
            log.err("Failed to serialise message: {}", .{err});
            continue;
        };

        writeAll(socket, raw_msg) catch |err| {
            log.err("Failed to write to client: {}", .{err});
        };
    }
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
