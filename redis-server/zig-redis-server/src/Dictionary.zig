const std = @import("std");
const log = std.log.scoped(.object_store);
const Dictionary = @This();

entries: std.StringHashMap(Value),

allocator: std.mem.Allocator,

/// Object is a tagged union that represents a Redis object.
/// Tagged unions seems to be a good fit for this kind of data.
/// Ref: https://zig.news/edyu/zig-unionenum-wtf-is-switchunionenum-2e02
pub const Value = union(ValueType) {
    string: []const u8,
};

pub const ValueType = enum {
    string,
};

pub fn init(allocator: std.mem.Allocator) !*Dictionary {
    const store = Dictionary{
        .entries = std.StringHashMap(Value).init(allocator),
        .allocator = allocator,
    };
    const kv_p = try allocator.create(Dictionary);
    kv_p.* = store;
    return kv_p;
}

pub fn deinit(self: *Dictionary) void {
    var iter = self.entries.iterator();
    while (iter.next()) |kv| {
        const k_p = kv.key_ptr.*;
        self.allocator.free(k_p);
    }
    self.entries.deinit();
    self.allocator.destroy(self);
}

pub fn putString(self: *Dictionary, key: []const u8, value: []const u8) !void {
    const k_p = try self.allocator.dupe(u8, key);
    const v = Value{ .string = value };
    try self.entries.put(k_p, v);
}

pub fn getString(self: *Dictionary, key: []const u8) !?[]const u8 {
    const v = self.entries.get(key);
    if (v == null) {
        return null;
    }

    switch (v.?) {
        .string => return v.?.string,
        else => return error.ValueNotString,
    }
}

pub fn printAll(self: Dictionary) void {
    var iter = self.entries.iterator();
    while (iter.next()) |kv| {
        const k = kv.key_ptr.*;
        const v = kv.value_ptr.*;
        log.debug("key: {s}, value: {}", .{ k, v });
    }
}
