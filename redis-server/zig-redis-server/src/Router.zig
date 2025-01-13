const Message = @import("Proto.zig").Message;
const std = @import("std");
const handlers = @import("handlers.zig");

const Router = @This();
const HandlerFn = *const fn (Message) Message;

/// Router is a simple command router that routes messages to handlers.
/// syntax:
///     command -> handler
///     hash map of string to fn(Message) Message
/// Example:
///     - "PING" -> fn(Message) Message { return Message{ .data_type = DataType.SimpleString, .content = "PONG" }; }
///     - "ECHO" -> fn(Message) Message { return Message{ .data_type = DataType.SimpleString, .content = message.content }; }
routeHandlers: std.StringHashMap(HandlerFn),

allocator: std.mem.Allocator,

// init allocates memory for the hashmap
// and returns a CommandRouter instance.
// Caller should call self.deinit to free the memory.
pub fn init(allocator: std.mem.Allocator) !Router {
    const routeHandlers = std.StringHashMap(HandlerFn).init(allocator);
    var r = Router{ .routeHandlers = routeHandlers, .allocator = allocator };
    try r.registerRoute("PING", handlers.ping);
    try r.registerRoute("ECHO", handlers.echo);
    return r;
}

pub fn deinit(self: *Router) void {
    self.routeHandlers.deinit();
}

fn registerRoute(self: *Router, command: []const u8, handler_fn: HandlerFn) !void {
    try self.routeHandlers.put(command, handler_fn);
}

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
    const handlerfn = self.findHandler(command);
    if (handlerfn) |h| {
        return h(message);
    } else {
        return Message{ .type = .Error, .value = .{ .single = "ERR unknown command" } };
    }
}

fn findHandler(self: Router, command: []const u8) ?HandlerFn {
    return self.routeHandlers.get(command);
}
