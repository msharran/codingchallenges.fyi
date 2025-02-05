const std = @import("std");
const log = std.log.scoped(.redis);
const Server = @import("TcpServer.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer {
        const check = gpa.deinit();
        std.debug.print("GPA deinitialised check={}", .{check});
    }
    var server = try Server.init(gpa.allocator());
    defer server.deinit();

    log.info("Server initialised", .{});

    const address = std.net.Address.initIp4(.{ 0, 0, 0, 0 }, 6377);
    try server.listenAndServe(address);
}
