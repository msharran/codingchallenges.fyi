const std = @import("std");
const server = @import("Server.zig");

const log = std.log.scoped(.main);

pub fn main() !void {
    const address = try std.net.Address.parseIp("127.0.0.1", 6379);

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var svr = try server.init(allocator);
    defer svr.deinit();

    log.info("Server initialized", .{});

    svr.listenAndServe(address) catch |err| {
        log.err("Server error: {}", .{err});
    };
}
