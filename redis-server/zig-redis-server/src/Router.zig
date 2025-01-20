/// Router is a simple command router that routes messages to handlers.
/// syntax:
///     command -> handler
///     hash map of string to fn(Message) Message
/// Example:
///     - "PING" -> fn(Message) Message { return Message{ .data_type = DataType.SimpleString, .content = "PONG" }; }
///     - "ECHO" -> fn(Message) Message { return Message{ .data_type = DataType.SimpleString, .content = message.content }; }
const std = @import("std");
const log = std.log.scoped(.router);
const Router = @This();

const Message = @import("Resp.zig").Message;
const command = @import("command.zig");
const CommandFn = command.CommandFn;

/// Stores all the mapping of command to handler.
routes: std.StringHashMap(CommandFn),

allocator: std.mem.Allocator,

pub fn init(a: std.mem.Allocator) !Router {
    const routes = std.StringHashMap(CommandFn).init(a);
    var r = Router{
        .routes = routes,
        .allocator = a,
    };
    try r.registerRoutes();
    return r;
}

fn registerRoutes(self: *Router) !void {
    const Route = struct {
        command: []const u8,
        handler: CommandFn,
    };
    const routes = [_]Route{
        .{ .command = "PING", .handler = command.ping },
        .{ .command = "ECHO", .handler = command.echo },
        .{ .command = "SET", .handler = command.set },
        .{ .command = "GET", .handler = command.get },
    };
    for (routes) |r| {
        try self.routes.put(r.command, r.handler);
    }
}

pub fn deinit(self: *Router) void {
    self.routes.deinit();
}

/// Routes the message to the appropriate handler.
/// Looks up the command in the store and calls the handler.
/// msg will always be an array
/// with first element as the command
/// and the rest as the arguments.
/// Example:
///    ["PING"]
///    ["ECHO", "hello"]
pub fn route(self: Router, req: command.Request) !Message {
    if (req.message.type != .Array) {
        return Message.err("ERR bad request: expected array");
    }

    if (req.message.value.list.items.len < 1) {
        return Message.err("ERR bad request: expected at least one item");
    }

    const cmd = req.message.value.list.items[0].value.single;
    const cmdFn = self.routes.get(cmd);

    if (cmdFn) |c| {
        return c(req);
    } else {
        return Message.err("ERR unknown command");
    }
}
