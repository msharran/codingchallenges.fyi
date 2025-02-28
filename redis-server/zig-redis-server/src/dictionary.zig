const std = @import("std");
const log = std.log.scoped(.dictionary);

// used for tracking if the dictionary is initialized
// many times
var next_id: u32 = 0;

pub const Dictionary = struct {
    const RwLock = std.Thread.RwLock;
    const StringValueHashMap = std.StringHashMap(Value);
    id: u32 = 0,
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
        next_id += 1;
        const lock = try allocator.create(RwLock);
        lock.* = RwLock{};
        return .{
            .id = next_id,
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

        log.debug("PUT: Dictionary[{d}] key='{s}' value='{s}'", .{ self.id, key, value });

        // First check if key exists
        if (self.map.getEntry(key)) |entry| {
            // Key exists - update value only
            const new_value = try self.allocator.dupe(u8, value);
            errdefer self.allocator.free(new_value);

            // Free old value
            self.allocator.free(entry.value_ptr.*.string);

            // Update value using the existing stored key
            entry.value_ptr.* = Value{ .string = new_value };

            log.debug("Updated existing key '{s}' with new value", .{entry.key_ptr.*});
            return;
        }

        // New key - copy both key and value
        const key_copy = try self.allocator.dupe(u8, key);
        errdefer self.allocator.free(key_copy);

        const value_copy = try self.allocator.dupe(u8, value);
        errdefer self.allocator.free(value_copy);

        try self.map.put(key_copy, Value{ .string = value_copy });
        log.debug("Added new key '{s}' with value", .{key});

        self.debugDictionaryState();
    }

    pub fn getString(self: *Dictionary, key: []const u8) ?[]const u8 {
        self.rwlock.lockShared();
        defer self.rwlock.unlockShared();

        log.debug("GET: Dictionary[{d}] key='{s}'", .{ self.id, key });

        if (self.map.get(key)) |value| {
            log.debug("Found value for key '{s}'", .{key});
            return value.string;
        }

        log.debug("Key '{s}' not found", .{key});
        return null;
    }

    pub fn debugDictionaryState(self: *Dictionary) void {
        log.debug("Dictionary state: [{d}]", .{self.id});
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

    pub fn printStateInfo(self: *Dictionary) void {
        log.info("  Dictionary state: [{d}]", .{self.id});
        log.info("    Map capacity: {d}", .{self.map.capacity()});
        log.info("    Map count: {d}", .{self.map.count()});

        var sum: usize = 0;
        var iter = self.map.iterator();
        while (iter.next()) |_| {
            sum += 1;
        }
        log.info("  Actual items found: {d}", .{sum});
    }
};
