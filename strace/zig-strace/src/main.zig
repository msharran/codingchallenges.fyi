const std = @import("std");
const os = std.os;
const linux = os.linux;
const posix = std.posix;
const log_tracer = std.log.scoped(.tracer);
const log_tracee = std.log.scoped(.tracee);
const stdout = std.io.getStdOut().writer();

pub const log_level: std.log.Level = .debug;

fn continueChild(allocator: std.mem.Allocator, args: [][:0]u8) !void {
    // Child process will return pid 0

    log_tracee.debug("traceme! stopping execution",.{});
    // Child declares itself traceable by parent
    // see: https://man7.org/linux/man-pages/man2/ptrace.2.html#:~:text=to%20be%20performed%3A-,PTRACE_TRACEME,-Indicate%20that%20this
    try posix.ptrace(linux.PTRACE.TRACEME, 0, 0, 0);
    // common practice to call this as per manual
    // ref: https://man7.org/linux/man-pages/man2/ptrace.2.html#:~:text=A%20common%20practice%20is%20to%20follow%0A%20%20%20%20%20%20%20the%20PTRACE_TRACEME%20with%0A%0A%20%20%20%20%20%20%20%20%20%20%20raise(SIGSTOP)%3B
    try posix.raise(linux.SIG.STOP);

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

fn waitChildAndContinueParent(pid: posix.pid_t) !void {
    // Child used PTRACE_TRACEME and raise(SIGSTOP),
    // so wait for the child to stop
    log_tracer.debug("expecting SIGSTOP from child {}", .{pid});
    var res = posix.waitpid(pid, 0);
    log_tracer.debug("child wait {} WIFEXITED={} WIFSTOPPED={}",.{res, linux.W.IFEXITED(res.status), linux.W.IFSTOPPED(res.status)});

    log_tracer.debug("expected child to stop at syscall-start {}", .{pid});
    try posix.ptrace(linux.PTRACE.SYSCALL, pid, 0, 0);
    res = posix.waitpid(pid, 0);
    log_tracer.debug("child wait {} WIFEXITED={} WIFSTOPPED={}",.{res, linux.W.IFEXITED(res.status), linux.W.IFSTOPPED(res.status)});

    log_tracer.debug("expected child to stop at syscall-end {}", .{pid});
    try posix.ptrace(linux.PTRACE.SYSCALL, pid, 0, 0);
    res = posix.waitpid(pid, 0);
    log_tracer.debug("child wait {} WIFEXITED={} WIFSTOPPED={}",.{res, linux.W.IFEXITED(res.status), linux.W.IFSTOPPED(res.status)});

    // try posix.ptrace(linux.PTRACE.SYSCALL, pid, 0, 0);
    // res = posix.waitpid(pid, 0);
    // log.debug("child WIFEXITED={} WIFSTOPPED={}",.{linux.W.IFEXITED(res.status), linux.W.IFSTOPPED(res.status)});
    // log.debug("child stopped: {}", .{res});

    log_tracer.debug("resuming child {}",.{pid});
    try posix.ptrace(linux.PTRACE.DETACH, pid, 0, 0);
    res = posix.waitpid(pid, 0);
    log_tracer.debug("child wait {} WIFEXITED={} WIFSTOPPED={}",.{res, linux.W.IFEXITED(res.status), linux.W.IFSTOPPED(res.status)});

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
        return continueChild(allocator, args);
    } else {
        try waitChildAndContinueParent(pid);
    }
}

test "ptrace function signature" {
    // Test to understand ptrace signature with PTRACE_ATTACH
    const result = posix.ptrace(linux.PTRACE.ATTACH, 1, null, null);
    _ = result;
}
