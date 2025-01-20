const std = @import("std");
const log = std.log.scoped(.dictionary);
const Dictionary = @This();

entries: std.StringHashMap(Value),

allocator: std.mem.Allocator,

/// A tagged union that represents a Redis object.
/// Tagged unions seems to be a good fit for this kind of data.
/// Ref: https://zig.news/edyu/zig-unionenum-wtf-is-switchunionenum-2e02
pub const Value = union(ValueType) {
    string: []const u8,
};

pub const ValueType = enum {
    string,
};

pub fn init(allocator: std.mem.Allocator) !*Dictionary {
    const dict = Dictionary{
        .entries = std.StringHashMap(Value).init(allocator),
        .allocator = allocator,
    };
    const dict_p = try allocator.create(Dictionary);
    dict_p.* = dict;
    return dict_p;
}

pub fn deinit(self: *Dictionary) void {
    var iter = self.entries.iterator();
    while (iter.next()) |kv| {
        const key_p = kv.key_ptr.*;
        self.allocator.free(key_p);
    }
    self.entries.deinit();
    self.allocator.destroy(self);
}

pub fn putString(self: *Dictionary, key: []const u8, value: []const u8) !void {
    const key_p = try self.allocator.dupe(u8, key);
    const val = Value{ .string = value };
    try self.entries.put(key_p, val);
}

pub fn getString(self: *Dictionary, key: []const u8) !?[]const u8 {
    const val = self.entries.get(key);

    if (val) |v| return v.string;
    return null;
}

pub fn printAll(self: Dictionary) void {
    var iter = self.entries.iterator();
    while (iter.next()) |kv| {
        const k = kv.key_ptr.*;
        const v = kv.value_ptr.*;
        log.debug("key: {s}, value: {}", .{ k, v });
    }
}
