const std = @import("std");
const log = std.log.scoped(.redis);

const ObjectStore = @import("ObjectStore.zig");
const Server = @import("Server.zig");

pub const Options = struct {
    host: []const u8 = "127.0.0.1",
    port: u16 = 6379,
};

pub fn startServer(o: Options) !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer {
        const check = gpa.deinit();
        std.debug.print("GPA deinitialised check={}", .{check});
    }
    var server = try Server.init(gpa.allocator());
    defer server.deinit();

    log.info("Server initialised", .{});

    const address = try std.net.Address.parseIp(o.host, o.port);
    try server.listenAndServe(address);
}
