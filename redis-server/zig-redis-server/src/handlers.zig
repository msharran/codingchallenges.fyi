const std = @import("std");
const proto = @import("RedisProto.zig");

const log = std.log.scoped(.handlers);

pub fn ping(_: proto.Message) proto.Message {
    return .{ .type = .SimpleString, .value = .{ .single = "PONG" } };
}

pub fn echo(msg: proto.Message) proto.Message {
    const items = msg.value.list.items;
    if (items.len < 2) {
        return .{ .type = .Error, .value = .{ .single = "ERR bad request: expected at least one argument" } };
    }

    const value = items[1].value.single;
    return .{ .type = .BulkString, .value = .{ .single = value } };
}
