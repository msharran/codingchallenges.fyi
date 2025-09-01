const std = @import("std");
const os = std.os;
const linux = os.linux;
const posix = std.posix;
const log_tracer = std.log.scoped(.parent);
const log_tracee = std.log.scoped(.child);

pub const log_level: std.log.Level = .debug;

// ARM64 user_regs_struct equivalent to /usr/include/sys/user.h
const UserRegsStruct = extern struct {
    regs: [31]u64, // X0-X30 general purpose registers
    sp: u64, // Stack pointer
    pc: u64, // Program counter
    pstate: u64, // Processor state

    pub fn getSyscallNumber(self: *const UserRegsStruct) u64 {
        return self.regs[8]; // X8 contains syscall number on ARM64
    }

    pub fn getSyscallArgs(self: *const UserRegsStruct) [6]u64 {
        return [6]u64{
            self.regs[0], // X0
            self.regs[1], // X1
            self.regs[2], // X2
            self.regs[3], // X3
            self.regs[4], // X4
            self.regs[5], // X5
        };
    }

    pub fn getReturnValue(self: *const UserRegsStruct) u64 {
        return self.regs[0]; // X0 contains return value
    }

    pub fn format(self: UserRegsStruct, comptime fmt: []const u8, options: std.fmt.FormatOptions, writer: anytype) !void {
        _ = fmt;
        _ = options;
        try writer.print("UserRegs{{ syscall={any}, pc=0x{x}, sp=0x{x}, args=[0x{x}, 0x{x}, 0x{x}, 0x{x}, 0x{x}, 0x{x}] }}", .{ self.getSyscallNumber(), self.pc, self.sp, self.regs[0], self.regs[1], self.regs[2], self.regs[3], self.regs[4], self.regs[5] });
    }
};

// iovec structure for PTRACE_GETREGSET (matches Linux kernel's struct iovec)
const IoVec = extern struct {
    iov_base: *anyopaque,
    iov_len: usize,
};

// NT constants from linux/elf.h
const NT_PRSTATUS: u32 = 1; // General purpose registers

// PTRACE options from linux/ptrace.h
const PTRACE_O_TRACESYSGOOD: u32 = 1;

// PTRACE_GET_SYSCALL_INFO constants
const PTRACE_SYSCALL_INFO_ENTRY: u8 = 1;
const PTRACE_SYSCALL_INFO_EXIT: u8 = 2;
const PTRACE_SYSCALL_INFO_SECCOMP: u8 = 3;

// ptrace_syscall_info structure from Linux kernel
const PtraceSyscallInfo = extern struct {
    op: u8, // Type of system call stop
    arch: u32, // AUDIT_ARCH_* value (compiler will add 3 bytes padding before this)
    instruction_pointer: u64, // CPU instruction pointer
    stack_pointer: u64, // CPU stack pointer
    data: extern union {
        entry: extern struct {
            nr: u64, // System call number
            args: [6]u64, // System call arguments
        },
        exit: extern struct {
            rval: i64, // System call return value
            is_error: u8, // System call error flag
        },
        seccomp: extern struct {
            nr: u64, // System call number
            args: [6]u64, // System call arguments
            ret_data: u32, // SECCOMP_RET_DATA
        },
    },
};

const SYS = linux.SYS;

fn getSyscallName(syscall_num: u64) []const u8 {
    const syscall_enum = std.meta.intToEnum(linux.SYS, syscall_num) catch return "unknown";
    return @tagName(syscall_enum);
}

fn getSignalName(signal_num: u32) []const u8 {
    return switch (signal_num) {
        linux.SIG.HUP => "SIGHUP",
        linux.SIG.INT => "SIGINT",
        linux.SIG.QUIT => "SIGQUIT",
        linux.SIG.ILL => "SIGILL",
        linux.SIG.TRAP => "SIGTRAP",
        linux.SIG.ABRT => "SIGABRT",
        linux.SIG.BUS => "SIGBUS",
        linux.SIG.FPE => "SIGFPE",
        linux.SIG.KILL => "SIGKILL",
        linux.SIG.USR1 => "SIGUSR1",
        linux.SIG.SEGV => "SIGSEGV",
        linux.SIG.USR2 => "SIGUSR2",
        linux.SIG.PIPE => "SIGPIPE",
        linux.SIG.ALRM => "SIGALRM",
        linux.SIG.TERM => "SIGTERM",
        linux.SIG.CHLD => "SIGCHLD",
        linux.SIG.CONT => "SIGCONT",
        linux.SIG.STOP => "SIGSTOP",
        linux.SIG.TSTP => "SIGTSTP",
        linux.SIG.TTIN => "SIGTTIN",
        linux.SIG.TTOU => "SIGTTOU",
        else => "UNKNOWN_SIGNAL",
    };
}

fn isSigTrap(num: u32) bool {
    return if (num == linux.SIG.TRAP) return true else false;
}

