const std = @import("std");
const os = std.os;
const linux = os.linux;
const posix = std.posix;
const log_tracer = std.log.scoped(.tracer);
const log_tracee = std.log.scoped(.tracee);
const log_syscall = std.log.scoped(.syscall);
const ptrace = @import("./ptrace.zig");
const wait = @import("./wait.zig");

pub const log_level: std.log.Level = .debug;

fn runChildAsTracee(allocator: std.mem.Allocator, args: [][:0]u8) !void {
    const ptracee = ptrace.Tracee.init();
    try ptracee.traceMe();

    const child_cmd = args[1..];
    const argv = try allocator.alloc(?[*:0]const u8, child_cmd.len + 1);
    defer allocator.free(argv);

    for (args[1..], 0..) |arg, i| {
        argv[i] = arg;
    }
    argv[child_cmd.len] = null;

    var i: usize = 0;
    while (argv[i] != null) : (i += 1) {
        // we should unwrap optional pointer
        log_tracee.debug("prepare exec -> argv[{d}]: {s}", .{ i, argv[i].? });
    }

    const envp = [_:null]?[*:0]const u8{null};
    const argv_ptr: [*:null]const ?[*:0]const u8 = @ptrCast(argv.ptr);

    // execvpeZ: The 'Z' suffix indicates null-terminated strings (C-style)
    // - file: null-terminated string ([*:0]const u8)
    // - argv: array of null-terminated string pointers
    // - envp: array of null-terminated string pointers
    return posix.execvpeZ(args[1], argv_ptr, &envp);
}

fn traceChild(allocator: std.mem.Allocator, pid: posix.pid_t) !void {
    const ptracer = ptrace.Tracer.init(pid);
    var res = try wait.sigStop(pid, 0); // Tracee stops due to traceme call
    //
    try ptracer.setOptions(ptrace.O_TRACESYSGOOD | ptrace.O_TRACEEXEC);
    try ptracer.cont(null);
    res = try wait.sigStop(pid, 0); // Tracee stops at next exec as we set the option O_TRACEEXEC

    while (true) {
        try ptracer.syscall(); // stops at both syscall entry and exit
        res = wait.sigSyscallStop(pid, 0) catch |err| switch (err) {
            error.ChildExited => return,
            else => return err,
        };

        const syscall_info = try ptracer.getSyscallInfo(allocator);
        defer allocator.destroy(syscall_info);

        if (syscall_info.isEntry()) {
            const syscall_name = ptrace.syscallNameFromNum(syscall_info.data.entry.nr);
            log_syscall.info("{s}({x}, {x}, {x}, {x}, {x}, {x})", .{ syscall_name, syscall_info.data.entry.args[0], syscall_info.data.entry.args[1], syscall_info.data.entry.args[2], syscall_info.data.entry.args[3], syscall_info.data.entry.args[4], syscall_info.data.entry.args[5] });
        } else if (syscall_info.isExit()) {
            log_syscall.info("retval=0x{x} error={}", .{ syscall_info.data.exit.rval, syscall_info.data.exit.is_error });
        } else {
            log_syscall.err("unknown syscall info op: {}", .{syscall_info.op});
            return error.UnknownSyscallInfoOp;
        }
    }
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer {
        const check = gpa.deinit();
        log_tracer.debug("Mem leak check: {}", .{check});
    }
    const allocator = gpa.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len < 2) {
        log_tracer.err("Usage: {s} <command> [args...]", .{args[0]});
        return;
    }

    log_tracer.debug("forking process", .{});
    const pid = try posix.fork();

    if (pid == 0) {
        // Child process will return pid 0
        return runChildAsTracee(allocator, args);
    } else {
        // parent process after fork
        try traceChild(allocator, pid);
    }
}
