const std = @import("std");
const log = std.log.scoped(.redis);
const Server = @import("Server.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer {
        const check = gpa.deinit();
        std.debug.print("GPA deinitialised check={}", .{check});
    }
    var server = try Server.init(gpa.allocator());
    defer server.deinit();

    log.info("Server initialised", .{});

    const address = try std.net.Address.parseIp("0.0.0.0", 6379);
    try server.listenAndServe(address);
}
