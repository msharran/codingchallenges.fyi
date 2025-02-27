/// Router is a simple command router that routes messages to handlers.
/// syntax:
///     command -> handler
///     hash map of string to fn(Message) Message
/// Example:
///     - "PING" -> fn(Message) Message { return Message{ .data_type = DataType.SimpleString, .content = "PONG" }; }
///     - "ECHO" -> fn(Message) Message { return Message{ .data_type = DataType.SimpleString, .content = message.content }; }
const std = @import("std");
const log = std.log.scoped(.router);

const Self = @This();

const command = @import("command.zig");
const dictionary = @import("dictionary.zig");
const Dictionary = dictionary.Dictionary;
const Message = @import("Resp.zig").Message;
const HandlerFn = *const fn (Request) Message;
const RoutesMap = std.StaticStringMap(HandlerFn);
const RouterKV = struct { []const u8, HandlerFn };

/// Stores all the mapping of command to handler.
routes: RoutesMap,

pub fn initComptime() Self {
    const routes: []const RouterKV = &.{
        .{ "PING", command.ping },
        .{ "ECHO", command.echo },
        .{ "SET", command.set },
        .{ "GET", command.get },
        .{ "CONFIG", command.config },
    };
    return Self{
        .routes = RoutesMap.initComptime(routes),
    };
}

/// Routes the message to the appropriate handler.
/// Looks up the command in the store and calls the handler.
/// msg will always be an array
/// with first element as the command
/// and the rest as the arguments.
/// Example:
///    ["PING"]
///    ["ECHO", "hello"]
pub fn route(self: Self, req: Request) Message {
    const dict = dictionary.getGlobalPtr();
    log.debug("Routing request with dictionary at {*} containing {d} entries", .{ dict, dict.map.count() });
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

pub const Request = struct {
    message: Message,

    // arena should be deinitialized by the caller
    arena: *std.heap.ArenaAllocator,

    pub fn init(arena: *std.heap.ArenaAllocator, m: Message) Request {
        return Request{
            .message = m,
            .arena = arena,
        };
    }
};
