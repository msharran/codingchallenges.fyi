const std = @import("std");
const redis = @import("redis.zig");

pub fn main() !void {
    try redis.startServer(.{ .host = "127.0.0.1", .port = 6379 });
}
