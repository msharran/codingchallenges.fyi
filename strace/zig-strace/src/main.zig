const std = @import("std");
const os = std.os;
const linux = os.linux;
const posix = std.posix;
const eprint = std.debug.print;
const log = std.log.scoped(.strace);
const stdout = std.io.getStdOut().writer();

pub const log_level: std.log.Level = .debug;

fn continueChild(allocator: std.mem.Allocator, args: [][:0]u8) !void {
    // Child process will return pid 0

    // PTRACE_TRACEME: Child declares itself traceable by parent
    // see: https://man7.org/linux/man-pages/man2/ptrace.2.html#:~:text=to%20be%20performed%3A-,PTRACE_TRACEME,-Indicate%20that%20this
    try posix.ptrace(linux.PTRACE.TRACEME, 0, 0, 0);

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
        log.debug("argv[{d}]: {s}", .{ i, argv[i].? });
    }

    const envp = [_:null]?[*:0]const u8{null};
    const argv_ptr: [*:null]const ?[*:0]const u8 = @ptrCast(argv.ptr);

    // execvpeZ: The 'Z' suffix indicates null-terminated strings (C-style)
    // - file: null-terminated string ([*:0]const u8)
    // - argv: array of null-terminated string pointers
    // - envp: array of null-terminated string pointers
    return posix.execvpeZ(args[1], argv_ptr, &envp);
}

fn waitChildAndContinueParent(pid: posix.pid_t) void {
    // Parent process will recieve child's pid
    const res = posix.waitpid(pid, 0);
    log.debug("child result: {}", .{res});
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer {
        const check = gpa.deinit();
        log.debug("Mem leak check: {}", .{check});
    }
    const allocator = gpa.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len < 2) {
        eprint("Usage: {s} <command> [args...]\n", .{args[0]});
        return;
    }

    const pid = try posix.fork();

    if (pid == 0) {
        return continueChild(allocator, args);
    } else {
        waitChildAndContinueParent(pid);
    }
}

test "ptrace function signature" {
    // Test to understand ptrace signature with PTRACE_ATTACH
    const result = posix.ptrace(linux.PTRACE.ATTACH, 1, null, null);
    _ = result;
}
