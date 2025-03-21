const std = @import("std");
const assert = std.debug.assert;
const Resp = @This();
const log = std.log.scoped(.resp);

const CRLF: []const u8 = "\r\n";
const CRLF_LEN: usize = CRLF.len;
comptime {
    std.debug.assert(CRLF_LEN == 2);
}

/// arena allocator is used to minimise memory allocations
/// and deallocations. Deserialisation of messages
/// (especially arrays) can be expensive in terms of memory
/// allocations.
/// (My reasoning)
arena: std.heap.ArenaAllocator,

pub fn init(allocator: std.mem.Allocator) Resp {
    return Resp{ .arena = std.heap.ArenaAllocator.init(allocator) };
}

pub fn deinit(self: *Resp) void {
    self.arena.deinit();
}

pub const DataType = enum {
    SimpleString,
    Error,
    Integer,
    BulkString,
    Array,
    Nil,

    fn yes(char: u8) bool {
        return switch (char) {
            '+', '-', ':', '$', '*', '_' => true,
            else => false,
        };
    }

    fn toChar(self: DataType) !u8 {
        return switch (self) {
            .SimpleString => @intCast('+'),
            .Error => @intCast('-'),
            .Integer => @intCast(':'),
            .BulkString => @intCast('$'),
            .Array => @intCast('*'),
            .Nil => @intCast('_'),
        };
    }

    fn fromChar(data_type: u8) !DataType {
        return switch (data_type) {
            '+' => .SimpleString,
            '-' => .Error,
            ':' => .Integer,
            '$' => .BulkString,
            '*' => .Array,
            '_' => .Nil,
            else => return error.InvalidDataType,
        };
    }
};

pub const ValueTag = enum {
    list,
    single,
};

pub const Value = union(ValueTag) {
    list: std.ArrayList(Message),
    single: []const u8,
};

pub const Message = struct {
    type: DataType,
    value: Value,

    pub fn init(t: DataType, v: []const u8) Message {
        return Message{ .type = t, .value = Value{ .single = v } };
    }

    pub fn initList(t: DataType, v: std.ArrayList(Message)) Message {
        return Message{ .type = t, .value = Value{ .list = v } };
    }

    pub fn simpleString(content: []const u8) Message {
        return .{ .type = .SimpleString, .value = .{ .single = content } };
    }

    pub fn bulkString(content: []const u8) Message {
        return .{ .type = .BulkString, .value = .{ .single = content } };
    }

    pub fn integer(content: []const u8) Message {
        return .{ .type = .Integer, .value = .{ .single = content } };
    }

    pub fn err(content: []const u8) Message {
        return .{ .type = .Error, .value = .{ .single = content } };
    }

    pub fn nil() Message {
        return .{ .type = .Nil, .value = .{ .single = "" } };
    }
};

pub fn deserialise(self: *Resp, raw: []const u8) !Message {
    if (raw.len == 0) {
        return Message.err("empty request");
    }

    const data_type = try DataType.fromChar(raw[0]);
    switch (data_type) {
        .SimpleString, .Error, .Integer, .Nil => {
            const value = raw[1 .. raw.len - CRLF_LEN];
            const last_2_bytes = raw[raw.len - CRLF_LEN ..];
            if (!std.mem.eql(u8, last_2_bytes, CRLF)) {
                return error.InvalidTerminator_ShouldBeCRLF;
            }
            return Message.init(data_type, value);
        },
        .BulkString => {
            var parts = std.mem.splitSequence(u8, raw, CRLF);
            const length_part = parts.first();

            // first char is "$"
            // rest is the length of the string in len_bytes
            // get the length of the string and parse to int
            const len = try std.fmt.parseInt(usize, length_part[1..], 10);

            const string_part = parts.next() orelse {
                return error.MissingContent;
            };

            if (string_part.len != len) {
                return error.ContentLengthMismatch;
            }

            return Message.init(data_type, string_part);
        },
        .Array => {
            const raw_msgs = try self.getArrayItems(raw);

            // init an array list of messages
            var list = try std.ArrayList(Message).initCapacity(self.arena.allocator(), raw_msgs.len);

            for (raw_msgs) |msg| {
                const m = try self.deserialise(msg);
                try list.append(m);
            }

            return Message.initList(data_type, list);
        },
    }
}

