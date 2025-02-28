const std = @import("std");
const assert = std.debug.assert;
const Router = @import("Router.zig");
const Dictionary = @import("dictionary.zig").Dictionary;
const log = std.log.scoped(.global);
/// Global represents a global state store for the redis server components.
/// It provides a singleton pattern for easy integration with C code while controlling
/// access to core components:
/// - Allocator: The global memory allocator shared across components
/// - Router: The command router that handles redis commands
/// - Dictionary: The redis key-value store implementation
///
/// All components are lazily initialized when first accessed and can be deinitialized
/// when no longer needed. The singleton pattern ensures safe access from anywhere.
const Self = @This();

/// Allocator
pub const GeneralPurposeAllocator = std.heap.GeneralPurposeAllocator(.{
    .stack_trace_frames = 0,
});

var gpa: ?GeneralPurposeAllocator = null;
pub var allocator: ?std.mem.Allocator = null;

var allocator_init_once = std.once(struct {
    fn callback() void {
        log.debug("Initializing GPA", .{});
        gpa = GeneralPurposeAllocator{};
        allocator = gpa.?.allocator();
    }
}.callback);

pub fn initAllocator() void {
    allocator_init_once.call();
}

pub fn deinitAllocator() void {
    const check = gpa.?.deinit();
    assert(check == .ok);
    log.debug("Deinitialized GPA; {}", .{check});

    gpa = null;
    allocator = null;
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
        dict = Dictionary.init(Self.allocator.?) catch unreachable;
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