fn getSyscallInfo(allocator: std.mem.Allocator, pid: posix.pid_t) !*PtraceSyscallInfo {
    const syscall_info = try allocator.create(PtraceSyscallInfo);
    errdefer allocator.destroy(syscall_info);

    // Initialize to zeros to detect if data is actually written
    syscall_info.* = std.mem.zeroes(PtraceSyscallInfo);

    // PTRACE_GET_SYSCALL_INFO requires Linux 5.3+
    posix.ptrace(linux.PTRACE.GET_SYSCALL_INFO, pid, @sizeOf(PtraceSyscallInfo), @intFromPtr(syscall_info)) catch |err| {
        log_tracer.debug("PTRACE_GET_SYSCALL_INFO failed with error: {any}", .{err});
        return err;
    };

    log_tracer.debug("PTRACE_GET_SYSCALL_INFO completed", .{});

    log_tracer.debug("Syscall info: op={}, arch=0x{x}, ip=0x{x}, sp=0x{x}", .{ syscall_info.op, syscall_info.arch, syscall_info.instruction_pointer, syscall_info.stack_pointer });

    if (syscall_info.op == 0) {
        log_tracer.debug("Syscall info op=0, likely not at a syscall stop", .{});
        return error.NotAtSyscallStop;
    }

    return syscall_info;
}

fn getRegisters(allocator: std.mem.Allocator, pid: posix.pid_t) !*UserRegsStruct {
    const regs = try allocator.create(UserRegsStruct);
    errdefer allocator.destroy(regs); // Clean up on error

    // PTRACE_GETREGSET is the modern, architecture-independent way to read registers
    // Unlike legacy PTRACE_GETREGS (x86 only), GETREGSET supports ARM64 where this was tested
    // Uses iovec interface for flexible buffer sizes and NT_PRSTATUS for general-purpose registers
    // see: https://man7.org/linux/man-pages/man2/ptrace.2.html#:~:text=PTRACE_GETREGSET%20(since%20Linux%202.6.34)
    var iov = IoVec{
        .iov_base = regs,
        .iov_len = @sizeOf(UserRegsStruct),
    };

    log_tracer.debug("Attempting PTRACE_GETREGSET with iov_len={}", .{iov.iov_len});
    try posix.ptrace(linux.PTRACE.GETREGSET, pid, NT_PRSTATUS, @intFromPtr(&iov));
    log_tracer.debug("PTRACE_GETREGSET returned iov_len={}", .{iov.iov_len});

    return regs;
}

fn execChild(allocator: std.mem.Allocator, args: [][:0]u8) !void {
    // Child process will return pid 0

    log_tracee.debug("traceme! stopping execution", .{});
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

fn listenChild(allocator: std.mem.Allocator, pid: posix.pid_t) !void {
    // Child used PTRACE_TRACEME and raise(SIGSTOP),
    // so wait for the child to stop
    log_tracer.debug("expecting SIGSTOP from child {}", .{pid});
    var res = posix.waitpid(pid, 0);
    log_tracer.debug("child wait {} WIFEXITED={} WIFSTOPPED={}", .{ res, linux.W.IFEXITED(res.status), linux.W.IFSTOPPED(res.status) });

    // Set PTRACE_O_TRACESYSGOOD to get SIGTRAP|0x80 for syscall-stops
    log_tracer.debug("setting PTRACE_O_TRACESYSGOOD option", .{});
    try posix.ptrace(linux.PTRACE.SETOPTIONS, pid, 0, PTRACE_O_TRACESYSGOOD);

    log_tracer.debug("tracing child syscalls {}", .{pid});

    for (0..10) |i| {
        log_tracer.debug("trace iteration {}", .{i});
        try posix.ptrace(linux.PTRACE.SYSCALL, pid, 0, 0);
        res = posix.waitpid(pid, 0);
        log_tracer.debug("child wait {} WIFEXITED={} WIFSTOPPED={}", .{ res, linux.W.IFEXITED(res.status), linux.W.IFSTOPPED(res.status) });

        if (!linux.W.IFSTOPPED(res.status)) {
            log_tracer.debug("Child no longer stopped, breaking", .{});
            break;
        }

        const stop_signal = linux.W.STOPSIG(res.status);
        log_tracer.debug("Stop signal: {} (0x{x}), SIGTRAP|0x80 = {}", .{ stop_signal, stop_signal, linux.SIG.TRAP | 0x80 });

        if (stop_signal == (linux.SIG.TRAP | 0x80)) {
            const syscall_info = getSyscallInfo(allocator, pid) catch |err| {
                log_tracer.debug("getSyscallInfo failed: {any}", .{err});
                continue;
            };
            defer allocator.destroy(syscall_info);

            if (syscall_info.op == PTRACE_SYSCALL_INFO_ENTRY) {
                const syscall_name = getSyscallName(syscall_info.data.entry.nr);
                log_tracer.info("{s}({x}, {x}, {x}, {x}, {x}, {x})", .{ syscall_name, syscall_info.data.entry.args[0], syscall_info.data.entry.args[1], syscall_info.data.entry.args[2], syscall_info.data.entry.args[3], syscall_info.data.entry.args[4], syscall_info.data.entry.args[5] });
            } else if (syscall_info.op == PTRACE_SYSCALL_INFO_EXIT) {
                log_tracer.info("retval={} error={}", .{ syscall_info.data.exit.rval, syscall_info.data.exit.is_error });
            } else {
                log_tracer.debug("Unknown syscall info op: {}", .{syscall_info.op});
            }
        } else {
            log_tracer.info("Child stopped by signal: {} (not syscall-stop)", .{stop_signal});
        }
    }

    log_tracer.debug("detaching from child {}", .{pid});
    try posix.ptrace(linux.PTRACE.DETACH, pid, 0, 0);
    res = posix.waitpid(pid, 0);
    log_tracer.debug("child wait {} WIFEXITED={} WIFSTOPPED={}", .{ res, linux.W.IFEXITED(res.status), linux.W.IFSTOPPED(res.status) });
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
        // child process after fork
        return execChild(allocator, args);
    } else {
        // parent process after fork
        try listenChild(allocator, pid);
    }
}