/// merges parts of items in an array
/// into a single item
/// e.g. "*2\r\n$4\r\nECHO\r\n$5\r\nhello\r\n"
/// item 1: "$4\r\nECHO\r\n" => "ECHO\r\n"
/// item 2: "$5\r\nhello\r\n" => "hello\r\n"
fn getArrayItems(self: *Resp, raw: []const u8) ![][]u8 {
    var parts = std.mem.splitSequence(u8, raw, CRLF);
    const arrlenbytes = parts.first();
    if (arrlenbytes.len != 2) {
        return error.InvalidArrayLength;
    }

    const arr_len = try std.fmt.parseInt(usize, arrlenbytes[1..], 10);

    var commands = try std.ArrayList([]u8).initCapacity(self.arena.allocator(), arr_len);

    var cmd: ?std.ArrayList(u8) = null;
    while (parts.next()) |part| {
        if (part.len == 0) {
            continue;
        }
        if (DataType.yes(part[0])) {
            if (cmd) |*c| {
                try commands.append(try c.toOwnedSlice());
            }

            // if there are chars after the data type byte till
            // CRLF, and it is a number, then it is the length.
            // Use that length to set the capacity of the array list
            const item_len_bytes = part[1..];
            const item_len = std.fmt.parseInt(usize, item_len_bytes, 10) catch 0;
            cmd = try std.ArrayList(u8).initCapacity(self.arena.allocator(), item_len);

            try cmd.?.appendSlice(part);
            try cmd.?.appendSlice(CRLF);
        } else {
            if (cmd == null) {
                return error.MissingDataType;
            }
            try cmd.?.appendSlice(part);
            try cmd.?.appendSlice(CRLF);
        }
    }

    if (cmd) |*c| {
        try commands.append(try c.toOwnedSlice());
    }

    const s = try commands.toOwnedSlice();
    return s;
}

pub fn serialise(self: *Resp, m: Message) ![]u8 {
    const data_type = try m.type.toChar();
    const content = m.value;

    var buf: []u8 = undefined;
    switch (m.type) {
        .SimpleString, .Error, .Integer, .Nil => {
            var a = self.arena.allocator();
            buf = try a.alloc(u8, 1 + content.single.len + CRLF_LEN); // data_type + content + crlf
            errdefer self.arena.deinit();
            _ = try std.fmt.bufPrint(buf, "{c}{s}{s}", .{ data_type, content.single, CRLF });
        },
        .BulkString => {
            // To allocate memory for the content length
            // we need to know the exact memory spaced used by
            // the int. So we convert the int to a string
            // and then get the length of the string.
            // any other better way?
            var content_len_buf: [128]u8 = undefined;
            const content_len = try std.fmt.bufPrint(&content_len_buf, "{d}", .{content.single.len});

            var a = self.arena.allocator();
            buf = try a.alloc(u8, 1 + content_len.len + CRLF_LEN + content.single.len + CRLF_LEN);
            errdefer self.arena.deinit();
            _ = try std.fmt.bufPrint(buf, "{c}{s}{s}{s}{s}", .{ data_type, content_len, CRLF, content.single, CRLF });
        },
        .Array => {
            // First calculate total size needed
            var total_size: usize = 0;

            // Size for array length (*<len>\r\n)
            var arr_len_buf: [128]u8 = undefined;
            const arr_len_str = try std.fmt.bufPrint(&arr_len_buf, "{d}", .{content.list.items.len});
            total_size += 1 + arr_len_str.len + CRLF_LEN;

            // Calculate size for each element
            var element_sizes = std.ArrayList([]u8).init(self.arena.allocator());
            defer element_sizes.deinit();

            for (content.list.items) |item| {
                const serialized = try self.serialise(item);
                try element_sizes.append(serialized);
                total_size += serialized.len;
            }

            // Allocate buffer and write data
            var a = self.arena.allocator();
            buf = try a.alloc(u8, total_size);
            errdefer self.arena.deinit();

            // Write array header
            var pos: usize = 0;
            _ = try std.fmt.bufPrint(buf[pos .. pos + 1 + arr_len_str.len + CRLF_LEN], "{c}{s}{s}", .{ data_type, arr_len_str, CRLF });
            pos += 1 + arr_len_str.len + CRLF_LEN;

            // Write elements
            for (element_sizes.items) |element| {
                @memcpy(buf[pos .. pos + element.len], element);
                pos += element.len;
            }
        },
    }
    return buf;
}

