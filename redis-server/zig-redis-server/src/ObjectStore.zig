const std = @import("std");
const log = std.log.scoped(.object_store);
const ObjectStore = @This();

objects: std.StringHashMap(Object),

allocator: std.mem.Allocator,

/// Object is a tagged union that represents a Redis object.
/// Tagged unions seems to be a good fit for this kind of data.
/// Ref: https://zig.news/edyu/zig-unionenum-wtf-is-switchunionenum-2e02
pub const Object = union(ObjectType) {
    string: []const u8,
};

pub const ObjectType = enum {
    string,
};

pub fn init(allocator: std.mem.Allocator) !*ObjectStore {
    const store = ObjectStore{
        .objects = std.StringHashMap(Object).init(allocator),
        .allocator = allocator,
    };
    const kv_p = try allocator.create(ObjectStore);
    kv_p.* = store;
    return kv_p;
}

pub fn deinit(self: *ObjectStore) void {
    var iter = self.objects.iterator();
    while (iter.next()) |kv| {
        const k_p = kv.key_ptr.*;
        self.allocator.free(k_p);
    }
    self.objects.deinit();
    self.allocator.destroy(self);
}

pub fn putString(self: *ObjectStore, key: []const u8, value: []const u8) !void {
    const k_p = try self.allocator.dupe(u8, key);
    const v = Object{ .string = value };
    try self.objects.put(k_p, v);
}

pub fn getString(self: *ObjectStore, key: []const u8) !?[]const u8 {
    const v = self.objects.get(key);
    if (v == null) {
        return null;
    }

    switch (v.?) {
        .string => return v.?.string,
        else => return error.NotAStringValue,
    }
}

pub fn printAll(self: ObjectStore) void {
    var iter = self.objects.iterator();
    while (iter.next()) |kv| {
        const k = kv.key_ptr.*;
        const v = kv.value_ptr.*;
        log.debug("key: {s}, value: {}", .{ k, v });
    }
}
