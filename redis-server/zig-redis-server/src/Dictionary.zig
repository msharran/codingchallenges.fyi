const std = @import("std");
const log = std.log.scoped(.dictionary);
const Dictionary = @This();
const RwLock = std.Thread.RwLock;

map: std.StringHashMap(Value),

allocator: std.mem.Allocator,

/// This can be performant compared to mutex in this
/// case because reads are allowed to happen concurrently
/// if there are no writes happening.
/// Only the write lock is exclusive.
/// Ref: https://pedropark99.github.io/zig-book/Chapters/14-threads.html#using-readwrite-locks-in-zig
rwlock: *RwLock,

/// A tagged union that represents a Redis object.
/// Tagged unions seems to be a good fit for this kind of data.
/// Ref: https://zig.news/edyu/zig-unionenum-wtf-is-switchunionenum-2e02
pub const Value = union(ValueType) {
    string: []const u8,
};

pub const ValueType = enum {
    string,
};

pub fn init(allocator: std.mem.Allocator) !Dictionary {
    const lock = try allocator.create(RwLock);
    lock.* = .{};
    return .{
        .allocator = allocator,
        .map = std.StringHashMap(Value).init(allocator),
        .rwlock = lock,
    };
}

pub fn deinit(self: *Dictionary) void {
    self.allocator.destroy(self.rwlock);

    var iter = self.map.iterator();
    while (iter.next()) |kv| {
        const key_p = kv.key_ptr.*;
        self.allocator.free(key_p);
        const val_p = kv.value_ptr.*.string;
        self.allocator.free(val_p);
    }
    self.map.deinit();
}

pub fn putString(self: *Dictionary, key: []const u8, value: []const u8) !void {
    self.rwlock.lock();
    defer self.rwlock.unlock();

    const key_p = try self.allocator.dupe(u8, key);
    const val_p = try self.allocator.dupe(u8, value);
    const val = Value{ .string = val_p };
    try self.map.put(key_p, val);
}

pub fn getString(self: *Dictionary, key: []const u8) ?[]const u8 {
    self.rwlock.lockShared();
    defer self.rwlock.unlockShared();

    const val = self.map.get(key);

    if (val) |v| return v.string;
    return null;
}

pub fn printAll(self: Dictionary) void {
    self.rwlock.lockShared();
    defer self.rwlock.unlockShared();

    const l = std.log.scoped(.print);
    var iter = self.map.iterator();
    while (iter.next()) |kv| {
        const k = kv.key_ptr.*;
        const v = kv.value_ptr.*;
        l.info("key: {s}, value: {s}", .{ k, v.string });
    }
}