test "serialise array" {
    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    var resp = Resp.init(std.testing.allocator);
    defer resp.deinit();

    var list = std.ArrayList(Message).init(arena.allocator());
    try list.append(Message.bulkString("ECHO"));
    try list.append(Message.bulkString("hello"));
    try list.append(Message.integer("123"));

    const msg = Message.initList(.Array, list);
    const got = try resp.serialise(msg);

    const want = "*3\r\n$4\r\nECHO\r\n$5\r\nhello\r\n:123\r\n";
    try std.testing.expectEqualStrings(want, got);
}

test "serialise simple string" {
    const allocator = std.heap.page_allocator;
    const m = Message{ .type = DataType.SimpleString, .value = "hello" };
    const got = try serialise(allocator, m);
    defer allocator.free(got);
    const want = "+hello\\r\\n";
    try std.testing.expectEqualStrings(got, want);
}

test "serialise error" {
    const allocator = std.heap.page_allocator;
    const m = Message{ .type = DataType.Error, .value = "error" };
    const got = try serialise(allocator, m);
    defer allocator.free(got);
    const want = "-error\\r\\n";
    try std.testing.expectEqualStrings(got, want);
}

test "serialise integer" {
    const allocator = std.heap.page_allocator;
    const m = Message{ .type = DataType.Integer, .value = "123" };
    const got = try serialise(allocator, m);
    defer allocator.free(got);
    const want = ":123\\r\\n";
    try std.testing.expectEqualStrings(got, want);
}

test "deserialise bulk_string" {
    const raw = "$4\\r\\nECHO\\r\\n";
    const got = try deserialise(raw);
    const want = Message{ .type = DataType.BulkString, .value = "ECHO" };

    try std.testing.expectEqualStrings(got.value, want.value);
}

test "deserialise first bulk_string" {
    const raw = "$4\\r\\nECHO\\r\\n$5\\r\\nhello\\r\\n";
    const got = try deserialise(raw);

    // should only deserialise the first bulk string
    const want = Message{ .type = DataType.BulkString, .value = "ECHO" };

    try std.testing.expectEqualStrings(got.value, want.value);
}

test "deserialise array" {
    const raw = "*3\r\n$4\r\nECHO\r\n$5\r\nhello\r\n:123\r\n";

    const proto = Resp.init(std.testing.allocator);
    defer proto.deinit();

    const got = try proto.deserialise(raw);

    assert(got.type == DataType.Array);
    assert(got.value.list.items.len == 3);
    assert(got.value.list.items[0].type == DataType.BulkString);
    const gotval0 = got.value.list.items[0].value.single;
    try std.testing.expectEqualStrings("ECHO", gotval0);
    assert(got.value.list.items[1].type == DataType.BulkString);
    try std.testing.expectEqualStrings(got.value.list.items[1].value.single, "hello");
    assert(got.value.list.items[2].type == DataType.Integer);
    try std.testing.expectEqualStrings(got.value.list.items[2].value.single, "123");
}
