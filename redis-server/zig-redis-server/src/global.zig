/// global represents a global state store for the redis server components.
/// It provides a singleton pattern for easy integration with C code while controlling
/// access to core components:
/// - Allocator: The global memory allocator shared across components
/// - Router: The command router that handles redis commands
/// - Dictionary: The redis key-value store implementation
///
/// All components are lazily initialized when first accessed and can be deinitialized
/// when no longer needed. The singleton pattern ensures safe access from anywhere.
const std = @import("std");
const assert = std.debug.assert;
const builtin = @import("builtin");

const Dictionary = @import("dictionary.zig").Dictionary;
const Router = @import("Router.zig");

const log = std.log.scoped(.global);
const Self = @This();

/// Allocator
const GeneralPurposeAllocator = std.heap.GeneralPurposeAllocator(.{});

var gpa: ?GeneralPurposeAllocator = null;

// Initialized during redis start up
pub var allocator: std.mem.Allocator = undefined;

var allocator_init_once = std.once(struct {
    fn callback() void {
        log.debug("Initializing GPA", .{});

        gpa = gpa: {
            // Use the libc allocator if it is available because it is WAY
            // faster than GPA. We only do this in release modes so that we
            // can get easy memory leak detection in debug modes.
            if (builtin.link_libc) {
                if (switch (builtin.mode) {
                    .ReleaseSafe, .ReleaseFast => true,

                    // We also use it if we can detect we're running under
                    // Valgrind since Valgrind only instruments the C allocator
                    else => std.valgrind.runningOnValgrind() > 0,
                }) break :gpa null;
            }
            break :gpa GeneralPurposeAllocator{};
        };

        if (gpa) |*value| {
            log.info("Using GPA", .{});
            allocator = value.allocator();
        } else if (builtin.link_libc) {
            log.info("Using libc allocator", .{});
            allocator = std.heap.c_allocator;
        } else {
            unreachable;
        }
    }
}.callback);

pub fn initAllocator() void {
    allocator_init_once.call();
}

pub fn deinitAllocator() void {
    if (gpa) |*value| {
        const check = value.deinit();
        assert(check == .ok);
        log.debug("Deinitialized GPA; {}", .{check});
        gpa = null;
    }

    allocator = undefined;
}

/// router
var routr: ?Router = null;
var router_init_once = std.once(struct {
    fn callback() void {
        routr = Router.initComptime();
    }
}.callback);

pub fn initRouter() void {
    router_init_once.call();
}

pub fn deinitRouter() void {
    if (routr) |*r| {
        r.deinit();
        r.* = undefined;
        routr = null;
    }
}

pub fn router() *Router {
    if (routr == null) {
        @panic("Router not initialized");
    }
    return &(routr.?);
}

/// Dictionary instance
var dict: ?Dictionary = null;
var dict_init_once = std.once(struct {
    fn callback() void {
        log.debug("Initializing Dictionary", .{});
        dict = Dictionary.init(Self.allocator) catch unreachable;
    }
}.callback);

pub fn initDictionary() void {
    dict_init_once.call();
}

pub fn deinitDictionary() void {
    defer log.debug("Deinitialized Dictionary", .{});

    Self.dictionary().printStateInfo();
    if (dict) |*d| {
        d.deinit();
        d.* = undefined;
        dict = null;
    }
}

pub fn dictionary() *Dictionary {
    if (dict == null) {
        @panic("Dictionary not initialized");
    }
    return &(dict.?);
}
