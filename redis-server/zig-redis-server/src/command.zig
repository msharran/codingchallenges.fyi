const std = @import("std");
const log = std.log.scoped(.command);
const assert = std.debug.assert;
const expect = std.testing.expect;

const Message = @import("RespParser.zig").Message;
const ObjectStore = @import("ObjectStore.zig");
pub const CommandFn = *const fn (Request) Message;

pub const Request = struct {
    message: Message,
    object_store: *ObjectStore,
};

pub fn ping(_: Request) Message {
    return Message.simpleString("PONG");
}

pub fn echo(r: Request) Message {
    const items = r.message.value.list.items;
    if (items.len < 2) {
        return Message.err("ERR bad request: expected at least one argument");
    }

    const value = items[1].value.single;
    return Message.bulkString(value);
}

pub fn set(r: Request) Message {
    const items = r.message.value.list.items;
    if (items.len < 3) {
        return Message.err("ERR bad request: expected at least two arguments");
    }

    const key = items[1].value.single;
    const value = items[2].value.single;

    r.object_store.putString(key, value) catch |err| {
        std.debug.print("ERR failed to set: {}\n", .{err});
        return Message.err("ERR failed to set");
    };

    return Message.simpleString("OK");
}

test "set command" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer {
        const check = gpa.deinit();
        std.debug.print("mem leak check {}\n", .{check});
        assert(check == .ok);
    }

    const obj_store = try ObjectStore.init(gpa.allocator());
    defer obj_store.deinit();

    var msg_list = std.ArrayList(Message).init(gpa.allocator());
    defer msg_list.deinit();

    try msg_list.append(Message.bulkString("SET"));
    try msg_list.append(Message.bulkString("foo"));
    try msg_list.append(Message.bulkString("bar"));

    const msg = Message.initList(.Array, msg_list);

    const req = Request{
        .message = msg,
        .object_store = obj_store,
    };

    const res = set(req);
    std.debug.print("res: {s}\n", .{res.value.single});

    const got = try obj_store.getString("foo");
    try expect(got != null);
    try std.testing.expectEqualStrings("bar", got.?);
}

test "set command long string" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer {
        const check = gpa.deinit();
        std.debug.print("mem leak check {}\n", .{check});
        assert(check == .ok);
    }

    const obj_store = try ObjectStore.init(gpa.allocator());
    defer obj_store.deinit();

    var msg_list = std.ArrayList(Message).init(gpa.allocator());
    defer msg_list.deinit();

    try msg_list.append(Message.bulkString("SET"));
    try msg_list.append(Message.bulkString("foo"));
    try msg_list.append(Message.bulkString("xxxyyyzzzaaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooop"));

    const msg = Message.initList(.Array, msg_list);

    const req = Request{
        .message = msg,
        .object_store = obj_store,
    };

    const res = set(req);
    std.debug.print("res: {s}\n", .{res.value.single});

    const got = try obj_store.getString("foo");
    try expect(got != null);
    try std.testing.expectEqualStrings("xxxyyyzzzaaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooop", got.?);
}
