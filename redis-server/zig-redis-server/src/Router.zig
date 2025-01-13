/// Router is a simple command router that routes messages to handlers.
/// syntax:
///     command -> handler
///     hash map of string to fn(Message) Message
/// Example:
///     - "PING" -> fn(Message) Message { return Message{ .data_type = DataType.SimpleString, .content = "PONG" }; }
///     - "ECHO" -> fn(Message) Message { return Message{ .data_type = DataType.SimpleString, .content = message.content }; }
const Message = @import("RedisProto.zig").Message;
const std = @import("std");
const handlers = @import("handlers.zig");
const log = std.log.scoped(.router);
const Router = @This();
const HandlerFn = *const fn (Message) Message;

const Route = struct {
    command: []const u8,
    handler: HandlerFn,
};

const routes = [_]Route{
    .{ .command = "PING", .handler = handlers.ping },
    .{ .command = "ECHO", .handler = handlers.echo },
};

/// Stores all the mapping of command to handler.
store: std.StringHashMap(HandlerFn),

allocator: std.mem.Allocator,

pub fn init(allocator: std.mem.Allocator) !Router {
    const routeHandlers = std.StringHashMap(HandlerFn).init(allocator);
    var r = Router{ .store = routeHandlers, .allocator = allocator };
    for (routes) |route| {
        try r.store.put(route.command, route.handler);
    }
    return r;
}

pub fn deinit(self: *Router) void {
    self.store.deinit();
}

/// Routes the message to the appropriate handler.
/// Looks up the command in the store and calls the handler.
pub fn handle(self: Router, message: Message) !Message {
    // const command = message.value.single;

    // msg will always be an array
    // with first element as the command
    // and the rest as the arguments.
    // Example:
    //    ["PING"]
    //    ["ECHO", "hello"]

    if (message.type != .Array) {
        return Message{ .type = .Error, .value = .{ .single = "ERR bad request: expected array" } };
    }

    if (message.value.list.items.len < 1) {
        return Message{ .type = .Error, .value = .{ .single = "ERR bad request: expected at least one item" } };
    }

    const command = message.value.list.items[0].value.single;
    const handler = self.store.get(command);

    if (handler) |h| {
        return h(message);
    } else {
        return Message{ .type = .Error, .value = .{ .single = "ERR unknown command" } };
    }
}
