const std = @import("std");
const log = std.log.scoped(.redis);
const redis = @import("redis.zig");
const dictionary = @import("dictionary.zig");

// uncomment the following lines for log level INFO
//
// pub const std_options = .{
//     // Set the log level to info
//     .log_level = .info,
// };

pub fn main() !void {
    var redis_server = try redis.Server.init();
    defer redis_server.deinit();

    log.info("Server initialised", .{});
    try redis_server.start();
}
