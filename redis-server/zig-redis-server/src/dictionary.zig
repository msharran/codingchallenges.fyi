const std = @import("std");
const log = std.log.scoped(.dictionary);

var gpa = std.heap.GeneralPurposeAllocator(.{
    .stack_trace_frames = 0,
}){};

var default: ?Dictionary = null;

// panic if default is not initialized
pub fn getDefaultPtr() *Dictionary {
    return &default.?;
}

pub fn init() !void {
    default = try Dictionary.init(gpa.allocator());
}

pub fn deinit() void {
    default.?.deinit();
    const check = gpa.deinit();
    log.debug("Global dictionary and allocator deinitialized; status={}", .{check});
}

pub const Dictionary = struct {
    const RwLock = std.Thread.RwLock;
    const StringValueHashMap = std.StringHashMap(Value);

    map: StringValueHashMap,

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
        lock.* = RwLock{};
        return .{
            .allocator = allocator,
            .map = StringValueHashMap.init(allocator),
            .rwlock = lock,
        };
    }

    pub fn deinit(self: *Dictionary) void {
        self.allocator.destroy(self.rwlock);

        var iter = self.map.iterator();
        while (iter.next()) |kv| {
            log.debug("Freeing key: {s}", .{kv.key_ptr.*});
            self.allocator.free(kv.key_ptr.*);

            log.debug("Freeing value: {s}", .{kv.value_ptr.*.string});
            self.allocator.free(kv.value_ptr.*.string);
        }
        self.map.deinit();
    }

    pub fn putString(self: *Dictionary, key: []const u8, value: []const u8) !void {
        self.rwlock.lock();
        defer self.rwlock.unlock();

        self.debugDictionaryState();

        const result = try self.map.getOrPut(key);
        if (result.found_existing) {
            log.debug("Found existing key: {s}", .{key});
            // Free the existing value
            self.allocator.free(result.value_ptr.*.string);
        } else {
            log.debug("Creating new key: {s}", .{key});
            // Store a copy of the key since we need to own it
            const key_p = try self.allocator.dupe(u8, key);
            result.key_ptr.* = key_p;
        }

        // Create a new value
        const val_p = try self.allocator.dupe(u8, value);
        log.debug("Creating new value: {s} {*}", .{ value, val_p });
        result.value_ptr.* = Value{ .string = val_p };

        self.debugDictionaryState();
    }

    pub fn getString(self: *Dictionary, key: []const u8) ?[]const u8 {
        self.rwlock.lockShared();
        defer self.rwlock.unlockShared();

        self.debugDictionaryState();

        const val = self.map.get(key);

        if (val) |v| return v.string;

        self.debugDictionaryState();
        return null;
    }

    pub fn debugDictionaryState(self: *Dictionary) void {
        log.debug("Dictionary state:", .{});
        log.debug("  Address: {*}", .{self});
        log.debug("  Map address: {*}", .{&self.map});
        log.debug("  Map capacity: {d}", .{self.map.capacity()});
        log.debug("  Map count: {d}", .{self.map.count()});

        var sum: usize = 0;
        var iter = self.map.iterator();
        while (iter.next()) |_| {
            sum += 1;
        }
        log.debug("  Actual items found: {d}", .{sum});
    }
};
