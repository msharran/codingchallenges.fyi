const std = @import("std");
const log = std.log.scoped(.redis);
const tcp = @import("tcp.zig");

// uncomment the following lines for log level INFO
//
// pub const std_options = .{
//     // Set the log level to info
//     .log_level = .info,
// };

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer {
        const check = gpa.deinit();
        log.info("Memory leak check = {}", .{check});
    }
    const allocator = gpa.allocator();
    var server = try tcp.Server.init(allocator);
    defer server.deinit();

    log.info("Server initialised", .{});

    try server.start(.{});
}
