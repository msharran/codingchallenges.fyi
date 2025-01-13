const std = @import("std");
const net = std.net;
const posix = std.posix;
const Proto = @import("Proto.zig");
const Router = @import("Router.zig");

const Server = @This();

const ServeMux = struct {};

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

    std.debug.print("=> Server listening on {}\n", .{address});

    var buf: [128]u8 = undefined;
    while (true) {
        var client_address: net.Address = undefined;
        var client_address_len: posix.socklen_t = @sizeOf(net.Address);

        const socket = posix.accept(listener, &client_address.any, &client_address_len, 0) catch |err| {
            std.debug.print("=> error accept: {}\n", .{err});
            continue;
        };
        defer posix.close(socket);

        std.debug.print("=> client {} connected\n", .{client_address});
        defer std.debug.print("=> client {} disconnected\n", .{client_address});

        const read = posix.read(socket, &buf) catch |err| {
            std.debug.print("error reading: {}\n", .{err});
            continue;
        };

        if (read == 0) {
            continue;
        }

        std.debug.print("=> read {} bytes\n", .{read});

        if (read == 0) {
            continue;
        }

        // TODO revist using any other allocator instead of
        // arena allocator for proto here.
        // For every new connection, we allocate memory for the message
        // but do not deallocate it. This can lead to excessive memory
        // usage since we only deallocate the memory when the server
        // is deinitialised.

        const redis_proto = Proto.init(self.allocator);
        errdefer redis_proto.deinit();

        const msg = redis_proto.deserialise(buf[0..read]) catch |err| {
            std.debug.print("=> error serialising: {}\n", .{err});
            continue;
        };

        std.debug.print("=> deserialised message\n", .{});

        const resp_msg = try self.router.handle(msg);

        std.debug.print("=> handled message\n", .{});

        const raw_msg = redis_proto.serialise(resp_msg) catch |err| {
            std.debug.print("=> error serialising: {}\n", .{err});
            continue;
        };

        std.debug.print("=> serialised message\n", .{});

        writeAll(socket, raw_msg) catch |err| {
            std.debug.print("=> error writing: {}\n", .{err});
        };

        redis_proto.deinit();
    }
}

fn writeAll(socket: posix.socket_t, msg: []const u8) !void {
    var pos: usize = 0;
    while (pos < msg.len) {
        std.debug.print("=> writing data {s}\n", .{msg[pos..]});
        const written = try posix.write(socket, msg[pos..]);
        if (written == 0) {
            return error.Closed;
        }
        pos += written;
    }

    std.debug.print("=> wrote {} bytes\n", .{pos});
}
