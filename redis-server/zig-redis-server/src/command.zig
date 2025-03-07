const std = @import("std");
const log = std.log.scoped(.command);
const assert = std.debug.assert;
const expect = std.testing.expect;

const Message = @import("Resp.zig").Message;
const global = @import("global.zig");
const Dictionary = @import("dictionary.zig").Dictionary;

pub const CommandCtx = struct {
    message: Message,

    // arena should be deinitialized by the caller
    arena: std.heap.ArenaAllocator,

    pub fn init(allocator: std.mem.Allocator, m: Message) CommandCtx {
        return CommandCtx{
            .message = m,
            .arena = std.heap.ArenaAllocator.init(allocator),
        };
    }

    pub fn deinit(self: *CommandCtx) void {
        self.arena.deinit();
    }
};

pub fn ping(_: *CommandCtx) Message {
    return Message.simpleString("PONG");
}

pub fn echo(r: *CommandCtx) Message {
    const items = r.message.value.list.items;
    if (items.len < 2) {
        return Message.err("ERR bad request: expected at least one argument");
    }

    const value = items[1].value.single;
    return Message.bulkString(value);
}

pub fn set(r: *CommandCtx) Message {
    const items = r.message.value.list.items;
    if (items.len < 3) {
        return Message.err("ERR bad request: expected at least two arguments");
    }

    const key = items[1].value.single;
    const value = items[2].value.single;

    global.dictionary().putString(key, value) catch return Message.err("ERR failed to set");

    return Message.simpleString("OK");
}

pub fn get(r: *CommandCtx) Message {
    const items = r.message.value.list.items;
    if (items.len < 2) {
        return Message.err("ERR bad request: expected at least two arguments");
    }

    const key = items[1].value.single;

    const value = global.dictionary().getString(key);
    if (value == null) {
        log.err("ERR key not found; key={s}", .{key});
        return Message.nil();
    }

    return Message.bulkString(value.?);
}

pub fn config(r: *CommandCtx) Message {
    const items = r.message.value.list.items;
    if (items.len < 3) {
        return Message.err("ERR wrong number of arguments for CONFIG GET");
    }

    // Check if it's a GET command
    const subcommand = items[1].value.single;
    if (!std.mem.eql(u8, subcommand, "GET")) {
        return Message.err("ERR unknown subcommand. Only GET is supported");
    }

    const param = items[2].value.single;

    // Create array list for response using the request's arena allocator
    var response_list = std.ArrayList(Message).init(r.arena.allocator());

    // Handle different config parameters
    if (std.mem.eql(u8, param, "save")) {
        // Add key
        response_list.append(Message.bulkString("save")) catch
            return Message.err("ERR allocation failed");
        // Add value
        response_list.append(Message.bulkString("900 1 300 10")) catch
            return Message.err("ERR allocation failed");
        return Message.initList(.Array, response_list);
    } else if (std.mem.eql(u8, param, "appendonly")) {
        // Add key
        response_list.append(Message.bulkString("appendonly")) catch
            return Message.err("ERR allocation failed");
        // Add value
        response_list.append(Message.bulkString("no")) catch
            return Message.err("ERR allocation failed");
        return Message.initList(.Array, response_list);
    } else {
        // For unknown parameters, return empty array
        return Message.initList(.Array, response_list);
    }
}

test "set command" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer {
        const check = gpa.deinit();
        std.debug.print("mem leak check {}\n", .{check});
        assert(check == .ok);
    }

    const obj_store = try Dictionary.init(gpa.allocator());
    defer obj_store.deinit();

    var msg_list = std.ArrayList(Message).init(gpa.allocator());
    defer msg_list.deinit();

    try msg_list.append(Message.bulkString("SET"));
    try msg_list.append(Message.bulkString("foo"));
    try msg_list.append(Message.bulkString("bar"));

    const msg = Message.initList(.Array, msg_list);

    const req = CommandCtx{
        .message = msg,
        .dict = obj_store,
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

    const obj_store = try Dictionary.init(gpa.allocator());
    defer obj_store.deinit();

    var msg_list = std.ArrayList(Message).init(gpa.allocator());
    defer msg_list.deinit();

    try msg_list.append(Message.bulkString("SET"));
    try msg_list.append(Message.bulkString("foo"));
    try msg_list.append(Message.bulkString("xxxyyyzzzaaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooop"));

    const msg = Message.initList(.Array, msg_list);

    const req = CommandCtx{
        .message = msg,
        .dict = obj_store,
    };

    const res = set(req);
    std.debug.print("res: {s}\n", .{res.value.single});

    const got = try obj_store.getString("foo");
    try expect(got != null);
    try std.testing.expectEqualStrings("xxxyyyzzzaaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooop", got.?);
}
