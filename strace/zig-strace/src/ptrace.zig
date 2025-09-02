const std = @import("std");
const os = std.os;
const linux = os.linux;
const posix = std.posix;
const log_syscall = std.log.scoped(.ptrace);

pub const O_TRACESYSGOOD: u32 = 1;
pub const O_TRACEEXEC: u32 = 16;

// ptrace_syscall_info structure from Linux kernel
pub const ptrace_syscall_info = extern struct {
    pub const SYSCALL_INFO_ENTRY: u8 = 1;
    pub const SYSCALL_INFO_EXIT: u8 = 2;

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

    pub fn isEntry(self: *const ptrace_syscall_info) bool {
        return self.op == SYSCALL_INFO_ENTRY;
    }

    pub fn isExit(self: *const ptrace_syscall_info) bool {
        return self.op == SYSCALL_INFO_EXIT;
    }
};

pub fn syscallNameFromNum(syscall_num: u64) []const u8 {
    const syscall_enum = std.meta.intToEnum(linux.SYS, syscall_num) catch return "unknown";
    return @tagName(syscall_enum);
}

pub const Tracer = struct {
    const Self = @This();

    pid: posix.pid_t,

    pub fn init(pid: posix.pid_t) Self {
        return Self{ .pid = pid };
    }

    /// PTRACE_SETOPTIONS since Linux 2.4.6; see BUGS for caveats)
    ///     Set ptrace options from data.  (addr is ignored.)  data is
    ///     interpreted as a bit mask of options, which are specified
    ///     by the following flags:
    pub fn setOptions(self: Self, opts: usize) !void {
        try posix.ptrace(linux.PTRACE.SETOPTIONS, self.pid, 0, opts);
    }

    /// PTRACE_CONT
    ///     Restart the stopped tracee process.  If data is nonzero, it
    ///     is interpreted as the number of a signal to be delivered to
    ///     the tracee; otherwise, no signal is delivered.  Thus, for
    ///     example, the tracer can control whether a signal sent to
    ///     the tracee is delivered or not.  (addr is ignored.)
    pub fn cont(self: Self, sig: ?usize) !void {
        try posix.ptrace(linux.PTRACE.CONT, self.pid, 0, sig orelse 0);
    }

    pub fn syscall(self: Self) !void {
        try posix.ptrace(linux.PTRACE.SYSCALL, self.pid, 0, 0);
    }

    pub fn getSyscallInfo(self: Self, allocator: std.mem.Allocator) !*ptrace_syscall_info {
        const syscall_info = try allocator.create(ptrace_syscall_info);
        errdefer allocator.destroy(syscall_info);

        // PTRACE_GET_SYSCALL_INFO requires Linux 5.3+
        try posix.ptrace(linux.PTRACE.GET_SYSCALL_INFO, self.pid, @sizeOf(ptrace_syscall_info), @intFromPtr(syscall_info));

        if (syscall_info.op == 0) {
            return error.NotAtSyscallStop;
        }

        return syscall_info;
    }
};

pub const Tracee = struct {
    const Self = @This();

    pub fn init() Self {
        return Self{};
    }

    // calls PTRACE_TRACEME, also raises(SIGSTOP) by convention
    // to stop the child process and indicate tracer to start tracing
    pub fn traceMe(_: Self) !void {
        // Child declares itself traceable by parent
        // see: https://man7.org/linux/man-pages/man2/ptrace.2.html#:~:text=to%20be%20performed%3A-,PTRACE_TRACEME,-Indicate%20that%20this
        try posix.ptrace(linux.PTRACE.TRACEME, 0, 0, 0);
        // common practice to call this as per manual
        // ref: https://man7.org/linux/man-pages/man2/ptrace.2.html#:~:text=A%20common%20practice%20is%20to%20follow%0A%20%20%20%20%20%20%20the%20PTRACE_TRACEME%20with%0A%0A%20%20%20%20%20%20%20%20%20%20%20raise(SIGSTOP)%3B
        try posix.raise(linux.SIG.STOP);
    }
};
