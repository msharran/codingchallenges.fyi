const std = @import("std");
const log = std.log.scoped(.allocator);

pub const GPA = std.heap.GeneralPurposeAllocator(.{
    .stack_trace_frames = 0,
});
var global_gpa: ?GPA = null;
pub var global: ?std.mem.Allocator = null;

var global_init_once = std.once(struct {
    fn callback() void {
        global_gpa = GPA{};
        global = global_gpa.?.allocator();
    }
}.callback);

pub fn initGlobal() void {
    log.info("Initializing global allocator", .{});
    global_init_once.call();
}

pub fn deinitGlobal() void {
    const check = global_gpa.?.deinit();
    log.info("Global allocator deinitialized; status={}", .{check});
}
