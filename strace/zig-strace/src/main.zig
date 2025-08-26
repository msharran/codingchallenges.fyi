const std = @import("std");
const os = std.os;
const linux = os.linux;
const posix = std.posix;
const eprint = std.debug.print;
const log = std.log.scoped(.strace);
const stdout = std.io.getStdOut().writer();

pub const log_level: std.log.Level = .debug;

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

    const child_cmd = args[1..]; // Include command name for execve

    const pid = try posix.fork();

    if (pid == 0) {
        // Child process will return pid 0
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

        return posix.execvpeZ(args[1], argv_ptr, &envp);
    } else {
        // Parent process will recieve child's pid
        const res = posix.waitpid(pid, 0);
        log.debug("child result: {}", .{res});
    }
}
