const std = @import("std");
const log = std.log.scoped(.redis);
const redis = @import("redis.zig");
const dictionary = @import("dictionary.zig");

// uncomment the following lines for log level INFO
//
pub const std_options: std.Options = .{
    // Set the log level to info
    .log_level = .info,
};

pub fn main() !void {
    redis.init();
    defer redis.deinit();

    try redis.start();
}
