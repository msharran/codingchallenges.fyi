const std = @import("std");
const log = std.log.scoped(.command);
const assert = std.debug.assert;
const expect = std.testing.expect;

const Message = @import("Resp.zig").Message;
const Dictionary = @import("Dictionary.zig");
pub const CommandFn = *const fn (Request) Message;

pub const Request = struct {
    message: Message,
    dict: *Dictionary,

    // used for list type of response
    arena: *std.heap.ArenaAllocator,

    pub fn init(arena: *std.heap.ArenaAllocator, m: Message, d: *Dictionary) Request {
        return Request{
            .message = m,
            .dict = d,
            .arena = arena,
        };
    }

    pub fn deinit(self: *Request) void {
        self.arena.deinit();
    }
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

    r.dict.putString(key, value) catch |err| {
        std.debug.print("ERR failed to set: {}\n", .{err});
        return Message.err("ERR failed to set");
    };

    return Message.simpleString("OK");
}

// my debug function
pub fn printall(r: Request) Message {
    r.dict.printAll();
    return Message.nil();
}

pub fn get(r: Request) Message {
    const items = r.message.value.list.items;
    if (items.len < 2) {
        return Message.err("ERR bad request: expected at least two arguments");
    }

    const key = items[1].value.single;

    const value = r.dict.getString(key) catch |err| {
        std.debug.print("ERR failed to set: {}\n", .{err});
        return Message.err("ERR failed to set");
    };

    if (value == null) {
        return Message.nil();
    }

    return Message.bulkString(value.?);
}

pub fn config(r: Request) Message {
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

    const req = Request{
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

    const req = Request{
        .message = msg,
        .dict = obj_store,
    };

    const res = set(req);
    std.debug.print("res: {s}\n", .{res.value.single});

    const got = try obj_store.getString("foo");
    try expect(got != null);
    try std.testing.expectEqualStrings("xxxyyyzzzaaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooop", got.?);
}
