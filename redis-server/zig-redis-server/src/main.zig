const std = @import("std");
const server = @import("Server.zig");

pub fn main() !void {
    const address = try std.net.Address.parseIp("127.0.0.1", 6379);

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var svr = try server.init(allocator);
    defer svr.deinit();

    svr.listenAndServe(address) catch |err| {
        std.debug.print("Failed to start server: {}\n", .{err});
    };
}
