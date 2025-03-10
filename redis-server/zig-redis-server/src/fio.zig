pub const __builtin_bswap16 = @import("std").zig.c_builtins.__builtin_bswap16;
pub const __builtin_bswap32 = @import("std").zig.c_builtins.__builtin_bswap32;
pub const __builtin_bswap64 = @import("std").zig.c_builtins.__builtin_bswap64;
pub const __builtin_signbit = @import("std").zig.c_builtins.__builtin_signbit;
pub const __builtin_signbitf = @import("std").zig.c_builtins.__builtin_signbitf;
pub const __builtin_popcount = @import("std").zig.c_builtins.__builtin_popcount;
pub const __builtin_ctz = @import("std").zig.c_builtins.__builtin_ctz;
pub const __builtin_clz = @import("std").zig.c_builtins.__builtin_clz;
pub const __builtin_sqrt = @import("std").zig.c_builtins.__builtin_sqrt;
pub const __builtin_sqrtf = @import("std").zig.c_builtins.__builtin_sqrtf;
pub const __builtin_sin = @import("std").zig.c_builtins.__builtin_sin;
pub const __builtin_sinf = @import("std").zig.c_builtins.__builtin_sinf;
pub const __builtin_cos = @import("std").zig.c_builtins.__builtin_cos;
pub const __builtin_cosf = @import("std").zig.c_builtins.__builtin_cosf;
pub const __builtin_exp = @import("std").zig.c_builtins.__builtin_exp;
pub const __builtin_expf = @import("std").zig.c_builtins.__builtin_expf;
pub const __builtin_exp2 = @import("std").zig.c_builtins.__builtin_exp2;
pub const __builtin_exp2f = @import("std").zig.c_builtins.__builtin_exp2f;
pub const __builtin_log = @import("std").zig.c_builtins.__builtin_log;
pub const __builtin_logf = @import("std").zig.c_builtins.__builtin_logf;
pub const __builtin_log2 = @import("std").zig.c_builtins.__builtin_log2;
pub const __builtin_log2f = @import("std").zig.c_builtins.__builtin_log2f;
pub const __builtin_log10 = @import("std").zig.c_builtins.__builtin_log10;
pub const __builtin_log10f = @import("std").zig.c_builtins.__builtin_log10f;
pub const __builtin_abs = @import("std").zig.c_builtins.__builtin_abs;
pub const __builtin_labs = @import("std").zig.c_builtins.__builtin_labs;
pub const __builtin_llabs = @import("std").zig.c_builtins.__builtin_llabs;
pub const __builtin_fabs = @import("std").zig.c_builtins.__builtin_fabs;
pub const __builtin_fabsf = @import("std").zig.c_builtins.__builtin_fabsf;
pub const __builtin_floor = @import("std").zig.c_builtins.__builtin_floor;
pub const __builtin_floorf = @import("std").zig.c_builtins.__builtin_floorf;
pub const __builtin_ceil = @import("std").zig.c_builtins.__builtin_ceil;
pub const __builtin_ceilf = @import("std").zig.c_builtins.__builtin_ceilf;
pub const __builtin_trunc = @import("std").zig.c_builtins.__builtin_trunc;
pub const __builtin_truncf = @import("std").zig.c_builtins.__builtin_truncf;
pub const __builtin_round = @import("std").zig.c_builtins.__builtin_round;
pub const __builtin_roundf = @import("std").zig.c_builtins.__builtin_roundf;
pub const __builtin_strlen = @import("std").zig.c_builtins.__builtin_strlen;
pub const __builtin_strcmp = @import("std").zig.c_builtins.__builtin_strcmp;
pub const __builtin_object_size = @import("std").zig.c_builtins.__builtin_object_size;
pub const __builtin___memset_chk = @import("std").zig.c_builtins.__builtin___memset_chk;
pub const __builtin_memset = @import("std").zig.c_builtins.__builtin_memset;
pub const __builtin___memcpy_chk = @import("std").zig.c_builtins.__builtin___memcpy_chk;
pub const __builtin_memcpy = @import("std").zig.c_builtins.__builtin_memcpy;
pub const __builtin_expect = @import("std").zig.c_builtins.__builtin_expect;
pub const __builtin_nanf = @import("std").zig.c_builtins.__builtin_nanf;
pub const __builtin_huge_valf = @import("std").zig.c_builtins.__builtin_huge_valf;
pub const __builtin_inff = @import("std").zig.c_builtins.__builtin_inff;
pub const __builtin_isnan = @import("std").zig.c_builtins.__builtin_isnan;
pub const __builtin_isinf = @import("std").zig.c_builtins.__builtin_isinf;
pub const __builtin_isinf_sign = @import("std").zig.c_builtins.__builtin_isinf_sign;
pub const __has_builtin = @import("std").zig.c_builtins.__has_builtin;
pub const __builtin_assume = @import("std").zig.c_builtins.__builtin_assume;
pub const __builtin_unreachable = @import("std").zig.c_builtins.__builtin_unreachable;
pub const __builtin_constant_p = @import("std").zig.c_builtins.__builtin_constant_p;
pub const __builtin_mul_overflow = @import("std").zig.c_builtins.__builtin_mul_overflow;
pub extern fn __errno_location() [*c]c_int;
pub extern var program_invocation_name: [*c]u8;
pub extern var program_invocation_short_name: [*c]u8;
pub const error_t = c_int;
pub extern fn __sysconf(__name: c_int) c_long;
pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __int_least8_t = __int8_t;
pub const __uint_least8_t = __uint8_t;
pub const __int_least16_t = __int16_t;
pub const __uint_least16_t = __uint16_t;
pub const __int_least32_t = __int32_t;
pub const __uint_least32_t = __uint32_t;
pub const __int_least64_t = __int64_t;
pub const __uint_least64_t = __uint64_t;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_uint;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
pub const __fsid_t = extern struct {
    __val: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __suseconds64_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*anyopaque;
pub const __blksize_t = c_int;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = [*c]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
pub const sig_atomic_t = __sig_atomic_t;
pub const __sigset_t = extern struct {
    __val: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
};
pub const sigset_t = __sigset_t;
pub const pid_t = __pid_t;
pub const uid_t = __uid_t;
pub const time_t = __time_t;
pub const struct_timespec = extern struct {
    tv_sec: __time_t = @import("std").mem.zeroes(__time_t),
    tv_nsec: __syscall_slong_t = @import("std").mem.zeroes(__syscall_slong_t),
};
pub const union_sigval = extern union {
    sival_int: c_int,
    sival_ptr: ?*anyopaque,
};
pub const __sigval_t = union_sigval;
const struct_unnamed_2 = extern struct {
    si_pid: __pid_t = @import("std").mem.zeroes(__pid_t),
    si_uid: __uid_t = @import("std").mem.zeroes(__uid_t),
};
const struct_unnamed_3 = extern struct {
    si_tid: c_int = @import("std").mem.zeroes(c_int),
    si_overrun: c_int = @import("std").mem.zeroes(c_int),
    si_sigval: __sigval_t = @import("std").mem.zeroes(__sigval_t),
};
const struct_unnamed_4 = extern struct {
    si_pid: __pid_t = @import("std").mem.zeroes(__pid_t),
    si_uid: __uid_t = @import("std").mem.zeroes(__uid_t),
    si_sigval: __sigval_t = @import("std").mem.zeroes(__sigval_t),
};
const struct_unnamed_5 = extern struct {
    si_pid: __pid_t = @import("std").mem.zeroes(__pid_t),
    si_uid: __uid_t = @import("std").mem.zeroes(__uid_t),
    si_status: c_int = @import("std").mem.zeroes(c_int),
    si_utime: __clock_t = @import("std").mem.zeroes(__clock_t),
    si_stime: __clock_t = @import("std").mem.zeroes(__clock_t),
};
const struct_unnamed_8 = extern struct {
    _lower: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    _upper: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
const union_unnamed_7 = extern union {
    _addr_bnd: struct_unnamed_8,
    _pkey: __uint32_t,
};
const struct_unnamed_6 = extern struct {
    si_addr: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    si_addr_lsb: c_short = @import("std").mem.zeroes(c_short),
    _bounds: union_unnamed_7 = @import("std").mem.zeroes(union_unnamed_7),
};
const struct_unnamed_9 = extern struct {
    si_band: c_long = @import("std").mem.zeroes(c_long),
    si_fd: c_int = @import("std").mem.zeroes(c_int),
};
const struct_unnamed_10 = extern struct {
    _call_addr: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    _syscall: c_int = @import("std").mem.zeroes(c_int),
    _arch: c_uint = @import("std").mem.zeroes(c_uint),
};
const union_unnamed_1 = extern union {
    _pad: [28]c_int,
    _kill: struct_unnamed_2,
    _timer: struct_unnamed_3,
    _rt: struct_unnamed_4,
    _sigchld: struct_unnamed_5,
    _sigfault: struct_unnamed_6,
    _sigpoll: struct_unnamed_9,
    _sigsys: struct_unnamed_10,
};
pub const siginfo_t = extern struct {
    si_signo: c_int = @import("std").mem.zeroes(c_int),
    si_errno: c_int = @import("std").mem.zeroes(c_int),
    si_code: c_int = @import("std").mem.zeroes(c_int),
    __pad0: c_int = @import("std").mem.zeroes(c_int),
    _sifields: union_unnamed_1 = @import("std").mem.zeroes(union_unnamed_1),
};
pub const SI_ASYNCNL: c_int = -60;
pub const SI_DETHREAD: c_int = -7;
pub const SI_TKILL: c_int = -6;
pub const SI_SIGIO: c_int = -5;
pub const SI_ASYNCIO: c_int = -4;
pub const SI_MESGQ: c_int = -3;
pub const SI_TIMER: c_int = -2;
pub const SI_QUEUE: c_int = -1;
pub const SI_USER: c_int = 0;
pub const SI_KERNEL: c_int = 128;
const enum_unnamed_11 = c_int;
pub const ILL_ILLOPC: c_int = 1;
pub const ILL_ILLOPN: c_int = 2;
pub const ILL_ILLADR: c_int = 3;
pub const ILL_ILLTRP: c_int = 4;
pub const ILL_PRVOPC: c_int = 5;
pub const ILL_PRVREG: c_int = 6;
pub const ILL_COPROC: c_int = 7;
pub const ILL_BADSTK: c_int = 8;
pub const ILL_BADIADDR: c_int = 9;
const enum_unnamed_12 = c_uint;
pub const FPE_INTDIV: c_int = 1;
pub const FPE_INTOVF: c_int = 2;
pub const FPE_FLTDIV: c_int = 3;
pub const FPE_FLTOVF: c_int = 4;
pub const FPE_FLTUND: c_int = 5;
pub const FPE_FLTRES: c_int = 6;
pub const FPE_FLTINV: c_int = 7;
pub const FPE_FLTSUB: c_int = 8;
pub const FPE_FLTUNK: c_int = 14;
pub const FPE_CONDTRAP: c_int = 15;
const enum_unnamed_13 = c_uint;
pub const SEGV_MAPERR: c_int = 1;
pub const SEGV_ACCERR: c_int = 2;
pub const SEGV_BNDERR: c_int = 3;
pub const SEGV_PKUERR: c_int = 4;
pub const SEGV_ACCADI: c_int = 5;
pub const SEGV_ADIDERR: c_int = 6;
pub const SEGV_ADIPERR: c_int = 7;
pub const SEGV_MTEAERR: c_int = 8;
pub const SEGV_MTESERR: c_int = 9;
pub const SEGV_CPERR: c_int = 10;
const enum_unnamed_14 = c_uint;
pub const BUS_ADRALN: c_int = 1;
pub const BUS_ADRERR: c_int = 2;
pub const BUS_OBJERR: c_int = 3;
pub const BUS_MCEERR_AR: c_int = 4;
pub const BUS_MCEERR_AO: c_int = 5;
const enum_unnamed_15 = c_uint;
pub const TRAP_BRKPT: c_int = 1;
pub const TRAP_TRACE: c_int = 2;
pub const TRAP_BRANCH: c_int = 3;
pub const TRAP_HWBKPT: c_int = 4;
pub const TRAP_UNK: c_int = 5;
const enum_unnamed_16 = c_uint;
pub const CLD_EXITED: c_int = 1;
pub const CLD_KILLED: c_int = 2;
pub const CLD_DUMPED: c_int = 3;
pub const CLD_TRAPPED: c_int = 4;
pub const CLD_STOPPED: c_int = 5;
pub const CLD_CONTINUED: c_int = 6;
const enum_unnamed_17 = c_uint;
pub const POLL_IN: c_int = 1;
pub const POLL_OUT: c_int = 2;
pub const POLL_MSG: c_int = 3;
pub const POLL_ERR: c_int = 4;
pub const POLL_PRI: c_int = 5;
pub const POLL_HUP: c_int = 6;
const enum_unnamed_18 = c_uint;
pub const sigval_t = __sigval_t;
pub const union_pthread_attr_t = extern union {
    __size: [64]u8,
    __align: c_long,
};
pub const pthread_attr_t = union_pthread_attr_t;
const struct_unnamed_20 = extern struct {
    _function: ?*const fn (__sigval_t) callconv(.C) void = @import("std").mem.zeroes(?*const fn (__sigval_t) callconv(.C) void),
    _attribute: [*c]pthread_attr_t = @import("std").mem.zeroes([*c]pthread_attr_t),
};
const union_unnamed_19 = extern union {
    _pad: [12]c_int,
    _tid: __pid_t,
    _sigev_thread: struct_unnamed_20,
};
pub const struct_sigevent = extern struct {
    sigev_value: __sigval_t = @import("std").mem.zeroes(__sigval_t),
    sigev_signo: c_int = @import("std").mem.zeroes(c_int),
    sigev_notify: c_int = @import("std").mem.zeroes(c_int),
    _sigev_un: union_unnamed_19 = @import("std").mem.zeroes(union_unnamed_19),
};
pub const sigevent_t = struct_sigevent;
pub const SIGEV_SIGNAL: c_int = 0;
pub const SIGEV_NONE: c_int = 1;
pub const SIGEV_THREAD: c_int = 2;
pub const SIGEV_THREAD_ID: c_int = 4;
const enum_unnamed_21 = c_uint;
pub const __sighandler_t = ?*const fn (c_int) callconv(.C) void;
pub extern fn __sysv_signal(__sig: c_int, __handler: __sighandler_t) __sighandler_t;
pub extern fn sysv_signal(__sig: c_int, __handler: __sighandler_t) __sighandler_t;
pub extern fn signal(__sig: c_int, __handler: __sighandler_t) __sighandler_t;
pub extern fn kill(__pid: __pid_t, __sig: c_int) c_int;
pub extern fn killpg(__pgrp: __pid_t, __sig: c_int) c_int;
pub extern fn raise(__sig: c_int) c_int;
pub extern fn ssignal(__sig: c_int, __handler: __sighandler_t) __sighandler_t;
pub extern fn gsignal(__sig: c_int) c_int;
pub extern fn psignal(__sig: c_int, __s: [*c]const u8) void;
pub extern fn psiginfo(__pinfo: [*c]const siginfo_t, __s: [*c]const u8) void;
pub extern fn sigpause(__sig: c_int) c_int;
pub extern fn sigblock(__mask: c_int) c_int;
pub extern fn sigsetmask(__mask: c_int) c_int;
pub extern fn siggetmask() c_int;
pub const sighandler_t = __sighandler_t;
pub const sig_t = __sighandler_t;
pub extern fn sigemptyset(__set: [*c]sigset_t) c_int;
pub extern fn sigfillset(__set: [*c]sigset_t) c_int;
pub extern fn sigaddset(__set: [*c]sigset_t, __signo: c_int) c_int;
pub extern fn sigdelset(__set: [*c]sigset_t, __signo: c_int) c_int;
pub extern fn sigismember(__set: [*c]const sigset_t, __signo: c_int) c_int;
pub extern fn sigisemptyset(__set: [*c]const sigset_t) c_int;
pub extern fn sigandset(__set: [*c]sigset_t, __left: [*c]const sigset_t, __right: [*c]const sigset_t) c_int;
pub extern fn sigorset(__set: [*c]sigset_t, __left: [*c]const sigset_t, __right: [*c]const sigset_t) c_int;
const union_unnamed_22 = extern union {
    sa_handler: __sighandler_t,
    sa_sigaction: ?*const fn (c_int, [*c]siginfo_t, ?*anyopaque) callconv(.C) void,
};
pub const struct_sigaction = extern struct {
    __sigaction_handler: union_unnamed_22 = @import("std").mem.zeroes(union_unnamed_22),
    sa_mask: __sigset_t = @import("std").mem.zeroes(__sigset_t),
    sa_flags: c_int = @import("std").mem.zeroes(c_int),
    sa_restorer: ?*const fn () callconv(.C) void = @import("std").mem.zeroes(?*const fn () callconv(.C) void),
};
pub extern fn sigprocmask(__how: c_int, noalias __set: [*c]const sigset_t, noalias __oset: [*c]sigset_t) c_int;
pub extern fn sigsuspend(__set: [*c]const sigset_t) c_int;
pub extern fn sigaction(__sig: c_int, noalias __act: [*c]const struct_sigaction, noalias __oact: [*c]struct_sigaction) c_int;
pub extern fn sigpending(__set: [*c]sigset_t) c_int;
pub extern fn sigwait(noalias __set: [*c]const sigset_t, noalias __sig: [*c]c_int) c_int;
pub extern fn sigwaitinfo(noalias __set: [*c]const sigset_t, noalias __info: [*c]siginfo_t) c_int;
pub extern fn sigtimedwait(noalias __set: [*c]const sigset_t, noalias __info: [*c]siginfo_t, noalias __timeout: [*c]const struct_timespec) c_int;
pub extern fn sigqueue(__pid: __pid_t, __sig: c_int, __val: union_sigval) c_int;
pub const __s8 = i8;
pub const __u8 = u8;
pub const __s16 = c_short;
pub const __u16 = c_ushort;
pub const __s32 = c_int;
pub const __u32 = c_uint;
pub const __s64 = c_longlong;
pub const __u64 = c_ulonglong;
pub const __kernel_fd_set = extern struct {
    fds_bits: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
};
pub const __kernel_sighandler_t = ?*const fn (c_int) callconv(.C) void;
pub const __kernel_key_t = c_int;
pub const __kernel_mqd_t = c_int;
pub const __kernel_old_uid_t = c_ushort;
pub const __kernel_old_gid_t = c_ushort;
pub const __kernel_long_t = c_long;
pub const __kernel_ulong_t = c_ulong;
pub const __kernel_ino_t = __kernel_ulong_t;
pub const __kernel_mode_t = c_uint;
pub const __kernel_pid_t = c_int;
pub const __kernel_ipc_pid_t = c_int;
pub const __kernel_uid_t = c_uint;
pub const __kernel_gid_t = c_uint;
pub const __kernel_suseconds_t = __kernel_long_t;
pub const __kernel_daddr_t = c_int;
pub const __kernel_uid32_t = c_uint;
pub const __kernel_gid32_t = c_uint;
pub const __kernel_old_dev_t = c_uint;
pub const __kernel_size_t = __kernel_ulong_t;
pub const __kernel_ssize_t = __kernel_long_t;
pub const __kernel_ptrdiff_t = __kernel_long_t;
pub const __kernel_fsid_t = extern struct {
    val: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const __kernel_off_t = __kernel_long_t;
pub const __kernel_loff_t = c_longlong;
pub const __kernel_old_time_t = __kernel_long_t;
pub const __kernel_time_t = __kernel_long_t;
pub const __kernel_time64_t = c_longlong;
pub const __kernel_clock_t = __kernel_long_t;
pub const __kernel_timer_t = c_int;
pub const __kernel_clockid_t = c_int;
pub const __kernel_caddr_t = [*c]u8;
pub const __kernel_uid16_t = c_ushort;
pub const __kernel_gid16_t = c_ushort;
pub const __s128 = i128;
pub const __u128 = u128;
pub const __le16 = __u16;
pub const __be16 = __u16;
pub const __le32 = __u32;
pub const __be32 = __u32;
pub const __le64 = __u64;
pub const __be64 = __u64;
pub const __sum16 = __u16;
pub const __wsum = __u32;
pub const __poll_t = c_uint;
pub const struct_sigcontext = extern struct {
    fault_address: __u64 = @import("std").mem.zeroes(__u64),
    regs: [31]__u64 = @import("std").mem.zeroes([31]__u64),
    sp: __u64 = @import("std").mem.zeroes(__u64),
    pc: __u64 = @import("std").mem.zeroes(__u64),
    pstate: __u64 = @import("std").mem.zeroes(__u64),
    __reserved: [4096]__u8 align(16) = @import("std").mem.zeroes([4096]__u8),
};
pub const struct__aarch64_ctx = extern struct {
    magic: __u32 = @import("std").mem.zeroes(__u32),
    size: __u32 = @import("std").mem.zeroes(__u32),
};
pub const __uint128_t = u128;
pub const struct_fpsimd_context = extern struct {
    head: struct__aarch64_ctx = @import("std").mem.zeroes(struct__aarch64_ctx),
    fpsr: __u32 = @import("std").mem.zeroes(__u32),
    fpcr: __u32 = @import("std").mem.zeroes(__u32),
    vregs: [32]__uint128_t = @import("std").mem.zeroes([32]__uint128_t),
};
pub const struct_esr_context = extern struct {
    head: struct__aarch64_ctx = @import("std").mem.zeroes(struct__aarch64_ctx),
    esr: __u64 = @import("std").mem.zeroes(__u64),
};
pub const struct_extra_context = extern struct {
    head: struct__aarch64_ctx = @import("std").mem.zeroes(struct__aarch64_ctx),
    datap: __u64 = @import("std").mem.zeroes(__u64),
    size: __u32 = @import("std").mem.zeroes(__u32),
    __reserved: [3]__u32 = @import("std").mem.zeroes([3]__u32),
};
pub const struct_sve_context = extern struct {
    head: struct__aarch64_ctx = @import("std").mem.zeroes(struct__aarch64_ctx),
    vl: __u16 = @import("std").mem.zeroes(__u16),
    flags: __u16 = @import("std").mem.zeroes(__u16),
    __reserved: [2]__u16 = @import("std").mem.zeroes([2]__u16),
};
pub const struct_tpidr2_context = extern struct {
    head: struct__aarch64_ctx = @import("std").mem.zeroes(struct__aarch64_ctx),
    tpidr2: __u64 = @import("std").mem.zeroes(__u64),
};
pub const struct_za_context = extern struct {
    head: struct__aarch64_ctx = @import("std").mem.zeroes(struct__aarch64_ctx),
    vl: __u16 = @import("std").mem.zeroes(__u16),
    __reserved: [3]__u16 = @import("std").mem.zeroes([3]__u16),
};
pub const struct_zt_context = extern struct {
    head: struct__aarch64_ctx = @import("std").mem.zeroes(struct__aarch64_ctx),
    nregs: __u16 = @import("std").mem.zeroes(__u16),
    __reserved: [3]__u16 = @import("std").mem.zeroes([3]__u16),
};
pub extern fn sigreturn(__scp: [*c]struct_sigcontext) c_int;
pub const stack_t = extern struct {
    ss_sp: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ss_flags: c_int = @import("std").mem.zeroes(c_int),
    ss_size: usize = @import("std").mem.zeroes(usize),
};
pub const struct_timeval = extern struct {
    tv_sec: __time_t = @import("std").mem.zeroes(__time_t),
    tv_usec: __suseconds_t = @import("std").mem.zeroes(__suseconds_t),
};
pub const suseconds_t = __suseconds_t;
pub const __fd_mask = c_long;
pub const fd_set = extern struct {
    fds_bits: [16]__fd_mask = @import("std").mem.zeroes([16]__fd_mask),
};
pub const fd_mask = __fd_mask;
pub extern fn select(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]struct_timeval) c_int;
pub extern fn pselect(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]const struct_timespec, noalias __sigmask: [*c]const __sigset_t) c_int;
pub const struct_timezone = extern struct {
    tz_minuteswest: c_int = @import("std").mem.zeroes(c_int),
    tz_dsttime: c_int = @import("std").mem.zeroes(c_int),
};
pub extern fn gettimeofday(noalias __tv: [*c]struct_timeval, noalias __tz: ?*anyopaque) c_int;
pub extern fn settimeofday(__tv: [*c]const struct_timeval, __tz: [*c]const struct_timezone) c_int;
pub extern fn adjtime(__delta: [*c]const struct_timeval, __olddelta: [*c]struct_timeval) c_int;
pub const ITIMER_REAL: c_int = 0;
pub const ITIMER_VIRTUAL: c_int = 1;
pub const ITIMER_PROF: c_int = 2;
pub const enum___itimer_which = c_uint;
pub const struct_itimerval = extern struct {
    it_interval: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    it_value: struct_timeval = @import("std").mem.zeroes(struct_timeval),
};
pub const __itimer_which_t = enum___itimer_which;
pub extern fn getitimer(__which: __itimer_which_t, __value: [*c]struct_itimerval) c_int;
pub extern fn setitimer(__which: __itimer_which_t, noalias __new: [*c]const struct_itimerval, noalias __old: [*c]struct_itimerval) c_int;
pub extern fn utimes(__file: [*c]const u8, __tvp: [*c]const struct_timeval) c_int;
pub extern fn lutimes(__file: [*c]const u8, __tvp: [*c]const struct_timeval) c_int;
pub extern fn futimes(__fd: c_int, __tvp: [*c]const struct_timeval) c_int;
pub extern fn futimesat(__fd: c_int, __file: [*c]const u8, __tvp: [*c]const struct_timeval) c_int;
pub const u_char = __u_char;
pub const u_short = __u_short;
pub const u_int = __u_int;
pub const u_long = __u_long;
pub const quad_t = __quad_t;
pub const u_quad_t = __u_quad_t;
pub const fsid_t = __fsid_t;
pub const loff_t = __loff_t;
pub const ino_t = __ino_t;
pub const ino64_t = __ino64_t;
pub const dev_t = __dev_t;
pub const gid_t = __gid_t;
pub const mode_t = __mode_t;
pub const nlink_t = __nlink_t;
pub const off_t = __off_t;
pub const off64_t = __off64_t;
pub const id_t = __id_t;
pub const daddr_t = __daddr_t;
pub const caddr_t = __caddr_t;
pub const key_t = __key_t;
pub const clock_t = __clock_t;
pub const clockid_t = __clockid_t;
pub const timer_t = __timer_t;
pub const useconds_t = __useconds_t;
pub const ulong = c_ulong;
pub const ushort = c_ushort;
pub const uint = c_uint;
pub const u_int8_t = __uint8_t;
pub const u_int16_t = __uint16_t;
pub const u_int32_t = __uint32_t;
pub const u_int64_t = __uint64_t;
pub const register_t = c_long;
pub fn __bswap_16(arg___bsx: __uint16_t) callconv(.C) __uint16_t {
    var __bsx = arg___bsx;
    _ = &__bsx;
    return @as(__uint16_t, @bitCast(@as(c_short, @truncate(((@as(c_int, @bitCast(@as(c_uint, __bsx))) >> @intCast(8)) & @as(c_int, 255)) | ((@as(c_int, @bitCast(@as(c_uint, __bsx))) & @as(c_int, 255)) << @intCast(8))))));
}
pub fn __bswap_32(arg___bsx: __uint32_t) callconv(.C) __uint32_t {
    var __bsx = arg___bsx;
    _ = &__bsx;
    return ((((__bsx & @as(c_uint, 4278190080)) >> @intCast(24)) | ((__bsx & @as(c_uint, 16711680)) >> @intCast(8))) | ((__bsx & @as(c_uint, 65280)) << @intCast(8))) | ((__bsx & @as(c_uint, 255)) << @intCast(24));
}
pub fn __bswap_64(arg___bsx: __uint64_t) callconv(.C) __uint64_t {
    var __bsx = arg___bsx;
    _ = &__bsx;
    return @as(__uint64_t, @bitCast(@as(c_ulong, @truncate(((((((((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 18374686479671623680)) >> @intCast(56)) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 71776119061217280)) >> @intCast(40))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 280375465082880)) >> @intCast(24))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 1095216660480)) >> @intCast(8))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 4278190080)) << @intCast(8))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 16711680)) << @intCast(24))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 65280)) << @intCast(40))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 255)) << @intCast(56))))));
}
pub fn __uint16_identity(arg___x: __uint16_t) callconv(.C) __uint16_t {
    var __x = arg___x;
    _ = &__x;
    return __x;
}
pub fn __uint32_identity(arg___x: __uint32_t) callconv(.C) __uint32_t {
    var __x = arg___x;
    _ = &__x;
    return __x;
}
pub fn __uint64_identity(arg___x: __uint64_t) callconv(.C) __uint64_t {
    var __x = arg___x;
    _ = &__x;
    return __x;
}
pub const blksize_t = __blksize_t;
pub const blkcnt_t = __blkcnt_t;
pub const fsblkcnt_t = __fsblkcnt_t;
pub const fsfilcnt_t = __fsfilcnt_t;
pub const blkcnt64_t = __blkcnt64_t;
pub const fsblkcnt64_t = __fsblkcnt64_t;
pub const fsfilcnt64_t = __fsfilcnt64_t;
const struct_unnamed_23 = extern struct {
    __low: c_uint = @import("std").mem.zeroes(c_uint),
    __high: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const __atomic_wide_counter = extern union {
    __value64: c_ulonglong,
    __value32: struct_unnamed_23,
};
pub const struct___pthread_internal_list = extern struct {
    __prev: [*c]struct___pthread_internal_list = @import("std").mem.zeroes([*c]struct___pthread_internal_list),
    __next: [*c]struct___pthread_internal_list = @import("std").mem.zeroes([*c]struct___pthread_internal_list),
};
pub const __pthread_list_t = struct___pthread_internal_list;
pub const struct___pthread_internal_slist = extern struct {
    __next: [*c]struct___pthread_internal_slist = @import("std").mem.zeroes([*c]struct___pthread_internal_slist),
};
pub const __pthread_slist_t = struct___pthread_internal_slist;
pub const struct___pthread_mutex_s = extern struct {
    __lock: c_int = @import("std").mem.zeroes(c_int),
    __count: c_uint = @import("std").mem.zeroes(c_uint),
    __owner: c_int = @import("std").mem.zeroes(c_int),
    __nusers: c_uint = @import("std").mem.zeroes(c_uint),
    __kind: c_int = @import("std").mem.zeroes(c_int),
    __spins: c_int = @import("std").mem.zeroes(c_int),
    __list: __pthread_list_t = @import("std").mem.zeroes(__pthread_list_t),
};
pub const struct___pthread_rwlock_arch_t = extern struct {
    __readers: c_uint = @import("std").mem.zeroes(c_uint),
    __writers: c_uint = @import("std").mem.zeroes(c_uint),
    __wrphase_futex: c_uint = @import("std").mem.zeroes(c_uint),
    __writers_futex: c_uint = @import("std").mem.zeroes(c_uint),
    __pad3: c_uint = @import("std").mem.zeroes(c_uint),
    __pad4: c_uint = @import("std").mem.zeroes(c_uint),
    __cur_writer: c_int = @import("std").mem.zeroes(c_int),
    __shared: c_int = @import("std").mem.zeroes(c_int),
    __pad1: c_ulong = @import("std").mem.zeroes(c_ulong),
    __pad2: c_ulong = @import("std").mem.zeroes(c_ulong),
    __flags: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const struct___pthread_cond_s = extern struct {
    __wseq: __atomic_wide_counter = @import("std").mem.zeroes(__atomic_wide_counter),
    __g1_start: __atomic_wide_counter = @import("std").mem.zeroes(__atomic_wide_counter),
    __g_refs: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
    __g_size: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
    __g1_orig_size: c_uint = @import("std").mem.zeroes(c_uint),
    __wrefs: c_uint = @import("std").mem.zeroes(c_uint),
    __g_signals: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
};
pub const __tss_t = c_uint;
pub const __thrd_t = c_ulong;
pub const __once_flag = extern struct {
    __data: c_int = @import("std").mem.zeroes(c_int),
};
pub const pthread_t = c_ulong;
pub const pthread_mutexattr_t = extern union {
    __size: [8]u8,
    __align: c_int,
};
pub const pthread_condattr_t = extern union {
    __size: [8]u8,
    __align: c_int,
};
pub const pthread_key_t = c_uint;
pub const pthread_once_t = c_int;
pub const pthread_mutex_t = extern union {
    __data: struct___pthread_mutex_s,
    __size: [48]u8,
    __align: c_long,
};
pub const pthread_cond_t = extern union {
    __data: struct___pthread_cond_s,
    __size: [48]u8,
    __align: c_longlong,
};
pub const pthread_rwlock_t = extern union {
    __data: struct___pthread_rwlock_arch_t,
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_rwlockattr_t = extern union {
    __size: [8]u8,
    __align: c_long,
};
pub const pthread_spinlock_t = c_int;
pub const pthread_barrier_t = extern union {
    __size: [32]u8,
    __align: c_long,
};
pub const pthread_barrierattr_t = extern union {
    __size: [8]u8,
    __align: c_int,
};
pub const struct_user_regs_struct = extern struct {
    regs: [31]c_ulonglong = @import("std").mem.zeroes([31]c_ulonglong),
    sp: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
    pc: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
    pstate: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
};
pub const struct_user_fpsimd_struct = extern struct {
    vregs: [32]__uint128_t = @import("std").mem.zeroes([32]__uint128_t),
    fpsr: c_uint = @import("std").mem.zeroes(c_uint),
    fpcr: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const elf_greg_t = __uint64_t;
pub const elf_gregset_t = [34]elf_greg_t;
pub const elf_fpregset_t = struct_user_fpsimd_struct;
pub const __pr_uid_t = c_uint;
pub const __pr_gid_t = c_uint;
pub const struct_elf_siginfo = extern struct {
    si_signo: c_int = @import("std").mem.zeroes(c_int),
    si_code: c_int = @import("std").mem.zeroes(c_int),
    si_errno: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_elf_prstatus = extern struct {
    pr_info: struct_elf_siginfo = @import("std").mem.zeroes(struct_elf_siginfo),
    pr_cursig: c_short = @import("std").mem.zeroes(c_short),
    pr_sigpend: c_ulong = @import("std").mem.zeroes(c_ulong),
    pr_sighold: c_ulong = @import("std").mem.zeroes(c_ulong),
    pr_pid: __pid_t = @import("std").mem.zeroes(__pid_t),
    pr_ppid: __pid_t = @import("std").mem.zeroes(__pid_t),
    pr_pgrp: __pid_t = @import("std").mem.zeroes(__pid_t),
    pr_sid: __pid_t = @import("std").mem.zeroes(__pid_t),
    pr_utime: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    pr_stime: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    pr_cutime: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    pr_cstime: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    pr_reg: elf_gregset_t = @import("std").mem.zeroes(elf_gregset_t),
    pr_fpvalid: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_elf_prpsinfo = extern struct {
    pr_state: u8 = @import("std").mem.zeroes(u8),
    pr_sname: u8 = @import("std").mem.zeroes(u8),
    pr_zomb: u8 = @import("std").mem.zeroes(u8),
    pr_nice: u8 = @import("std").mem.zeroes(u8),
    pr_flag: c_ulong = @import("std").mem.zeroes(c_ulong),
    pr_uid: __pr_uid_t = @import("std").mem.zeroes(__pr_uid_t),
    pr_gid: __pr_gid_t = @import("std").mem.zeroes(__pr_gid_t),
    pr_pid: c_int = @import("std").mem.zeroes(c_int),
    pr_ppid: c_int = @import("std").mem.zeroes(c_int),
    pr_pgrp: c_int = @import("std").mem.zeroes(c_int),
    pr_sid: c_int = @import("std").mem.zeroes(c_int),
    pr_fname: [16]u8 = @import("std").mem.zeroes([16]u8),
    pr_psargs: [80]u8 = @import("std").mem.zeroes([80]u8),
};
pub const psaddr_t = ?*anyopaque;
pub const __prgregset_t = elf_gregset_t;
pub const __prfpregset_t = elf_fpregset_t;
pub const prgregset_t = __prgregset_t;
pub const prfpregset_t = __prfpregset_t;
pub const lwpid_t = __pid_t;
pub const prstatus_t = struct_elf_prstatus;
pub const prpsinfo_t = struct_elf_prpsinfo;
pub const greg_t = elf_greg_t;
pub const gregset_t = elf_gregset_t;
pub const fpregset_t = elf_fpregset_t;
pub const mcontext_t = extern struct {
    fault_address: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
    regs: [31]c_ulonglong = @import("std").mem.zeroes([31]c_ulonglong),
    sp: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
    pc: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
    pstate: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
    __reserved: [4096]u8 align(16) = @import("std").mem.zeroes([4096]u8),
};
pub const struct_ucontext_t = extern struct {
    uc_flags: c_ulong = @import("std").mem.zeroes(c_ulong),
    uc_link: [*c]struct_ucontext_t = @import("std").mem.zeroes([*c]struct_ucontext_t),
    uc_stack: stack_t = @import("std").mem.zeroes(stack_t),
    uc_sigmask: sigset_t = @import("std").mem.zeroes(sigset_t),
    uc_mcontext: mcontext_t = @import("std").mem.zeroes(mcontext_t),
};
pub const ucontext_t = struct_ucontext_t;
pub extern fn siginterrupt(__sig: c_int, __interrupt: c_int) c_int;
pub const socklen_t = __socklen_t;
pub extern fn access(__name: [*c]const u8, __type: c_int) c_int;
pub extern fn euidaccess(__name: [*c]const u8, __type: c_int) c_int;
pub extern fn eaccess(__name: [*c]const u8, __type: c_int) c_int;
pub extern fn execveat(__fd: c_int, __path: [*c]const u8, __argv: [*c]const [*c]u8, __envp: [*c]const [*c]u8, __flags: c_int) c_int;
pub extern fn faccessat(__fd: c_int, __file: [*c]const u8, __type: c_int, __flag: c_int) c_int;
pub extern fn lseek(__fd: c_int, __offset: __off_t, __whence: c_int) __off_t;
pub extern fn lseek64(__fd: c_int, __offset: __off64_t, __whence: c_int) __off64_t;
pub extern fn close(__fd: c_int) c_int;
pub extern fn closefrom(__lowfd: c_int) void;
pub extern fn read(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize) isize;
pub extern fn write(__fd: c_int, __buf: ?*const anyopaque, __n: usize) isize;
pub extern fn pread(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize, __offset: __off_t) isize;
pub extern fn pwrite(__fd: c_int, __buf: ?*const anyopaque, __n: usize, __offset: __off_t) isize;
pub extern fn pread64(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize, __offset: __off64_t) isize;
pub extern fn pwrite64(__fd: c_int, __buf: ?*const anyopaque, __n: usize, __offset: __off64_t) isize;
pub extern fn pipe(__pipedes: [*c]c_int) c_int;
pub extern fn pipe2(__pipedes: [*c]c_int, __flags: c_int) c_int;
pub extern fn alarm(__seconds: c_uint) c_uint;
pub extern fn sleep(__seconds: c_uint) c_uint;
pub extern fn ualarm(__value: __useconds_t, __interval: __useconds_t) __useconds_t;
pub extern fn usleep(__useconds: __useconds_t) c_int;
pub extern fn pause() c_int;
pub extern fn chown(__file: [*c]const u8, __owner: __uid_t, __group: __gid_t) c_int;
pub extern fn fchown(__fd: c_int, __owner: __uid_t, __group: __gid_t) c_int;
pub extern fn lchown(__file: [*c]const u8, __owner: __uid_t, __group: __gid_t) c_int;
pub extern fn fchownat(__fd: c_int, __file: [*c]const u8, __owner: __uid_t, __group: __gid_t, __flag: c_int) c_int;
pub extern fn chdir(__path: [*c]const u8) c_int;
pub extern fn fchdir(__fd: c_int) c_int;
pub extern fn getcwd(__buf: [*c]u8, __size: usize) [*c]u8;
pub extern fn get_current_dir_name() [*c]u8;
pub extern fn getwd(__buf: [*c]u8) [*c]u8;
pub extern fn dup(__fd: c_int) c_int;
pub extern fn dup2(__fd: c_int, __fd2: c_int) c_int;
pub extern fn dup3(__fd: c_int, __fd2: c_int, __flags: c_int) c_int;
pub extern var __environ: [*c][*c]u8;
pub extern var environ: [*c][*c]u8;
pub extern fn execve(__path: [*c]const u8, __argv: [*c]const [*c]u8, __envp: [*c]const [*c]u8) c_int;
pub extern fn fexecve(__fd: c_int, __argv: [*c]const [*c]u8, __envp: [*c]const [*c]u8) c_int;
pub extern fn execv(__path: [*c]const u8, __argv: [*c]const [*c]u8) c_int;
pub extern fn execle(__path: [*c]const u8, __arg: [*c]const u8, ...) c_int;
pub extern fn execl(__path: [*c]const u8, __arg: [*c]const u8, ...) c_int;
pub extern fn execvp(__file: [*c]const u8, __argv: [*c]const [*c]u8) c_int;
pub extern fn execlp(__file: [*c]const u8, __arg: [*c]const u8, ...) c_int;
pub extern fn execvpe(__file: [*c]const u8, __argv: [*c]const [*c]u8, __envp: [*c]const [*c]u8) c_int;
pub extern fn nice(__inc: c_int) c_int;
pub extern fn _exit(__status: c_int) noreturn;
pub const _PC_LINK_MAX: c_int = 0;
pub const _PC_MAX_CANON: c_int = 1;
pub const _PC_MAX_INPUT: c_int = 2;
pub const _PC_NAME_MAX: c_int = 3;
pub const _PC_PATH_MAX: c_int = 4;
pub const _PC_PIPE_BUF: c_int = 5;
pub const _PC_CHOWN_RESTRICTED: c_int = 6;
pub const _PC_NO_TRUNC: c_int = 7;
pub const _PC_VDISABLE: c_int = 8;
pub const _PC_SYNC_IO: c_int = 9;
pub const _PC_ASYNC_IO: c_int = 10;
pub const _PC_PRIO_IO: c_int = 11;
pub const _PC_SOCK_MAXBUF: c_int = 12;
pub const _PC_FILESIZEBITS: c_int = 13;
pub const _PC_REC_INCR_XFER_SIZE: c_int = 14;
pub const _PC_REC_MAX_XFER_SIZE: c_int = 15;
pub const _PC_REC_MIN_XFER_SIZE: c_int = 16;
pub const _PC_REC_XFER_ALIGN: c_int = 17;
pub const _PC_ALLOC_SIZE_MIN: c_int = 18;
pub const _PC_SYMLINK_MAX: c_int = 19;
pub const _PC_2_SYMLINKS: c_int = 20;
const enum_unnamed_24 = c_uint;
pub const _SC_ARG_MAX: c_int = 0;
pub const _SC_CHILD_MAX: c_int = 1;
pub const _SC_CLK_TCK: c_int = 2;
pub const _SC_NGROUPS_MAX: c_int = 3;
pub const _SC_OPEN_MAX: c_int = 4;
pub const _SC_STREAM_MAX: c_int = 5;
pub const _SC_TZNAME_MAX: c_int = 6;
pub const _SC_JOB_CONTROL: c_int = 7;
pub const _SC_SAVED_IDS: c_int = 8;
pub const _SC_REALTIME_SIGNALS: c_int = 9;
pub const _SC_PRIORITY_SCHEDULING: c_int = 10;
pub const _SC_TIMERS: c_int = 11;
pub const _SC_ASYNCHRONOUS_IO: c_int = 12;
pub const _SC_PRIORITIZED_IO: c_int = 13;
pub const _SC_SYNCHRONIZED_IO: c_int = 14;
pub const _SC_FSYNC: c_int = 15;
pub const _SC_MAPPED_FILES: c_int = 16;
pub const _SC_MEMLOCK: c_int = 17;
pub const _SC_MEMLOCK_RANGE: c_int = 18;
pub const _SC_MEMORY_PROTECTION: c_int = 19;
pub const _SC_MESSAGE_PASSING: c_int = 20;
pub const _SC_SEMAPHORES: c_int = 21;
pub const _SC_SHARED_MEMORY_OBJECTS: c_int = 22;
pub const _SC_AIO_LISTIO_MAX: c_int = 23;
pub const _SC_AIO_MAX: c_int = 24;
pub const _SC_AIO_PRIO_DELTA_MAX: c_int = 25;
pub const _SC_DELAYTIMER_MAX: c_int = 26;
pub const _SC_MQ_OPEN_MAX: c_int = 27;
pub const _SC_MQ_PRIO_MAX: c_int = 28;
pub const _SC_VERSION: c_int = 29;
pub const _SC_PAGESIZE: c_int = 30;
pub const _SC_RTSIG_MAX: c_int = 31;
pub const _SC_SEM_NSEMS_MAX: c_int = 32;
pub const _SC_SEM_VALUE_MAX: c_int = 33;
pub const _SC_SIGQUEUE_MAX: c_int = 34;
pub const _SC_TIMER_MAX: c_int = 35;
pub const _SC_BC_BASE_MAX: c_int = 36;
pub const _SC_BC_DIM_MAX: c_int = 37;
pub const _SC_BC_SCALE_MAX: c_int = 38;
pub const _SC_BC_STRING_MAX: c_int = 39;
pub const _SC_COLL_WEIGHTS_MAX: c_int = 40;
pub const _SC_EQUIV_CLASS_MAX: c_int = 41;
pub const _SC_EXPR_NEST_MAX: c_int = 42;
pub const _SC_LINE_MAX: c_int = 43;
pub const _SC_RE_DUP_MAX: c_int = 44;
pub const _SC_CHARCLASS_NAME_MAX: c_int = 45;
pub const _SC_2_VERSION: c_int = 46;
pub const _SC_2_C_BIND: c_int = 47;
pub const _SC_2_C_DEV: c_int = 48;
pub const _SC_2_FORT_DEV: c_int = 49;
pub const _SC_2_FORT_RUN: c_int = 50;
pub const _SC_2_SW_DEV: c_int = 51;
pub const _SC_2_LOCALEDEF: c_int = 52;
pub const _SC_PII: c_int = 53;
pub const _SC_PII_XTI: c_int = 54;
pub const _SC_PII_SOCKET: c_int = 55;
pub const _SC_PII_INTERNET: c_int = 56;
pub const _SC_PII_OSI: c_int = 57;
pub const _SC_POLL: c_int = 58;
pub const _SC_SELECT: c_int = 59;
pub const _SC_UIO_MAXIOV: c_int = 60;
pub const _SC_IOV_MAX: c_int = 60;
pub const _SC_PII_INTERNET_STREAM: c_int = 61;
pub const _SC_PII_INTERNET_DGRAM: c_int = 62;
pub const _SC_PII_OSI_COTS: c_int = 63;
pub const _SC_PII_OSI_CLTS: c_int = 64;
pub const _SC_PII_OSI_M: c_int = 65;
pub const _SC_T_IOV_MAX: c_int = 66;
pub const _SC_THREADS: c_int = 67;
pub const _SC_THREAD_SAFE_FUNCTIONS: c_int = 68;
pub const _SC_GETGR_R_SIZE_MAX: c_int = 69;
pub const _SC_GETPW_R_SIZE_MAX: c_int = 70;
pub const _SC_LOGIN_NAME_MAX: c_int = 71;
pub const _SC_TTY_NAME_MAX: c_int = 72;
pub const _SC_THREAD_DESTRUCTOR_ITERATIONS: c_int = 73;
pub const _SC_THREAD_KEYS_MAX: c_int = 74;
pub const _SC_THREAD_STACK_MIN: c_int = 75;
pub const _SC_THREAD_THREADS_MAX: c_int = 76;
pub const _SC_THREAD_ATTR_STACKADDR: c_int = 77;
pub const _SC_THREAD_ATTR_STACKSIZE: c_int = 78;
pub const _SC_THREAD_PRIORITY_SCHEDULING: c_int = 79;
pub const _SC_THREAD_PRIO_INHERIT: c_int = 80;
pub const _SC_THREAD_PRIO_PROTECT: c_int = 81;
pub const _SC_THREAD_PROCESS_SHARED: c_int = 82;
pub const _SC_NPROCESSORS_CONF: c_int = 83;
pub const _SC_NPROCESSORS_ONLN: c_int = 84;
pub const _SC_PHYS_PAGES: c_int = 85;
pub const _SC_AVPHYS_PAGES: c_int = 86;
pub const _SC_ATEXIT_MAX: c_int = 87;
pub const _SC_PASS_MAX: c_int = 88;
pub const _SC_XOPEN_VERSION: c_int = 89;
pub const _SC_XOPEN_XCU_VERSION: c_int = 90;
pub const _SC_XOPEN_UNIX: c_int = 91;
pub const _SC_XOPEN_CRYPT: c_int = 92;
pub const _SC_XOPEN_ENH_I18N: c_int = 93;
pub const _SC_XOPEN_SHM: c_int = 94;
pub const _SC_2_CHAR_TERM: c_int = 95;
pub const _SC_2_C_VERSION: c_int = 96;
pub const _SC_2_UPE: c_int = 97;
pub const _SC_XOPEN_XPG2: c_int = 98;
pub const _SC_XOPEN_XPG3: c_int = 99;
pub const _SC_XOPEN_XPG4: c_int = 100;
pub const _SC_CHAR_BIT: c_int = 101;
pub const _SC_CHAR_MAX: c_int = 102;
pub const _SC_CHAR_MIN: c_int = 103;
pub const _SC_INT_MAX: c_int = 104;
pub const _SC_INT_MIN: c_int = 105;
pub const _SC_LONG_BIT: c_int = 106;
pub const _SC_WORD_BIT: c_int = 107;
pub const _SC_MB_LEN_MAX: c_int = 108;
pub const _SC_NZERO: c_int = 109;
pub const _SC_SSIZE_MAX: c_int = 110;
pub const _SC_SCHAR_MAX: c_int = 111;
pub const _SC_SCHAR_MIN: c_int = 112;
pub const _SC_SHRT_MAX: c_int = 113;
pub const _SC_SHRT_MIN: c_int = 114;
pub const _SC_UCHAR_MAX: c_int = 115;
pub const _SC_UINT_MAX: c_int = 116;
pub const _SC_ULONG_MAX: c_int = 117;
pub const _SC_USHRT_MAX: c_int = 118;
pub const _SC_NL_ARGMAX: c_int = 119;
pub const _SC_NL_LANGMAX: c_int = 120;
pub const _SC_NL_MSGMAX: c_int = 121;
pub const _SC_NL_NMAX: c_int = 122;
pub const _SC_NL_SETMAX: c_int = 123;
pub const _SC_NL_TEXTMAX: c_int = 124;
pub const _SC_XBS5_ILP32_OFF32: c_int = 125;
pub const _SC_XBS5_ILP32_OFFBIG: c_int = 126;
pub const _SC_XBS5_LP64_OFF64: c_int = 127;
pub const _SC_XBS5_LPBIG_OFFBIG: c_int = 128;
pub const _SC_XOPEN_LEGACY: c_int = 129;
pub const _SC_XOPEN_REALTIME: c_int = 130;
pub const _SC_XOPEN_REALTIME_THREADS: c_int = 131;
pub const _SC_ADVISORY_INFO: c_int = 132;
pub const _SC_BARRIERS: c_int = 133;
pub const _SC_BASE: c_int = 134;
pub const _SC_C_LANG_SUPPORT: c_int = 135;
pub const _SC_C_LANG_SUPPORT_R: c_int = 136;
pub const _SC_CLOCK_SELECTION: c_int = 137;
pub const _SC_CPUTIME: c_int = 138;
pub const _SC_THREAD_CPUTIME: c_int = 139;
pub const _SC_DEVICE_IO: c_int = 140;
pub const _SC_DEVICE_SPECIFIC: c_int = 141;
pub const _SC_DEVICE_SPECIFIC_R: c_int = 142;
pub const _SC_FD_MGMT: c_int = 143;
pub const _SC_FIFO: c_int = 144;
pub const _SC_PIPE: c_int = 145;
pub const _SC_FILE_ATTRIBUTES: c_int = 146;
pub const _SC_FILE_LOCKING: c_int = 147;
pub const _SC_FILE_SYSTEM: c_int = 148;
pub const _SC_MONOTONIC_CLOCK: c_int = 149;
pub const _SC_MULTI_PROCESS: c_int = 150;
pub const _SC_SINGLE_PROCESS: c_int = 151;
pub const _SC_NETWORKING: c_int = 152;
pub const _SC_READER_WRITER_LOCKS: c_int = 153;
pub const _SC_SPIN_LOCKS: c_int = 154;
pub const _SC_REGEXP: c_int = 155;
pub const _SC_REGEX_VERSION: c_int = 156;
pub const _SC_SHELL: c_int = 157;
pub const _SC_SIGNALS: c_int = 158;
pub const _SC_SPAWN: c_int = 159;
pub const _SC_SPORADIC_SERVER: c_int = 160;
pub const _SC_THREAD_SPORADIC_SERVER: c_int = 161;
pub const _SC_SYSTEM_DATABASE: c_int = 162;
pub const _SC_SYSTEM_DATABASE_R: c_int = 163;
pub const _SC_TIMEOUTS: c_int = 164;
pub const _SC_TYPED_MEMORY_OBJECTS: c_int = 165;
pub const _SC_USER_GROUPS: c_int = 166;
pub const _SC_USER_GROUPS_R: c_int = 167;
pub const _SC_2_PBS: c_int = 168;
pub const _SC_2_PBS_ACCOUNTING: c_int = 169;
pub const _SC_2_PBS_LOCATE: c_int = 170;
pub const _SC_2_PBS_MESSAGE: c_int = 171;
pub const _SC_2_PBS_TRACK: c_int = 172;
pub const _SC_SYMLOOP_MAX: c_int = 173;
pub const _SC_STREAMS: c_int = 174;
pub const _SC_2_PBS_CHECKPOINT: c_int = 175;
pub const _SC_V6_ILP32_OFF32: c_int = 176;
pub const _SC_V6_ILP32_OFFBIG: c_int = 177;
pub const _SC_V6_LP64_OFF64: c_int = 178;
pub const _SC_V6_LPBIG_OFFBIG: c_int = 179;
pub const _SC_HOST_NAME_MAX: c_int = 180;
pub const _SC_TRACE: c_int = 181;
pub const _SC_TRACE_EVENT_FILTER: c_int = 182;
pub const _SC_TRACE_INHERIT: c_int = 183;
pub const _SC_TRACE_LOG: c_int = 184;
pub const _SC_LEVEL1_ICACHE_SIZE: c_int = 185;
pub const _SC_LEVEL1_ICACHE_ASSOC: c_int = 186;
pub const _SC_LEVEL1_ICACHE_LINESIZE: c_int = 187;
pub const _SC_LEVEL1_DCACHE_SIZE: c_int = 188;
pub const _SC_LEVEL1_DCACHE_ASSOC: c_int = 189;
pub const _SC_LEVEL1_DCACHE_LINESIZE: c_int = 190;
pub const _SC_LEVEL2_CACHE_SIZE: c_int = 191;
pub const _SC_LEVEL2_CACHE_ASSOC: c_int = 192;
pub const _SC_LEVEL2_CACHE_LINESIZE: c_int = 193;
pub const _SC_LEVEL3_CACHE_SIZE: c_int = 194;
pub const _SC_LEVEL3_CACHE_ASSOC: c_int = 195;
pub const _SC_LEVEL3_CACHE_LINESIZE: c_int = 196;
pub const _SC_LEVEL4_CACHE_SIZE: c_int = 197;
pub const _SC_LEVEL4_CACHE_ASSOC: c_int = 198;
pub const _SC_LEVEL4_CACHE_LINESIZE: c_int = 199;
pub const _SC_IPV6: c_int = 235;
pub const _SC_RAW_SOCKETS: c_int = 236;
pub const _SC_V7_ILP32_OFF32: c_int = 237;
pub const _SC_V7_ILP32_OFFBIG: c_int = 238;
pub const _SC_V7_LP64_OFF64: c_int = 239;
pub const _SC_V7_LPBIG_OFFBIG: c_int = 240;
pub const _SC_SS_REPL_MAX: c_int = 241;
pub const _SC_TRACE_EVENT_NAME_MAX: c_int = 242;
pub const _SC_TRACE_NAME_MAX: c_int = 243;
pub const _SC_TRACE_SYS_MAX: c_int = 244;
pub const _SC_TRACE_USER_EVENT_MAX: c_int = 245;
pub const _SC_XOPEN_STREAMS: c_int = 246;
pub const _SC_THREAD_ROBUST_PRIO_INHERIT: c_int = 247;
pub const _SC_THREAD_ROBUST_PRIO_PROTECT: c_int = 248;
pub const _SC_MINSIGSTKSZ: c_int = 249;
pub const _SC_SIGSTKSZ: c_int = 250;
const enum_unnamed_25 = c_uint;
pub const _CS_PATH: c_int = 0;
pub const _CS_V6_WIDTH_RESTRICTED_ENVS: c_int = 1;
pub const _CS_GNU_LIBC_VERSION: c_int = 2;
pub const _CS_GNU_LIBPTHREAD_VERSION: c_int = 3;
pub const _CS_V5_WIDTH_RESTRICTED_ENVS: c_int = 4;
pub const _CS_V7_WIDTH_RESTRICTED_ENVS: c_int = 5;
pub const _CS_LFS_CFLAGS: c_int = 1000;
pub const _CS_LFS_LDFLAGS: c_int = 1001;
pub const _CS_LFS_LIBS: c_int = 1002;
pub const _CS_LFS_LINTFLAGS: c_int = 1003;
pub const _CS_LFS64_CFLAGS: c_int = 1004;
pub const _CS_LFS64_LDFLAGS: c_int = 1005;
pub const _CS_LFS64_LIBS: c_int = 1006;
pub const _CS_LFS64_LINTFLAGS: c_int = 1007;
pub const _CS_XBS5_ILP32_OFF32_CFLAGS: c_int = 1100;
pub const _CS_XBS5_ILP32_OFF32_LDFLAGS: c_int = 1101;
pub const _CS_XBS5_ILP32_OFF32_LIBS: c_int = 1102;
pub const _CS_XBS5_ILP32_OFF32_LINTFLAGS: c_int = 1103;
pub const _CS_XBS5_ILP32_OFFBIG_CFLAGS: c_int = 1104;
pub const _CS_XBS5_ILP32_OFFBIG_LDFLAGS: c_int = 1105;
pub const _CS_XBS5_ILP32_OFFBIG_LIBS: c_int = 1106;
pub const _CS_XBS5_ILP32_OFFBIG_LINTFLAGS: c_int = 1107;
pub const _CS_XBS5_LP64_OFF64_CFLAGS: c_int = 1108;
pub const _CS_XBS5_LP64_OFF64_LDFLAGS: c_int = 1109;
pub const _CS_XBS5_LP64_OFF64_LIBS: c_int = 1110;
pub const _CS_XBS5_LP64_OFF64_LINTFLAGS: c_int = 1111;
pub const _CS_XBS5_LPBIG_OFFBIG_CFLAGS: c_int = 1112;
pub const _CS_XBS5_LPBIG_OFFBIG_LDFLAGS: c_int = 1113;
pub const _CS_XBS5_LPBIG_OFFBIG_LIBS: c_int = 1114;
pub const _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS: c_int = 1115;
pub const _CS_POSIX_V6_ILP32_OFF32_CFLAGS: c_int = 1116;
pub const _CS_POSIX_V6_ILP32_OFF32_LDFLAGS: c_int = 1117;
pub const _CS_POSIX_V6_ILP32_OFF32_LIBS: c_int = 1118;
pub const _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS: c_int = 1119;
pub const _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS: c_int = 1120;
pub const _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS: c_int = 1121;
pub const _CS_POSIX_V6_ILP32_OFFBIG_LIBS: c_int = 1122;
pub const _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS: c_int = 1123;
pub const _CS_POSIX_V6_LP64_OFF64_CFLAGS: c_int = 1124;
pub const _CS_POSIX_V6_LP64_OFF64_LDFLAGS: c_int = 1125;
pub const _CS_POSIX_V6_LP64_OFF64_LIBS: c_int = 1126;
pub const _CS_POSIX_V6_LP64_OFF64_LINTFLAGS: c_int = 1127;
pub const _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS: c_int = 1128;
pub const _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS: c_int = 1129;
pub const _CS_POSIX_V6_LPBIG_OFFBIG_LIBS: c_int = 1130;
pub const _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS: c_int = 1131;
pub const _CS_POSIX_V7_ILP32_OFF32_CFLAGS: c_int = 1132;
pub const _CS_POSIX_V7_ILP32_OFF32_LDFLAGS: c_int = 1133;
pub const _CS_POSIX_V7_ILP32_OFF32_LIBS: c_int = 1134;
pub const _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS: c_int = 1135;
pub const _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS: c_int = 1136;
pub const _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS: c_int = 1137;
pub const _CS_POSIX_V7_ILP32_OFFBIG_LIBS: c_int = 1138;
pub const _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS: c_int = 1139;
pub const _CS_POSIX_V7_LP64_OFF64_CFLAGS: c_int = 1140;
pub const _CS_POSIX_V7_LP64_OFF64_LDFLAGS: c_int = 1141;
pub const _CS_POSIX_V7_LP64_OFF64_LIBS: c_int = 1142;
pub const _CS_POSIX_V7_LP64_OFF64_LINTFLAGS: c_int = 1143;
pub const _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS: c_int = 1144;
pub const _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS: c_int = 1145;
pub const _CS_POSIX_V7_LPBIG_OFFBIG_LIBS: c_int = 1146;
pub const _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS: c_int = 1147;
pub const _CS_V6_ENV: c_int = 1148;
pub const _CS_V7_ENV: c_int = 1149;
const enum_unnamed_26 = c_uint;
pub extern fn pathconf(__path: [*c]const u8, __name: c_int) c_long;
pub extern fn fpathconf(__fd: c_int, __name: c_int) c_long;
pub extern fn sysconf(__name: c_int) c_long;
pub extern fn confstr(__name: c_int, __buf: [*c]u8, __len: usize) usize;
pub extern fn getpid() __pid_t;
pub extern fn getppid() __pid_t;
pub extern fn getpgrp() __pid_t;
pub extern fn __getpgid(__pid: __pid_t) __pid_t;
pub extern fn getpgid(__pid: __pid_t) __pid_t;
pub extern fn setpgid(__pid: __pid_t, __pgid: __pid_t) c_int;
pub extern fn setpgrp() c_int;
pub extern fn setsid() __pid_t;
pub extern fn getsid(__pid: __pid_t) __pid_t;
pub extern fn getuid() __uid_t;
pub extern fn geteuid() __uid_t;
pub extern fn getgid() __gid_t;
pub extern fn getegid() __gid_t;
pub extern fn getgroups(__size: c_int, __list: [*c]__gid_t) c_int;
pub extern fn group_member(__gid: __gid_t) c_int;
pub extern fn setuid(__uid: __uid_t) c_int;
pub extern fn setreuid(__ruid: __uid_t, __euid: __uid_t) c_int;
pub extern fn seteuid(__uid: __uid_t) c_int;
pub extern fn setgid(__gid: __gid_t) c_int;
pub extern fn setregid(__rgid: __gid_t, __egid: __gid_t) c_int;
pub extern fn setegid(__gid: __gid_t) c_int;
pub extern fn getresuid(__ruid: [*c]__uid_t, __euid: [*c]__uid_t, __suid: [*c]__uid_t) c_int;
pub extern fn getresgid(__rgid: [*c]__gid_t, __egid: [*c]__gid_t, __sgid: [*c]__gid_t) c_int;
pub extern fn setresuid(__ruid: __uid_t, __euid: __uid_t, __suid: __uid_t) c_int;
pub extern fn setresgid(__rgid: __gid_t, __egid: __gid_t, __sgid: __gid_t) c_int;
pub extern fn fork() __pid_t;
pub extern fn vfork() c_int;
pub extern fn _Fork() __pid_t;
pub extern fn ttyname(__fd: c_int) [*c]u8;
pub extern fn ttyname_r(__fd: c_int, __buf: [*c]u8, __buflen: usize) c_int;
pub extern fn isatty(__fd: c_int) c_int;
pub extern fn ttyslot() c_int;
pub extern fn link(__from: [*c]const u8, __to: [*c]const u8) c_int;
pub extern fn linkat(__fromfd: c_int, __from: [*c]const u8, __tofd: c_int, __to: [*c]const u8, __flags: c_int) c_int;
pub extern fn symlink(__from: [*c]const u8, __to: [*c]const u8) c_int;
pub extern fn readlink(noalias __path: [*c]const u8, noalias __buf: [*c]u8, __len: usize) isize;
pub extern fn symlinkat(__from: [*c]const u8, __tofd: c_int, __to: [*c]const u8) c_int;
pub extern fn readlinkat(__fd: c_int, noalias __path: [*c]const u8, noalias __buf: [*c]u8, __len: usize) isize;
pub extern fn unlink(__name: [*c]const u8) c_int;
pub extern fn unlinkat(__fd: c_int, __name: [*c]const u8, __flag: c_int) c_int;
pub extern fn rmdir(__path: [*c]const u8) c_int;
pub extern fn tcgetpgrp(__fd: c_int) __pid_t;
pub extern fn tcsetpgrp(__fd: c_int, __pgrp_id: __pid_t) c_int;
pub extern fn getlogin() [*c]u8;
pub extern fn getlogin_r(__name: [*c]u8, __name_len: usize) c_int;
pub extern fn setlogin(__name: [*c]const u8) c_int;
pub extern var optarg: [*c]u8;
pub extern var optind: c_int;
pub extern var opterr: c_int;
pub extern var optopt: c_int;
pub extern fn getopt(___argc: c_int, ___argv: [*c]const [*c]u8, __shortopts: [*c]const u8) c_int;
pub extern fn gethostname(__name: [*c]u8, __len: usize) c_int;
pub extern fn sethostname(__name: [*c]const u8, __len: usize) c_int;
pub extern fn sethostid(__id: c_long) c_int;
pub extern fn getdomainname(__name: [*c]u8, __len: usize) c_int;
pub extern fn setdomainname(__name: [*c]const u8, __len: usize) c_int;
pub extern fn vhangup() c_int;
pub extern fn revoke(__file: [*c]const u8) c_int;
pub extern fn profil(__sample_buffer: [*c]c_ushort, __size: usize, __offset: usize, __scale: c_uint) c_int;
pub extern fn acct(__name: [*c]const u8) c_int;
pub extern fn getusershell() [*c]u8;
pub extern fn endusershell() void;
pub extern fn setusershell() void;
pub extern fn daemon(__nochdir: c_int, __noclose: c_int) c_int;
pub extern fn chroot(__path: [*c]const u8) c_int;
pub extern fn getpass(__prompt: [*c]const u8) [*c]u8;
pub extern fn fsync(__fd: c_int) c_int;
pub extern fn syncfs(__fd: c_int) c_int;
pub extern fn gethostid() c_long;
pub extern fn sync() void;
pub extern fn getpagesize() c_int;
pub extern fn getdtablesize() c_int;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub extern fn truncate64(__file: [*c]const u8, __length: __off64_t) c_int;
pub extern fn ftruncate(__fd: c_int, __length: __off_t) c_int;
pub extern fn ftruncate64(__fd: c_int, __length: __off64_t) c_int;
pub extern fn brk(__addr: ?*anyopaque) c_int;
pub extern fn sbrk(__delta: isize) ?*anyopaque;
pub extern fn syscall(__sysno: c_long, ...) c_long;
pub extern fn lockf(__fd: c_int, __cmd: c_int, __len: __off_t) c_int;
pub extern fn lockf64(__fd: c_int, __cmd: c_int, __len: __off64_t) c_int;
pub extern fn copy_file_range(__infd: c_int, __pinoff: [*c]__off64_t, __outfd: c_int, __poutoff: [*c]__off64_t, __length: usize, __flags: c_uint) isize;
pub extern fn fdatasync(__fildes: c_int) c_int;
pub extern fn crypt(__key: [*c]const u8, __salt: [*c]const u8) [*c]u8;
pub extern fn swab(noalias __from: ?*const anyopaque, noalias __to: ?*anyopaque, __n: isize) void;
pub extern fn getentropy(__buffer: ?*anyopaque, __length: usize) c_int;
pub extern fn close_range(__fd: c_uint, __max_fd: c_uint, __flags: c_int) c_int;
pub extern fn gettid() __pid_t;
pub const SS_ONSTACK: c_int = 1;
pub const SS_DISABLE: c_int = 2;
const enum_unnamed_27 = c_uint;
pub extern fn sigaltstack(noalias __ss: [*c]const stack_t, noalias __oss: [*c]stack_t) c_int;
pub const struct_sigstack = extern struct {
    ss_sp: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ss_onstack: c_int = @import("std").mem.zeroes(c_int),
};
pub extern fn sigstack(__ss: [*c]struct_sigstack, __oss: [*c]struct_sigstack) c_int;
pub extern fn sighold(__sig: c_int) c_int;
pub extern fn sigrelse(__sig: c_int) c_int;
pub extern fn sigignore(__sig: c_int) c_int;
pub extern fn sigset(__sig: c_int, __disp: __sighandler_t) __sighandler_t;
pub extern fn pthread_sigmask(__how: c_int, noalias __newmask: [*c]const __sigset_t, noalias __oldmask: [*c]__sigset_t) c_int;
pub extern fn pthread_kill(__threadid: pthread_t, __signo: c_int) c_int;
pub extern fn pthread_sigqueue(__threadid: pthread_t, __signo: c_int, __value: union_sigval) c_int;
pub extern fn __libc_current_sigrtmin() c_int;
pub extern fn __libc_current_sigrtmax() c_int;
pub extern fn tgkill(__tgid: __pid_t, __tid: __pid_t, __signal: c_int) c_int;
pub const struct___va_list_28 = extern struct {
    __stack: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    __gr_top: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    __vr_top: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    __gr_offs: c_int = @import("std").mem.zeroes(c_int),
    __vr_offs: c_int = @import("std").mem.zeroes(c_int),
};
pub const __builtin_va_list = struct___va_list_28;
pub const __gnuc_va_list = __builtin_va_list;
pub const va_list = __builtin_va_list;
pub const int_least8_t = __int_least8_t;
pub const int_least16_t = __int_least16_t;
pub const int_least32_t = __int_least32_t;
pub const int_least64_t = __int_least64_t;
pub const uint_least8_t = __uint_least8_t;
pub const uint_least16_t = __uint_least16_t;
pub const uint_least32_t = __uint_least32_t;
pub const uint_least64_t = __uint_least64_t;
pub const int_fast8_t = i8;
pub const int_fast16_t = c_long;
pub const int_fast32_t = c_long;
pub const int_fast64_t = c_long;
pub const uint_fast8_t = u8;
pub const uint_fast16_t = c_ulong;
pub const uint_fast32_t = c_ulong;
pub const uint_fast64_t = c_ulong;
pub const intmax_t = __intmax_t;
pub const uintmax_t = __uintmax_t;
const union_unnamed_29 = extern union {
    __wch: c_uint,
    __wchb: [4]u8,
};
pub const __mbstate_t = extern struct {
    __count: c_int = @import("std").mem.zeroes(c_int),
    __value: union_unnamed_29 = @import("std").mem.zeroes(union_unnamed_29),
};
pub const struct__G_fpos_t = extern struct {
    __pos: __off_t = @import("std").mem.zeroes(__off_t),
    __state: __mbstate_t = @import("std").mem.zeroes(__mbstate_t),
};
pub const __fpos_t = struct__G_fpos_t;
pub const struct__G_fpos64_t = extern struct {
    __pos: __off64_t = @import("std").mem.zeroes(__off64_t),
    __state: __mbstate_t = @import("std").mem.zeroes(__mbstate_t),
};
pub const __fpos64_t = struct__G_fpos64_t;
pub const struct__IO_marker = opaque {};
pub const _IO_lock_t = anyopaque;
pub const struct__IO_codecvt = opaque {};
pub const struct__IO_wide_data = opaque {};
pub const struct__IO_FILE = extern struct {
    _flags: c_int = @import("std").mem.zeroes(c_int),
    _IO_read_ptr: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_read_end: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_read_base: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_write_base: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_write_ptr: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_write_end: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_buf_base: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_buf_end: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_save_base: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_backup_base: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_save_end: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _markers: ?*struct__IO_marker = @import("std").mem.zeroes(?*struct__IO_marker),
    _chain: [*c]struct__IO_FILE = @import("std").mem.zeroes([*c]struct__IO_FILE),
    _fileno: c_int = @import("std").mem.zeroes(c_int),
    _flags2: c_int = @import("std").mem.zeroes(c_int),
    _old_offset: __off_t = @import("std").mem.zeroes(__off_t),
    _cur_column: c_ushort = @import("std").mem.zeroes(c_ushort),
    _vtable_offset: i8 = @import("std").mem.zeroes(i8),
    _shortbuf: [1]u8 = @import("std").mem.zeroes([1]u8),
    _lock: ?*_IO_lock_t = @import("std").mem.zeroes(?*_IO_lock_t),
    _offset: __off64_t = @import("std").mem.zeroes(__off64_t),
    _codecvt: ?*struct__IO_codecvt = @import("std").mem.zeroes(?*struct__IO_codecvt),
    _wide_data: ?*struct__IO_wide_data = @import("std").mem.zeroes(?*struct__IO_wide_data),
    _freeres_list: [*c]struct__IO_FILE = @import("std").mem.zeroes([*c]struct__IO_FILE),
    _freeres_buf: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    __pad5: usize = @import("std").mem.zeroes(usize),
    _mode: c_int = @import("std").mem.zeroes(c_int),
    _unused2: [20]u8 = @import("std").mem.zeroes([20]u8),
};
pub const __FILE = struct__IO_FILE;
pub const FILE = struct__IO_FILE;
pub const cookie_read_function_t = fn (?*anyopaque, [*c]u8, usize) callconv(.C) __ssize_t;
pub const cookie_write_function_t = fn (?*anyopaque, [*c]const u8, usize) callconv(.C) __ssize_t;
pub const cookie_seek_function_t = fn (?*anyopaque, [*c]__off64_t, c_int) callconv(.C) c_int;
pub const cookie_close_function_t = fn (?*anyopaque) callconv(.C) c_int;
pub const struct__IO_cookie_io_functions_t = extern struct {
    read: ?*const cookie_read_function_t = @import("std").mem.zeroes(?*const cookie_read_function_t),
    write: ?*const cookie_write_function_t = @import("std").mem.zeroes(?*const cookie_write_function_t),
    seek: ?*const cookie_seek_function_t = @import("std").mem.zeroes(?*const cookie_seek_function_t),
    close: ?*const cookie_close_function_t = @import("std").mem.zeroes(?*const cookie_close_function_t),
};
pub const cookie_io_functions_t = struct__IO_cookie_io_functions_t;
pub const fpos_t = __fpos_t;
pub const fpos64_t = __fpos64_t;
pub extern var stdin: [*c]FILE;
pub extern var stdout: [*c]FILE;
pub extern var stderr: [*c]FILE;
pub extern fn remove(__filename: [*c]const u8) c_int;
pub extern fn rename(__old: [*c]const u8, __new: [*c]const u8) c_int;
pub extern fn renameat(__oldfd: c_int, __old: [*c]const u8, __newfd: c_int, __new: [*c]const u8) c_int;
pub extern fn renameat2(__oldfd: c_int, __old: [*c]const u8, __newfd: c_int, __new: [*c]const u8, __flags: c_uint) c_int;
pub extern fn fclose(__stream: [*c]FILE) c_int;
pub extern fn tmpfile() [*c]FILE;
pub extern fn tmpfile64() [*c]FILE;
pub extern fn tmpnam([*c]u8) [*c]u8;
pub extern fn tmpnam_r(__s: [*c]u8) [*c]u8;
pub extern fn tempnam(__dir: [*c]const u8, __pfx: [*c]const u8) [*c]u8;
pub extern fn fflush(__stream: [*c]FILE) c_int;
pub extern fn fflush_unlocked(__stream: [*c]FILE) c_int;
pub extern fn fcloseall() c_int;
pub extern fn fopen(__filename: [*c]const u8, __modes: [*c]const u8) [*c]FILE;
pub extern fn freopen(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8, noalias __stream: [*c]FILE) [*c]FILE;
pub extern fn fopen64(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8) [*c]FILE;
pub extern fn freopen64(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8, noalias __stream: [*c]FILE) [*c]FILE;
pub extern fn fdopen(__fd: c_int, __modes: [*c]const u8) [*c]FILE;
pub extern fn fopencookie(noalias __magic_cookie: ?*anyopaque, noalias __modes: [*c]const u8, __io_funcs: cookie_io_functions_t) [*c]FILE;
pub extern fn fmemopen(__s: ?*anyopaque, __len: usize, __modes: [*c]const u8) [*c]FILE;
pub extern fn open_memstream(__bufloc: [*c][*c]u8, __sizeloc: [*c]usize) [*c]FILE;
pub extern fn setbuf(noalias __stream: [*c]FILE, noalias __buf: [*c]u8) void;
pub extern fn setvbuf(noalias __stream: [*c]FILE, noalias __buf: [*c]u8, __modes: c_int, __n: usize) c_int;
pub extern fn setbuffer(noalias __stream: [*c]FILE, noalias __buf: [*c]u8, __size: usize) void;
pub extern fn setlinebuf(__stream: [*c]FILE) void;
pub extern fn fprintf(__stream: [*c]FILE, __format: [*c]const u8, ...) c_int;
pub extern fn printf(__format: [*c]const u8, ...) c_int;
pub extern fn sprintf(__s: [*c]u8, __format: [*c]const u8, ...) c_int;
pub extern fn vfprintf(__s: [*c]FILE, __format: [*c]const u8, __arg: __builtin_va_list) c_int;
pub extern fn vprintf(__format: [*c]const u8, __arg: __builtin_va_list) c_int;
pub extern fn vsprintf(__s: [*c]u8, __format: [*c]const u8, __arg: __builtin_va_list) c_int;
pub extern fn snprintf(__s: [*c]u8, __maxlen: c_ulong, __format: [*c]const u8, ...) c_int;
pub extern fn vsnprintf(__s: [*c]u8, __maxlen: c_ulong, __format: [*c]const u8, __arg: __builtin_va_list) c_int;
pub extern fn vasprintf(noalias __ptr: [*c][*c]u8, noalias __f: [*c]const u8, __arg: __gnuc_va_list) c_int;
pub extern fn __asprintf(noalias __ptr: [*c][*c]u8, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn asprintf(noalias __ptr: [*c][*c]u8, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn vdprintf(__fd: c_int, noalias __fmt: [*c]const u8, __arg: __gnuc_va_list) c_int;
pub extern fn dprintf(__fd: c_int, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn fscanf(noalias __stream: [*c]FILE, noalias __format: [*c]const u8, ...) c_int;
pub extern fn scanf(noalias __format: [*c]const u8, ...) c_int;
pub extern fn sscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, ...) c_int;
pub const _Float128 = c_longdouble;
pub const _Float32 = f32;
pub const _Float64 = f64;
pub const _Float32x = f64;
pub const _Float64x = c_longdouble;
pub extern fn vfscanf(noalias __s: [*c]FILE, noalias __format: [*c]const u8, __arg: __builtin_va_list) c_int;
pub extern fn vscanf(noalias __format: [*c]const u8, __arg: __builtin_va_list) c_int;
pub extern fn vsscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, __arg: __builtin_va_list) c_int;
pub extern fn fgetc(__stream: [*c]FILE) c_int;
pub extern fn getc(__stream: [*c]FILE) c_int;
pub extern fn getchar() c_int;
pub extern fn getc_unlocked(__stream: [*c]FILE) c_int;
pub extern fn getchar_unlocked() c_int;
pub extern fn fgetc_unlocked(__stream: [*c]FILE) c_int;
pub extern fn fputc(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putc(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putchar(__c: c_int) c_int;
pub extern fn fputc_unlocked(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putc_unlocked(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putchar_unlocked(__c: c_int) c_int;
pub extern fn getw(__stream: [*c]FILE) c_int;
pub extern fn putw(__w: c_int, __stream: [*c]FILE) c_int;
pub extern fn fgets(noalias __s: [*c]u8, __n: c_int, noalias __stream: [*c]FILE) [*c]u8;
pub extern fn fgets_unlocked(noalias __s: [*c]u8, __n: c_int, noalias __stream: [*c]FILE) [*c]u8;
pub extern fn __getdelim(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn getdelim(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn getline(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn fputs(noalias __s: [*c]const u8, noalias __stream: [*c]FILE) c_int;
pub extern fn puts(__s: [*c]const u8) c_int;
pub extern fn ungetc(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn fread(__ptr: ?*anyopaque, __size: c_ulong, __n: c_ulong, __stream: [*c]FILE) c_ulong;
pub extern fn fwrite(__ptr: ?*const anyopaque, __size: c_ulong, __n: c_ulong, __s: [*c]FILE) c_ulong;
pub extern fn fputs_unlocked(noalias __s: [*c]const u8, noalias __stream: [*c]FILE) c_int;
pub extern fn fread_unlocked(noalias __ptr: ?*anyopaque, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn fwrite_unlocked(noalias __ptr: ?*const anyopaque, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn fseek(__stream: [*c]FILE, __off: c_long, __whence: c_int) c_int;
pub extern fn ftell(__stream: [*c]FILE) c_long;
pub extern fn rewind(__stream: [*c]FILE) void;
pub extern fn fseeko(__stream: [*c]FILE, __off: __off_t, __whence: c_int) c_int;
pub extern fn ftello(__stream: [*c]FILE) __off_t;
pub extern fn fgetpos(noalias __stream: [*c]FILE, noalias __pos: [*c]fpos_t) c_int;
pub extern fn fsetpos(__stream: [*c]FILE, __pos: [*c]const fpos_t) c_int;
pub extern fn fseeko64(__stream: [*c]FILE, __off: __off64_t, __whence: c_int) c_int;
pub extern fn ftello64(__stream: [*c]FILE) __off64_t;
pub extern fn fgetpos64(noalias __stream: [*c]FILE, noalias __pos: [*c]fpos64_t) c_int;
pub extern fn fsetpos64(__stream: [*c]FILE, __pos: [*c]const fpos64_t) c_int;
pub extern fn clearerr(__stream: [*c]FILE) void;
pub extern fn feof(__stream: [*c]FILE) c_int;
pub extern fn ferror(__stream: [*c]FILE) c_int;
pub extern fn clearerr_unlocked(__stream: [*c]FILE) void;
pub extern fn feof_unlocked(__stream: [*c]FILE) c_int;
pub extern fn ferror_unlocked(__stream: [*c]FILE) c_int;
pub extern fn perror(__s: [*c]const u8) void;
pub extern fn fileno(__stream: [*c]FILE) c_int;
pub extern fn fileno_unlocked(__stream: [*c]FILE) c_int;
pub extern fn pclose(__stream: [*c]FILE) c_int;
pub extern fn popen(__command: [*c]const u8, __modes: [*c]const u8) [*c]FILE;
pub extern fn ctermid(__s: [*c]u8) [*c]u8;
pub extern fn cuserid(__s: [*c]u8) [*c]u8;
pub const struct_obstack = opaque {};
pub extern fn obstack_printf(noalias __obstack: ?*struct_obstack, noalias __format: [*c]const u8, ...) c_int;
pub extern fn obstack_vprintf(noalias __obstack: ?*struct_obstack, noalias __format: [*c]const u8, __args: __gnuc_va_list) c_int;
pub extern fn flockfile(__stream: [*c]FILE) void;
pub extern fn ftrylockfile(__stream: [*c]FILE) c_int;
pub extern fn funlockfile(__stream: [*c]FILE) void;
pub extern fn __uflow([*c]FILE) c_int;
pub extern fn __overflow([*c]FILE, c_int) c_int;
pub const wchar_t = c_uint;
pub const div_t = extern struct {
    quot: c_int = @import("std").mem.zeroes(c_int),
    rem: c_int = @import("std").mem.zeroes(c_int),
};
pub const ldiv_t = extern struct {
    quot: c_long = @import("std").mem.zeroes(c_long),
    rem: c_long = @import("std").mem.zeroes(c_long),
};
pub const lldiv_t = extern struct {
    quot: c_longlong = @import("std").mem.zeroes(c_longlong),
    rem: c_longlong = @import("std").mem.zeroes(c_longlong),
};
pub extern fn __ctype_get_mb_cur_max() usize;
pub extern fn atof(__nptr: [*c]const u8) f64;
pub extern fn atoi(__nptr: [*c]const u8) c_int;
pub extern fn atol(__nptr: [*c]const u8) c_long;
pub extern fn atoll(__nptr: [*c]const u8) c_longlong;
pub extern fn strtod(__nptr: [*c]const u8, __endptr: [*c][*c]u8) f64;
pub extern fn strtof(__nptr: [*c]const u8, __endptr: [*c][*c]u8) f32;
pub extern fn strtold(__nptr: [*c]const u8, __endptr: [*c][*c]u8) c_longdouble;
pub extern fn strtof32(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8) _Float32;
pub extern fn strtof64(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8) _Float64;
pub extern fn strtof128(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8) _Float128;
pub extern fn strtof32x(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8) _Float32x;
pub extern fn strtof64x(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8) _Float64x;
pub extern fn strtol(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_long;
pub extern fn strtoul(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulong;
pub extern fn strtoq(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtouq(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn strtoll(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtoull(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn strfromd(__dest: [*c]u8, __size: usize, __format: [*c]const u8, __f: f64) c_int;
pub extern fn strfromf(__dest: [*c]u8, __size: usize, __format: [*c]const u8, __f: f32) c_int;
pub extern fn strfroml(__dest: [*c]u8, __size: usize, __format: [*c]const u8, __f: c_longdouble) c_int;
pub extern fn strfromf32(__dest: [*c]u8, __size: usize, __format: [*c]const u8, __f: _Float32) c_int;
pub extern fn strfromf64(__dest: [*c]u8, __size: usize, __format: [*c]const u8, __f: _Float64) c_int;
pub extern fn strfromf128(__dest: [*c]u8, __size: usize, __format: [*c]const u8, __f: _Float128) c_int;
pub extern fn strfromf32x(__dest: [*c]u8, __size: usize, __format: [*c]const u8, __f: _Float32x) c_int;
pub extern fn strfromf64x(__dest: [*c]u8, __size: usize, __format: [*c]const u8, __f: _Float64x) c_int;
pub const struct___locale_data_30 = opaque {};
pub const struct___locale_struct = extern struct {
    __locales: [13]?*struct___locale_data_30 = @import("std").mem.zeroes([13]?*struct___locale_data_30),
    __ctype_b: [*c]const c_ushort = @import("std").mem.zeroes([*c]const c_ushort),
    __ctype_tolower: [*c]const c_int = @import("std").mem.zeroes([*c]const c_int),
    __ctype_toupper: [*c]const c_int = @import("std").mem.zeroes([*c]const c_int),
    __names: [13][*c]const u8 = @import("std").mem.zeroes([13][*c]const u8),
};
pub const __locale_t = [*c]struct___locale_struct;
pub const locale_t = __locale_t;
pub extern fn strtol_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int, __loc: locale_t) c_long;
pub extern fn strtoul_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int, __loc: locale_t) c_ulong;
pub extern fn strtoll_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int, __loc: locale_t) c_longlong;
pub extern fn strtoull_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int, __loc: locale_t) c_ulonglong;
pub extern fn strtod_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __loc: locale_t) f64;
pub extern fn strtof_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __loc: locale_t) f32;
pub extern fn strtold_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __loc: locale_t) c_longdouble;
pub extern fn strtof32_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __loc: locale_t) _Float32;
pub extern fn strtof64_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __loc: locale_t) _Float64;
pub extern fn strtof128_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __loc: locale_t) _Float128;
pub extern fn strtof32x_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __loc: locale_t) _Float32x;
pub extern fn strtof64x_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __loc: locale_t) _Float64x;
pub extern fn l64a(__n: c_long) [*c]u8;
pub extern fn a64l(__s: [*c]const u8) c_long;
pub extern fn random() c_long;
pub extern fn srandom(__seed: c_uint) void;
pub extern fn initstate(__seed: c_uint, __statebuf: [*c]u8, __statelen: usize) [*c]u8;
pub extern fn setstate(__statebuf: [*c]u8) [*c]u8;
pub const struct_random_data = extern struct {
    fptr: [*c]i32 = @import("std").mem.zeroes([*c]i32),
    rptr: [*c]i32 = @import("std").mem.zeroes([*c]i32),
    state: [*c]i32 = @import("std").mem.zeroes([*c]i32),
    rand_type: c_int = @import("std").mem.zeroes(c_int),
    rand_deg: c_int = @import("std").mem.zeroes(c_int),
    rand_sep: c_int = @import("std").mem.zeroes(c_int),
    end_ptr: [*c]i32 = @import("std").mem.zeroes([*c]i32),
};
pub extern fn random_r(noalias __buf: [*c]struct_random_data, noalias __result: [*c]i32) c_int;
pub extern fn srandom_r(__seed: c_uint, __buf: [*c]struct_random_data) c_int;
pub extern fn initstate_r(__seed: c_uint, noalias __statebuf: [*c]u8, __statelen: usize, noalias __buf: [*c]struct_random_data) c_int;
pub extern fn setstate_r(noalias __statebuf: [*c]u8, noalias __buf: [*c]struct_random_data) c_int;
pub extern fn rand() c_int;
pub extern fn srand(__seed: c_uint) void;
pub extern fn rand_r(__seed: [*c]c_uint) c_int;
pub extern fn drand48() f64;
pub extern fn erand48(__xsubi: [*c]c_ushort) f64;
pub extern fn lrand48() c_long;
pub extern fn nrand48(__xsubi: [*c]c_ushort) c_long;
pub extern fn mrand48() c_long;
pub extern fn jrand48(__xsubi: [*c]c_ushort) c_long;
pub extern fn srand48(__seedval: c_long) void;
pub extern fn seed48(__seed16v: [*c]c_ushort) [*c]c_ushort;
pub extern fn lcong48(__param: [*c]c_ushort) void;
pub const struct_drand48_data = extern struct {
    __x: [3]c_ushort = @import("std").mem.zeroes([3]c_ushort),
    __old_x: [3]c_ushort = @import("std").mem.zeroes([3]c_ushort),
    __c: c_ushort = @import("std").mem.zeroes(c_ushort),
    __init: c_ushort = @import("std").mem.zeroes(c_ushort),
    __a: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
};
pub extern fn drand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]f64) c_int;
pub extern fn erand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]f64) c_int;
pub extern fn lrand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn nrand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn mrand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn jrand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn srand48_r(__seedval: c_long, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn seed48_r(__seed16v: [*c]c_ushort, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn lcong48_r(__param: [*c]c_ushort, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn arc4random() __uint32_t;
pub extern fn arc4random_buf(__buf: ?*anyopaque, __size: usize) void;
pub extern fn arc4random_uniform(__upper_bound: __uint32_t) __uint32_t;
pub extern fn malloc(__size: c_ulong) ?*anyopaque;
pub extern fn calloc(__nmemb: c_ulong, __size: c_ulong) ?*anyopaque;
pub extern fn realloc(__ptr: ?*anyopaque, __size: c_ulong) ?*anyopaque;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn reallocarray(__ptr: ?*anyopaque, __nmemb: usize, __size: usize) ?*anyopaque;
pub extern fn alloca(__size: c_ulong) ?*anyopaque;
pub extern fn valloc(__size: usize) ?*anyopaque;
pub extern fn posix_memalign(__memptr: [*c]?*anyopaque, __alignment: usize, __size: usize) c_int;
pub extern fn aligned_alloc(__alignment: c_ulong, __size: c_ulong) ?*anyopaque;
pub extern fn abort() noreturn;
pub extern fn atexit(__func: ?*const fn () callconv(.C) void) c_int;
pub extern fn at_quick_exit(__func: ?*const fn () callconv(.C) void) c_int;
pub extern fn on_exit(__func: ?*const fn (c_int, ?*anyopaque) callconv(.C) void, __arg: ?*anyopaque) c_int;
pub extern fn exit(__status: c_int) noreturn;
pub extern fn quick_exit(__status: c_int) noreturn;
pub extern fn _Exit(__status: c_int) noreturn;
pub extern fn getenv(__name: [*c]const u8) [*c]u8;
pub extern fn secure_getenv(__name: [*c]const u8) [*c]u8;
pub extern fn putenv(__string: [*c]u8) c_int;
pub extern fn setenv(__name: [*c]const u8, __value: [*c]const u8, __replace: c_int) c_int;
pub extern fn unsetenv(__name: [*c]const u8) c_int;
pub extern fn clearenv() c_int;
pub extern fn mktemp(__template: [*c]u8) [*c]u8;
pub extern fn mkstemp(__template: [*c]u8) c_int;
pub extern fn mkstemp64(__template: [*c]u8) c_int;
pub extern fn mkstemps(__template: [*c]u8, __suffixlen: c_int) c_int;
pub extern fn mkstemps64(__template: [*c]u8, __suffixlen: c_int) c_int;
pub extern fn mkdtemp(__template: [*c]u8) [*c]u8;
pub extern fn mkostemp(__template: [*c]u8, __flags: c_int) c_int;
pub extern fn mkostemp64(__template: [*c]u8, __flags: c_int) c_int;
pub extern fn mkostemps(__template: [*c]u8, __suffixlen: c_int, __flags: c_int) c_int;
pub extern fn mkostemps64(__template: [*c]u8, __suffixlen: c_int, __flags: c_int) c_int;
pub extern fn system(__command: [*c]const u8) c_int;
pub extern fn canonicalize_file_name(__name: [*c]const u8) [*c]u8;
pub extern fn realpath(noalias __name: [*c]const u8, noalias __resolved: [*c]u8) [*c]u8;
pub const __compar_fn_t = ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.C) c_int;
pub const comparison_fn_t = __compar_fn_t;
pub const __compar_d_fn_t = ?*const fn (?*const anyopaque, ?*const anyopaque, ?*anyopaque) callconv(.C) c_int;
pub extern fn bsearch(__key: ?*const anyopaque, __base: ?*const anyopaque, __nmemb: usize, __size: usize, __compar: __compar_fn_t) ?*anyopaque;
pub extern fn qsort(__base: ?*anyopaque, __nmemb: usize, __size: usize, __compar: __compar_fn_t) void;
pub extern fn qsort_r(__base: ?*anyopaque, __nmemb: usize, __size: usize, __compar: __compar_d_fn_t, __arg: ?*anyopaque) void;
pub extern fn abs(__x: c_int) c_int;
pub extern fn labs(__x: c_long) c_long;
pub extern fn llabs(__x: c_longlong) c_longlong;
pub extern fn div(__numer: c_int, __denom: c_int) div_t;
pub extern fn ldiv(__numer: c_long, __denom: c_long) ldiv_t;
pub extern fn lldiv(__numer: c_longlong, __denom: c_longlong) lldiv_t;
pub extern fn ecvt(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn fcvt(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn gcvt(__value: f64, __ndigit: c_int, __buf: [*c]u8) [*c]u8;
pub extern fn qecvt(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn qfcvt(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn qgcvt(__value: c_longdouble, __ndigit: c_int, __buf: [*c]u8) [*c]u8;
pub extern fn ecvt_r(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn fcvt_r(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn qecvt_r(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn qfcvt_r(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn mblen(__s: [*c]const u8, __n: usize) c_int;
pub extern fn mbtowc(noalias __pwc: [*c]wchar_t, noalias __s: [*c]const u8, __n: usize) c_int;
pub extern fn wctomb(__s: [*c]u8, __wchar: wchar_t) c_int;
pub extern fn mbstowcs(noalias __pwcs: [*c]wchar_t, noalias __s: [*c]const u8, __n: usize) usize;
pub extern fn wcstombs(noalias __s: [*c]u8, noalias __pwcs: [*c]const wchar_t, __n: usize) usize;
pub extern fn rpmatch(__response: [*c]const u8) c_int;
pub extern fn getsubopt(noalias __optionp: [*c][*c]u8, noalias __tokens: [*c]const [*c]u8, noalias __valuep: [*c][*c]u8) c_int;
pub extern fn posix_openpt(__oflag: c_int) c_int;
pub extern fn grantpt(__fd: c_int) c_int;
pub extern fn unlockpt(__fd: c_int) c_int;
pub extern fn ptsname(__fd: c_int) [*c]u8;
pub extern fn ptsname_r(__fd: c_int, __buf: [*c]u8, __buflen: usize) c_int;
pub extern fn getpt() c_int;
pub extern fn getloadavg(__loadavg: [*c]f64, __nelem: c_int) c_int;
pub extern fn memcpy(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: c_ulong) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: c_ulong) ?*anyopaque;
pub extern fn memccpy(__dest: ?*anyopaque, __src: ?*const anyopaque, __c: c_int, __n: c_ulong) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: c_ulong) ?*anyopaque;
pub extern fn memcmp(__s1: ?*const anyopaque, __s2: ?*const anyopaque, __n: c_ulong) c_int;
pub extern fn __memcmpeq(__s1: ?*const anyopaque, __s2: ?*const anyopaque, __n: usize) c_int;
pub extern fn memchr(__s: ?*const anyopaque, __c: c_int, __n: c_ulong) ?*anyopaque;
pub extern fn rawmemchr(__s: ?*const anyopaque, __c: c_int) ?*anyopaque;
pub extern fn memrchr(__s: ?*const anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn strcpy(__dest: [*c]u8, __src: [*c]const u8) [*c]u8;
pub extern fn strncpy(__dest: [*c]u8, __src: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strcat(__dest: [*c]u8, __src: [*c]const u8) [*c]u8;
pub extern fn strncat(__dest: [*c]u8, __src: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strcmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strncmp(__s1: [*c]const u8, __s2: [*c]const u8, __n: c_ulong) c_int;
pub extern fn strcoll(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strxfrm(__dest: [*c]u8, __src: [*c]const u8, __n: c_ulong) c_ulong;
pub extern fn strcoll_l(__s1: [*c]const u8, __s2: [*c]const u8, __l: locale_t) c_int;
pub extern fn strxfrm_l(__dest: [*c]u8, __src: [*c]const u8, __n: usize, __l: locale_t) usize;
pub extern fn strdup(__s: [*c]const u8) [*c]u8;
pub extern fn strndup(__string: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strrchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strchrnul(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strcspn(__s: [*c]const u8, __reject: [*c]const u8) c_ulong;
pub extern fn strspn(__s: [*c]const u8, __accept: [*c]const u8) c_ulong;
pub extern fn strpbrk(__s: [*c]const u8, __accept: [*c]const u8) [*c]u8;
pub extern fn strstr(__haystack: [*c]const u8, __needle: [*c]const u8) [*c]u8;
pub extern fn strtok(__s: [*c]u8, __delim: [*c]const u8) [*c]u8;
pub extern fn __strtok_r(noalias __s: [*c]u8, noalias __delim: [*c]const u8, noalias __save_ptr: [*c][*c]u8) [*c]u8;
pub extern fn strtok_r(noalias __s: [*c]u8, noalias __delim: [*c]const u8, noalias __save_ptr: [*c][*c]u8) [*c]u8;
pub extern fn strcasestr(__haystack: [*c]const u8, __needle: [*c]const u8) [*c]u8;
pub extern fn memmem(__haystack: ?*const anyopaque, __haystacklen: usize, __needle: ?*const anyopaque, __needlelen: usize) ?*anyopaque;
pub extern fn __mempcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn mempcpy(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: c_ulong) ?*anyopaque;
pub extern fn strlen(__s: [*c]const u8) c_ulong;
pub extern fn strnlen(__string: [*c]const u8, __maxlen: usize) usize;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub extern fn strerror_r(__errnum: c_int, __buf: [*c]u8, __buflen: usize) [*c]u8;
pub extern fn strerrordesc_np(__err: c_int) [*c]const u8;
pub extern fn strerrorname_np(__err: c_int) [*c]const u8;
pub extern fn strerror_l(__errnum: c_int, __l: locale_t) [*c]u8;
pub extern fn bcmp(__s1: ?*const anyopaque, __s2: ?*const anyopaque, __n: c_ulong) c_int;
pub extern fn bcopy(__src: ?*const anyopaque, __dest: ?*anyopaque, __n: c_ulong) void;
pub extern fn bzero(__s: ?*anyopaque, __n: c_ulong) void;
pub extern fn index(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn rindex(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn ffs(__i: c_int) c_int;
pub extern fn ffsl(__l: c_long) c_int;
pub extern fn ffsll(__ll: c_longlong) c_int;
pub extern fn strcasecmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strncasecmp(__s1: [*c]const u8, __s2: [*c]const u8, __n: c_ulong) c_int;
pub extern fn strcasecmp_l(__s1: [*c]const u8, __s2: [*c]const u8, __loc: locale_t) c_int;
pub extern fn strncasecmp_l(__s1: [*c]const u8, __s2: [*c]const u8, __n: usize, __loc: locale_t) c_int;
pub extern fn explicit_bzero(__s: ?*anyopaque, __n: usize) void;
pub extern fn strsep(noalias __stringp: [*c][*c]u8, noalias __delim: [*c]const u8) [*c]u8;
pub extern fn strsignal(__sig: c_int) [*c]u8;
pub extern fn sigabbrev_np(__sig: c_int) [*c]const u8;
pub extern fn sigdescr_np(__sig: c_int) [*c]const u8;
pub extern fn __stpcpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8) [*c]u8;
pub extern fn stpcpy(__dest: [*c]u8, __src: [*c]const u8) [*c]u8;
pub extern fn __stpncpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8, __n: usize) [*c]u8;
pub extern fn stpncpy(__dest: [*c]u8, __src: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strlcpy(__dest: [*c]u8, __src: [*c]const u8, __n: c_ulong) c_ulong;
pub extern fn strlcat(__dest: [*c]u8, __src: [*c]const u8, __n: c_ulong) c_ulong;
pub extern fn strverscmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strfry(__string: [*c]u8) [*c]u8;
pub extern fn memfrob(__s: ?*anyopaque, __n: usize) ?*anyopaque;
pub extern fn basename(__filename: [*c]const u8) [*c]u8;
// /usr/include/aarch64-linux-gnu/bits/timex.h:81:3: warning: struct demoted to opaque type - has bitfield
pub const struct_timex = opaque {};
pub extern fn clock_adjtime(__clock_id: __clockid_t, __utx: ?*struct_timex) c_int;
pub const struct_tm = extern struct {
    tm_sec: c_int = @import("std").mem.zeroes(c_int),
    tm_min: c_int = @import("std").mem.zeroes(c_int),
    tm_hour: c_int = @import("std").mem.zeroes(c_int),
    tm_mday: c_int = @import("std").mem.zeroes(c_int),
    tm_mon: c_int = @import("std").mem.zeroes(c_int),
    tm_year: c_int = @import("std").mem.zeroes(c_int),
    tm_wday: c_int = @import("std").mem.zeroes(c_int),
    tm_yday: c_int = @import("std").mem.zeroes(c_int),
    tm_isdst: c_int = @import("std").mem.zeroes(c_int),
    tm_gmtoff: c_long = @import("std").mem.zeroes(c_long),
    tm_zone: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const struct_itimerspec = extern struct {
    it_interval: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    it_value: struct_timespec = @import("std").mem.zeroes(struct_timespec),
};
pub extern fn clock() clock_t;
pub extern fn time(__timer: [*c]time_t) time_t;
pub extern fn difftime(__time1: time_t, __time0: time_t) f64;
pub extern fn mktime(__tp: [*c]struct_tm) time_t;
pub extern fn strftime(noalias __s: [*c]u8, __maxsize: usize, noalias __format: [*c]const u8, noalias __tp: [*c]const struct_tm) usize;
pub extern fn strptime(noalias __s: [*c]const u8, noalias __fmt: [*c]const u8, __tp: [*c]struct_tm) [*c]u8;
pub extern fn strftime_l(noalias __s: [*c]u8, __maxsize: usize, noalias __format: [*c]const u8, noalias __tp: [*c]const struct_tm, __loc: locale_t) usize;
pub extern fn strptime_l(noalias __s: [*c]const u8, noalias __fmt: [*c]const u8, __tp: [*c]struct_tm, __loc: locale_t) [*c]u8;
pub extern fn gmtime(__timer: [*c]const time_t) [*c]struct_tm;
pub extern fn localtime(__timer: [*c]const time_t) [*c]struct_tm;
pub extern fn gmtime_r(noalias __timer: [*c]const time_t, noalias __tp: [*c]struct_tm) [*c]struct_tm;
pub extern fn localtime_r(noalias __timer: [*c]const time_t, noalias __tp: [*c]struct_tm) [*c]struct_tm;
pub extern fn asctime(__tp: [*c]const struct_tm) [*c]u8;
pub extern fn ctime(__timer: [*c]const time_t) [*c]u8;
pub extern fn asctime_r(noalias __tp: [*c]const struct_tm, noalias __buf: [*c]u8) [*c]u8;
pub extern fn ctime_r(noalias __timer: [*c]const time_t, noalias __buf: [*c]u8) [*c]u8;
pub extern var __tzname: [2][*c]u8;
pub extern var __daylight: c_int;
pub extern var __timezone: c_long;
pub extern var tzname: [2][*c]u8;
pub extern fn tzset() void;
pub extern var daylight: c_int;
pub extern var timezone: c_long;
pub extern fn timegm(__tp: [*c]struct_tm) time_t;
pub extern fn timelocal(__tp: [*c]struct_tm) time_t;
pub extern fn dysize(__year: c_int) c_int;
pub extern fn nanosleep(__requested_time: [*c]const struct_timespec, __remaining: [*c]struct_timespec) c_int;
pub extern fn clock_getres(__clock_id: clockid_t, __res: [*c]struct_timespec) c_int;
pub extern fn clock_gettime(__clock_id: clockid_t, __tp: [*c]struct_timespec) c_int;
pub extern fn clock_settime(__clock_id: clockid_t, __tp: [*c]const struct_timespec) c_int;
pub extern fn clock_nanosleep(__clock_id: clockid_t, __flags: c_int, __req: [*c]const struct_timespec, __rem: [*c]struct_timespec) c_int;
pub extern fn clock_getcpuclockid(__pid: pid_t, __clock_id: [*c]clockid_t) c_int;
pub extern fn timer_create(__clock_id: clockid_t, noalias __evp: [*c]struct_sigevent, noalias __timerid: [*c]timer_t) c_int;
pub extern fn timer_delete(__timerid: timer_t) c_int;
pub extern fn timer_settime(__timerid: timer_t, __flags: c_int, noalias __value: [*c]const struct_itimerspec, noalias __ovalue: [*c]struct_itimerspec) c_int;
pub extern fn timer_gettime(__timerid: timer_t, __value: [*c]struct_itimerspec) c_int;
pub extern fn timer_getoverrun(__timerid: timer_t) c_int;
pub extern fn timespec_get(__ts: [*c]struct_timespec, __base: c_int) c_int;
pub extern fn timespec_getres(__ts: [*c]struct_timespec, __base: c_int) c_int;
pub extern var getdate_err: c_int;
pub extern fn getdate(__string: [*c]const u8) [*c]struct_tm;
pub extern fn getdate_r(noalias __string: [*c]const u8, noalias __resbufp: [*c]struct_tm) c_int;
pub const struct_flock = extern struct {
    l_type: c_short = @import("std").mem.zeroes(c_short),
    l_whence: c_short = @import("std").mem.zeroes(c_short),
    l_start: __off_t = @import("std").mem.zeroes(__off_t),
    l_len: __off_t = @import("std").mem.zeroes(__off_t),
    l_pid: __pid_t = @import("std").mem.zeroes(__pid_t),
};
pub const struct_flock64 = extern struct {
    l_type: c_short = @import("std").mem.zeroes(c_short),
    l_whence: c_short = @import("std").mem.zeroes(c_short),
    l_start: __off64_t = @import("std").mem.zeroes(__off64_t),
    l_len: __off64_t = @import("std").mem.zeroes(__off64_t),
    l_pid: __pid_t = @import("std").mem.zeroes(__pid_t),
};
pub const struct_iovec = extern struct {
    iov_base: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    iov_len: usize = @import("std").mem.zeroes(usize),
};
pub const F_OWNER_TID: c_int = 0;
pub const F_OWNER_PID: c_int = 1;
pub const F_OWNER_PGRP: c_int = 2;
pub const F_OWNER_GID: c_int = 2;
pub const enum___pid_type = c_uint;
pub const struct_f_owner_ex = extern struct {
    type: enum___pid_type = @import("std").mem.zeroes(enum___pid_type),
    pid: __pid_t = @import("std").mem.zeroes(__pid_t),
};
pub const struct_file_handle = extern struct {
    handle_bytes: c_uint align(4) = @import("std").mem.zeroes(c_uint),
    handle_type: c_int = @import("std").mem.zeroes(c_int),
    pub fn f_handle(self: anytype) @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8) {
        const Intermediate = @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8);
        const ReturnType = @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8);
        return @as(ReturnType, @ptrCast(@alignCast(@as(Intermediate, @ptrCast(self)) + 8)));
    }
};
pub extern fn readahead(__fd: c_int, __offset: __off64_t, __count: usize) __ssize_t;
pub extern fn sync_file_range(__fd: c_int, __offset: __off64_t, __count: __off64_t, __flags: c_uint) c_int;
pub extern fn vmsplice(__fdout: c_int, __iov: [*c]const struct_iovec, __count: usize, __flags: c_uint) __ssize_t;
pub extern fn splice(__fdin: c_int, __offin: [*c]__off64_t, __fdout: c_int, __offout: [*c]__off64_t, __len: usize, __flags: c_uint) __ssize_t;
pub extern fn tee(__fdin: c_int, __fdout: c_int, __len: usize, __flags: c_uint) __ssize_t;
pub extern fn fallocate(__fd: c_int, __mode: c_int, __offset: __off_t, __len: __off_t) c_int;
pub extern fn fallocate64(__fd: c_int, __mode: c_int, __offset: __off64_t, __len: __off64_t) c_int;
pub extern fn name_to_handle_at(__dfd: c_int, __name: [*c]const u8, __handle: [*c]struct_file_handle, __mnt_id: [*c]c_int, __flags: c_int) c_int;
pub extern fn open_by_handle_at(__mountdirfd: c_int, __handle: [*c]struct_file_handle, __flags: c_int) c_int;
pub const struct_stat = extern struct {
    st_dev: __dev_t = @import("std").mem.zeroes(__dev_t),
    st_ino: __ino_t = @import("std").mem.zeroes(__ino_t),
    st_mode: __mode_t = @import("std").mem.zeroes(__mode_t),
    st_nlink: __nlink_t = @import("std").mem.zeroes(__nlink_t),
    st_uid: __uid_t = @import("std").mem.zeroes(__uid_t),
    st_gid: __gid_t = @import("std").mem.zeroes(__gid_t),
    st_rdev: __dev_t = @import("std").mem.zeroes(__dev_t),
    __pad1: __dev_t = @import("std").mem.zeroes(__dev_t),
    st_size: __off_t = @import("std").mem.zeroes(__off_t),
    st_blksize: __blksize_t = @import("std").mem.zeroes(__blksize_t),
    __pad2: c_int = @import("std").mem.zeroes(c_int),
    st_blocks: __blkcnt_t = @import("std").mem.zeroes(__blkcnt_t),
    st_atim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_mtim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_ctim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    __glibc_reserved: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const struct_stat64 = extern struct {
    st_dev: __dev_t = @import("std").mem.zeroes(__dev_t),
    st_ino: __ino64_t = @import("std").mem.zeroes(__ino64_t),
    st_mode: __mode_t = @import("std").mem.zeroes(__mode_t),
    st_nlink: __nlink_t = @import("std").mem.zeroes(__nlink_t),
    st_uid: __uid_t = @import("std").mem.zeroes(__uid_t),
    st_gid: __gid_t = @import("std").mem.zeroes(__gid_t),
    st_rdev: __dev_t = @import("std").mem.zeroes(__dev_t),
    __pad1: __dev_t = @import("std").mem.zeroes(__dev_t),
    st_size: __off64_t = @import("std").mem.zeroes(__off64_t),
    st_blksize: __blksize_t = @import("std").mem.zeroes(__blksize_t),
    __pad2: c_int = @import("std").mem.zeroes(c_int),
    st_blocks: __blkcnt64_t = @import("std").mem.zeroes(__blkcnt64_t),
    st_atim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_mtim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_ctim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    __glibc_reserved: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub extern fn fcntl(__fd: c_int, __cmd: c_int, ...) c_int;
pub extern fn fcntl64(__fd: c_int, __cmd: c_int, ...) c_int;
pub extern fn open(__file: [*c]const u8, __oflag: c_int, ...) c_int;
pub extern fn open64(__file: [*c]const u8, __oflag: c_int, ...) c_int;
pub extern fn openat(__fd: c_int, __file: [*c]const u8, __oflag: c_int, ...) c_int;
pub extern fn openat64(__fd: c_int, __file: [*c]const u8, __oflag: c_int, ...) c_int;
pub extern fn creat(__file: [*c]const u8, __mode: mode_t) c_int;
pub extern fn creat64(__file: [*c]const u8, __mode: mode_t) c_int;
pub extern fn posix_fadvise(__fd: c_int, __offset: off_t, __len: off_t, __advise: c_int) c_int;
pub extern fn posix_fadvise64(__fd: c_int, __offset: off64_t, __len: off64_t, __advise: c_int) c_int;
pub extern fn posix_fallocate(__fd: c_int, __offset: off_t, __len: off_t) c_int;
pub extern fn posix_fallocate64(__fd: c_int, __offset: off64_t, __len: off64_t) c_int;
pub extern fn stat(noalias __file: [*c]const u8, noalias __buf: [*c]struct_stat) c_int;
pub extern fn fstat(__fd: c_int, __buf: [*c]struct_stat) c_int;
pub extern fn stat64(noalias __file: [*c]const u8, noalias __buf: [*c]struct_stat64) c_int;
pub extern fn fstat64(__fd: c_int, __buf: [*c]struct_stat64) c_int;
pub extern fn fstatat(__fd: c_int, noalias __file: [*c]const u8, noalias __buf: [*c]struct_stat, __flag: c_int) c_int;
pub extern fn fstatat64(__fd: c_int, noalias __file: [*c]const u8, noalias __buf: [*c]struct_stat64, __flag: c_int) c_int;
pub extern fn lstat(noalias __file: [*c]const u8, noalias __buf: [*c]struct_stat) c_int;
pub extern fn lstat64(noalias __file: [*c]const u8, noalias __buf: [*c]struct_stat64) c_int;
pub extern fn chmod(__file: [*c]const u8, __mode: __mode_t) c_int;
pub extern fn lchmod(__file: [*c]const u8, __mode: __mode_t) c_int;
pub extern fn fchmod(__fd: c_int, __mode: __mode_t) c_int;
pub extern fn fchmodat(__fd: c_int, __file: [*c]const u8, __mode: __mode_t, __flag: c_int) c_int;
pub extern fn umask(__mask: __mode_t) __mode_t;
pub extern fn getumask() __mode_t;
pub extern fn mkdir(__path: [*c]const u8, __mode: __mode_t) c_int;
pub extern fn mkdirat(__fd: c_int, __path: [*c]const u8, __mode: __mode_t) c_int;
pub extern fn mknod(__path: [*c]const u8, __mode: __mode_t, __dev: __dev_t) c_int;
pub extern fn mknodat(__fd: c_int, __path: [*c]const u8, __mode: __mode_t, __dev: __dev_t) c_int;
pub extern fn mkfifo(__path: [*c]const u8, __mode: __mode_t) c_int;
pub extern fn mkfifoat(__fd: c_int, __path: [*c]const u8, __mode: __mode_t) c_int;
pub extern fn utimensat(__fd: c_int, __path: [*c]const u8, __times: [*c]const struct_timespec, __flags: c_int) c_int;
pub extern fn futimens(__fd: c_int, __times: [*c]const struct_timespec) c_int;
pub const struct_statx_timestamp = extern struct {
    tv_sec: __s64 = @import("std").mem.zeroes(__s64),
    tv_nsec: __u32 = @import("std").mem.zeroes(__u32),
    __reserved: __s32 = @import("std").mem.zeroes(__s32),
};
pub const struct_statx = extern struct {
    stx_mask: __u32 = @import("std").mem.zeroes(__u32),
    stx_blksize: __u32 = @import("std").mem.zeroes(__u32),
    stx_attributes: __u64 = @import("std").mem.zeroes(__u64),
    stx_nlink: __u32 = @import("std").mem.zeroes(__u32),
    stx_uid: __u32 = @import("std").mem.zeroes(__u32),
    stx_gid: __u32 = @import("std").mem.zeroes(__u32),
    stx_mode: __u16 = @import("std").mem.zeroes(__u16),
    __spare0: [1]__u16 = @import("std").mem.zeroes([1]__u16),
    stx_ino: __u64 = @import("std").mem.zeroes(__u64),
    stx_size: __u64 = @import("std").mem.zeroes(__u64),
    stx_blocks: __u64 = @import("std").mem.zeroes(__u64),
    stx_attributes_mask: __u64 = @import("std").mem.zeroes(__u64),
    stx_atime: struct_statx_timestamp = @import("std").mem.zeroes(struct_statx_timestamp),
    stx_btime: struct_statx_timestamp = @import("std").mem.zeroes(struct_statx_timestamp),
    stx_ctime: struct_statx_timestamp = @import("std").mem.zeroes(struct_statx_timestamp),
    stx_mtime: struct_statx_timestamp = @import("std").mem.zeroes(struct_statx_timestamp),
    stx_rdev_major: __u32 = @import("std").mem.zeroes(__u32),
    stx_rdev_minor: __u32 = @import("std").mem.zeroes(__u32),
    stx_dev_major: __u32 = @import("std").mem.zeroes(__u32),
    stx_dev_minor: __u32 = @import("std").mem.zeroes(__u32),
    stx_mnt_id: __u64 = @import("std").mem.zeroes(__u64),
    stx_dio_mem_align: __u32 = @import("std").mem.zeroes(__u32),
    stx_dio_offset_align: __u32 = @import("std").mem.zeroes(__u32),
    __spare3: [12]__u64 = @import("std").mem.zeroes([12]__u64),
};
pub extern fn statx(__dirfd: c_int, noalias __path: [*c]const u8, __flags: c_int, __mask: c_uint, noalias __buf: [*c]struct_statx) c_int;
pub const struct_fio_str_info_s = extern struct {
    capa: usize = @import("std").mem.zeroes(usize),
    len: usize = @import("std").mem.zeroes(usize),
    data: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub const fio_str_info_s = struct_fio_str_info_s;
pub extern fn fio_malloc(size: usize) ?*anyopaque;
pub extern fn fio_calloc(size_per_unit: usize, unit_count: usize) ?*anyopaque;
pub extern fn fio_free(ptr: ?*anyopaque) void;
pub extern fn fio_realloc(ptr: ?*anyopaque, new_size: usize) ?*anyopaque;
pub extern fn fio_realloc2(ptr: ?*anyopaque, new_size: usize, copy_length: usize) ?*anyopaque;
pub extern fn fio_mmap(size: usize) ?*anyopaque;
pub extern fn fio_malloc_after_fork() void;
pub export var FIO_LOG_LEVEL: c_int = @import("std").mem.zeroes(c_int);
// vendor/facil.io/lib/facil/fio.h:437:1: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn FIO_LOG2STDERR(format: [*c]const u8, ...) void;
pub const fio_protocol_s = struct_fio_protocol_s;
pub const struct_fio_protocol_s = extern struct {
    on_data: ?*const fn (isize, *fio_protocol_s) callconv(.C) void = @import("std").mem.zeroes(?*const fn (isize, *fio_protocol_s) callconv(.C) void),
    on_ready: ?*const fn (isize, [*c]fio_protocol_s) callconv(.C) void = @import("std").mem.zeroes(?*const fn (isize, [*c]fio_protocol_s) callconv(.C) void),
    on_shutdown: ?*const fn (isize, [*c]fio_protocol_s) callconv(.C) u8 = @import("std").mem.zeroes(?*const fn (isize, [*c]fio_protocol_s) callconv(.C) u8),
    on_close: ?*const fn (isize, *fio_protocol_s) callconv(.C) void = @import("std").mem.zeroes(?*const fn (isize, *fio_protocol_s) callconv(.C) void),
    ping: ?*const fn (isize, [*c]fio_protocol_s) callconv(.C) void = @import("std").mem.zeroes(?*const fn (isize, [*c]fio_protocol_s) callconv(.C) void),
    rsv: usize = @import("std").mem.zeroes(usize),
};
pub extern fn fio_attach(uuid: isize, protocol: *fio_protocol_s) void;
pub extern fn fio_attach_fd(fd: c_int, protocol: [*c]fio_protocol_s) void;
pub extern fn fio_set_non_block(fd: c_int) c_int;
pub extern fn fio_capa() usize;
pub extern fn fio_timeout_set(uuid: isize, timeout: u8) void;
pub extern fn fio_timeout_get(uuid: isize) u8;
pub extern fn fio_touch(uuid: isize) void;
pub const FIO_EVENT_ON_DATA: c_int = 0;
pub const FIO_EVENT_ON_READY: c_int = 1;
pub const FIO_EVENT_ON_TIMEOUT: c_int = 2;
pub const enum_fio_io_event = c_uint;
pub extern fn fio_force_event(uuid: isize, enum_fio_io_event) void;
pub extern fn fio_suspend(uuid: isize) void;
pub const struct_fio_listen_args = extern struct {
    on_open: ?*const fn (isize, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn (isize, ?*anyopaque) callconv(.C) void),
    port: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    address: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    tls: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    udata: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    on_start: ?*const fn (isize, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn (isize, ?*anyopaque) callconv(.C) void),
    on_finish: ?*const fn (isize, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn (isize, ?*anyopaque) callconv(.C) void),
};
pub extern fn fio_listen(args: struct_fio_listen_args) isize;
pub const struct_fio_connect_args = extern struct {
    address: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    port: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    on_connect: ?*const fn (isize, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn (isize, ?*anyopaque) callconv(.C) void),
    on_fail: ?*const fn (isize, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn (isize, ?*anyopaque) callconv(.C) void),
    tls: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    udata: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    timeout: u8 = @import("std").mem.zeroes(u8),
};
pub extern fn fio_connect(struct_fio_connect_args) isize;
pub const fio_url_s = extern struct {
    scheme: fio_str_info_s = @import("std").mem.zeroes(fio_str_info_s),
    user: fio_str_info_s = @import("std").mem.zeroes(fio_str_info_s),
    password: fio_str_info_s = @import("std").mem.zeroes(fio_str_info_s),
    host: fio_str_info_s = @import("std").mem.zeroes(fio_str_info_s),
    port: fio_str_info_s = @import("std").mem.zeroes(fio_str_info_s),
    path: fio_str_info_s = @import("std").mem.zeroes(fio_str_info_s),
    query: fio_str_info_s = @import("std").mem.zeroes(fio_str_info_s),
    target: fio_str_info_s = @import("std").mem.zeroes(fio_str_info_s),
};
pub extern fn fio_url_parse(url: [*c]const u8, length: usize) fio_url_s;
pub const struct_fio_start_args = extern struct {
    threads: i16 = @import("std").mem.zeroes(i16),
    workers: i16 = @import("std").mem.zeroes(i16),
};
pub extern fn fio_start(args: struct_fio_start_args) void;
pub extern fn fio_stop() void;
pub extern fn fio_expected_concurrency(threads: [*c]i16, workers: [*c]i16) void;
pub extern fn fio_is_running() i16;
pub extern fn fio_is_worker() c_int;
pub extern fn fio_is_master() c_int;
pub extern fn fio_parent_pid() pid_t;
pub extern fn fio_reap_children() void;
pub extern fn fio_signal_handler_reset() void;
pub extern fn fio_last_tick() struct_timespec;
pub extern fn fio_engine() [*c]const u8;
pub extern fn fio_socket(address: [*c]const u8, port: [*c]const u8, is_server: u8) isize;
pub extern fn fio_accept(srv_uuid: isize) isize;
pub extern fn fio_is_valid(uuid: isize) c_int;
pub extern fn fio_is_closed(uuid: isize) c_int;
pub extern fn fio_close(uuid: isize) void;
pub extern fn fio_force_close(uuid: isize) void;
pub extern fn fio_peer_addr(uuid: isize) fio_str_info_s;
pub extern fn fio_local_addr(dest: [*c]u8, limit: usize) usize;
pub extern fn fio_read(uuid: isize, buffer: ?*anyopaque, count: usize) isize;
const union_unnamed_31 = extern union {
    buffer: ?*const anyopaque,
    fd: isize,
};
const union_unnamed_32 = extern union {
    dealloc: ?*const fn (?*anyopaque) callconv(.C) void,
    close: ?*const fn (isize) callconv(.C) void,
};
// vendor/facil.io/lib/facil/fio.h:1174:12: warning: struct demoted to opaque type - has bitfield
pub const fio_write_args_s = opaque {};
// pub extern fn fio_write2_fn(uuid: isize, options: fio_write_args_s) isize;
pub extern fn FIO_DEALLOC_NOOP(arg: ?*anyopaque) void;
// vendor/facil.io/lib/facil/fio.h:1205:41: warning: cannot initialize opaque type

// vendor/facil.io/lib/facil/fio.h:1223:25: warning: unable to translate function, demoted to extern
// pub extern fn fio_write(uuid: isize, buffer: ?*const anyopaque, length: usize) callconv(.C) isize;

// Arguments for write operations
pub const WriteArgs = extern struct {
    data: extern union {
        buffer: ?*const anyopaque,
        fd: isize,
    },
    after: extern union {
        dealloc: ?*const fn (?*anyopaque) void,
        close: ?*fn (isize) void,
    },
    length: usize,
    offset: usize,
    urgent: bool,
    is_fd: bool,
    rsv: bool,
    rsv2: bool,
};

/// External C function that performs the actual write
pub extern fn fio_write2_fn(uuid: isize, options: WriteArgs) isize;

/// Writes data to a connection
pub inline fn write2(uuid: isize, options: WriteArgs) isize {
    return fio_write2_fn(uuid, options);
}

// vendor/facil.io/lib/facil/fio.h:1205:41: warning: cannot initialize opaque type

// vendor/facil.io/lib/facil/fio.h:1250:25: warning: unable to translate function, demoted to extern
pub extern fn fio_sendfile(arg_uuid: isize, arg_source_fd: isize, arg_offset: off_t, arg_length: usize) callconv(.C) isize;
pub extern fn fio_pending(uuid: isize) usize;
pub extern fn fio_flush(uuid: isize) isize;
pub extern fn fio_flush_all() usize;
pub extern fn fio_fd2uuid(fd: c_int) isize;
pub extern fn fio_uuid_link(uuid: isize, obj: ?*anyopaque, on_close: ?*const fn (?*anyopaque) callconv(.C) void) void;
pub extern fn fio_uuid_unlink(uuid: isize, obj: ?*anyopaque) c_int;
pub const struct_fio_rw_hook_s = extern struct {
    read: ?*const fn (isize, ?*anyopaque, ?*anyopaque, usize) callconv(.C) isize = @import("std").mem.zeroes(?*const fn (isize, ?*anyopaque, ?*anyopaque, usize) callconv(.C) isize),
    write: ?*const fn (isize, ?*anyopaque, ?*const anyopaque, usize) callconv(.C) isize = @import("std").mem.zeroes(?*const fn (isize, ?*anyopaque, ?*const anyopaque, usize) callconv(.C) isize),
    flush: ?*const fn (isize, ?*anyopaque) callconv(.C) isize = @import("std").mem.zeroes(?*const fn (isize, ?*anyopaque) callconv(.C) isize),
    before_close: ?*const fn (isize, ?*anyopaque) callconv(.C) isize = @import("std").mem.zeroes(?*const fn (isize, ?*anyopaque) callconv(.C) isize),
    cleanup: ?*const fn (?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn (?*anyopaque) callconv(.C) void),
};
pub const fio_rw_hook_s = struct_fio_rw_hook_s;
pub extern fn fio_rw_hook_set(uuid: isize, rw_hooks: [*c]fio_rw_hook_s, udata: ?*anyopaque) c_int;
pub extern fn fio_rw_hook_replace_unsafe(uuid: isize, rw_hooks: [*c]fio_rw_hook_s, udata: ?*anyopaque) c_int;
pub extern const FIO_DEFAULT_RW_HOOKS: fio_rw_hook_s;
pub extern fn fio_fork() c_int;
pub extern fn fio_thread_new(thread_func: ?*const fn (?*anyopaque) callconv(.C) ?*anyopaque, arg: ?*anyopaque) ?*anyopaque;
pub extern fn fio_thread_free(p_thr: ?*anyopaque) void;
pub extern fn fio_thread_join(p_thr: ?*anyopaque) c_int;
pub const FIO_PR_LOCK_TASK: c_int = 0;
pub const FIO_PR_LOCK_WRITE: c_int = 1;
pub const FIO_PR_LOCK_STATE: c_int = 2;
pub const enum_fio_protocol_lock_e = c_uint;
pub const fio_defer_iotask_args_s = extern struct {
    type: enum_fio_protocol_lock_e = @import("std").mem.zeroes(enum_fio_protocol_lock_e),
    task: ?*const fn (isize, [*c]fio_protocol_s, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn (isize, [*c]fio_protocol_s, ?*anyopaque) callconv(.C) void),
    udata: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    fallback: ?*const fn (isize, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn (isize, ?*anyopaque) callconv(.C) void),
};
pub extern fn fio_defer_io_task(uuid: isize, args: fio_defer_iotask_args_s) void;
pub extern fn fio_defer(task: ?*const fn (?*anyopaque, ?*anyopaque) callconv(.C) void, udata1: ?*anyopaque, udata2: ?*anyopaque) c_int;
pub extern fn fio_run_every(milliseconds: usize, repetitions: usize, task: ?*const fn (?*anyopaque) callconv(.C) void, arg: ?*anyopaque, on_finish: ?*const fn (?*anyopaque) callconv(.C) void) c_int;
pub extern fn fio_defer_perform() void;
pub extern fn fio_defer_has_queue() c_int;
pub const FIO_CALL_ON_INITIALIZE: c_int = 0;
pub const FIO_CALL_PRE_START: c_int = 1;
pub const FIO_CALL_BEFORE_FORK: c_int = 2;
pub const FIO_CALL_AFTER_FORK: c_int = 3;
pub const FIO_CALL_IN_CHILD: c_int = 4;
pub const FIO_CALL_IN_MASTER: c_int = 5;
pub const FIO_CALL_ON_START: c_int = 6;
pub const FIO_CALL_ON_IDLE: c_int = 7;
pub const FIO_CALL_ON_SHUTDOWN: c_int = 8;
pub const FIO_CALL_ON_FINISH: c_int = 9;
pub const FIO_CALL_ON_PARENT_CRUSH: c_int = 10;
pub const FIO_CALL_ON_CHILD_CRUSH: c_int = 11;
pub const FIO_CALL_AT_EXIT: c_int = 12;
pub const FIO_CALL_NEVER: c_int = 13;
pub const callback_type_e = c_uint;
pub extern fn fio_state_callback_add(callback_type_e, func: ?*const fn (?*anyopaque) callconv(.C) void, arg: ?*anyopaque) void;
pub extern fn fio_state_callback_remove(callback_type_e, func: ?*const fn (?*anyopaque) callconv(.C) void, arg: ?*anyopaque) c_int;
pub extern fn fio_state_callback_force(callback_type_e) void;
pub extern fn fio_state_callback_clear(callback_type_e) void;
pub extern fn fio_protocol_try_lock(uuid: isize, enum_fio_protocol_lock_e) [*c]fio_protocol_s;
pub extern fn fio_protocol_unlock(pr: [*c]fio_protocol_s, enum_fio_protocol_lock_e) void;
pub const struct_subscription_s = opaque {};
pub const subscription_s = struct_subscription_s;
pub const fio_pubsub_engine_s = struct_fio_pubsub_engine_s;
pub const fio_match_fn = ?*const fn (fio_str_info_s, fio_str_info_s) callconv(.C) c_int;
pub const struct_fio_pubsub_engine_s = extern struct {
    subscribe: ?*const fn ([*c]const fio_pubsub_engine_s, fio_str_info_s, fio_match_fn) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]const fio_pubsub_engine_s, fio_str_info_s, fio_match_fn) callconv(.C) void),
    unsubscribe: ?*const fn ([*c]const fio_pubsub_engine_s, fio_str_info_s, fio_match_fn) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]const fio_pubsub_engine_s, fio_str_info_s, fio_match_fn) callconv(.C) void),
    publish: ?*const fn ([*c]const fio_pubsub_engine_s, fio_str_info_s, fio_str_info_s, u8) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]const fio_pubsub_engine_s, fio_str_info_s, fio_str_info_s, u8) callconv(.C) void),
};
pub extern var FIO_PUBSUB_DEFAULT: [*c]fio_pubsub_engine_s;
pub const struct_fio_msg_s = extern struct {
    filter: i32 = @import("std").mem.zeroes(i32),
    channel: fio_str_info_s = @import("std").mem.zeroes(fio_str_info_s),
    msg: fio_str_info_s = @import("std").mem.zeroes(fio_str_info_s),
    udata1: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    udata2: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    is_json: u8 = @import("std").mem.zeroes(u8),
};
pub const fio_msg_s = struct_fio_msg_s;
pub extern var FIO_MATCH_GLOB: fio_match_fn;
pub const subscribe_args_s = extern struct {
    filter: i32 = @import("std").mem.zeroes(i32),
    channel: fio_str_info_s = @import("std").mem.zeroes(fio_str_info_s),
    match: fio_match_fn = @import("std").mem.zeroes(fio_match_fn),
    on_message: ?*const fn ([*c]fio_msg_s) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]fio_msg_s) callconv(.C) void),
    on_unsubscribe: ?*const fn (?*anyopaque, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn (?*anyopaque, ?*anyopaque) callconv(.C) void),
    udata1: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    udata2: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const struct_fio_publish_args_s = extern struct {
    engine: [*c]const fio_pubsub_engine_s = @import("std").mem.zeroes([*c]const fio_pubsub_engine_s),
    filter: i32 = @import("std").mem.zeroes(i32),
    channel: fio_str_info_s = @import("std").mem.zeroes(fio_str_info_s),
    message: fio_str_info_s = @import("std").mem.zeroes(fio_str_info_s),
    is_json: u8 = @import("std").mem.zeroes(u8),
};
pub const fio_publish_args_s = struct_fio_publish_args_s;
pub extern fn fio_subscribe(args: subscribe_args_s) ?*subscription_s;
pub extern fn fio_unsubscribe(subscription: ?*subscription_s) void;
pub extern fn fio_subscription_channel(subscription: ?*subscription_s) fio_str_info_s;
pub extern fn fio_publish(args: fio_publish_args_s) void;
pub extern fn fio_message_metadata(msg: [*c]fio_msg_s, type_id: isize) ?*anyopaque;
pub extern fn fio_message_defer(msg: [*c]fio_msg_s) void;
pub const struct_fio_msg_metadata_s = extern struct {
    type_id: isize = @import("std").mem.zeroes(isize),
    on_finish: ?*const fn ([*c]fio_msg_s, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]fio_msg_s, ?*anyopaque) callconv(.C) void),
    metadata: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const fio_msg_metadata_s = struct_fio_msg_metadata_s;
pub const fio_msg_metadata_fn = ?*const fn (fio_str_info_s, fio_str_info_s, u8) callconv(.C) fio_msg_metadata_s;
pub extern fn fio_message_metadata_callback_set(callback: fio_msg_metadata_fn, enable: c_int) void;
pub extern fn fio_pubsub_attach(engine: [*c]fio_pubsub_engine_s) void;
pub extern fn fio_pubsub_detach(engine: [*c]fio_pubsub_engine_s) void;
pub extern fn fio_pubsub_reattach(eng: [*c]fio_pubsub_engine_s) void;
pub extern fn fio_pubsub_is_attached(engine: [*c]fio_pubsub_engine_s) c_int;
pub const fio_lock_i = u8;
// vendor/facil.io/lib/facil/fio.h:2994:3: warning: TODO implement translation of stmt class GCCAsmStmtClass

// vendor/facil.io/lib/facil/fio.h:2993:21: warning: unable to translate function, demoted to extern
pub extern fn fio_trylock(arg_lock: [*c]volatile fio_lock_i) callconv(.C) c_int;
// vendor/facil.io/lib/facil/fio.h:3007:3: warning: TODO implement translation of stmt class GCCAsmStmtClass

// vendor/facil.io/lib/facil/fio.h:3006:21: warning: unable to translate function, demoted to extern
pub extern fn fio_unlock(arg_lock: [*c]volatile fio_lock_i) callconv(.C) c_int;
// vendor/facil.io/lib/facil/fio.h:3014:3: warning: TODO implement translation of stmt class GCCAsmStmtClass

// vendor/facil.io/lib/facil/fio.h:3013:21: warning: unable to translate function, demoted to extern
pub extern fn fio_is_locked(arg_lock: [*c]volatile fio_lock_i) callconv(.C) c_int;
pub fn fio_lock(arg_lock: [*c]volatile fio_lock_i) callconv(.C) void {
    var lock = arg_lock;
    _ = &lock;
    while (fio_trylock(lock) != 0) {
        fio_reschedule_thread();
    }
}
pub fn fio_reschedule_thread() callconv(.C) void {
    const tm_1: struct_timespec = struct_timespec{
        .tv_sec = @import("std").mem.zeroes(__time_t),
        .tv_nsec = @as(__syscall_slong_t, @bitCast(@as(c_long, @as(c_int, 1)))),
    };
    _ = &tm_1;
    _ = nanosleep(&tm_1, null);
}
pub fn fio_throttle_thread(arg_nano_sec: usize) callconv(.C) void {
    var nano_sec = arg_nano_sec;
    _ = &nano_sec;
    const tm_1: struct_timespec = struct_timespec{
        .tv_sec = @as(time_t, @bitCast(nano_sec / @as(usize, @bitCast(@as(c_long, @as(c_int, 1000000000)))))),
        .tv_nsec = @as(c_long, @bitCast(nano_sec % @as(usize, @bitCast(@as(c_long, @as(c_int, 1000000000)))))),
    };
    _ = &tm_1;
    _ = nanosleep(&tm_1, null);
}
pub fn fio_ct_true(arg_cond: usize) callconv(.C) usize {
    var cond = arg_cond;
    _ = &cond;
    return (cond | (@as(usize, @bitCast(@as(c_long, @as(c_int, 0)))) -% cond)) >> @intCast((@sizeOf(usize) << @intCast(3)) -% @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 1)))));
}
pub fn fio_ct_false(arg_cond: usize) callconv(.C) usize {
    var cond = arg_cond;
    _ = &cond;
    return fio_ct_true(cond) ^ @as(usize, @bitCast(@as(c_long, @as(c_int, 1))));
}
pub fn fio_ct_if(arg_cond: u8, arg_a: usize, arg_b: usize) callconv(.C) usize {
    var cond = arg_cond;
    _ = &cond;
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    return b ^ (@as(usize, @bitCast(@as(c_long, @as(c_int, 0) - (@as(c_int, @bitCast(@as(c_uint, cond))) & @as(c_int, 1))))) & (a ^ b));
}
pub fn fio_ct_if2(arg_cond: usize, arg_a: usize, arg_b: usize) callconv(.C) usize {
    var cond = arg_cond;
    _ = &cond;
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    return fio_ct_if(@as(u8, @bitCast(@as(u8, @truncate(fio_ct_true(cond))))), a, b);
}
pub extern fn fio_atol(pstr: [*c][*c]u8) i64;
pub extern fn fio_atof(pstr: [*c][*c]u8) f64;
pub extern fn fio_ltoa(dest: [*c]u8, num: i64, base: u8) usize;
pub extern fn fio_ftoa(dest: [*c]u8, num: f64, base: u8) usize;
pub extern fn fio_rand64() u64;
pub extern fn fio_rand_bytes(target: ?*anyopaque, length: usize) void;
pub export var fio_hash_secret_marker1: u8 = @import("std").mem.zeroes(u8);
pub export var fio_hash_secret_marker2: u8 = @import("std").mem.zeroes(u8);
pub fn fio_risky_hash(arg_data_: ?*const anyopaque, arg_len: usize, arg_seed: u64) callconv(.C) u64 {
    var data_ = arg_data_;
    _ = &data_;
    var len = arg_len;
    _ = &len;
    var seed = arg_seed;
    _ = &seed;
    var data: [*c]const u8 = @as([*c]u8, @ptrCast(@volatileCast(@constCast(data_))));
    _ = &data;
    var v0: u64 = seed ^ @as(c_ulong, 12327324395758126793);
    _ = &v0;
    var v1: u64 = ~seed +% @as(c_ulong, 12327324395758126793);
    _ = &v1;
    var v2: u64 = ((seed << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 17)))) & @as(c_ulong, 63))) | (seed >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 17)))) & @as(c_ulong, 63)))) ^ (~@as(c_ulong, 12327324395758126793) +% @as(c_ulong, 18138880411439337787));
    _ = &v2;
    var v3: u64 = ((seed << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (seed >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)))) +% ~@as(c_ulong, 12327324395758126793);
    _ = &v3;
    {
        var i: usize = len >> @intCast(5);
        _ = &i;
        while (i != 0) : (i -%= 1) {
            v0 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
            v0 = (v0 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v0 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
            v0 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
            v0 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
            v1 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
            v1 = (v1 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v1 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
            v1 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
            v1 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
            v2 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
            v2 = (v2 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v2 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
            v2 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
            v2 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
            v3 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 24)))))))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 24)))))))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 24)))))))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 24)))))))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 24)))))))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 24)))))))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 24)))))))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 24)))))))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
            v3 = (v3 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v3 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
            v3 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 24)))))))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 24)))))))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 24)))))))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 24)))))))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 24)))))))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 24)))))))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 24)))))))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 24)))))))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
            v3 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
            data += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))));
        }
    }
    while (true) {
        switch (len & @as(usize, @bitCast(@as(c_long, @as(c_int, 24))))) {
            @as(usize, @bitCast(@as(c_long, @as(c_int, 24)))) => {
                v2 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
                v2 = (v2 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v2 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                v2 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
                v2 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                v1 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
                v1 = (v1 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v1 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                v1 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
                v1 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                v0 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
                v0 = (v0 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v0 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                v0 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
                v0 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                data += @as([*c]const u8, @ptrFromInt(len & @as(usize, @bitCast(@as(c_long, @as(c_int, 24))))));
            },
            @as(usize, @bitCast(@as(c_long, @as(c_int, 16)))) => {
                v1 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
                v1 = (v1 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v1 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                v1 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
                v1 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                v0 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
                v0 = (v0 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v0 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                v0 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
                v0 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                data += @as([*c]const u8, @ptrFromInt(len & @as(usize, @bitCast(@as(c_long, @as(c_int, 24))))));
            },
            @as(usize, @bitCast(@as(c_long, @as(c_int, 8)))) => {
                v0 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
                v0 = (v0 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v0 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                v0 +%= (((((((@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56)) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16))) | (@as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8))) | @as(u64, @bitCast(@as(c_ulong, @as([*c]u8, @ptrCast(@volatileCast(@constCast(data))))[@as(c_uint, @intCast(@as(c_int, 7)))])));
                v0 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                data += @as([*c]const u8, @ptrFromInt(len & @as(usize, @bitCast(@as(c_long, @as(c_int, 24))))));
            },
            else => {},
        }
        break;
    }
    var tmp: u64 = 0;
    _ = &tmp;
    while (true) {
        switch (len & @as(usize, @bitCast(@as(c_long, @as(c_int, 7))))) {
            @as(usize, @bitCast(@as(c_long, @as(c_int, 7)))) => {
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 6)))]))) << @intCast(8);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56);
                while (true) {
                    switch ((len >> @intCast(3)) & @as(usize, @bitCast(@as(c_long, @as(c_int, 3))))) {
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 3)))) => {
                            v3 +%= tmp;
                            v3 = (v3 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v3 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v3 +%= tmp;
                            v3 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 2)))) => {
                            v2 +%= tmp;
                            v2 = (v2 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v2 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v2 +%= tmp;
                            v2 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 1)))) => {
                            v1 +%= tmp;
                            v1 = (v1 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v1 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v1 +%= tmp;
                            v1 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 0)))) => {
                            v0 +%= tmp;
                            v0 = (v0 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v0 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v0 +%= tmp;
                            v0 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        else => {},
                    }
                    break;
                }
            },
            @as(usize, @bitCast(@as(c_long, @as(c_int, 6)))) => {
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 5)))]))) << @intCast(16);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56);
                while (true) {
                    switch ((len >> @intCast(3)) & @as(usize, @bitCast(@as(c_long, @as(c_int, 3))))) {
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 3)))) => {
                            v3 +%= tmp;
                            v3 = (v3 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v3 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v3 +%= tmp;
                            v3 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 2)))) => {
                            v2 +%= tmp;
                            v2 = (v2 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v2 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v2 +%= tmp;
                            v2 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 1)))) => {
                            v1 +%= tmp;
                            v1 = (v1 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v1 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v1 +%= tmp;
                            v1 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 0)))) => {
                            v0 +%= tmp;
                            v0 = (v0 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v0 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v0 +%= tmp;
                            v0 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        else => {},
                    }
                    break;
                }
            },
            @as(usize, @bitCast(@as(c_long, @as(c_int, 5)))) => {
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 4)))]))) << @intCast(24);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56);
                while (true) {
                    switch ((len >> @intCast(3)) & @as(usize, @bitCast(@as(c_long, @as(c_int, 3))))) {
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 3)))) => {
                            v3 +%= tmp;
                            v3 = (v3 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v3 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v3 +%= tmp;
                            v3 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 2)))) => {
                            v2 +%= tmp;
                            v2 = (v2 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v2 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v2 +%= tmp;
                            v2 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 1)))) => {
                            v1 +%= tmp;
                            v1 = (v1 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v1 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v1 +%= tmp;
                            v1 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 0)))) => {
                            v0 +%= tmp;
                            v0 = (v0 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v0 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v0 +%= tmp;
                            v0 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        else => {},
                    }
                    break;
                }
            },
            @as(usize, @bitCast(@as(c_long, @as(c_int, 4)))) => {
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 3)))]))) << @intCast(32);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56);
                while (true) {
                    switch ((len >> @intCast(3)) & @as(usize, @bitCast(@as(c_long, @as(c_int, 3))))) {
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 3)))) => {
                            v3 +%= tmp;
                            v3 = (v3 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v3 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v3 +%= tmp;
                            v3 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 2)))) => {
                            v2 +%= tmp;
                            v2 = (v2 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v2 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v2 +%= tmp;
                            v2 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 1)))) => {
                            v1 +%= tmp;
                            v1 = (v1 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v1 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v1 +%= tmp;
                            v1 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 0)))) => {
                            v0 +%= tmp;
                            v0 = (v0 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v0 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v0 +%= tmp;
                            v0 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        else => {},
                    }
                    break;
                }
            },
            @as(usize, @bitCast(@as(c_long, @as(c_int, 3)))) => {
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(40);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56);
                while (true) {
                    switch ((len >> @intCast(3)) & @as(usize, @bitCast(@as(c_long, @as(c_int, 3))))) {
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 3)))) => {
                            v3 +%= tmp;
                            v3 = (v3 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v3 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v3 +%= tmp;
                            v3 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 2)))) => {
                            v2 +%= tmp;
                            v2 = (v2 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v2 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v2 +%= tmp;
                            v2 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 1)))) => {
                            v1 +%= tmp;
                            v1 = (v1 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v1 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v1 +%= tmp;
                            v1 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 0)))) => {
                            v0 +%= tmp;
                            v0 = (v0 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v0 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v0 +%= tmp;
                            v0 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        else => {},
                    }
                    break;
                }
            },
            @as(usize, @bitCast(@as(c_long, @as(c_int, 2)))) => {
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(48);
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56);
                while (true) {
                    switch ((len >> @intCast(3)) & @as(usize, @bitCast(@as(c_long, @as(c_int, 3))))) {
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 3)))) => {
                            v3 +%= tmp;
                            v3 = (v3 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v3 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v3 +%= tmp;
                            v3 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 2)))) => {
                            v2 +%= tmp;
                            v2 = (v2 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v2 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v2 +%= tmp;
                            v2 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 1)))) => {
                            v1 +%= tmp;
                            v1 = (v1 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v1 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v1 +%= tmp;
                            v1 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 0)))) => {
                            v0 +%= tmp;
                            v0 = (v0 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v0 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v0 +%= tmp;
                            v0 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        else => {},
                    }
                    break;
                }
            },
            @as(usize, @bitCast(@as(c_long, @as(c_int, 1)))) => {
                tmp |= @as(u64, @bitCast(@as(c_ulong, data[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(56);
                while (true) {
                    switch ((len >> @intCast(3)) & @as(usize, @bitCast(@as(c_long, @as(c_int, 3))))) {
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 3)))) => {
                            v3 +%= tmp;
                            v3 = (v3 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v3 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v3 +%= tmp;
                            v3 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 2)))) => {
                            v2 +%= tmp;
                            v2 = (v2 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v2 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v2 +%= tmp;
                            v2 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 1)))) => {
                            v1 +%= tmp;
                            v1 = (v1 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v1 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v1 +%= tmp;
                            v1 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        @as(usize, @bitCast(@as(c_long, @as(c_int, 0)))) => {
                            v0 +%= tmp;
                            v0 = (v0 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (v0 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
                            v0 +%= tmp;
                            v0 *%= @as(u64, @bitCast(@as(c_ulong, 18138880411439337787)));
                            break;
                        },
                        else => {},
                    }
                    break;
                }
            },
            else => {},
        }
        break;
    }
    var result: u64 = ((((v0 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 17)))) & @as(c_ulong, 63))) | (v0 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 17)))) & @as(c_ulong, 63)))) +% ((v1 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 13)))) & @as(c_ulong, 63))) | (v1 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 13)))) & @as(c_ulong, 63))))) +% ((v2 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 47)))) & @as(c_ulong, 63))) | (v2 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 47)))) & @as(c_ulong, 63))))) +% ((v3 << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 57)))) & @as(c_ulong, 63))) | (v3 >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 57)))) & @as(c_ulong, 63))));
    _ = &result;
    len ^= len << @intCast(33);
    result +%= @as(u64, @bitCast(len));
    result +%= @as(u64, @bitCast(v0 *% @as(c_ulong, 12327324395758126793)));
    result ^= (result << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 13)))) & @as(c_ulong, 63))) | (result >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 13)))) & @as(c_ulong, 63)));
    result +%= @as(u64, @bitCast(v1 *% @as(c_ulong, 12327324395758126793)));
    result ^= (result << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 29)))) & @as(c_ulong, 63))) | (result >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 29)))) & @as(c_ulong, 63)));
    result +%= @as(u64, @bitCast(v2 *% @as(c_ulong, 12327324395758126793)));
    result ^= (result << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 33)))) & @as(c_ulong, 63))) | (result >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 33)))) & @as(c_ulong, 63)));
    result +%= @as(u64, @bitCast(v3 *% @as(c_ulong, 12327324395758126793)));
    result ^= (result << @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 51)))) & @as(c_ulong, 63))) | (result >> @intCast(@as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 51)))) & @as(c_ulong, 63)));
    result ^= @as(u64, @bitCast((result >> @intCast(29)) *% @as(c_ulong, 18138880411439337787)));
    return result;
}
pub extern fn fio_siphash24(data: ?*const anyopaque, len: usize, key1: u64, key2: u64) u64;
pub extern fn fio_siphash13(data: ?*const anyopaque, len: usize, key1: u64, key2: u64) u64;
const union_unnamed_33 = extern union {
    i: [5]u32,
    str: [21]u8,
};
pub const fio_sha1_s = extern struct {
    length: u64 = @import("std").mem.zeroes(u64),
    buffer: [64]u8 = @import("std").mem.zeroes([64]u8),
    digest: union_unnamed_33 = @import("std").mem.zeroes(union_unnamed_33),
};
pub extern fn fio_sha1_init() fio_sha1_s;
pub extern fn fio_sha1_write(s: [*c]fio_sha1_s, data: ?*const anyopaque, len: usize) void;
pub extern fn fio_sha1_result(s: [*c]fio_sha1_s) [*c]u8;
pub fn fio_sha1(arg_s: [*c]fio_sha1_s, arg_data: ?*const anyopaque, arg_len: usize) callconv(.C) [*c]u8 {
    var s = arg_s;
    _ = &s;
    var data = arg_data;
    _ = &data;
    var len = arg_len;
    _ = &len;
    s.* = fio_sha1_init();
    fio_sha1_write(s, data, len);
    return fio_sha1_result(s);
}
pub const SHA_512: c_int = 1;
pub const SHA_512_256: c_int = 3;
pub const SHA_512_224: c_int = 5;
pub const SHA_384: c_int = 7;
pub const SHA_256: c_int = 2;
pub const SHA_224: c_int = 4;
pub const fio_sha2_variant_e = c_uint;
const union_unnamed_34 = extern union {
    bytes: [16]u8,
    matrix: [4][4]u8,
    words_small: [4]u32,
    words: [2]u64,
    i: __uint128_t,
};
const union_unnamed_35 = extern union {
    i32: [16]u32,
    i64: [8]u64,
    str: [65]u8,
};
pub const fio_sha2_s = extern struct {
    length: union_unnamed_34 = @import("std").mem.zeroes(union_unnamed_34),
    buffer: [128]u8 = @import("std").mem.zeroes([128]u8),
    digest: union_unnamed_35 = @import("std").mem.zeroes(union_unnamed_35),
    type: fio_sha2_variant_e = @import("std").mem.zeroes(fio_sha2_variant_e),
};
pub extern fn fio_sha2_init(variant: fio_sha2_variant_e) fio_sha2_s;
pub extern fn fio_sha2_write(s: [*c]fio_sha2_s, data: ?*const anyopaque, len: usize) void;
pub extern fn fio_sha2_result(s: [*c]fio_sha2_s) [*c]u8;
pub fn fio_sha2_512(arg_s: [*c]fio_sha2_s, arg_data: ?*const anyopaque, arg_len: usize) callconv(.C) [*c]u8 {
    var s = arg_s;
    _ = &s;
    var data = arg_data;
    _ = &data;
    var len = arg_len;
    _ = &len;
    s.* = fio_sha2_init(@as(c_uint, @bitCast(SHA_512)));
    fio_sha2_write(s, data, len);
    return fio_sha2_result(s);
}
pub fn fio_sha2_256(arg_s: [*c]fio_sha2_s, arg_data: ?*const anyopaque, arg_len: usize) callconv(.C) [*c]u8 {
    var s = arg_s;
    _ = &s;
    var data = arg_data;
    _ = &data;
    var len = arg_len;
    _ = &len;
    s.* = fio_sha2_init(@as(c_uint, @bitCast(SHA_256)));
    fio_sha2_write(s, data, len);
    return fio_sha2_result(s);
}
pub fn fio_sha2_384(arg_s: [*c]fio_sha2_s, arg_data: ?*const anyopaque, arg_len: usize) callconv(.C) [*c]u8 {
    var s = arg_s;
    _ = &s;
    var data = arg_data;
    _ = &data;
    var len = arg_len;
    _ = &len;
    s.* = fio_sha2_init(@as(c_uint, @bitCast(SHA_384)));
    fio_sha2_write(s, data, len);
    return fio_sha2_result(s);
}
pub extern fn fio_base64_encode(target: [*c]u8, data: [*c]const u8, len: c_int) c_int;
pub extern fn fio_base64url_encode(target: [*c]u8, data: [*c]const u8, len: c_int) c_int;
pub extern fn fio_base64_decode(target: [*c]u8, encoded: [*c]u8, base64_len: c_int) c_int;
pub const __llvm__ = @as(c_int, 1);
pub const __clang__ = @as(c_int, 1);
pub const __clang_major__ = @as(c_int, 18);
pub const __clang_minor__ = @as(c_int, 1);
pub const __clang_patchlevel__ = @as(c_int, 6);
pub const __clang_version__ = "18.1.6 (https://github.com/ziglang/zig-bootstrap 98bc6bf4fc4009888d33941daf6b600d20a42a56)";
pub const __GNUC__ = @as(c_int, 4);
pub const __GNUC_MINOR__ = @as(c_int, 2);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
pub const __GXX_ABI_VERSION = @as(c_int, 1002);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __MEMORY_SCOPE_SYSTEM = @as(c_int, 0);
pub const __MEMORY_SCOPE_DEVICE = @as(c_int, 1);
pub const __MEMORY_SCOPE_WRKGRP = @as(c_int, 2);
pub const __MEMORY_SCOPE_WVFRNT = @as(c_int, 3);
pub const __MEMORY_SCOPE_SINGLE = @as(c_int, 4);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
pub const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
pub const __FPCLASS_SNAN = @as(c_int, 0x0001);
pub const __FPCLASS_QNAN = @as(c_int, 0x0002);
pub const __FPCLASS_NEGINF = @as(c_int, 0x0004);
pub const __FPCLASS_NEGNORMAL = @as(c_int, 0x0008);
pub const __FPCLASS_NEGSUBNORMAL = @as(c_int, 0x0010);
pub const __FPCLASS_NEGZERO = @as(c_int, 0x0020);
pub const __FPCLASS_POSZERO = @as(c_int, 0x0040);
pub const __FPCLASS_POSSUBNORMAL = @as(c_int, 0x0080);
pub const __FPCLASS_POSNORMAL = @as(c_int, 0x0100);
pub const __FPCLASS_POSINF = @as(c_int, 0x0200);
pub const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
pub const __VERSION__ = "Clang 18.1.6 (https://github.com/ziglang/zig-bootstrap 98bc6bf4fc4009888d33941daf6b600d20a42a56)";
pub const __OBJC_BOOL_IS_BOOL = @as(c_int, 0);
pub const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
pub const __clang_literal_encoding__ = "UTF-8";
pub const __clang_wide_literal_encoding__ = "UTF-32";
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const _LP64 = @as(c_int, 1);
pub const __LP64__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_WIDTH__ = @as(c_int, 64);
pub const __LLONG_WIDTH__ = @as(c_int, 64);
pub const __BITINT_MAXWIDTH__ = @as(c_int, 128);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __INTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 16);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTMAX_TYPE__ = c_long;
pub const __INTMAX_FMTd__ = "ld";
pub const __INTMAX_FMTi__ = "li";
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`");
// (no file):95:9
pub const __UINTMAX_TYPE__ = c_ulong;
pub const __UINTMAX_FMTo__ = "lo";
pub const __UINTMAX_FMTu__ = "lu";
pub const __UINTMAX_FMTx__ = "lx";
pub const __UINTMAX_FMTX__ = "lX";
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`");
// (no file):101:9
pub const __PTRDIFF_TYPE__ = c_long;
pub const __PTRDIFF_FMTd__ = "ld";
pub const __PTRDIFF_FMTi__ = "li";
pub const __INTPTR_TYPE__ = c_long;
pub const __INTPTR_FMTd__ = "ld";
pub const __INTPTR_FMTi__ = "li";
pub const __SIZE_TYPE__ = c_ulong;
pub const __SIZE_FMTo__ = "lo";
pub const __SIZE_FMTu__ = "lu";
pub const __SIZE_FMTx__ = "lx";
pub const __SIZE_FMTX__ = "lX";
pub const __WCHAR_TYPE__ = c_uint;
pub const __WINT_TYPE__ = c_uint;
pub const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __UINTPTR_FMTo__ = "lo";
pub const __UINTPTR_FMTu__ = "lu";
pub const __UINTPTR_FMTx__ = "lx";
pub const __UINTPTR_FMTX__ = "lX";
pub const __FLT16_DENORM_MIN__ = @as(f16, 5.9604644775390625e-8);
pub const __FLT16_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_EPSILON__ = @as(f16, 9.765625e-4);
pub const __FLT16_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT16_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT16_MIN__ = @as(f16, 6.103515625e-5);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_HAS_DENORM__ = @as(c_int, 1);
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 6.47517511943802511092443895822764655e-4966);
pub const __LDBL_HAS_DENORM__ = @as(c_int, 1);
pub const __LDBL_DIG__ = @as(c_int, 33);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 36);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.92592994438723585305597794258492732e-34);
pub const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __LDBL_MANT_DIG__ = @as(c_int, 113);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176508575932662800702e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626267781732175260e-4932);
pub const __POINTER_WIDTH__ = @as(c_int, 64);
pub const __BIGGEST_ALIGNMENT__ = @as(c_int, 16);
pub const __CHAR_UNSIGNED__ = @as(c_int, 1);
pub const __WCHAR_UNSIGNED__ = @as(c_int, 1);
pub const __WINT_UNSIGNED__ = @as(c_int, 1);
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub const __INT64_TYPE__ = c_long;
pub const __INT64_FMTd__ = "ld";
pub const __INT64_FMTi__ = "li";
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`");
// (no file):200:9
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub const __UINT16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`");
// (no file):222:9
pub const __UINT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulong;
pub const __UINT64_FMTo__ = "lo";
pub const __UINT64_FMTu__ = "lu";
pub const __UINT64_FMTx__ = "lx";
pub const __UINT64_FMTX__ = "lX";
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`");
// (no file):230:9
pub const __UINT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __INT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_long;
pub const __INT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_LEAST64_FMTd__ = "ld";
pub const __INT_LEAST64_FMTi__ = "li";
pub const __UINT_LEAST64_TYPE__ = c_ulong;
pub const __UINT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_LEAST64_FMTo__ = "lo";
pub const __UINT_LEAST64_FMTu__ = "lu";
pub const __UINT_LEAST64_FMTx__ = "lx";
pub const __UINT_LEAST64_FMTX__ = "lX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_TYPE__ = c_long;
pub const __INT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_FAST64_FMTd__ = "ld";
pub const __INT_FAST64_FMTi__ = "li";
pub const __UINT_FAST64_TYPE__ = c_ulong;
pub const __UINT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_FAST64_FMTo__ = "lo";
pub const __UINT_FAST64_FMTu__ = "lu";
pub const __UINT_FAST64_FMTx__ = "lx";
pub const __UINT_FAST64_FMTX__ = "lX";
pub const __USER_LABEL_PREFIX__ = "";
pub const __FINITE_MATH_ONLY__ = @as(c_int, 0);
pub const __GNUC_STDC_INLINE__ = @as(c_int, 1);
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __NO_INLINE__ = @as(c_int, 1);
pub const __PIC__ = @as(c_int, 2);
pub const __pic__ = @as(c_int, 2);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __SSP_STRONG__ = @as(c_int, 2);
pub const __ELF__ = @as(c_int, 1);
pub const __AARCH64EL__ = @as(c_int, 1);
pub const __aarch64__ = @as(c_int, 1);
pub const __GCC_ASM_FLAG_OUTPUTS__ = @as(c_int, 1);
pub const __AARCH64_CMODEL_SMALL__ = @as(c_int, 1);
pub const __ARM_ACLE = @as(c_int, 200);
pub const __ARM_ARCH = @as(c_int, 8);
pub const __ARM_ARCH_PROFILE = 'A';
pub const __ARM_64BIT_STATE = @as(c_int, 1);
pub const __ARM_PCS_AAPCS64 = @as(c_int, 1);
pub const __ARM_ARCH_ISA_A64 = @as(c_int, 1);
pub const __ARM_FEATURE_CLZ = @as(c_int, 1);
pub const __ARM_FEATURE_FMA = @as(c_int, 1);
pub const __ARM_FEATURE_LDREX = @as(c_int, 0xF);
pub const __ARM_FEATURE_IDIV = @as(c_int, 1);
pub const __ARM_FEATURE_DIV = @as(c_int, 1);
pub const __ARM_FEATURE_NUMERIC_MAXMIN = @as(c_int, 1);
pub const __ARM_FEATURE_DIRECTED_ROUNDING = @as(c_int, 1);
pub const __ARM_ALIGN_MAX_STACK_PWR = @as(c_int, 4);
pub const __ARM_STATE_ZA = @as(c_int, 1);
pub const __ARM_STATE_ZT0 = @as(c_int, 1);
pub const __ARM_FP = @as(c_int, 0xE);
pub const __ARM_FP16_FORMAT_IEEE = @as(c_int, 1);
pub const __ARM_FP16_ARGS = @as(c_int, 1);
pub const __ARM_SIZEOF_WCHAR_T = @as(c_int, 4);
pub const __ARM_SIZEOF_MINIMAL_ENUM = @as(c_int, 4);
pub const __ARM_NEON = @as(c_int, 1);
pub const __ARM_NEON_FP = @as(c_int, 0xE);
pub const __ARM_FEATURE_UNALIGNED = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = @as(c_int, 1);
pub const __FP_FAST_FMA = @as(c_int, 1);
pub const __FP_FAST_FMAF = @as(c_int, 1);
pub const unix = @as(c_int, 1);
pub const __unix = @as(c_int, 1);
pub const __unix__ = @as(c_int, 1);
pub const linux = @as(c_int, 1);
pub const __linux = @as(c_int, 1);
pub const __linux__ = @as(c_int, 1);
pub const __gnu_linux__ = @as(c_int, 1);
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const __GLIBC_MINOR__ = @as(c_int, 39);
pub const _DEBUG = @as(c_int, 1);
pub const __GCC_HAVE_DWARF2_CFI_ASM = @as(c_int, 1);
pub const H_FACIL_IO_H = "";
pub const FIO_VERSION_MAJOR = @as(c_int, 0);
pub const FIO_VERSION_MINOR = @as(c_int, 7);
pub const FIO_VERSION_PATCH = @as(c_int, 4);
pub const FIO_VERSION_BETA = @as(c_int, 0);
pub const FIO_MACRO2STR_STEP2 = @compileError("unable to translate C expr: unexpected token '#'");
// vendor/facil.io/lib/facil/fio.h:116:9
pub inline fn FIO_MACRO2STR(macro: anytype) @TypeOf(FIO_MACRO2STR_STEP2(macro)) {
    _ = &macro;
    return FIO_MACRO2STR_STEP2(macro);
}
pub const FIO_VERSION_STRING = FIO_MACRO2STR(FIO_VERSION_MAJOR) ++ "." ++ FIO_MACRO2STR(FIO_VERSION_MINOR) ++ "." ++ FIO_MACRO2STR(FIO_VERSION_PATCH);
pub const FIO_MAX_SOCK_CAPACITY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 131072, .decimal);
pub const FIO_CPU_CORES_LIMIT = @as(c_int, 8);
pub const FIO_DEFER_THROTTLE_PROGRESSIVE = @as(c_int, 1);
pub const FIO_PRINT_STATE = @as(c_int, 0);
pub const FIO_PUBSUB_SUPPORT = @as(c_int, 1);
pub const FIO_LOG_LENGTH_LIMIT = @as(c_int, 2048);
pub const FIO_IGNORE_MACRO = "";
pub const _GNU_SOURCE = "";
pub const _ERRNO_H = @as(c_int, 1);
pub const _FEATURES_H = @as(c_int, 1);
pub const __KERNEL_STRICT_NAMES = "";
pub inline fn __GNUC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub inline fn __glibc_clang_prereq(maj: anytype, min: anytype) @TypeOf(((__clang_major__ << @as(c_int, 16)) + __clang_minor__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__clang_major__ << @as(c_int, 16)) + __clang_minor__) >= ((maj << @as(c_int, 16)) + min);
}
pub const __GLIBC_USE = @compileError("unable to translate macro: undefined identifier `__GLIBC_USE_`");
// /usr/include/features.h:188:9
pub const _ISOC95_SOURCE = @as(c_int, 1);
pub const _ISOC99_SOURCE = @as(c_int, 1);
pub const _ISOC11_SOURCE = @as(c_int, 1);
pub const _ISOC2X_SOURCE = @as(c_int, 1);
pub const _POSIX_SOURCE = @as(c_int, 1);
pub const _POSIX_C_SOURCE = @as(c_long, 200809);
pub const _XOPEN_SOURCE = @as(c_int, 700);
pub const _XOPEN_SOURCE_EXTENDED = @as(c_int, 1);
pub const _LARGEFILE64_SOURCE = @as(c_int, 1);
pub const _DEFAULT_SOURCE = @as(c_int, 1);
pub const _ATFILE_SOURCE = @as(c_int, 1);
pub const _DYNAMIC_STACK_SIZE_SOURCE = @as(c_int, 1);
pub const __GLIBC_USE_ISOC2X = @as(c_int, 1);
pub const __USE_ISOC11 = @as(c_int, 1);
pub const __USE_ISOC99 = @as(c_int, 1);
pub const __USE_ISOC95 = @as(c_int, 1);
pub const __USE_POSIX = @as(c_int, 1);
pub const __USE_POSIX2 = @as(c_int, 1);
pub const __USE_POSIX199309 = @as(c_int, 1);
pub const __USE_POSIX199506 = @as(c_int, 1);
pub const __USE_XOPEN2K = @as(c_int, 1);
pub const __USE_XOPEN2K8 = @as(c_int, 1);
pub const __USE_XOPEN = @as(c_int, 1);
pub const __USE_XOPEN_EXTENDED = @as(c_int, 1);
pub const __USE_UNIX98 = @as(c_int, 1);
pub const _LARGEFILE_SOURCE = @as(c_int, 1);
pub const __USE_XOPEN2K8XSI = @as(c_int, 1);
pub const __USE_XOPEN2KXSI = @as(c_int, 1);
pub const __USE_LARGEFILE = @as(c_int, 1);
pub const __USE_LARGEFILE64 = @as(c_int, 1);
pub const __WORDSIZE = @as(c_int, 64);
pub const __WORDSIZE_TIME64_COMPAT32 = @as(c_int, 0);
pub const __TIMESIZE = @as(c_int, 64);
pub const __USE_MISC = @as(c_int, 1);
pub const __USE_ATFILE = @as(c_int, 1);
pub const __USE_DYNAMIC_STACK_SIZE = @as(c_int, 1);
pub const __USE_GNU = @as(c_int, 1);
pub const __USE_FORTIFY_LEVEL = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_GETS = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_SCANF = @as(c_int, 0);
pub const __GLIBC_USE_C2X_STRTOL = @as(c_int, 1);
pub const _STDC_PREDEF_H = @as(c_int, 1);
pub const __STDC_IEC_559__ = @as(c_int, 1);
pub const __STDC_IEC_60559_BFP__ = @as(c_long, 201404);
pub const __STDC_IEC_559_COMPLEX__ = @as(c_int, 1);
pub const __STDC_IEC_60559_COMPLEX__ = @as(c_long, 201404);
pub const __STDC_ISO_10646__ = @as(c_long, 201706);
pub const __GNU_LIBRARY__ = @as(c_int, 6);
pub const __GLIBC__ = @as(c_int, 2);
pub inline fn __GLIBC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub const _SYS_CDEFS_H = @as(c_int, 1);
pub const __glibc_has_attribute = @compileError("unable to translate macro: undefined identifier `__has_attribute`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:45:10
pub inline fn __glibc_has_builtin(name: anytype) @TypeOf(__has_builtin(name)) {
    _ = &name;
    return __has_builtin(name);
}
pub const __glibc_has_extension = @compileError("unable to translate macro: undefined identifier `__has_extension`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:55:10
pub const __LEAF = "";
pub const __LEAF_ATTR = "";
pub const __THROW = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:79:11
pub const __THROWNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:80:11
pub const __NTH = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:81:11
pub const __NTHNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:82:11
pub const __COLD = @compileError("unable to translate macro: undefined identifier `__cold__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:102:11
pub inline fn __P(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub inline fn __PMT(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token '##'");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:131:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token '#'");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:132:9
pub const __ptr_t = ?*anyopaque;
pub const __BEGIN_DECLS = "";
pub const __END_DECLS = "";
pub inline fn __bos(ptr: anytype) @TypeOf(__builtin_object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1))) {
    _ = &ptr;
    return __builtin_object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1));
}
pub inline fn __bos0(ptr: anytype) @TypeOf(__builtin_object_size(ptr, @as(c_int, 0))) {
    _ = &ptr;
    return __builtin_object_size(ptr, @as(c_int, 0));
}
pub inline fn __glibc_objsize0(__o: anytype) @TypeOf(__bos0(__o)) {
    _ = &__o;
    return __bos0(__o);
}
pub inline fn __glibc_objsize(__o: anytype) @TypeOf(__bos(__o)) {
    _ = &__o;
    return __bos(__o);
}
pub const __warnattr = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:216:10
pub const __errordecl = @compileError("unable to translate C expr: unexpected token 'extern'");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:217:10
pub const __flexarr = @compileError("unable to translate C expr: unexpected token '['");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:225:10
pub const __glibc_c99_flexarr_available = @as(c_int, 1);
pub const __REDIRECT = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:256:10
pub const __REDIRECT_NTH = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:263:11
pub const __REDIRECT_NTHNL = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:265:11
pub const __ASMNAME = @compileError("unable to translate C expr: unexpected token ','");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:268:10
pub inline fn __ASMNAME2(prefix: anytype, cname: anytype) @TypeOf(__STRING(prefix) ++ cname) {
    _ = &prefix;
    _ = &cname;
    return __STRING(prefix) ++ cname;
}
pub const __REDIRECT_FORTIFY = __REDIRECT;
pub const __REDIRECT_FORTIFY_NTH = __REDIRECT_NTH;
pub const __attribute_malloc__ = @compileError("unable to translate macro: undefined identifier `__malloc__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:298:10
pub const __attribute_alloc_size__ = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:309:10
pub const __attribute_alloc_align__ = @compileError("unable to translate macro: undefined identifier `__alloc_align__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:315:10
pub const __attribute_pure__ = @compileError("unable to translate macro: undefined identifier `__pure__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:325:10
pub const __attribute_const__ = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:332:10
pub const __attribute_maybe_unused__ = @compileError("unable to translate macro: undefined identifier `__unused__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:338:10
pub const __attribute_used__ = @compileError("unable to translate macro: undefined identifier `__used__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:347:10
pub const __attribute_noinline__ = @compileError("unable to translate macro: undefined identifier `__noinline__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:348:10
pub const __attribute_deprecated__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:356:10
pub const __attribute_deprecated_msg__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:366:10
pub const __attribute_format_arg__ = @compileError("unable to translate macro: undefined identifier `__format_arg__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:379:10
pub const __attribute_format_strfmon__ = @compileError("unable to translate macro: undefined identifier `__format__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:389:10
pub const __attribute_nonnull__ = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:401:11
pub inline fn __nonnull(params: anytype) @TypeOf(__attribute_nonnull__(params)) {
    _ = &params;
    return __attribute_nonnull__(params);
}
pub const __returns_nonnull = @compileError("unable to translate macro: undefined identifier `__returns_nonnull__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:414:10
pub const __attribute_warn_unused_result__ = @compileError("unable to translate macro: undefined identifier `__warn_unused_result__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:423:10
pub const __wur = "";
pub const __always_inline = @compileError("unable to translate macro: undefined identifier `__always_inline__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:441:10
pub const __attribute_artificial__ = @compileError("unable to translate macro: undefined identifier `__artificial__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:450:10
pub const __extern_inline = @compileError("unable to translate macro: undefined identifier `__gnu_inline__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:468:11
pub const __extern_always_inline = @compileError("unable to translate macro: undefined identifier `__gnu_inline__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:469:11
pub const __fortify_function = __extern_always_inline ++ __attribute_artificial__;
pub const __restrict_arr = @compileError("unable to translate C expr: unexpected token '__restrict'");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:512:10
pub inline fn __glibc_unlikely(cond: anytype) @TypeOf(__builtin_expect(cond, @as(c_int, 0))) {
    _ = &cond;
    return __builtin_expect(cond, @as(c_int, 0));
}
pub inline fn __glibc_likely(cond: anytype) @TypeOf(__builtin_expect(cond, @as(c_int, 1))) {
    _ = &cond;
    return __builtin_expect(cond, @as(c_int, 1));
}
pub const __attribute_nonstring__ = "";
pub const __attribute_copy__ = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:561:10
pub const __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = @as(c_int, 0);
pub inline fn __LDBL_REDIR1(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR(name: anytype, proto: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR1_NTH(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto ++ __THROW;
}
pub inline fn __LDBL_REDIR_NTH(name: anytype, proto: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    return name ++ proto ++ __THROW;
}
pub const __LDBL_REDIR2_DECL = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:638:10
pub const __LDBL_REDIR_DECL = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:639:10
pub inline fn __REDIRECT_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT(name, proto, alias);
}
pub inline fn __REDIRECT_NTH_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT_NTH(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT_NTH(name, proto, alias);
}
pub const __glibc_macro_warning1 = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:653:10
pub const __glibc_macro_warning = @compileError("unable to translate macro: undefined identifier `GCC`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:654:10
pub const __HAVE_GENERIC_SELECTION = @as(c_int, 1);
pub const __fortified_attr_access = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:699:11
pub const __attr_access = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:700:11
pub const __attr_access_none = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:701:11
pub const __attr_dealloc = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:711:10
pub const __attr_dealloc_free = "";
pub const __attribute_returns_twice__ = @compileError("unable to translate macro: undefined identifier `__returns_twice__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:718:10
pub const __stub___compat_bdflush = "";
pub const __stub___compat_create_module = "";
pub const __stub___compat_get_kernel_syms = "";
pub const __stub___compat_query_module = "";
pub const __stub___compat_uselib = "";
pub const __stub_chflags = "";
pub const __stub_fchflags = "";
pub const __stub_gtty = "";
pub const __stub_revoke = "";
pub const __stub_setlogin = "";
pub const __stub_sigreturn = "";
pub const __stub_stty = "";
pub const _BITS_ERRNO_H = @as(c_int, 1);
pub const _ASM_GENERIC_ERRNO_H = "";
pub const _ASM_GENERIC_ERRNO_BASE_H = "";
pub const EPERM = @as(c_int, 1);
pub const ENOENT = @as(c_int, 2);
pub const ESRCH = @as(c_int, 3);
pub const EINTR = @as(c_int, 4);
pub const EIO = @as(c_int, 5);
pub const ENXIO = @as(c_int, 6);
pub const E2BIG = @as(c_int, 7);
pub const ENOEXEC = @as(c_int, 8);
pub const EBADF = @as(c_int, 9);
pub const ECHILD = @as(c_int, 10);
pub const EAGAIN = @as(c_int, 11);
pub const ENOMEM = @as(c_int, 12);
pub const EACCES = @as(c_int, 13);
pub const EFAULT = @as(c_int, 14);
pub const ENOTBLK = @as(c_int, 15);
pub const EBUSY = @as(c_int, 16);
pub const EEXIST = @as(c_int, 17);
pub const EXDEV = @as(c_int, 18);
pub const ENODEV = @as(c_int, 19);
pub const ENOTDIR = @as(c_int, 20);
pub const EISDIR = @as(c_int, 21);
pub const EINVAL = @as(c_int, 22);
pub const ENFILE = @as(c_int, 23);
pub const EMFILE = @as(c_int, 24);
pub const ENOTTY = @as(c_int, 25);
pub const ETXTBSY = @as(c_int, 26);
pub const EFBIG = @as(c_int, 27);
pub const ENOSPC = @as(c_int, 28);
pub const ESPIPE = @as(c_int, 29);
pub const EROFS = @as(c_int, 30);
pub const EMLINK = @as(c_int, 31);
pub const EPIPE = @as(c_int, 32);
pub const EDOM = @as(c_int, 33);
pub const ERANGE = @as(c_int, 34);
pub const EDEADLK = @as(c_int, 35);
pub const ENAMETOOLONG = @as(c_int, 36);
pub const ENOLCK = @as(c_int, 37);
pub const ENOSYS = @as(c_int, 38);
pub const ENOTEMPTY = @as(c_int, 39);
pub const ELOOP = @as(c_int, 40);
pub const EWOULDBLOCK = EAGAIN;
pub const ENOMSG = @as(c_int, 42);
pub const EIDRM = @as(c_int, 43);
pub const ECHRNG = @as(c_int, 44);
pub const EL2NSYNC = @as(c_int, 45);
pub const EL3HLT = @as(c_int, 46);
pub const EL3RST = @as(c_int, 47);
pub const ELNRNG = @as(c_int, 48);
pub const EUNATCH = @as(c_int, 49);
pub const ENOCSI = @as(c_int, 50);
pub const EL2HLT = @as(c_int, 51);
pub const EBADE = @as(c_int, 52);
pub const EBADR = @as(c_int, 53);
pub const EXFULL = @as(c_int, 54);
pub const ENOANO = @as(c_int, 55);
pub const EBADRQC = @as(c_int, 56);
pub const EBADSLT = @as(c_int, 57);
pub const EDEADLOCK = EDEADLK;
pub const EBFONT = @as(c_int, 59);
pub const ENOSTR = @as(c_int, 60);
pub const ENODATA = @as(c_int, 61);
pub const ETIME = @as(c_int, 62);
pub const ENOSR = @as(c_int, 63);
pub const ENONET = @as(c_int, 64);
pub const ENOPKG = @as(c_int, 65);
pub const EREMOTE = @as(c_int, 66);
pub const ENOLINK = @as(c_int, 67);
pub const EADV = @as(c_int, 68);
pub const ESRMNT = @as(c_int, 69);
pub const ECOMM = @as(c_int, 70);
pub const EPROTO = @as(c_int, 71);
pub const EMULTIHOP = @as(c_int, 72);
pub const EDOTDOT = @as(c_int, 73);
pub const EBADMSG = @as(c_int, 74);
pub const EOVERFLOW = @as(c_int, 75);
pub const ENOTUNIQ = @as(c_int, 76);
pub const EBADFD = @as(c_int, 77);
pub const EREMCHG = @as(c_int, 78);
pub const ELIBACC = @as(c_int, 79);
pub const ELIBBAD = @as(c_int, 80);
pub const ELIBSCN = @as(c_int, 81);
pub const ELIBMAX = @as(c_int, 82);
pub const ELIBEXEC = @as(c_int, 83);
pub const EILSEQ = @as(c_int, 84);
pub const ERESTART = @as(c_int, 85);
pub const ESTRPIPE = @as(c_int, 86);
pub const EUSERS = @as(c_int, 87);
pub const ENOTSOCK = @as(c_int, 88);
pub const EDESTADDRREQ = @as(c_int, 89);
pub const EMSGSIZE = @as(c_int, 90);
pub const EPROTOTYPE = @as(c_int, 91);
pub const ENOPROTOOPT = @as(c_int, 92);
pub const EPROTONOSUPPORT = @as(c_int, 93);
pub const ESOCKTNOSUPPORT = @as(c_int, 94);
pub const EOPNOTSUPP = @as(c_int, 95);
pub const EPFNOSUPPORT = @as(c_int, 96);
pub const EAFNOSUPPORT = @as(c_int, 97);
pub const EADDRINUSE = @as(c_int, 98);
pub const EADDRNOTAVAIL = @as(c_int, 99);
pub const ENETDOWN = @as(c_int, 100);
pub const ENETUNREACH = @as(c_int, 101);
pub const ENETRESET = @as(c_int, 102);
pub const ECONNABORTED = @as(c_int, 103);
pub const ECONNRESET = @as(c_int, 104);
pub const ENOBUFS = @as(c_int, 105);
pub const EISCONN = @as(c_int, 106);
pub const ENOTCONN = @as(c_int, 107);
pub const ESHUTDOWN = @as(c_int, 108);
pub const ETOOMANYREFS = @as(c_int, 109);
pub const ETIMEDOUT = @as(c_int, 110);
pub const ECONNREFUSED = @as(c_int, 111);
pub const EHOSTDOWN = @as(c_int, 112);
pub const EHOSTUNREACH = @as(c_int, 113);
pub const EALREADY = @as(c_int, 114);
pub const EINPROGRESS = @as(c_int, 115);
pub const ESTALE = @as(c_int, 116);
pub const EUCLEAN = @as(c_int, 117);
pub const ENOTNAM = @as(c_int, 118);
pub const ENAVAIL = @as(c_int, 119);
pub const EISNAM = @as(c_int, 120);
pub const EREMOTEIO = @as(c_int, 121);
pub const EDQUOT = @as(c_int, 122);
pub const ENOMEDIUM = @as(c_int, 123);
pub const EMEDIUMTYPE = @as(c_int, 124);
pub const ECANCELED = @as(c_int, 125);
pub const ENOKEY = @as(c_int, 126);
pub const EKEYEXPIRED = @as(c_int, 127);
pub const EKEYREVOKED = @as(c_int, 128);
pub const EKEYREJECTED = @as(c_int, 129);
pub const EOWNERDEAD = @as(c_int, 130);
pub const ENOTRECOVERABLE = @as(c_int, 131);
pub const ERFKILL = @as(c_int, 132);
pub const EHWPOISON = @as(c_int, 133);
pub const ENOTSUP = EOPNOTSUPP;
pub const errno = __errno_location().*;
pub const __error_t_defined = @as(c_int, 1);
pub const __CLANG_LIMITS_H = "";
pub const _GCC_LIMITS_H_ = "";
pub const _LIBC_LIMITS_H_ = @as(c_int, 1);
pub const __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION = "";
pub const __GLIBC_USE_LIB_EXT2 = @as(c_int, 1);
pub const __GLIBC_USE_IEC_60559_BFP_EXT = @as(c_int, 1);
pub const __GLIBC_USE_IEC_60559_BFP_EXT_C2X = @as(c_int, 1);
pub const __GLIBC_USE_IEC_60559_EXT = @as(c_int, 1);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT = @as(c_int, 1);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = @as(c_int, 1);
pub const __GLIBC_USE_IEC_60559_TYPES_EXT = @as(c_int, 1);
pub const MB_LEN_MAX = @as(c_int, 16);
pub const LLONG_MIN = -LLONG_MAX - @as(c_int, 1);
pub const LLONG_MAX = __LONG_LONG_MAX__;
pub const ULLONG_MAX = (LLONG_MAX * @as(c_ulonglong, 2)) + @as(c_int, 1);
pub const CHAR_WIDTH = @as(c_int, 8);
pub const SCHAR_WIDTH = @as(c_int, 8);
pub const UCHAR_WIDTH = @as(c_int, 8);
pub const SHRT_WIDTH = @as(c_int, 16);
pub const USHRT_WIDTH = @as(c_int, 16);
pub const INT_WIDTH = @as(c_int, 32);
pub const UINT_WIDTH = @as(c_int, 32);
pub const LONG_WIDTH = __WORDSIZE;
pub const ULONG_WIDTH = __WORDSIZE;
pub const LLONG_WIDTH = @as(c_int, 64);
pub const ULLONG_WIDTH = @as(c_int, 64);
pub const BOOL_MAX = @as(c_int, 1);
pub const BOOL_WIDTH = @as(c_int, 1);
pub const _BITS_POSIX1_LIM_H = @as(c_int, 1);
pub const _POSIX_AIO_LISTIO_MAX = @as(c_int, 2);
pub const _POSIX_AIO_MAX = @as(c_int, 1);
pub const _POSIX_ARG_MAX = @as(c_int, 4096);
pub const _POSIX_CHILD_MAX = @as(c_int, 25);
pub const _POSIX_DELAYTIMER_MAX = @as(c_int, 32);
pub const _POSIX_HOST_NAME_MAX = @as(c_int, 255);
pub const _POSIX_LINK_MAX = @as(c_int, 8);
pub const _POSIX_LOGIN_NAME_MAX = @as(c_int, 9);
pub const _POSIX_MAX_CANON = @as(c_int, 255);
pub const _POSIX_MAX_INPUT = @as(c_int, 255);
pub const _POSIX_MQ_OPEN_MAX = @as(c_int, 8);
pub const _POSIX_MQ_PRIO_MAX = @as(c_int, 32);
pub const _POSIX_NAME_MAX = @as(c_int, 14);
pub const _POSIX_NGROUPS_MAX = @as(c_int, 8);
pub const _POSIX_OPEN_MAX = @as(c_int, 20);
pub const _POSIX_FD_SETSIZE = _POSIX_OPEN_MAX;
pub const _POSIX_PATH_MAX = @as(c_int, 256);
pub const _POSIX_PIPE_BUF = @as(c_int, 512);
pub const _POSIX_RE_DUP_MAX = @as(c_int, 255);
pub const _POSIX_RTSIG_MAX = @as(c_int, 8);
pub const _POSIX_SEM_NSEMS_MAX = @as(c_int, 256);
pub const _POSIX_SEM_VALUE_MAX = @as(c_int, 32767);
pub const _POSIX_SIGQUEUE_MAX = @as(c_int, 32);
pub const _POSIX_SSIZE_MAX = @as(c_int, 32767);
pub const _POSIX_STREAM_MAX = @as(c_int, 8);
pub const _POSIX_SYMLINK_MAX = @as(c_int, 255);
pub const _POSIX_SYMLOOP_MAX = @as(c_int, 8);
pub const _POSIX_TIMER_MAX = @as(c_int, 32);
pub const _POSIX_TTY_NAME_MAX = @as(c_int, 9);
pub const _POSIX_TZNAME_MAX = @as(c_int, 6);
pub const _POSIX_QLIMIT = @as(c_int, 1);
pub const _POSIX_HIWAT = _POSIX_PIPE_BUF;
pub const _POSIX_UIO_MAXIOV = @as(c_int, 16);
pub const _POSIX_CLOCKRES_MIN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 20000000, .decimal);
pub const __undef_NR_OPEN = "";
pub const __undef_LINK_MAX = "";
pub const __undef_OPEN_MAX = "";
pub const __undef_ARG_MAX = "";
pub const _LINUX_LIMITS_H = "";
pub const NR_OPEN = @as(c_int, 1024);
pub const NGROUPS_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65536, .decimal);
pub const ARG_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 131072, .decimal);
pub const LINK_MAX = @as(c_int, 127);
pub const MAX_CANON = @as(c_int, 255);
pub const MAX_INPUT = @as(c_int, 255);
pub const NAME_MAX = @as(c_int, 255);
pub const PATH_MAX = @as(c_int, 4096);
pub const PIPE_BUF = @as(c_int, 4096);
pub const XATTR_NAME_MAX = @as(c_int, 255);
pub const XATTR_SIZE_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65536, .decimal);
pub const XATTR_LIST_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65536, .decimal);
pub const RTSIG_MAX = @as(c_int, 32);
pub const _POSIX_THREAD_KEYS_MAX = @as(c_int, 128);
pub const PTHREAD_KEYS_MAX = @as(c_int, 1024);
pub const _POSIX_THREAD_DESTRUCTOR_ITERATIONS = @as(c_int, 4);
pub const PTHREAD_DESTRUCTOR_ITERATIONS = _POSIX_THREAD_DESTRUCTOR_ITERATIONS;
pub const _POSIX_THREAD_THREADS_MAX = @as(c_int, 64);
pub const AIO_PRIO_DELTA_MAX = @as(c_int, 20);
pub const __SC_THREAD_STACK_MIN_VALUE = @as(c_int, 75);
pub const PTHREAD_STACK_MIN = __sysconf(__SC_THREAD_STACK_MIN_VALUE);
pub const DELAYTIMER_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const TTY_NAME_MAX = @as(c_int, 32);
pub const LOGIN_NAME_MAX = @as(c_int, 256);
pub const HOST_NAME_MAX = @as(c_int, 64);
pub const MQ_PRIO_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 32768, .decimal);
pub const SEM_VALUE_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const SSIZE_MAX = LONG_MAX;
pub const _BITS_POSIX2_LIM_H = @as(c_int, 1);
pub const _POSIX2_BC_BASE_MAX = @as(c_int, 99);
pub const _POSIX2_BC_DIM_MAX = @as(c_int, 2048);
pub const _POSIX2_BC_SCALE_MAX = @as(c_int, 99);
pub const _POSIX2_BC_STRING_MAX = @as(c_int, 1000);
pub const _POSIX2_COLL_WEIGHTS_MAX = @as(c_int, 2);
pub const _POSIX2_EXPR_NEST_MAX = @as(c_int, 32);
pub const _POSIX2_LINE_MAX = @as(c_int, 2048);
pub const _POSIX2_RE_DUP_MAX = @as(c_int, 255);
pub const _POSIX2_CHARCLASS_NAME_MAX = @as(c_int, 14);
pub const BC_BASE_MAX = _POSIX2_BC_BASE_MAX;
pub const BC_DIM_MAX = _POSIX2_BC_DIM_MAX;
pub const BC_SCALE_MAX = _POSIX2_BC_SCALE_MAX;
pub const BC_STRING_MAX = _POSIX2_BC_STRING_MAX;
pub const COLL_WEIGHTS_MAX = @as(c_int, 255);
pub const EXPR_NEST_MAX = _POSIX2_EXPR_NEST_MAX;
pub const LINE_MAX = _POSIX2_LINE_MAX;
pub const CHARCLASS_NAME_MAX = @as(c_int, 2048);
pub const RE_DUP_MAX = @as(c_int, 0x7fff);
pub const _XOPEN_LIM_H = @as(c_int, 1);
pub const _XOPEN_IOV_MAX = _POSIX_UIO_MAXIOV;
pub const _BITS_UIO_LIM_H = @as(c_int, 1);
pub const __IOV_MAX = @as(c_int, 1024);
pub const IOV_MAX = __IOV_MAX;
pub const NL_ARGMAX = _POSIX_ARG_MAX;
pub const NL_LANGMAX = _POSIX2_LINE_MAX;
pub const NL_MSGMAX = INT_MAX;
pub const NL_NMAX = INT_MAX;
pub const NL_SETMAX = INT_MAX;
pub const NL_TEXTMAX = INT_MAX;
pub const NZERO = @as(c_int, 20);
pub const WORD_BIT = @as(c_int, 32);
pub const LONG_BIT = @as(c_int, 64);
pub const SCHAR_MAX = __SCHAR_MAX__;
pub const SHRT_MAX = __SHRT_MAX__;
pub const INT_MAX = __INT_MAX__;
pub const LONG_MAX = __LONG_MAX__;
pub const SCHAR_MIN = -__SCHAR_MAX__ - @as(c_int, 1);
pub const SHRT_MIN = -__SHRT_MAX__ - @as(c_int, 1);
pub const INT_MIN = -__INT_MAX__ - @as(c_int, 1);
pub const LONG_MIN = -__LONG_MAX__ - @as(c_long, 1);
pub const UCHAR_MAX = (__SCHAR_MAX__ * @as(c_int, 2)) + @as(c_int, 1);
pub const USHRT_MAX = (__SHRT_MAX__ * @as(c_int, 2)) + @as(c_int, 1);
pub const UINT_MAX = (__INT_MAX__ * @as(c_uint, 2)) + @as(c_uint, 1);
pub const ULONG_MAX = (__LONG_MAX__ * @as(c_ulong, 2)) + @as(c_ulong, 1);
pub const CHAR_BIT = __CHAR_BIT__;
pub const CHAR_MIN = @as(c_int, 0);
pub const CHAR_MAX = UCHAR_MAX;
pub const LONG_LONG_MAX = __LONG_LONG_MAX__;
pub const LONG_LONG_MIN = -__LONG_LONG_MAX__ - @as(c_longlong, 1);
pub const ULONG_LONG_MAX = (__LONG_LONG_MAX__ * @as(c_ulonglong, 2)) + @as(c_ulonglong, 1);
pub const _SIGNAL_H = "";
pub const _BITS_TYPES_H = @as(c_int, 1);
pub const __S16_TYPE = c_short;
pub const __U16_TYPE = c_ushort;
pub const __S32_TYPE = c_int;
pub const __U32_TYPE = c_uint;
pub const __SLONGWORD_TYPE = c_long;
pub const __ULONGWORD_TYPE = c_ulong;
pub const __SQUAD_TYPE = c_long;
pub const __UQUAD_TYPE = c_ulong;
pub const __SWORD_TYPE = c_long;
pub const __UWORD_TYPE = c_ulong;
pub const __SLONG32_TYPE = c_int;
pub const __ULONG32_TYPE = c_uint;
pub const __S64_TYPE = c_long;
pub const __U64_TYPE = c_ulong;
pub const __STD_TYPE = @compileError("unable to translate C expr: unexpected token 'typedef'");
// /usr/include/aarch64-linux-gnu/bits/types.h:137:10
pub const _BITS_TYPESIZES_H = @as(c_int, 1);
pub const __INO_T_TYPE = __ULONGWORD_TYPE;
pub const __OFF_T_TYPE = __SLONGWORD_TYPE;
pub const __RLIM_T_TYPE = __ULONGWORD_TYPE;
pub const __BLKCNT_T_TYPE = __SLONGWORD_TYPE;
pub const __FSBLKCNT_T_TYPE = __ULONGWORD_TYPE;
pub const __FSFILCNT_T_TYPE = __ULONGWORD_TYPE;
pub const __TIME_T_TYPE = __SLONGWORD_TYPE;
pub const __SUSECONDS_T_TYPE = __SLONGWORD_TYPE;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const __UID_T_TYPE = __U32_TYPE;
pub const __GID_T_TYPE = __U32_TYPE;
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const __MODE_T_TYPE = __U32_TYPE;
pub const __NLINK_T_TYPE = __U32_TYPE;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const __PID_T_TYPE = __S32_TYPE;
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const __FSWORD_T_TYPE = __SWORD_TYPE;
pub const __ID_T_TYPE = __U32_TYPE;
pub const __CLOCK_T_TYPE = __SLONGWORD_TYPE;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const __SUSECONDS64_T_TYPE = __SQUAD_TYPE;
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const __KEY_T_TYPE = __S32_TYPE;
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __TIMER_T_TYPE = ?*anyopaque;
pub const __BLKSIZE_T_TYPE = __S32_TYPE;
pub const __FSID_T_TYPE = @compileError("unable to translate macro: undefined identifier `__val`");
// /usr/include/aarch64-linux-gnu/bits/typesizes.h:72:9
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub const __CPU_MASK_TYPE = __ULONGWORD_TYPE;
pub const __OFF_T_MATCHES_OFF64_T = @as(c_int, 1);
pub const __INO_T_MATCHES_INO64_T = @as(c_int, 1);
pub const __RLIM_T_MATCHES_RLIM64_T = @as(c_int, 1);
pub const __STATFS_MATCHES_STATFS64 = @as(c_int, 1);
pub const __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = __WORDSIZE == @as(c_int, 64);
pub const __FD_SETSIZE = @as(c_int, 1024);
pub const _BITS_TIME64_H = @as(c_int, 1);
pub const __TIME64_T_TYPE = __TIME_T_TYPE;
pub const _BITS_SIGNUM_GENERIC_H = @as(c_int, 1);
pub const SIG_ERR = @import("std").zig.c_translation.cast(__sighandler_t, -@as(c_int, 1));
pub const SIG_DFL = @import("std").zig.c_translation.cast(__sighandler_t, @as(c_int, 0));
pub const SIG_IGN = @import("std").zig.c_translation.cast(__sighandler_t, @as(c_int, 1));
pub const SIG_HOLD = @import("std").zig.c_translation.cast(__sighandler_t, @as(c_int, 2));
pub const SIGINT = @as(c_int, 2);
pub const SIGILL = @as(c_int, 4);
pub const SIGABRT = @as(c_int, 6);
pub const SIGFPE = @as(c_int, 8);
pub const SIGSEGV = @as(c_int, 11);
pub const SIGTERM = @as(c_int, 15);
pub const SIGHUP = @as(c_int, 1);
pub const SIGQUIT = @as(c_int, 3);
pub const SIGTRAP = @as(c_int, 5);
pub const SIGKILL = @as(c_int, 9);
pub const SIGPIPE = @as(c_int, 13);
pub const SIGALRM = @as(c_int, 14);
pub const SIGIO = SIGPOLL;
pub const SIGIOT = SIGABRT;
pub const SIGCLD = SIGCHLD;
pub const _BITS_SIGNUM_ARCH_H = @as(c_int, 1);
pub const SIGSTKFLT = @as(c_int, 16);
pub const SIGPWR = @as(c_int, 30);
pub const SIGBUS = @as(c_int, 7);
pub const SIGSYS = @as(c_int, 31);
pub const SIGURG = @as(c_int, 23);
pub const SIGSTOP = @as(c_int, 19);
pub const SIGTSTP = @as(c_int, 20);
pub const SIGCONT = @as(c_int, 18);
pub const SIGCHLD = @as(c_int, 17);
pub const SIGTTIN = @as(c_int, 21);
pub const SIGTTOU = @as(c_int, 22);
pub const SIGPOLL = @as(c_int, 29);
pub const SIGXFSZ = @as(c_int, 25);
pub const SIGXCPU = @as(c_int, 24);
pub const SIGVTALRM = @as(c_int, 26);
pub const SIGPROF = @as(c_int, 27);
pub const SIGUSR1 = @as(c_int, 10);
pub const SIGUSR2 = @as(c_int, 12);
pub const SIGWINCH = @as(c_int, 28);
pub const __SIGRTMIN = @as(c_int, 32);
pub const __SIGRTMAX = @as(c_int, 64);
pub const _NSIG = __SIGRTMAX + @as(c_int, 1);
pub const __sig_atomic_t_defined = @as(c_int, 1);
pub const __sigset_t_defined = @as(c_int, 1);
pub const ____sigset_t_defined = "";
pub const _SIGSET_NWORDS = @import("std").zig.c_translation.MacroArithmetic.div(@as(c_int, 1024), @as(c_int, 8) * @import("std").zig.c_translation.sizeof(c_ulong));
pub const __pid_t_defined = "";
pub const __uid_t_defined = "";
pub const _STRUCT_TIMESPEC = @as(c_int, 1);
pub const _BITS_ENDIAN_H = @as(c_int, 1);
pub const __LITTLE_ENDIAN = @as(c_int, 1234);
pub const __BIG_ENDIAN = @as(c_int, 4321);
pub const __PDP_ENDIAN = @as(c_int, 3412);
pub const _BITS_ENDIANNESS_H = @as(c_int, 1);
pub const __BYTE_ORDER = __LITTLE_ENDIAN;
pub const __FLOAT_WORD_ORDER = __BYTE_ORDER;
pub inline fn __LONG_LONG_PAIR(HI: anytype, LO: anytype) @TypeOf(HI) {
    _ = &HI;
    _ = &LO;
    return blk: {
        _ = &LO;
        break :blk HI;
    };
}
pub const __time_t_defined = @as(c_int, 1);
pub const __siginfo_t_defined = @as(c_int, 1);
pub const ____sigval_t_defined = "";
pub const __SI_MAX_SIZE = @as(c_int, 128);
pub const __SI_PAD_SIZE = @import("std").zig.c_translation.MacroArithmetic.div(__SI_MAX_SIZE, @import("std").zig.c_translation.sizeof(c_int)) - @as(c_int, 4);
pub const _BITS_SIGINFO_ARCH_H = @as(c_int, 1);
pub const __SI_ALIGNMENT = "";
pub const __SI_BAND_TYPE = c_long;
pub const __SI_CLOCK_T = __clock_t;
pub const __SI_ERRNO_THEN_CODE = @as(c_int, 1);
pub const __SI_HAVE_SIGSYS = @as(c_int, 1);
pub const __SI_SIGFAULT_ADDL = "";
pub const si_pid = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:128:9
pub const si_uid = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:129:9
pub const si_timerid = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:130:9
pub const si_overrun = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:131:9
pub const si_status = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:132:9
pub const si_utime = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:133:9
pub const si_stime = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:134:9
pub const si_value = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:135:9
pub const si_int = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:136:9
pub const si_ptr = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:137:9
pub const si_addr = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:138:9
pub const si_addr_lsb = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:139:9
pub const si_lower = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:140:9
pub const si_upper = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:141:9
pub const si_pkey = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:142:9
pub const si_band = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:143:9
pub const si_fd = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:144:9
pub const si_call_addr = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:146:10
pub const si_syscall = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:147:10
pub const si_arch = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:148:10
pub const _BITS_SIGINFO_CONSTS_H = @as(c_int, 1);
pub const __SI_ASYNCIO_AFTER_SIGIO = @as(c_int, 1);
pub const _BITS_SIGINFO_CONSTS_ARCH_H = @as(c_int, 1);
pub const __sigval_t_defined = "";
pub const __sigevent_t_defined = @as(c_int, 1);
pub const __SIGEV_MAX_SIZE = @as(c_int, 64);
pub const __SIGEV_PAD_SIZE = @import("std").zig.c_translation.MacroArithmetic.div(__SIGEV_MAX_SIZE, @import("std").zig.c_translation.sizeof(c_int)) - @as(c_int, 4);
pub const __have_pthread_attr_t = @as(c_int, 1);
pub const sigev_notify_function = @compileError("unable to translate macro: undefined identifier `_sigev_un`");
// /usr/include/aarch64-linux-gnu/bits/types/sigevent_t.h:45:9
pub const sigev_notify_attributes = @compileError("unable to translate macro: undefined identifier `_sigev_un`");
// /usr/include/aarch64-linux-gnu/bits/types/sigevent_t.h:46:9
pub const _BITS_SIGEVENT_CONSTS_H = @as(c_int, 1);
pub inline fn sigmask(sig: anytype) @TypeOf(__glibc_macro_warning("sigmask is deprecated")(@import("std").zig.c_translation.cast(c_int, @as(c_uint, 1) << (sig - @as(c_int, 1))))) {
    _ = &sig;
    return __glibc_macro_warning("sigmask is deprecated")(@import("std").zig.c_translation.cast(c_int, @as(c_uint, 1) << (sig - @as(c_int, 1))));
}
pub const NSIG = _NSIG;
pub const _BITS_SIGACTION_H = @as(c_int, 1);
pub const sa_handler = @compileError("unable to translate macro: undefined identifier `__sigaction_handler`");
// /usr/include/aarch64-linux-gnu/bits/sigaction.h:39:10
pub const sa_sigaction = @compileError("unable to translate macro: undefined identifier `__sigaction_handler`");
// /usr/include/aarch64-linux-gnu/bits/sigaction.h:40:10
pub const SA_NOCLDSTOP = @as(c_int, 1);
pub const SA_NOCLDWAIT = @as(c_int, 2);
pub const SA_SIGINFO = @as(c_int, 4);
pub const SA_ONSTACK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x08000000, .hex);
pub const SA_RESTART = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000000, .hex);
pub const SA_NODEFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const SA_RESETHAND = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const SA_INTERRUPT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const SA_NOMASK = SA_NODEFER;
pub const SA_ONESHOT = SA_RESETHAND;
pub const SA_STACK = SA_ONSTACK;
pub const SIG_BLOCK = @as(c_int, 0);
pub const SIG_UNBLOCK = @as(c_int, 1);
pub const SIG_SETMASK = @as(c_int, 2);
pub const _BITS_SIGCONTEXT_H = @as(c_int, 1);
pub const sigcontext_struct = sigcontext;
pub const __ASM_SIGCONTEXT_H = "";
pub const _LINUX_TYPES_H = "";
pub const _ASM_GENERIC_TYPES_H = "";
pub const _ASM_GENERIC_INT_LL64_H = "";
pub const __ASM_BITSPERLONG_H = "";
pub const __BITS_PER_LONG = @as(c_int, 64);
pub const __ASM_GENERIC_BITS_PER_LONG = "";
pub const _LINUX_POSIX_TYPES_H = "";
pub const _LINUX_STDDEF_H = "";
pub const __struct_group = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /usr/include/linux/stddef.h:26:9
pub const __DECLARE_FLEX_ARRAY = @compileError("unable to translate macro: undefined identifier `__empty_`");
// /usr/include/linux/stddef.h:47:9
pub const __counted_by = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/linux/stddef.h:55:9
pub const __ASM_POSIX_TYPES_H = "";
pub const __ASM_GENERIC_POSIX_TYPES_H = "";
pub const __bitwise = "";
pub const __bitwise__ = "";
pub const __aligned_u64 = @compileError("unable to translate macro: undefined identifier `aligned`");
// /usr/include/linux/types.h:50:9
pub const __aligned_be64 = @compileError("unable to translate macro: undefined identifier `aligned`");
// /usr/include/linux/types.h:51:9
pub const __aligned_le64 = @compileError("unable to translate macro: undefined identifier `aligned`");
// /usr/include/linux/types.h:52:9
pub const FPSIMD_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x46508001, .hex);
pub const ESR_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x45535201, .hex);
pub const EXTRA_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x45585401, .hex);
pub const SVE_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x53564501, .hex);
pub const SVE_SIG_FLAG_SM = @as(c_int, 0x1);
pub const TPIDR2_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x54504902, .hex);
pub const ZA_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x54366345, .hex);
pub const ZT_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x5a544e01, .hex);
pub const __ASM_SVE_CONTEXT_H = "";
pub const __SVE_VQ_BYTES = @as(c_int, 16);
pub const __SVE_VQ_MIN = @as(c_int, 1);
pub const __SVE_VQ_MAX = @as(c_int, 512);
pub const __SVE_VL_MIN = __SVE_VQ_MIN * __SVE_VQ_BYTES;
pub const __SVE_VL_MAX = __SVE_VQ_MAX * __SVE_VQ_BYTES;
pub const __SVE_NUM_ZREGS = @as(c_int, 32);
pub const __SVE_NUM_PREGS = @as(c_int, 16);
pub inline fn __sve_vl_valid(vl: anytype) @TypeOf(((@import("std").zig.c_translation.MacroArithmetic.rem(vl, __SVE_VQ_BYTES) == @as(c_int, 0)) and (vl >= __SVE_VL_MIN)) and (vl <= __SVE_VL_MAX)) {
    _ = &vl;
    return ((@import("std").zig.c_translation.MacroArithmetic.rem(vl, __SVE_VQ_BYTES) == @as(c_int, 0)) and (vl >= __SVE_VL_MIN)) and (vl <= __SVE_VL_MAX);
}
pub inline fn __sve_vq_from_vl(vl: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.div(vl, __SVE_VQ_BYTES)) {
    _ = &vl;
    return @import("std").zig.c_translation.MacroArithmetic.div(vl, __SVE_VQ_BYTES);
}
pub inline fn __sve_vl_from_vq(vq: anytype) @TypeOf(vq * __SVE_VQ_BYTES) {
    _ = &vq;
    return vq * __SVE_VQ_BYTES;
}
pub inline fn __SVE_ZREG_SIZE(vq: anytype) @TypeOf(@import("std").zig.c_translation.cast(__u32, vq) * __SVE_VQ_BYTES) {
    _ = &vq;
    return @import("std").zig.c_translation.cast(__u32, vq) * __SVE_VQ_BYTES;
}
pub inline fn __SVE_PREG_SIZE(vq: anytype) @TypeOf(@import("std").zig.c_translation.cast(__u32, vq) * @import("std").zig.c_translation.MacroArithmetic.div(__SVE_VQ_BYTES, @as(c_int, 8))) {
    _ = &vq;
    return @import("std").zig.c_translation.cast(__u32, vq) * @import("std").zig.c_translation.MacroArithmetic.div(__SVE_VQ_BYTES, @as(c_int, 8));
}
pub inline fn __SVE_FFR_SIZE(vq: anytype) @TypeOf(__SVE_PREG_SIZE(vq)) {
    _ = &vq;
    return __SVE_PREG_SIZE(vq);
}
pub const __SVE_ZREGS_OFFSET = @as(c_int, 0);
pub inline fn __SVE_ZREG_OFFSET(vq: anytype, n: anytype) @TypeOf(__SVE_ZREGS_OFFSET + (__SVE_ZREG_SIZE(vq) * n)) {
    _ = &vq;
    _ = &n;
    return __SVE_ZREGS_OFFSET + (__SVE_ZREG_SIZE(vq) * n);
}
pub inline fn __SVE_ZREGS_SIZE(vq: anytype) @TypeOf(__SVE_ZREG_OFFSET(vq, __SVE_NUM_ZREGS) - __SVE_ZREGS_OFFSET) {
    _ = &vq;
    return __SVE_ZREG_OFFSET(vq, __SVE_NUM_ZREGS) - __SVE_ZREGS_OFFSET;
}
pub inline fn __SVE_PREGS_OFFSET(vq: anytype) @TypeOf(__SVE_ZREGS_OFFSET + __SVE_ZREGS_SIZE(vq)) {
    _ = &vq;
    return __SVE_ZREGS_OFFSET + __SVE_ZREGS_SIZE(vq);
}
pub inline fn __SVE_PREG_OFFSET(vq: anytype, n: anytype) @TypeOf(__SVE_PREGS_OFFSET(vq) + (__SVE_PREG_SIZE(vq) * n)) {
    _ = &vq;
    _ = &n;
    return __SVE_PREGS_OFFSET(vq) + (__SVE_PREG_SIZE(vq) * n);
}
pub inline fn __SVE_PREGS_SIZE(vq: anytype) @TypeOf(__SVE_PREG_OFFSET(vq, __SVE_NUM_PREGS) - __SVE_PREGS_OFFSET(vq)) {
    _ = &vq;
    return __SVE_PREG_OFFSET(vq, __SVE_NUM_PREGS) - __SVE_PREGS_OFFSET(vq);
}
pub inline fn __SVE_FFR_OFFSET(vq: anytype) @TypeOf(__SVE_PREGS_OFFSET(vq) + __SVE_PREGS_SIZE(vq)) {
    _ = &vq;
    return __SVE_PREGS_OFFSET(vq) + __SVE_PREGS_SIZE(vq);
}
pub const SVE_VQ_BYTES = __SVE_VQ_BYTES;
pub const SVE_VQ_MIN = __SVE_VQ_MIN;
pub const SVE_VQ_MAX = __SVE_VQ_MAX;
pub const SVE_VL_MIN = __SVE_VL_MIN;
pub const SVE_VL_MAX = __SVE_VL_MAX;
pub const SVE_NUM_ZREGS = __SVE_NUM_ZREGS;
pub const SVE_NUM_PREGS = __SVE_NUM_PREGS;
pub inline fn sve_vl_valid(vl: anytype) @TypeOf(__sve_vl_valid(vl)) {
    _ = &vl;
    return __sve_vl_valid(vl);
}
pub inline fn sve_vq_from_vl(vl: anytype) @TypeOf(__sve_vq_from_vl(vl)) {
    _ = &vl;
    return __sve_vq_from_vl(vl);
}
pub inline fn sve_vl_from_vq(vq: anytype) @TypeOf(__sve_vl_from_vq(vq)) {
    _ = &vq;
    return __sve_vl_from_vq(vq);
}
pub inline fn SVE_SIG_ZREG_SIZE(vq: anytype) @TypeOf(__SVE_ZREG_SIZE(vq)) {
    _ = &vq;
    return __SVE_ZREG_SIZE(vq);
}
pub inline fn SVE_SIG_PREG_SIZE(vq: anytype) @TypeOf(__SVE_PREG_SIZE(vq)) {
    _ = &vq;
    return __SVE_PREG_SIZE(vq);
}
pub inline fn SVE_SIG_FFR_SIZE(vq: anytype) @TypeOf(__SVE_FFR_SIZE(vq)) {
    _ = &vq;
    return __SVE_FFR_SIZE(vq);
}
pub const SVE_SIG_REGS_OFFSET = @import("std").zig.c_translation.MacroArithmetic.div(@import("std").zig.c_translation.sizeof(struct_sve_context) + (__SVE_VQ_BYTES - @as(c_int, 1)), __SVE_VQ_BYTES) * __SVE_VQ_BYTES;
pub const SVE_SIG_ZREGS_OFFSET = SVE_SIG_REGS_OFFSET + __SVE_ZREGS_OFFSET;
pub inline fn SVE_SIG_ZREG_OFFSET(vq: anytype, n: anytype) @TypeOf(SVE_SIG_REGS_OFFSET + __SVE_ZREG_OFFSET(vq, n)) {
    _ = &vq;
    _ = &n;
    return SVE_SIG_REGS_OFFSET + __SVE_ZREG_OFFSET(vq, n);
}
pub inline fn SVE_SIG_ZREGS_SIZE(vq: anytype) @TypeOf(__SVE_ZREGS_SIZE(vq)) {
    _ = &vq;
    return __SVE_ZREGS_SIZE(vq);
}
pub inline fn SVE_SIG_PREGS_OFFSET(vq: anytype) @TypeOf(SVE_SIG_REGS_OFFSET + __SVE_PREGS_OFFSET(vq)) {
    _ = &vq;
    return SVE_SIG_REGS_OFFSET + __SVE_PREGS_OFFSET(vq);
}
pub inline fn SVE_SIG_PREG_OFFSET(vq: anytype, n: anytype) @TypeOf(SVE_SIG_REGS_OFFSET + __SVE_PREG_OFFSET(vq, n)) {
    _ = &vq;
    _ = &n;
    return SVE_SIG_REGS_OFFSET + __SVE_PREG_OFFSET(vq, n);
}
pub inline fn SVE_SIG_PREGS_SIZE(vq: anytype) @TypeOf(__SVE_PREGS_SIZE(vq)) {
    _ = &vq;
    return __SVE_PREGS_SIZE(vq);
}
pub inline fn SVE_SIG_FFR_OFFSET(vq: anytype) @TypeOf(SVE_SIG_REGS_OFFSET + __SVE_FFR_OFFSET(vq)) {
    _ = &vq;
    return SVE_SIG_REGS_OFFSET + __SVE_FFR_OFFSET(vq);
}
pub inline fn SVE_SIG_REGS_SIZE(vq: anytype) @TypeOf(__SVE_FFR_OFFSET(vq) + __SVE_FFR_SIZE(vq)) {
    _ = &vq;
    return __SVE_FFR_OFFSET(vq) + __SVE_FFR_SIZE(vq);
}
pub inline fn SVE_SIG_CONTEXT_SIZE(vq: anytype) @TypeOf(SVE_SIG_REGS_OFFSET + SVE_SIG_REGS_SIZE(vq)) {
    _ = &vq;
    return SVE_SIG_REGS_OFFSET + SVE_SIG_REGS_SIZE(vq);
}
pub const ZA_SIG_REGS_OFFSET = @import("std").zig.c_translation.MacroArithmetic.div(@import("std").zig.c_translation.sizeof(struct_za_context) + (__SVE_VQ_BYTES - @as(c_int, 1)), __SVE_VQ_BYTES) * __SVE_VQ_BYTES;
pub inline fn ZA_SIG_REGS_SIZE(vq: anytype) @TypeOf((vq * __SVE_VQ_BYTES) * (vq * __SVE_VQ_BYTES)) {
    _ = &vq;
    return (vq * __SVE_VQ_BYTES) * (vq * __SVE_VQ_BYTES);
}
pub inline fn ZA_SIG_ZAV_OFFSET(vq: anytype, n: anytype) @TypeOf(ZA_SIG_REGS_OFFSET + (SVE_SIG_ZREG_SIZE(vq) * n)) {
    _ = &vq;
    _ = &n;
    return ZA_SIG_REGS_OFFSET + (SVE_SIG_ZREG_SIZE(vq) * n);
}
pub inline fn ZA_SIG_CONTEXT_SIZE(vq: anytype) @TypeOf(ZA_SIG_REGS_OFFSET + ZA_SIG_REGS_SIZE(vq)) {
    _ = &vq;
    return ZA_SIG_REGS_OFFSET + ZA_SIG_REGS_SIZE(vq);
}
pub const ZT_SIG_REG_SIZE = @as(c_int, 512);
pub const ZT_SIG_REG_BYTES = @import("std").zig.c_translation.MacroArithmetic.div(ZT_SIG_REG_SIZE, @as(c_int, 8));
pub const ZT_SIG_REGS_OFFSET = @import("std").zig.c_translation.sizeof(struct_zt_context);
pub inline fn ZT_SIG_REGS_SIZE(n: anytype) @TypeOf(ZT_SIG_REG_BYTES * n) {
    _ = &n;
    return ZT_SIG_REG_BYTES * n;
}
pub inline fn ZT_SIG_CONTEXT_SIZE(n: anytype) @TypeOf(@import("std").zig.c_translation.sizeof(struct_zt_context) + ZT_SIG_REGS_SIZE(n)) {
    _ = &n;
    return @import("std").zig.c_translation.sizeof(struct_zt_context) + ZT_SIG_REGS_SIZE(n);
}
pub const __need_NULL = "";
pub const NULL = @import("std").zig.c_translation.cast(?*anyopaque, @as(c_int, 0));
pub const __need_size_t = "";
pub const _SIZE_T = "";
pub const __stack_t_defined = @as(c_int, 1);
pub const _SYS_UCONTEXT_H = @as(c_int, 1);
pub inline fn __ctx(fld: anytype) @TypeOf(fld) {
    _ = &fld;
    return fld;
}
pub const _SYS_PROCFS_H = @as(c_int, 1);
pub const _SYS_TIME_H = @as(c_int, 1);
pub const __timeval_defined = @as(c_int, 1);
pub const __suseconds_t_defined = "";
pub const _SYS_SELECT_H = @as(c_int, 1);
pub const __FD_ZERO = @compileError("unable to translate macro: undefined identifier `__i`");
// /usr/include/aarch64-linux-gnu/bits/select.h:25:9
pub const __FD_SET = @compileError("unable to translate C expr: expected ')' instead got '|='");
// /usr/include/aarch64-linux-gnu/bits/select.h:32:9
pub const __FD_CLR = @compileError("unable to translate C expr: expected ')' instead got '&='");
// /usr/include/aarch64-linux-gnu/bits/select.h:34:9
pub inline fn __FD_ISSET(d: anytype, s: anytype) @TypeOf((__FDS_BITS(s)[@as(usize, @intCast(__FD_ELT(d)))] & __FD_MASK(d)) != @as(c_int, 0)) {
    _ = &d;
    _ = &s;
    return (__FDS_BITS(s)[@as(usize, @intCast(__FD_ELT(d)))] & __FD_MASK(d)) != @as(c_int, 0);
}
pub const __NFDBITS = @as(c_int, 8) * @import("std").zig.c_translation.cast(c_int, @import("std").zig.c_translation.sizeof(__fd_mask));
pub inline fn __FD_ELT(d: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.div(d, __NFDBITS)) {
    _ = &d;
    return @import("std").zig.c_translation.MacroArithmetic.div(d, __NFDBITS);
}
pub inline fn __FD_MASK(d: anytype) __fd_mask {
    _ = &d;
    return @import("std").zig.c_translation.cast(__fd_mask, @as(c_ulong, 1) << @import("std").zig.c_translation.MacroArithmetic.rem(d, __NFDBITS));
}
pub inline fn __FDS_BITS(set: anytype) @TypeOf(set.*.fds_bits) {
    _ = &set;
    return set.*.fds_bits;
}
pub const FD_SETSIZE = __FD_SETSIZE;
pub const NFDBITS = __NFDBITS;
pub inline fn FD_SET(fd: anytype, fdsetp: anytype) @TypeOf(__FD_SET(fd, fdsetp)) {
    _ = &fd;
    _ = &fdsetp;
    return __FD_SET(fd, fdsetp);
}
pub inline fn FD_CLR(fd: anytype, fdsetp: anytype) @TypeOf(__FD_CLR(fd, fdsetp)) {
    _ = &fd;
    _ = &fdsetp;
    return __FD_CLR(fd, fdsetp);
}
pub inline fn FD_ISSET(fd: anytype, fdsetp: anytype) @TypeOf(__FD_ISSET(fd, fdsetp)) {
    _ = &fd;
    _ = &fdsetp;
    return __FD_ISSET(fd, fdsetp);
}
pub inline fn FD_ZERO(fdsetp: anytype) @TypeOf(__FD_ZERO(fdsetp)) {
    _ = &fdsetp;
    return __FD_ZERO(fdsetp);
}
pub const TIMEVAL_TO_TIMESPEC = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/aarch64-linux-gnu/sys/time.h:38:10
pub const TIMESPEC_TO_TIMEVAL = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/aarch64-linux-gnu/sys/time.h:42:10
pub inline fn timerisset(tvp: anytype) @TypeOf((tvp.*.tv_sec != 0) or (tvp.*.tv_usec != 0)) {
    _ = &tvp;
    return (tvp.*.tv_sec != 0) or (tvp.*.tv_usec != 0);
}
pub const timerclear = @compileError("unable to translate C expr: expected ')' instead got '='");
// /usr/include/aarch64-linux-gnu/sys/time.h:232:10
pub inline fn timercmp(a: anytype, b: anytype, CMP: anytype) @TypeOf(if (a.*.tv_sec == b.*.tv_sec) a.*.tv_usec ++ CMP(b).*.tv_usec else a.*.tv_sec ++ CMP(b).*.tv_sec) {
    _ = &a;
    _ = &b;
    _ = &CMP;
    return if (a.*.tv_sec == b.*.tv_sec) a.*.tv_usec ++ CMP(b).*.tv_usec else a.*.tv_sec ++ CMP(b).*.tv_sec;
}
pub const timeradd = @compileError("unable to translate C expr: unexpected token 'do'");
// /usr/include/aarch64-linux-gnu/sys/time.h:237:10
pub const timersub = @compileError("unable to translate C expr: unexpected token 'do'");
// /usr/include/aarch64-linux-gnu/sys/time.h:247:10
pub const _SYS_TYPES_H = @as(c_int, 1);
pub const __u_char_defined = "";
pub const __ino_t_defined = "";
pub const __ino64_t_defined = "";
pub const __dev_t_defined = "";
pub const __gid_t_defined = "";
pub const __mode_t_defined = "";
pub const __nlink_t_defined = "";
pub const __off_t_defined = "";
pub const __off64_t_defined = "";
pub const __id_t_defined = "";
pub const __ssize_t_defined = "";
pub const __daddr_t_defined = "";
pub const __key_t_defined = "";
pub const __clock_t_defined = @as(c_int, 1);
pub const __clockid_t_defined = @as(c_int, 1);
pub const __timer_t_defined = @as(c_int, 1);
pub const __useconds_t_defined = "";
pub const _BITS_STDINT_INTN_H = @as(c_int, 1);
pub const __BIT_TYPES_DEFINED__ = @as(c_int, 1);
pub const _ENDIAN_H = @as(c_int, 1);
pub const LITTLE_ENDIAN = __LITTLE_ENDIAN;
pub const BIG_ENDIAN = __BIG_ENDIAN;
pub const PDP_ENDIAN = __PDP_ENDIAN;
pub const BYTE_ORDER = __BYTE_ORDER;
pub const _BITS_BYTESWAP_H = @as(c_int, 1);
pub inline fn __bswap_constant_16(x: anytype) __uint16_t {
    _ = &x;
    return @import("std").zig.c_translation.cast(__uint16_t, ((x >> @as(c_int, 8)) & @as(c_int, 0xff)) | ((x & @as(c_int, 0xff)) << @as(c_int, 8)));
}
pub inline fn __bswap_constant_32(x: anytype) @TypeOf(((((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xff000000, .hex)) >> @as(c_int, 24)) | ((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x00ff0000, .hex)) >> @as(c_int, 8))) | ((x & @as(c_uint, 0x0000ff00)) << @as(c_int, 8))) | ((x & @as(c_uint, 0x000000ff)) << @as(c_int, 24))) {
    _ = &x;
    return ((((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xff000000, .hex)) >> @as(c_int, 24)) | ((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x00ff0000, .hex)) >> @as(c_int, 8))) | ((x & @as(c_uint, 0x0000ff00)) << @as(c_int, 8))) | ((x & @as(c_uint, 0x000000ff)) << @as(c_int, 24));
}
pub inline fn __bswap_constant_64(x: anytype) @TypeOf(((((((((x & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((x & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56))) {
    _ = &x;
    return ((((((((x & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((x & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56));
}
pub const _BITS_UINTN_IDENTITY_H = @as(c_int, 1);
pub inline fn htobe16(x: anytype) @TypeOf(__bswap_16(x)) {
    _ = &x;
    return __bswap_16(x);
}
pub inline fn htole16(x: anytype) @TypeOf(__uint16_identity(x)) {
    _ = &x;
    return __uint16_identity(x);
}
pub inline fn be16toh(x: anytype) @TypeOf(__bswap_16(x)) {
    _ = &x;
    return __bswap_16(x);
}
pub inline fn le16toh(x: anytype) @TypeOf(__uint16_identity(x)) {
    _ = &x;
    return __uint16_identity(x);
}
pub inline fn htobe32(x: anytype) @TypeOf(__bswap_32(x)) {
    _ = &x;
    return __bswap_32(x);
}
pub inline fn htole32(x: anytype) @TypeOf(__uint32_identity(x)) {
    _ = &x;
    return __uint32_identity(x);
}
pub inline fn be32toh(x: anytype) @TypeOf(__bswap_32(x)) {
    _ = &x;
    return __bswap_32(x);
}
pub inline fn le32toh(x: anytype) @TypeOf(__uint32_identity(x)) {
    _ = &x;
    return __uint32_identity(x);
}
pub inline fn htobe64(x: anytype) @TypeOf(__bswap_64(x)) {
    _ = &x;
    return __bswap_64(x);
}
pub inline fn htole64(x: anytype) @TypeOf(__uint64_identity(x)) {
    _ = &x;
    return __uint64_identity(x);
}
pub inline fn be64toh(x: anytype) @TypeOf(__bswap_64(x)) {
    _ = &x;
    return __bswap_64(x);
}
pub inline fn le64toh(x: anytype) @TypeOf(__uint64_identity(x)) {
    _ = &x;
    return __uint64_identity(x);
}
pub const __blksize_t_defined = "";
pub const __blkcnt_t_defined = "";
pub const __fsblkcnt_t_defined = "";
pub const __fsfilcnt_t_defined = "";
pub const _BITS_PTHREADTYPES_COMMON_H = @as(c_int, 1);
pub const _THREAD_SHARED_TYPES_H = @as(c_int, 1);
pub const _BITS_PTHREADTYPES_ARCH_H = @as(c_int, 1);
pub const __SIZEOF_PTHREAD_ATTR_T = @as(c_int, 64);
pub const __SIZEOF_PTHREAD_MUTEX_T = @as(c_int, 48);
pub const __SIZEOF_PTHREAD_MUTEXATTR_T = @as(c_int, 8);
pub const __SIZEOF_PTHREAD_CONDATTR_T = @as(c_int, 8);
pub const __SIZEOF_PTHREAD_RWLOCK_T = @as(c_int, 56);
pub const __SIZEOF_PTHREAD_BARRIER_T = @as(c_int, 32);
pub const __SIZEOF_PTHREAD_BARRIERATTR_T = @as(c_int, 8);
pub const __SIZEOF_PTHREAD_COND_T = @as(c_int, 48);
pub const __SIZEOF_PTHREAD_RWLOCKATTR_T = @as(c_int, 8);
pub const __LOCK_ALIGNMENT = "";
pub const __ONCE_ALIGNMENT = "";
pub const _BITS_ATOMIC_WIDE_COUNTER_H = "";
pub const _THREAD_MUTEX_INTERNAL_H = @as(c_int, 1);
pub const __PTHREAD_MUTEX_HAVE_PREV = @as(c_int, 1);
pub const __PTHREAD_MUTEX_INITIALIZER = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/aarch64-linux-gnu/bits/struct_mutex.h:77:10
pub const _RWLOCK_INTERNAL_H = "";
pub inline fn __PTHREAD_RWLOCK_INITIALIZER(__flags: anytype) @TypeOf(__flags) {
    _ = &__flags;
    return blk: {
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        break :blk __flags;
    };
}
pub const __ONCE_FLAG_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/aarch64-linux-gnu/bits/thread-shared-types.h:113:9
pub const _SYS_USER_H = @as(c_int, 1);
pub const ELF_NGREG = @import("std").zig.c_translation.MacroArithmetic.div(@import("std").zig.c_translation.sizeof(struct_user_regs_struct), @import("std").zig.c_translation.sizeof(elf_greg_t));
pub const ELF_PRARGSZ = @as(c_int, 80);
pub const _BITS_SIGSTACK_H = @as(c_int, 1);
pub const MINSIGSTKSZ = @as(c_int, 5120);
pub const SIGSTKSZ = @as(c_int, 16384);
pub const _UNISTD_H = @as(c_int, 1);
pub const _POSIX_VERSION = @as(c_long, 200809);
pub const __POSIX2_THIS_VERSION = @as(c_long, 200809);
pub const _POSIX2_VERSION = __POSIX2_THIS_VERSION;
pub const _POSIX2_C_VERSION = __POSIX2_THIS_VERSION;
pub const _POSIX2_C_BIND = __POSIX2_THIS_VERSION;
pub const _POSIX2_C_DEV = __POSIX2_THIS_VERSION;
pub const _POSIX2_SW_DEV = __POSIX2_THIS_VERSION;
pub const _POSIX2_LOCALEDEF = __POSIX2_THIS_VERSION;
pub const _XOPEN_VERSION = @as(c_int, 700);
pub const _XOPEN_XCU_VERSION = @as(c_int, 4);
pub const _XOPEN_XPG2 = @as(c_int, 1);
pub const _XOPEN_XPG3 = @as(c_int, 1);
pub const _XOPEN_XPG4 = @as(c_int, 1);
pub const _XOPEN_UNIX = @as(c_int, 1);
pub const _XOPEN_ENH_I18N = @as(c_int, 1);
pub const _XOPEN_LEGACY = @as(c_int, 1);
pub const _BITS_POSIX_OPT_H = @as(c_int, 1);
pub const _POSIX_JOB_CONTROL = @as(c_int, 1);
pub const _POSIX_SAVED_IDS = @as(c_int, 1);
pub const _POSIX_PRIORITY_SCHEDULING = @as(c_long, 200809);
pub const _POSIX_SYNCHRONIZED_IO = @as(c_long, 200809);
pub const _POSIX_FSYNC = @as(c_long, 200809);
pub const _POSIX_MAPPED_FILES = @as(c_long, 200809);
pub const _POSIX_MEMLOCK = @as(c_long, 200809);
pub const _POSIX_MEMLOCK_RANGE = @as(c_long, 200809);
pub const _POSIX_MEMORY_PROTECTION = @as(c_long, 200809);
pub const _POSIX_CHOWN_RESTRICTED = @as(c_int, 0);
pub const _POSIX_VDISABLE = '\x00';
pub const _POSIX_NO_TRUNC = @as(c_int, 1);
pub const _XOPEN_REALTIME = @as(c_int, 1);
pub const _XOPEN_REALTIME_THREADS = @as(c_int, 1);
pub const _XOPEN_SHM = @as(c_int, 1);
pub const _POSIX_THREADS = @as(c_long, 200809);
pub const _POSIX_REENTRANT_FUNCTIONS = @as(c_int, 1);
pub const _POSIX_THREAD_SAFE_FUNCTIONS = @as(c_long, 200809);
pub const _POSIX_THREAD_PRIORITY_SCHEDULING = @as(c_long, 200809);
pub const _POSIX_THREAD_ATTR_STACKSIZE = @as(c_long, 200809);
pub const _POSIX_THREAD_ATTR_STACKADDR = @as(c_long, 200809);
pub const _POSIX_THREAD_PRIO_INHERIT = @as(c_long, 200809);
pub const _POSIX_THREAD_PRIO_PROTECT = @as(c_long, 200809);
pub const _POSIX_THREAD_ROBUST_PRIO_INHERIT = @as(c_long, 200809);
pub const _POSIX_THREAD_ROBUST_PRIO_PROTECT = -@as(c_int, 1);
pub const _POSIX_SEMAPHORES = @as(c_long, 200809);
pub const _POSIX_REALTIME_SIGNALS = @as(c_long, 200809);
pub const _POSIX_ASYNCHRONOUS_IO = @as(c_long, 200809);
pub const _POSIX_ASYNC_IO = @as(c_int, 1);
pub const _LFS_ASYNCHRONOUS_IO = @as(c_int, 1);
pub const _POSIX_PRIORITIZED_IO = @as(c_long, 200809);
pub const _LFS64_ASYNCHRONOUS_IO = @as(c_int, 1);
pub const _LFS_LARGEFILE = @as(c_int, 1);
pub const _LFS64_LARGEFILE = @as(c_int, 1);
pub const _LFS64_STDIO = @as(c_int, 1);
pub const _POSIX_SHARED_MEMORY_OBJECTS = @as(c_long, 200809);
pub const _POSIX_CPUTIME = @as(c_int, 0);
pub const _POSIX_THREAD_CPUTIME = @as(c_int, 0);
pub const _POSIX_REGEXP = @as(c_int, 1);
pub const _POSIX_READER_WRITER_LOCKS = @as(c_long, 200809);
pub const _POSIX_SHELL = @as(c_int, 1);
pub const _POSIX_TIMEOUTS = @as(c_long, 200809);
pub const _POSIX_SPIN_LOCKS = @as(c_long, 200809);
pub const _POSIX_SPAWN = @as(c_long, 200809);
pub const _POSIX_TIMERS = @as(c_long, 200809);
pub const _POSIX_BARRIERS = @as(c_long, 200809);
pub const _POSIX_MESSAGE_PASSING = @as(c_long, 200809);
pub const _POSIX_THREAD_PROCESS_SHARED = @as(c_long, 200809);
pub const _POSIX_MONOTONIC_CLOCK = @as(c_int, 0);
pub const _POSIX_CLOCK_SELECTION = @as(c_long, 200809);
pub const _POSIX_ADVISORY_INFO = @as(c_long, 200809);
pub const _POSIX_IPV6 = @as(c_long, 200809);
pub const _POSIX_RAW_SOCKETS = @as(c_long, 200809);
pub const _POSIX2_CHAR_TERM = @as(c_long, 200809);
pub const _POSIX_SPORADIC_SERVER = -@as(c_int, 1);
pub const _POSIX_THREAD_SPORADIC_SERVER = -@as(c_int, 1);
pub const _POSIX_TRACE = -@as(c_int, 1);
pub const _POSIX_TRACE_EVENT_FILTER = -@as(c_int, 1);
pub const _POSIX_TRACE_INHERIT = -@as(c_int, 1);
pub const _POSIX_TRACE_LOG = -@as(c_int, 1);
pub const _POSIX_TYPED_MEMORY_OBJECTS = -@as(c_int, 1);
pub const _POSIX_V7_ILP32_OFF32 = -@as(c_int, 1);
pub const _POSIX_V7_ILP32_OFFBIG = -@as(c_int, 1);
pub const _POSIX_V6_ILP32_OFF32 = -@as(c_int, 1);
pub const _POSIX_V6_ILP32_OFFBIG = -@as(c_int, 1);
pub const _XBS5_ILP32_OFF32 = -@as(c_int, 1);
pub const _XBS5_ILP32_OFFBIG = -@as(c_int, 1);
pub const _POSIX_V7_LPBIG_OFFBIG = -@as(c_int, 1);
pub const _POSIX_V6_LPBIG_OFFBIG = -@as(c_int, 1);
pub const _XBS5_LPBIG_OFFBIG = -@as(c_int, 1);
pub const _POSIX_V7_LP64_OFF64 = @as(c_int, 1);
pub const _POSIX_V6_LP64_OFF64 = @as(c_int, 1);
pub const _XBS5_LP64_OFF64 = @as(c_int, 1);
pub const STDIN_FILENO = @as(c_int, 0);
pub const STDOUT_FILENO = @as(c_int, 1);
pub const STDERR_FILENO = @as(c_int, 2);
pub const __intptr_t_defined = "";
pub const __socklen_t_defined = "";
pub const R_OK = @as(c_int, 4);
pub const W_OK = @as(c_int, 2);
pub const X_OK = @as(c_int, 1);
pub const F_OK = @as(c_int, 0);
pub const SEEK_SET = @as(c_int, 0);
pub const SEEK_CUR = @as(c_int, 1);
pub const SEEK_END = @as(c_int, 2);
pub const SEEK_DATA = @as(c_int, 3);
pub const SEEK_HOLE = @as(c_int, 4);
pub const L_SET = SEEK_SET;
pub const L_INCR = SEEK_CUR;
pub const L_XTND = SEEK_END;
pub const _SC_PAGE_SIZE = _SC_PAGESIZE;
pub const _CS_POSIX_V6_WIDTH_RESTRICTED_ENVS = _CS_V6_WIDTH_RESTRICTED_ENVS;
pub const _CS_POSIX_V5_WIDTH_RESTRICTED_ENVS = _CS_V5_WIDTH_RESTRICTED_ENVS;
pub const _CS_POSIX_V7_WIDTH_RESTRICTED_ENVS = _CS_V7_WIDTH_RESTRICTED_ENVS;
pub const _GETOPT_POSIX_H = @as(c_int, 1);
pub const _GETOPT_CORE_H = @as(c_int, 1);
pub const F_ULOCK = @as(c_int, 0);
pub const F_LOCK = @as(c_int, 1);
pub const F_TLOCK = @as(c_int, 2);
pub const F_TEST = @as(c_int, 3);
pub const TEMP_FAILURE_RETRY = @compileError("unable to translate macro: undefined identifier `__result`");
// /usr/include/unistd.h:1134:10
pub const _LINUX_CLOSE_RANGE_H = "";
pub const CLOSE_RANGE_UNSHARE = @as(c_uint, 1) << @as(c_int, 1);
pub const CLOSE_RANGE_CLOEXEC = @as(c_uint, 1) << @as(c_int, 2);
pub const _BITS_SS_FLAGS_H = @as(c_int, 1);
pub const __sigstack_defined = @as(c_int, 1);
pub const _BITS_SIGTHREAD_H = @as(c_int, 1);
pub const SIGRTMIN = __libc_current_sigrtmin();
pub const SIGRTMAX = __libc_current_sigrtmax();
pub const __STDARG_H = "";
pub const __need___va_list = "";
pub const __need_va_list = "";
pub const __need_va_arg = "";
pub const __need___va_copy = "";
pub const __need_va_copy = "";
pub const __GNUC_VA_LIST = "";
pub const _VA_LIST = "";
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// /snap/zig/11624/lib/include/__stdarg_va_arg.h:17:9
pub const va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`");
// /snap/zig/11624/lib/include/__stdarg_va_arg.h:19:9
pub const va_arg = @compileError("unable to translate C expr: unexpected token 'an identifier'");
// /snap/zig/11624/lib/include/__stdarg_va_arg.h:20:9
pub const __va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`");
// /snap/zig/11624/lib/include/__stdarg___va_copy.h:11:9
pub const va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`");
// /snap/zig/11624/lib/include/__stdarg_va_copy.h:11:9
pub const __CLANG_STDINT_H = "";
pub const _STDINT_H = @as(c_int, 1);
pub const _BITS_WCHAR_H = @as(c_int, 1);
pub const __WCHAR_MAX = __WCHAR_MAX__;
pub const __WCHAR_MIN = '\x00' + @as(c_int, 0);
pub const _BITS_STDINT_UINTN_H = @as(c_int, 1);
pub const _BITS_STDINT_LEAST_H = @as(c_int, 1);
pub const __INT64_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const __UINT64_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INT8_MIN = -@as(c_int, 128);
pub const INT16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const INT32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT8_MAX = @as(c_int, 127);
pub const INT16_MAX = @as(c_int, 32767);
pub const INT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT8_MAX = @as(c_int, 255);
pub const UINT16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INT_LEAST8_MIN = -@as(c_int, 128);
pub const INT_LEAST16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const INT_LEAST32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT_LEAST64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT_LEAST8_MAX = @as(c_int, 127);
pub const INT_LEAST16_MAX = @as(c_int, 32767);
pub const INT_LEAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT_LEAST64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT_LEAST8_MAX = @as(c_int, 255);
pub const UINT_LEAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_LEAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_LEAST64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INT_FAST8_MIN = -@as(c_int, 128);
pub const INT_FAST16_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INT_FAST32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INT_FAST64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT_FAST8_MAX = @as(c_int, 127);
pub const INT_FAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INT_FAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INT_FAST64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT_FAST8_MAX = @as(c_int, 255);
pub const UINT_FAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INTPTR_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const UINTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const INTMAX_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INTMAX_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINTMAX_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const PTRDIFF_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const PTRDIFF_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const SIG_ATOMIC_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const SIG_ATOMIC_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const SIZE_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const WCHAR_MIN = __WCHAR_MIN;
pub const WCHAR_MAX = __WCHAR_MAX;
pub const WINT_MIN = @as(c_uint, 0);
pub const WINT_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub inline fn INT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn INT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn INT32_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const INT64_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub inline fn UINT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn UINT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const UINT32_C = @import("std").zig.c_translation.Macros.U_SUFFIX;
pub const UINT64_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INTMAX_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const UINTMAX_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INT8_WIDTH = @as(c_int, 8);
pub const UINT8_WIDTH = @as(c_int, 8);
pub const INT16_WIDTH = @as(c_int, 16);
pub const UINT16_WIDTH = @as(c_int, 16);
pub const INT32_WIDTH = @as(c_int, 32);
pub const UINT32_WIDTH = @as(c_int, 32);
pub const INT64_WIDTH = @as(c_int, 64);
pub const UINT64_WIDTH = @as(c_int, 64);
pub const INT_LEAST8_WIDTH = @as(c_int, 8);
pub const UINT_LEAST8_WIDTH = @as(c_int, 8);
pub const INT_LEAST16_WIDTH = @as(c_int, 16);
pub const UINT_LEAST16_WIDTH = @as(c_int, 16);
pub const INT_LEAST32_WIDTH = @as(c_int, 32);
pub const UINT_LEAST32_WIDTH = @as(c_int, 32);
pub const INT_LEAST64_WIDTH = @as(c_int, 64);
pub const UINT_LEAST64_WIDTH = @as(c_int, 64);
pub const INT_FAST8_WIDTH = @as(c_int, 8);
pub const UINT_FAST8_WIDTH = @as(c_int, 8);
pub const INT_FAST16_WIDTH = __WORDSIZE;
pub const UINT_FAST16_WIDTH = __WORDSIZE;
pub const INT_FAST32_WIDTH = __WORDSIZE;
pub const UINT_FAST32_WIDTH = __WORDSIZE;
pub const INT_FAST64_WIDTH = @as(c_int, 64);
pub const UINT_FAST64_WIDTH = @as(c_int, 64);
pub const INTPTR_WIDTH = __WORDSIZE;
pub const UINTPTR_WIDTH = __WORDSIZE;
pub const INTMAX_WIDTH = @as(c_int, 64);
pub const UINTMAX_WIDTH = @as(c_int, 64);
pub const PTRDIFF_WIDTH = __WORDSIZE;
pub const SIG_ATOMIC_WIDTH = @as(c_int, 32);
pub const SIZE_WIDTH = __WORDSIZE;
pub const WCHAR_WIDTH = @as(c_int, 32);
pub const WINT_WIDTH = @as(c_int, 32);
pub const _STDIO_H = @as(c_int, 1);
pub const _____fpos_t_defined = @as(c_int, 1);
pub const ____mbstate_t_defined = @as(c_int, 1);
pub const _____fpos64_t_defined = @as(c_int, 1);
pub const ____FILE_defined = @as(c_int, 1);
pub const __FILE_defined = @as(c_int, 1);
pub const __struct_FILE_defined = @as(c_int, 1);
pub const __getc_unlocked_body = @compileError("TODO postfix inc/dec expr");
// /usr/include/aarch64-linux-gnu/bits/types/struct_FILE.h:102:9
pub const __putc_unlocked_body = @compileError("TODO postfix inc/dec expr");
// /usr/include/aarch64-linux-gnu/bits/types/struct_FILE.h:106:9
pub const _IO_EOF_SEEN = @as(c_int, 0x0010);
pub inline fn __feof_unlocked_body(_fp: anytype) @TypeOf((_fp.*._flags & _IO_EOF_SEEN) != @as(c_int, 0)) {
    _ = &_fp;
    return (_fp.*._flags & _IO_EOF_SEEN) != @as(c_int, 0);
}
pub const _IO_ERR_SEEN = @as(c_int, 0x0020);
pub inline fn __ferror_unlocked_body(_fp: anytype) @TypeOf((_fp.*._flags & _IO_ERR_SEEN) != @as(c_int, 0)) {
    _ = &_fp;
    return (_fp.*._flags & _IO_ERR_SEEN) != @as(c_int, 0);
}
pub const _IO_USER_LOCK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const __cookie_io_functions_t_defined = @as(c_int, 1);
pub const _VA_LIST_DEFINED = "";
pub const _IOFBF = @as(c_int, 0);
pub const _IOLBF = @as(c_int, 1);
pub const _IONBF = @as(c_int, 2);
pub const BUFSIZ = @as(c_int, 8192);
pub const EOF = -@as(c_int, 1);
pub const P_tmpdir = "/tmp";
pub const L_tmpnam = @as(c_int, 20);
pub const TMP_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 238328, .decimal);
pub const _BITS_STDIO_LIM_H = @as(c_int, 1);
pub const FILENAME_MAX = @as(c_int, 4096);
pub const L_ctermid = @as(c_int, 9);
pub const L_cuserid = @as(c_int, 9);
pub const FOPEN_MAX = @as(c_int, 16);
pub const _PRINTF_NAN_LEN_MAX = @as(c_int, 4);
pub const RENAME_NOREPLACE = @as(c_int, 1) << @as(c_int, 0);
pub const RENAME_EXCHANGE = @as(c_int, 1) << @as(c_int, 1);
pub const RENAME_WHITEOUT = @as(c_int, 1) << @as(c_int, 2);
pub const __attr_dealloc_fclose = __attr_dealloc(fclose, @as(c_int, 1));
pub const _BITS_FLOATN_H = "";
pub const __HAVE_FLOAT128 = @as(c_int, 1);
pub const __HAVE_DISTINCT_FLOAT128 = @as(c_int, 0);
pub const __HAVE_FLOAT64X = __HAVE_FLOAT128;
pub const __HAVE_FLOAT64X_LONG_DOUBLE = __HAVE_FLOAT128;
pub const __f128 = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const __CFLOAT128 = @compileError("unable to translate: TODO _Complex");
// /usr/include/aarch64-linux-gnu/bits/floatn.h:69:12
pub const __builtin_huge_valf128 = @compileError("unable to translate macro: undefined identifier `__builtin_huge_vall`");
// /usr/include/aarch64-linux-gnu/bits/floatn.h:85:12
pub const __builtin_inff128 = @compileError("unable to translate macro: undefined identifier `__builtin_infl`");
// /usr/include/aarch64-linux-gnu/bits/floatn.h:86:12
pub const __builtin_nanf128 = @compileError("unable to translate macro: undefined identifier `__builtin_nanl`");
// /usr/include/aarch64-linux-gnu/bits/floatn.h:87:12
pub const __builtin_nansf128 = @compileError("unable to translate macro: undefined identifier `__builtin_nansl`");
// /usr/include/aarch64-linux-gnu/bits/floatn.h:88:12
pub const _BITS_FLOATN_COMMON_H = "";
pub const __HAVE_FLOAT16 = @as(c_int, 0);
pub const __HAVE_FLOAT32 = @as(c_int, 1);
pub const __HAVE_FLOAT64 = @as(c_int, 1);
pub const __HAVE_FLOAT32X = @as(c_int, 1);
pub const __HAVE_FLOAT128X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT16 = __HAVE_FLOAT16;
pub const __HAVE_DISTINCT_FLOAT32 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT32X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT128X = __HAVE_FLOAT128X;
pub const __HAVE_FLOAT128_UNLIKE_LDBL = (__HAVE_DISTINCT_FLOAT128 != 0) and (__LDBL_MANT_DIG__ != @as(c_int, 113));
pub const __HAVE_FLOATN_NOT_TYPEDEF = @as(c_int, 0);
pub const __f32 = @import("std").zig.c_translation.Macros.F_SUFFIX;
pub inline fn __f64(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __f32x(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub const __f64x = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const __CFLOAT32 = @compileError("unable to translate: TODO _Complex");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:149:12
pub const __CFLOAT64 = @compileError("unable to translate: TODO _Complex");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:160:13
pub const __CFLOAT32X = @compileError("unable to translate: TODO _Complex");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:169:12
pub const __CFLOAT64X = @compileError("unable to translate: TODO _Complex");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:178:13
pub inline fn __builtin_huge_valf32() @TypeOf(__builtin_huge_valf()) {
    return __builtin_huge_valf();
}
pub inline fn __builtin_inff32() @TypeOf(__builtin_inff()) {
    return __builtin_inff();
}
pub inline fn __builtin_nanf32(x: anytype) @TypeOf(__builtin_nanf(x)) {
    _ = &x;
    return __builtin_nanf(x);
}
pub const __builtin_nansf32 = @compileError("unable to translate macro: undefined identifier `__builtin_nansf`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:221:12
pub const __builtin_huge_valf64 = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:255:13
pub const __builtin_inff64 = @compileError("unable to translate macro: undefined identifier `__builtin_inf`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:256:13
pub const __builtin_nanf64 = @compileError("unable to translate macro: undefined identifier `__builtin_nan`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:257:13
pub const __builtin_nansf64 = @compileError("unable to translate macro: undefined identifier `__builtin_nans`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:258:13
pub const __builtin_huge_valf32x = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:272:12
pub const __builtin_inff32x = @compileError("unable to translate macro: undefined identifier `__builtin_inf`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:273:12
pub const __builtin_nanf32x = @compileError("unable to translate macro: undefined identifier `__builtin_nan`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:274:12
pub const __builtin_nansf32x = @compileError("unable to translate macro: undefined identifier `__builtin_nans`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:275:12
pub const __builtin_huge_valf64x = @compileError("unable to translate macro: undefined identifier `__builtin_huge_vall`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:289:13
pub const __builtin_inff64x = @compileError("unable to translate macro: undefined identifier `__builtin_infl`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:290:13
pub const __builtin_nanf64x = @compileError("unable to translate macro: undefined identifier `__builtin_nanl`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:291:13
pub const __builtin_nansf64x = @compileError("unable to translate macro: undefined identifier `__builtin_nansl`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:292:13
pub const __need_wchar_t = "";
pub const _WCHAR_T = "";
pub const _STDLIB_H = @as(c_int, 1);
pub const WNOHANG = @as(c_int, 1);
pub const WUNTRACED = @as(c_int, 2);
pub const WSTOPPED = @as(c_int, 2);
pub const WEXITED = @as(c_int, 4);
pub const WCONTINUED = @as(c_int, 8);
pub const WNOWAIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const __WNOTHREAD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const __WALL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const __WCLONE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub inline fn __WEXITSTATUS(status: anytype) @TypeOf((status & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff00, .hex)) >> @as(c_int, 8)) {
    _ = &status;
    return (status & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff00, .hex)) >> @as(c_int, 8);
}
pub inline fn __WTERMSIG(status: anytype) @TypeOf(status & @as(c_int, 0x7f)) {
    _ = &status;
    return status & @as(c_int, 0x7f);
}
pub inline fn __WSTOPSIG(status: anytype) @TypeOf(__WEXITSTATUS(status)) {
    _ = &status;
    return __WEXITSTATUS(status);
}
pub inline fn __WIFEXITED(status: anytype) @TypeOf(__WTERMSIG(status) == @as(c_int, 0)) {
    _ = &status;
    return __WTERMSIG(status) == @as(c_int, 0);
}
pub inline fn __WIFSIGNALED(status: anytype) @TypeOf((@import("std").zig.c_translation.cast(i8, (status & @as(c_int, 0x7f)) + @as(c_int, 1)) >> @as(c_int, 1)) > @as(c_int, 0)) {
    _ = &status;
    return (@import("std").zig.c_translation.cast(i8, (status & @as(c_int, 0x7f)) + @as(c_int, 1)) >> @as(c_int, 1)) > @as(c_int, 0);
}
pub inline fn __WIFSTOPPED(status: anytype) @TypeOf((status & @as(c_int, 0xff)) == @as(c_int, 0x7f)) {
    _ = &status;
    return (status & @as(c_int, 0xff)) == @as(c_int, 0x7f);
}
pub inline fn __WIFCONTINUED(status: anytype) @TypeOf(status == __W_CONTINUED) {
    _ = &status;
    return status == __W_CONTINUED;
}
pub inline fn __WCOREDUMP(status: anytype) @TypeOf(status & __WCOREFLAG) {
    _ = &status;
    return status & __WCOREFLAG;
}
pub inline fn __W_EXITCODE(ret: anytype, sig: anytype) @TypeOf((ret << @as(c_int, 8)) | sig) {
    _ = &ret;
    _ = &sig;
    return (ret << @as(c_int, 8)) | sig;
}
pub inline fn __W_STOPCODE(sig: anytype) @TypeOf((sig << @as(c_int, 8)) | @as(c_int, 0x7f)) {
    _ = &sig;
    return (sig << @as(c_int, 8)) | @as(c_int, 0x7f);
}
pub const __W_CONTINUED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex);
pub const __WCOREFLAG = @as(c_int, 0x80);
pub inline fn WEXITSTATUS(status: anytype) @TypeOf(__WEXITSTATUS(status)) {
    _ = &status;
    return __WEXITSTATUS(status);
}
pub inline fn WTERMSIG(status: anytype) @TypeOf(__WTERMSIG(status)) {
    _ = &status;
    return __WTERMSIG(status);
}
pub inline fn WSTOPSIG(status: anytype) @TypeOf(__WSTOPSIG(status)) {
    _ = &status;
    return __WSTOPSIG(status);
}
pub inline fn WIFEXITED(status: anytype) @TypeOf(__WIFEXITED(status)) {
    _ = &status;
    return __WIFEXITED(status);
}
pub inline fn WIFSIGNALED(status: anytype) @TypeOf(__WIFSIGNALED(status)) {
    _ = &status;
    return __WIFSIGNALED(status);
}
pub inline fn WIFSTOPPED(status: anytype) @TypeOf(__WIFSTOPPED(status)) {
    _ = &status;
    return __WIFSTOPPED(status);
}
pub inline fn WIFCONTINUED(status: anytype) @TypeOf(__WIFCONTINUED(status)) {
    _ = &status;
    return __WIFCONTINUED(status);
}
pub const __ldiv_t_defined = @as(c_int, 1);
pub const __lldiv_t_defined = @as(c_int, 1);
pub const RAND_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const EXIT_FAILURE = @as(c_int, 1);
pub const EXIT_SUCCESS = @as(c_int, 0);
pub const MB_CUR_MAX = __ctype_get_mb_cur_max();
pub const _BITS_TYPES_LOCALE_T_H = @as(c_int, 1);
pub const _BITS_TYPES___LOCALE_T_H = @as(c_int, 1);
pub const _ALLOCA_H = @as(c_int, 1);
pub const __COMPAR_FN_T = "";
pub const _STRING_H = @as(c_int, 1);
pub const strdupa = @compileError("unable to translate macro: undefined identifier `__old`");
// /usr/include/string.h:201:10
pub const strndupa = @compileError("unable to translate macro: undefined identifier `__old`");
// /usr/include/string.h:211:10
pub const _STRINGS_H = @as(c_int, 1);
pub const _TIME_H = @as(c_int, 1);
pub const _BITS_TIME_H = @as(c_int, 1);
pub const CLOCKS_PER_SEC = @import("std").zig.c_translation.cast(__clock_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000000, .decimal));
pub const CLOCK_REALTIME = @as(c_int, 0);
pub const CLOCK_MONOTONIC = @as(c_int, 1);
pub const CLOCK_PROCESS_CPUTIME_ID = @as(c_int, 2);
pub const CLOCK_THREAD_CPUTIME_ID = @as(c_int, 3);
pub const CLOCK_MONOTONIC_RAW = @as(c_int, 4);
pub const CLOCK_REALTIME_COARSE = @as(c_int, 5);
pub const CLOCK_MONOTONIC_COARSE = @as(c_int, 6);
pub const CLOCK_BOOTTIME = @as(c_int, 7);
pub const CLOCK_REALTIME_ALARM = @as(c_int, 8);
pub const CLOCK_BOOTTIME_ALARM = @as(c_int, 9);
pub const CLOCK_TAI = @as(c_int, 11);
pub const TIMER_ABSTIME = @as(c_int, 1);
pub const _BITS_TIMEX_H = @as(c_int, 1);
pub const ADJ_OFFSET = @as(c_int, 0x0001);
pub const ADJ_FREQUENCY = @as(c_int, 0x0002);
pub const ADJ_MAXERROR = @as(c_int, 0x0004);
pub const ADJ_ESTERROR = @as(c_int, 0x0008);
pub const ADJ_STATUS = @as(c_int, 0x0010);
pub const ADJ_TIMECONST = @as(c_int, 0x0020);
pub const ADJ_TAI = @as(c_int, 0x0080);
pub const ADJ_SETOFFSET = @as(c_int, 0x0100);
pub const ADJ_MICRO = @as(c_int, 0x1000);
pub const ADJ_NANO = @as(c_int, 0x2000);
pub const ADJ_TICK = @as(c_int, 0x4000);
pub const ADJ_OFFSET_SINGLESHOT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8001, .hex);
pub const ADJ_OFFSET_SS_READ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xa001, .hex);
pub const MOD_OFFSET = ADJ_OFFSET;
pub const MOD_FREQUENCY = ADJ_FREQUENCY;
pub const MOD_MAXERROR = ADJ_MAXERROR;
pub const MOD_ESTERROR = ADJ_ESTERROR;
pub const MOD_STATUS = ADJ_STATUS;
pub const MOD_TIMECONST = ADJ_TIMECONST;
pub const MOD_CLKB = ADJ_TICK;
pub const MOD_CLKA = ADJ_OFFSET_SINGLESHOT;
pub const MOD_TAI = ADJ_TAI;
pub const MOD_MICRO = ADJ_MICRO;
pub const MOD_NANO = ADJ_NANO;
pub const STA_PLL = @as(c_int, 0x0001);
pub const STA_PPSFREQ = @as(c_int, 0x0002);
pub const STA_PPSTIME = @as(c_int, 0x0004);
pub const STA_FLL = @as(c_int, 0x0008);
pub const STA_INS = @as(c_int, 0x0010);
pub const STA_DEL = @as(c_int, 0x0020);
pub const STA_UNSYNC = @as(c_int, 0x0040);
pub const STA_FREQHOLD = @as(c_int, 0x0080);
pub const STA_PPSSIGNAL = @as(c_int, 0x0100);
pub const STA_PPSJITTER = @as(c_int, 0x0200);
pub const STA_PPSWANDER = @as(c_int, 0x0400);
pub const STA_PPSERROR = @as(c_int, 0x0800);
pub const STA_CLOCKERR = @as(c_int, 0x1000);
pub const STA_NANO = @as(c_int, 0x2000);
pub const STA_MODE = @as(c_int, 0x4000);
pub const STA_CLK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const STA_RONLY = ((((((STA_PPSSIGNAL | STA_PPSJITTER) | STA_PPSWANDER) | STA_PPSERROR) | STA_CLOCKERR) | STA_NANO) | STA_MODE) | STA_CLK;
pub const __struct_tm_defined = @as(c_int, 1);
pub const __itimerspec_defined = @as(c_int, 1);
pub const TIME_UTC = @as(c_int, 1);
pub inline fn __isleap(year: anytype) @TypeOf((@import("std").zig.c_translation.MacroArithmetic.rem(year, @as(c_int, 4)) == @as(c_int, 0)) and ((@import("std").zig.c_translation.MacroArithmetic.rem(year, @as(c_int, 100)) != @as(c_int, 0)) or (@import("std").zig.c_translation.MacroArithmetic.rem(year, @as(c_int, 400)) == @as(c_int, 0)))) {
    _ = &year;
    return (@import("std").zig.c_translation.MacroArithmetic.rem(year, @as(c_int, 4)) == @as(c_int, 0)) and ((@import("std").zig.c_translation.MacroArithmetic.rem(year, @as(c_int, 100)) != @as(c_int, 0)) or (@import("std").zig.c_translation.MacroArithmetic.rem(year, @as(c_int, 400)) == @as(c_int, 0)));
}
pub const _FCNTL_H = @as(c_int, 1);
pub const __O_DIRECTORY = @as(c_int, 0o40000);
pub const __O_NOFOLLOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o100000, .octal);
pub const __O_DIRECT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o200000, .octal);
pub const __O_LARGEFILE = @as(c_int, 0);
pub const F_GETLK64 = @as(c_int, 5);
pub const F_SETLK64 = @as(c_int, 6);
pub const F_SETLKW64 = @as(c_int, 7);
pub const __iovec_defined = @as(c_int, 1);
pub const O_ACCMODE = @as(c_int, 0o003);
pub const O_RDONLY = @as(c_int, 0o0);
pub const O_WRONLY = @as(c_int, 0o1);
pub const O_RDWR = @as(c_int, 0o2);
pub const O_CREAT = @as(c_int, 0o100);
pub const O_EXCL = @as(c_int, 0o200);
pub const O_NOCTTY = @as(c_int, 0o400);
pub const O_TRUNC = @as(c_int, 0o1000);
pub const O_APPEND = @as(c_int, 0o2000);
pub const O_NONBLOCK = @as(c_int, 0o4000);
pub const O_NDELAY = O_NONBLOCK;
pub const O_SYNC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o4010000, .octal);
pub const O_FSYNC = O_SYNC;
pub const O_ASYNC = @as(c_int, 0o20000);
pub const __O_CLOEXEC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o2000000, .octal);
pub const __O_NOATIME = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o1000000, .octal);
pub const __O_PATH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o10000000, .octal);
pub const __O_DSYNC = @as(c_int, 0o10000);
pub const __O_TMPFILE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o20000000, .octal) | __O_DIRECTORY;
pub const F_GETLK = F_GETLK64;
pub const F_SETLK = F_SETLK64;
pub const F_SETLKW = F_SETLKW64;
pub const F_OFD_GETLK = @as(c_int, 36);
pub const F_OFD_SETLK = @as(c_int, 37);
pub const F_OFD_SETLKW = @as(c_int, 38);
pub const O_LARGEFILE = __O_LARGEFILE;
pub const O_DIRECTORY = __O_DIRECTORY;
pub const O_NOFOLLOW = __O_NOFOLLOW;
pub const O_CLOEXEC = __O_CLOEXEC;
pub const O_DIRECT = __O_DIRECT;
pub const O_NOATIME = __O_NOATIME;
pub const O_PATH = __O_PATH;
pub const O_TMPFILE = __O_TMPFILE;
pub const O_DSYNC = __O_DSYNC;
pub const O_RSYNC = O_SYNC;
pub const F_DUPFD = @as(c_int, 0);
pub const F_GETFD = @as(c_int, 1);
pub const F_SETFD = @as(c_int, 2);
pub const F_GETFL = @as(c_int, 3);
pub const F_SETFL = @as(c_int, 4);
pub const __F_SETOWN = @as(c_int, 8);
pub const __F_GETOWN = @as(c_int, 9);
pub const F_SETOWN = __F_SETOWN;
pub const F_GETOWN = __F_GETOWN;
pub const __F_SETSIG = @as(c_int, 10);
pub const __F_GETSIG = @as(c_int, 11);
pub const __F_SETOWN_EX = @as(c_int, 15);
pub const __F_GETOWN_EX = @as(c_int, 16);
pub const F_SETSIG = __F_SETSIG;
pub const F_GETSIG = __F_GETSIG;
pub const F_SETOWN_EX = __F_SETOWN_EX;
pub const F_GETOWN_EX = __F_GETOWN_EX;
pub const F_SETLEASE = @as(c_int, 1024);
pub const F_GETLEASE = @as(c_int, 1025);
pub const F_NOTIFY = @as(c_int, 1026);
pub const F_SETPIPE_SZ = @as(c_int, 1031);
pub const F_GETPIPE_SZ = @as(c_int, 1032);
pub const F_ADD_SEALS = @as(c_int, 1033);
pub const F_GET_SEALS = @as(c_int, 1034);
pub const F_GET_RW_HINT = @as(c_int, 1035);
pub const F_SET_RW_HINT = @as(c_int, 1036);
pub const F_GET_FILE_RW_HINT = @as(c_int, 1037);
pub const F_SET_FILE_RW_HINT = @as(c_int, 1038);
pub const F_DUPFD_CLOEXEC = @as(c_int, 1030);
pub const FD_CLOEXEC = @as(c_int, 1);
pub const F_RDLCK = @as(c_int, 0);
pub const F_WRLCK = @as(c_int, 1);
pub const F_UNLCK = @as(c_int, 2);
pub const F_EXLCK = @as(c_int, 4);
pub const F_SHLCK = @as(c_int, 8);
pub const LOCK_SH = @as(c_int, 1);
pub const LOCK_EX = @as(c_int, 2);
pub const LOCK_NB = @as(c_int, 4);
pub const LOCK_UN = @as(c_int, 8);
pub const LOCK_MAND = @as(c_int, 32);
pub const LOCK_READ = @as(c_int, 64);
pub const LOCK_WRITE = @as(c_int, 128);
pub const LOCK_RW = @as(c_int, 192);
pub const DN_ACCESS = @as(c_int, 0x00000001);
pub const DN_MODIFY = @as(c_int, 0x00000002);
pub const DN_CREATE = @as(c_int, 0x00000004);
pub const DN_DELETE = @as(c_int, 0x00000008);
pub const DN_RENAME = @as(c_int, 0x00000010);
pub const DN_ATTRIB = @as(c_int, 0x00000020);
pub const DN_MULTISHOT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const F_SEAL_SEAL = @as(c_int, 0x0001);
pub const F_SEAL_SHRINK = @as(c_int, 0x0002);
pub const F_SEAL_GROW = @as(c_int, 0x0004);
pub const F_SEAL_WRITE = @as(c_int, 0x0008);
pub const F_SEAL_FUTURE_WRITE = @as(c_int, 0x0010);
pub const F_SEAL_EXEC = @as(c_int, 0x0020);
pub const RWH_WRITE_LIFE_NOT_SET = @as(c_int, 0);
pub const RWF_WRITE_LIFE_NOT_SET = RWH_WRITE_LIFE_NOT_SET;
pub const RWH_WRITE_LIFE_NONE = @as(c_int, 1);
pub const RWH_WRITE_LIFE_SHORT = @as(c_int, 2);
pub const RWH_WRITE_LIFE_MEDIUM = @as(c_int, 3);
pub const RWH_WRITE_LIFE_LONG = @as(c_int, 4);
pub const RWH_WRITE_LIFE_EXTREME = @as(c_int, 5);
pub const FAPPEND = O_APPEND;
pub const FFSYNC = O_FSYNC;
pub const FASYNC = O_ASYNC;
pub const FNONBLOCK = O_NONBLOCK;
pub const FNDELAY = O_NDELAY;
pub const __POSIX_FADV_DONTNEED = @as(c_int, 4);
pub const __POSIX_FADV_NOREUSE = @as(c_int, 5);
pub const POSIX_FADV_NORMAL = @as(c_int, 0);
pub const POSIX_FADV_RANDOM = @as(c_int, 1);
pub const POSIX_FADV_SEQUENTIAL = @as(c_int, 2);
pub const POSIX_FADV_WILLNEED = @as(c_int, 3);
pub const POSIX_FADV_DONTNEED = __POSIX_FADV_DONTNEED;
pub const POSIX_FADV_NOREUSE = __POSIX_FADV_NOREUSE;
pub const SYNC_FILE_RANGE_WAIT_BEFORE = @as(c_int, 1);
pub const SYNC_FILE_RANGE_WRITE = @as(c_int, 2);
pub const SYNC_FILE_RANGE_WAIT_AFTER = @as(c_int, 4);
pub const SYNC_FILE_RANGE_WRITE_AND_WAIT = (SYNC_FILE_RANGE_WRITE | SYNC_FILE_RANGE_WAIT_BEFORE) | SYNC_FILE_RANGE_WAIT_AFTER;
pub const SPLICE_F_MOVE = @as(c_int, 1);
pub const SPLICE_F_NONBLOCK = @as(c_int, 2);
pub const SPLICE_F_MORE = @as(c_int, 4);
pub const SPLICE_F_GIFT = @as(c_int, 8);
pub const _FALLOC_H_ = "";
pub const FALLOC_FL_KEEP_SIZE = @as(c_int, 0x01);
pub const FALLOC_FL_PUNCH_HOLE = @as(c_int, 0x02);
pub const FALLOC_FL_NO_HIDE_STALE = @as(c_int, 0x04);
pub const FALLOC_FL_COLLAPSE_RANGE = @as(c_int, 0x08);
pub const FALLOC_FL_ZERO_RANGE = @as(c_int, 0x10);
pub const FALLOC_FL_INSERT_RANGE = @as(c_int, 0x20);
pub const FALLOC_FL_UNSHARE_RANGE = @as(c_int, 0x40);
pub const MAX_HANDLE_SZ = @as(c_int, 128);
pub const AT_HANDLE_FID = AT_REMOVEDIR;
pub inline fn __OPEN_NEEDS_MODE(oflag: anytype) @TypeOf(((oflag & O_CREAT) != @as(c_int, 0)) or ((oflag & __O_TMPFILE) == __O_TMPFILE)) {
    _ = &oflag;
    return ((oflag & O_CREAT) != @as(c_int, 0)) or ((oflag & __O_TMPFILE) == __O_TMPFILE);
}
pub const _BITS_STAT_H = @as(c_int, 1);
pub const _BITS_STRUCT_STAT_H = @as(c_int, 1);
pub inline fn __field64(@"type": anytype, type64: anytype, name: anytype) @TypeOf(@"type" ++ name) {
    _ = &@"type";
    _ = &type64;
    _ = &name;
    return @"type" ++ name;
}
pub const st_atime = @compileError("unable to translate macro: undefined identifier `st_atim`");
// /usr/include/aarch64-linux-gnu/bits/struct_stat.h:68:10
pub const st_mtime = @compileError("unable to translate macro: undefined identifier `st_mtim`");
// /usr/include/aarch64-linux-gnu/bits/struct_stat.h:69:10
pub const st_ctime = @compileError("unable to translate macro: undefined identifier `st_ctim`");
// /usr/include/aarch64-linux-gnu/bits/struct_stat.h:70:10
pub const _STATBUF_ST_BLKSIZE = "";
pub const _STATBUF_ST_RDEV = "";
pub const _STATBUF_ST_NSEC = "";
pub const __S_IFMT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o170000, .octal);
pub const __S_IFDIR = @as(c_int, 0o040000);
pub const __S_IFCHR = @as(c_int, 0o020000);
pub const __S_IFBLK = @as(c_int, 0o060000);
pub const __S_IFREG = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o100000, .octal);
pub const __S_IFIFO = @as(c_int, 0o010000);
pub const __S_IFLNK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o120000, .octal);
pub const __S_IFSOCK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o140000, .octal);
pub inline fn __S_TYPEISMQ(buf: anytype) @TypeOf(buf.*.st_mode - buf.*.st_mode) {
    _ = &buf;
    return buf.*.st_mode - buf.*.st_mode;
}
pub inline fn __S_TYPEISSEM(buf: anytype) @TypeOf(buf.*.st_mode - buf.*.st_mode) {
    _ = &buf;
    return buf.*.st_mode - buf.*.st_mode;
}
pub inline fn __S_TYPEISSHM(buf: anytype) @TypeOf(buf.*.st_mode - buf.*.st_mode) {
    _ = &buf;
    return buf.*.st_mode - buf.*.st_mode;
}
pub const __S_ISUID = @as(c_int, 0o4000);
pub const __S_ISGID = @as(c_int, 0o2000);
pub const __S_ISVTX = @as(c_int, 0o1000);
pub const __S_IREAD = @as(c_int, 0o400);
pub const __S_IWRITE = @as(c_int, 0o200);
pub const __S_IEXEC = @as(c_int, 0o100);
pub const UTIME_NOW = (@as(c_long, 1) << @as(c_int, 30)) - @as(c_long, 1);
pub const UTIME_OMIT = (@as(c_long, 1) << @as(c_int, 30)) - @as(c_long, 2);
pub const S_IFMT = __S_IFMT;
pub const S_IFDIR = __S_IFDIR;
pub const S_IFCHR = __S_IFCHR;
pub const S_IFBLK = __S_IFBLK;
pub const S_IFREG = __S_IFREG;
pub const S_IFIFO = __S_IFIFO;
pub const S_IFLNK = __S_IFLNK;
pub const S_IFSOCK = __S_IFSOCK;
pub const S_ISUID = __S_ISUID;
pub const S_ISGID = __S_ISGID;
pub const S_ISVTX = __S_ISVTX;
pub const S_IRUSR = __S_IREAD;
pub const S_IWUSR = __S_IWRITE;
pub const S_IXUSR = __S_IEXEC;
pub const S_IRWXU = (__S_IREAD | __S_IWRITE) | __S_IEXEC;
pub const S_IRGRP = S_IRUSR >> @as(c_int, 3);
pub const S_IWGRP = S_IWUSR >> @as(c_int, 3);
pub const S_IXGRP = S_IXUSR >> @as(c_int, 3);
pub const S_IRWXG = S_IRWXU >> @as(c_int, 3);
pub const S_IROTH = S_IRGRP >> @as(c_int, 3);
pub const S_IWOTH = S_IWGRP >> @as(c_int, 3);
pub const S_IXOTH = S_IXGRP >> @as(c_int, 3);
pub const S_IRWXO = S_IRWXG >> @as(c_int, 3);
pub const AT_FDCWD = -@as(c_int, 100);
pub const AT_SYMLINK_NOFOLLOW = @as(c_int, 0x100);
pub const AT_REMOVEDIR = @as(c_int, 0x200);
pub const AT_SYMLINK_FOLLOW = @as(c_int, 0x400);
pub const AT_NO_AUTOMOUNT = @as(c_int, 0x800);
pub const AT_EMPTY_PATH = @as(c_int, 0x1000);
pub const AT_STATX_SYNC_TYPE = @as(c_int, 0x6000);
pub const AT_STATX_SYNC_AS_STAT = @as(c_int, 0x0000);
pub const AT_STATX_FORCE_SYNC = @as(c_int, 0x2000);
pub const AT_STATX_DONT_SYNC = @as(c_int, 0x4000);
pub const AT_RECURSIVE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const AT_EACCESS = @as(c_int, 0x200);
pub const _SYS_STAT_H = @as(c_int, 1);
pub inline fn __S_ISTYPE(mode: anytype, mask: anytype) @TypeOf((mode & __S_IFMT) == mask) {
    _ = &mode;
    _ = &mask;
    return (mode & __S_IFMT) == mask;
}
pub inline fn S_ISDIR(mode: anytype) @TypeOf(__S_ISTYPE(mode, __S_IFDIR)) {
    _ = &mode;
    return __S_ISTYPE(mode, __S_IFDIR);
}
pub inline fn S_ISCHR(mode: anytype) @TypeOf(__S_ISTYPE(mode, __S_IFCHR)) {
    _ = &mode;
    return __S_ISTYPE(mode, __S_IFCHR);
}
pub inline fn S_ISBLK(mode: anytype) @TypeOf(__S_ISTYPE(mode, __S_IFBLK)) {
    _ = &mode;
    return __S_ISTYPE(mode, __S_IFBLK);
}
pub inline fn S_ISREG(mode: anytype) @TypeOf(__S_ISTYPE(mode, __S_IFREG)) {
    _ = &mode;
    return __S_ISTYPE(mode, __S_IFREG);
}
pub inline fn S_ISFIFO(mode: anytype) @TypeOf(__S_ISTYPE(mode, __S_IFIFO)) {
    _ = &mode;
    return __S_ISTYPE(mode, __S_IFIFO);
}
pub inline fn S_ISLNK(mode: anytype) @TypeOf(__S_ISTYPE(mode, __S_IFLNK)) {
    _ = &mode;
    return __S_ISTYPE(mode, __S_IFLNK);
}
pub inline fn S_ISSOCK(mode: anytype) @TypeOf(__S_ISTYPE(mode, __S_IFSOCK)) {
    _ = &mode;
    return __S_ISTYPE(mode, __S_IFSOCK);
}
pub inline fn S_TYPEISMQ(buf: anytype) @TypeOf(__S_TYPEISMQ(buf)) {
    _ = &buf;
    return __S_TYPEISMQ(buf);
}
pub inline fn S_TYPEISSEM(buf: anytype) @TypeOf(__S_TYPEISSEM(buf)) {
    _ = &buf;
    return __S_TYPEISSEM(buf);
}
pub inline fn S_TYPEISSHM(buf: anytype) @TypeOf(__S_TYPEISSHM(buf)) {
    _ = &buf;
    return __S_TYPEISSHM(buf);
}
pub const S_IREAD = S_IRUSR;
pub const S_IWRITE = S_IWUSR;
pub const S_IEXEC = S_IXUSR;
pub const ACCESSPERMS = (S_IRWXU | S_IRWXG) | S_IRWXO;
pub const ALLPERMS = ((((S_ISUID | S_ISGID) | S_ISVTX) | S_IRWXU) | S_IRWXG) | S_IRWXO;
pub const DEFFILEMODE = ((((S_IRUSR | S_IWUSR) | S_IRGRP) | S_IWGRP) | S_IROTH) | S_IWOTH;
pub const S_BLKSIZE = @as(c_int, 512);
pub const _LINUX_STAT_H = "";
pub const STATX_TYPE = @as(c_uint, 0x00000001);
pub const STATX_MODE = @as(c_uint, 0x00000002);
pub const STATX_NLINK = @as(c_uint, 0x00000004);
pub const STATX_UID = @as(c_uint, 0x00000008);
pub const STATX_GID = @as(c_uint, 0x00000010);
pub const STATX_ATIME = @as(c_uint, 0x00000020);
pub const STATX_MTIME = @as(c_uint, 0x00000040);
pub const STATX_CTIME = @as(c_uint, 0x00000080);
pub const STATX_INO = @as(c_uint, 0x00000100);
pub const STATX_SIZE = @as(c_uint, 0x00000200);
pub const STATX_BLOCKS = @as(c_uint, 0x00000400);
pub const STATX_BASIC_STATS = @as(c_uint, 0x000007ff);
pub const STATX_BTIME = @as(c_uint, 0x00000800);
pub const STATX_MNT_ID = @as(c_uint, 0x00001000);
pub const STATX_DIOALIGN = @as(c_uint, 0x00002000);
pub const STATX_MNT_ID_UNIQUE = @as(c_uint, 0x00004000);
pub const STATX__RESERVED = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x80000000, .hex);
pub const STATX_ALL = @as(c_uint, 0x00000fff);
pub const STATX_ATTR_COMPRESSED = @as(c_int, 0x00000004);
pub const STATX_ATTR_IMMUTABLE = @as(c_int, 0x00000010);
pub const STATX_ATTR_APPEND = @as(c_int, 0x00000020);
pub const STATX_ATTR_NODUMP = @as(c_int, 0x00000040);
pub const STATX_ATTR_ENCRYPTED = @as(c_int, 0x00000800);
pub const STATX_ATTR_AUTOMOUNT = @as(c_int, 0x00001000);
pub const STATX_ATTR_MOUNT_ROOT = @as(c_int, 0x00002000);
pub const STATX_ATTR_VERITY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00100000, .hex);
pub const STATX_ATTR_DAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00200000, .hex);
pub const __statx_timestamp_defined = @as(c_int, 1);
pub const __statx_defined = @as(c_int, 1);
pub inline fn deprecated(reason: anytype) @TypeOf(deprecated) {
    _ = &reason;
    return deprecated;
}
pub const FIO_FUNC = @compileError("unable to translate macro: undefined identifier `unused`");
// vendor/facil.io/lib/facil/fio.h:238:9
pub const FIO_STR_INFO_TYPE = "";
pub const FIO_ALIGN = @compileError("unable to translate macro: undefined identifier `assume_aligned`");
// vendor/facil.io/lib/facil/fio.h:324:9
pub const FIO_ALIGN_NEW = @compileError("unable to translate macro: undefined identifier `assume_aligned`");
// vendor/facil.io/lib/facil/fio.h:325:9
pub const FIO_LOG_LEVEL_NONE = @as(c_int, 0);
pub const FIO_LOG_LEVEL_FATAL = @as(c_int, 1);
pub const FIO_LOG_LEVEL_ERROR = @as(c_int, 2);
pub const FIO_LOG_LEVEL_WARNING = @as(c_int, 3);
pub const FIO_LOG_LEVEL_INFO = @as(c_int, 4);
pub const FIO_LOG_LEVEL_DEBUG = @as(c_int, 5);
pub const FIO_LOG____LENGTH_ON_STACK = FIO_LOG_LENGTH_LIMIT;
pub const FIO_LOG____LENGTH_BORDER = FIO_LOG_LENGTH_LIMIT - @as(c_int, 32);
pub const FIO_LOG_PRINT = @compileError("unable to translate C expr: expected ')' instead got '...'");
// vendor/facil.io/lib/facil/fio.h:459:9
pub const FIO_LOG_DEBUG = @compileError("unable to translate C expr: expected ')' instead got '...'");
// vendor/facil.io/lib/facil/fio.h:465:9
pub const FIO_LOG_INFO = @compileError("unable to translate C expr: expected ')' instead got '...'");
// vendor/facil.io/lib/facil/fio.h:469:9
pub const FIO_LOG_WARNING = @compileError("unable to translate C expr: expected ')' instead got '...'");
// vendor/facil.io/lib/facil/fio.h:471:9
pub const FIO_LOG_ERROR = @compileError("unable to translate C expr: expected ')' instead got '...'");
// vendor/facil.io/lib/facil/fio.h:473:9
pub const FIO_LOG_FATAL = @compileError("unable to translate C expr: expected ')' instead got '...'");
// vendor/facil.io/lib/facil/fio.h:475:9
pub const FIO_LOG_STATE = @compileError("unable to translate C expr: expected ')' instead got '...'");
// vendor/facil.io/lib/facil/fio.h:484:9
pub const FIO_ASSERT = @compileError("unable to translate C expr: expected ')' instead got '...'");
// vendor/facil.io/lib/facil/fio.h:487:9
pub const FIO_ASSERT_ALLOC = @compileError("unable to translate macro: undefined identifier `__FILE__`");
// vendor/facil.io/lib/facil/fio.h:496:9
pub const FIO_ASSERT_DEBUG = @compileError("unable to translate C expr: expected ')' instead got '...'");
// vendor/facil.io/lib/facil/fio.h:513:9
// pub const fio_write2 = @compileError("unable to translate C expr: expected ')' instead got '...'");
// vendor/facil.io/lib/facil/fio.h:1204:9
pub const FIO_CLOSE_NOOP = @compileError("unable to translate C expr: expected ')' instead got '('");
// vendor/facil.io/lib/facil/fio.h:1209:9
pub const fio_flush_strong = @compileError("unable to translate C expr: unexpected token 'do'");
// vendor/facil.io/lib/facil/fio.h:1276:9
pub inline fn fio_uuid2fd(uuid: anytype) c_int {
    _ = &uuid;
    return @import("std").zig.c_translation.cast(c_int, @import("std").zig.c_translation.cast(usize, uuid) >> @as(c_int, 8));
}
pub const FIO_PUBSUB_CLUSTER = @import("std").zig.c_translation.cast([*c]fio_pubsub_engine_s, @as(c_int, 1));
pub const FIO_PUBSUB_PROCESS = @import("std").zig.c_translation.cast([*c]fio_pubsub_engine_s, @as(c_int, 2));
pub const FIO_PUBSUB_SIBLINGS = @import("std").zig.c_translation.cast([*c]fio_pubsub_engine_s, @as(c_int, 3));
pub const FIO_PUBSUB_ROOT = @import("std").zig.c_translation.cast([*c]fio_pubsub_engine_s, @as(c_int, 4));
pub const pubsub_publish = fio_publish;
pub const fio_atomic_xchange = @compileError("unable to translate macro: undefined identifier `__atomic_exchange_n`");
// vendor/facil.io/lib/facil/fio.h:2025:9
pub const fio_atomic_add = @compileError("unable to translate macro: undefined identifier `__atomic_add_fetch`");
// vendor/facil.io/lib/facil/fio.h:2028:9
pub const fio_atomic_sub = @compileError("unable to translate macro: undefined identifier `__atomic_sub_fetch`");
// vendor/facil.io/lib/facil/fio.h:2031:9
pub const FIO_LOCK_INIT = @as(c_int, 0);
pub inline fn fio_bswap16(i: anytype) @TypeOf(__builtin_bswap16(@import("std").zig.c_translation.cast(u16, i))) {
    _ = &i;
    return __builtin_bswap16(@import("std").zig.c_translation.cast(u16, i));
}
pub inline fn fio_bswap32(i: anytype) @TypeOf(__builtin_bswap32(@import("std").zig.c_translation.cast(u32, i))) {
    _ = &i;
    return __builtin_bswap32(@import("std").zig.c_translation.cast(u32, i));
}
pub inline fn fio_bswap64(i: anytype) @TypeOf(__builtin_bswap64(@import("std").zig.c_translation.cast(u64, i))) {
    _ = &i;
    return __builtin_bswap64(@import("std").zig.c_translation.cast(u64, i));
}
pub inline fn fio_lton16(i: anytype) @TypeOf(fio_bswap16(i)) {
    _ = &i;
    return fio_bswap16(i);
}
pub inline fn fio_lton32(i: anytype) @TypeOf(fio_bswap32(i)) {
    _ = &i;
    return fio_bswap32(i);
}
pub inline fn fio_lton64(i: anytype) @TypeOf(fio_bswap64(i)) {
    _ = &i;
    return fio_bswap64(i);
}
pub inline fn fio_ntol16(i: anytype) @TypeOf(fio_bswap16(i)) {
    _ = &i;
    return fio_bswap16(i);
}
pub inline fn fio_ntol32(i: anytype) @TypeOf(fio_bswap32(i)) {
    _ = &i;
    return fio_bswap32(i);
}
pub inline fn fio_ntol64(i: anytype) @TypeOf(fio_bswap64(i)) {
    _ = &i;
    return fio_bswap64(i);
}
pub inline fn fio_lrot32(i: anytype, bits: anytype) @TypeOf((@import("std").zig.c_translation.cast(u32, i) << (bits & @as(c_ulong, 31))) | (@import("std").zig.c_translation.cast(u32, i) >> (-bits & @as(c_ulong, 31)))) {
    _ = &i;
    _ = &bits;
    return (@import("std").zig.c_translation.cast(u32, i) << (bits & @as(c_ulong, 31))) | (@import("std").zig.c_translation.cast(u32, i) >> (-bits & @as(c_ulong, 31)));
}
pub inline fn fio_rrot32(i: anytype, bits: anytype) @TypeOf((@import("std").zig.c_translation.cast(u32, i) >> (bits & @as(c_ulong, 31))) | (@import("std").zig.c_translation.cast(u32, i) << (-bits & @as(c_ulong, 31)))) {
    _ = &i;
    _ = &bits;
    return (@import("std").zig.c_translation.cast(u32, i) >> (bits & @as(c_ulong, 31))) | (@import("std").zig.c_translation.cast(u32, i) << (-bits & @as(c_ulong, 31)));
}
pub inline fn fio_lrot64(i: anytype, bits: anytype) @TypeOf((@import("std").zig.c_translation.cast(u64, i) << (bits & @as(c_ulong, 63))) | (@import("std").zig.c_translation.cast(u64, i) >> (-bits & @as(c_ulong, 63)))) {
    _ = &i;
    _ = &bits;
    return (@import("std").zig.c_translation.cast(u64, i) << (bits & @as(c_ulong, 63))) | (@import("std").zig.c_translation.cast(u64, i) >> (-bits & @as(c_ulong, 63)));
}
pub inline fn fio_rrot64(i: anytype, bits: anytype) @TypeOf((@import("std").zig.c_translation.cast(u64, i) >> (bits & @as(c_ulong, 63))) | (@import("std").zig.c_translation.cast(u64, i) << (-bits & @as(c_ulong, 63)))) {
    _ = &i;
    _ = &bits;
    return (@import("std").zig.c_translation.cast(u64, i) >> (bits & @as(c_ulong, 63))) | (@import("std").zig.c_translation.cast(u64, i) << (-bits & @as(c_ulong, 63)));
}
pub const fio_lrot = @compileError("unable to translate C expr: unexpected token '('");
// vendor/facil.io/lib/facil/fio.h:2251:9
pub const fio_rrot = @compileError("unable to translate C expr: unexpected token '('");
// vendor/facil.io/lib/facil/fio.h:2255:9
pub inline fn fio_str2u16(c: anytype) u16 {
    _ = &c;
    return @import("std").zig.c_translation.cast(u16, (@import("std").zig.c_translation.cast(u16, @import("std").zig.c_translation.cast([*c]u8, c)[@as(usize, @intCast(@as(c_int, 0)))]) << @as(c_int, 8)) | @import("std").zig.c_translation.cast(u16, @import("std").zig.c_translation.cast([*c]u8, c)[@as(usize, @intCast(@as(c_int, 1)))]));
}
pub inline fn fio_str2u32(c: anytype) u32 {
    _ = &c;
    return @import("std").zig.c_translation.cast(u32, (((@import("std").zig.c_translation.cast(u32, @import("std").zig.c_translation.cast([*c]u8, c)[@as(usize, @intCast(@as(c_int, 0)))]) << @as(c_int, 24)) | (@import("std").zig.c_translation.cast(u32, @import("std").zig.c_translation.cast([*c]u8, c)[@as(usize, @intCast(@as(c_int, 1)))]) << @as(c_int, 16))) | (@import("std").zig.c_translation.cast(u32, @import("std").zig.c_translation.cast([*c]u8, c)[@as(usize, @intCast(@as(c_int, 2)))]) << @as(c_int, 8))) | @import("std").zig.c_translation.cast(u32, @import("std").zig.c_translation.cast([*c]u8, c)[@as(usize, @intCast(@as(c_int, 3)))]));
}
pub inline fn fio_str2u64(c: anytype) u64 {
    _ = &c;
    return @import("std").zig.c_translation.cast(u64, (((((((@import("std").zig.c_translation.cast(u64, @import("std").zig.c_translation.cast([*c]u8, c)[@as(usize, @intCast(@as(c_int, 0)))]) << @as(c_int, 56)) | (@import("std").zig.c_translation.cast(u64, @import("std").zig.c_translation.cast([*c]u8, c)[@as(usize, @intCast(@as(c_int, 1)))]) << @as(c_int, 48))) | (@import("std").zig.c_translation.cast(u64, @import("std").zig.c_translation.cast([*c]u8, c)[@as(usize, @intCast(@as(c_int, 2)))]) << @as(c_int, 40))) | (@import("std").zig.c_translation.cast(u64, @import("std").zig.c_translation.cast([*c]u8, c)[@as(usize, @intCast(@as(c_int, 3)))]) << @as(c_int, 32))) | (@import("std").zig.c_translation.cast(u64, @import("std").zig.c_translation.cast([*c]u8, c)[@as(usize, @intCast(@as(c_int, 4)))]) << @as(c_int, 24))) | (@import("std").zig.c_translation.cast(u64, @import("std").zig.c_translation.cast([*c]u8, c)[@as(usize, @intCast(@as(c_int, 5)))]) << @as(c_int, 16))) | (@import("std").zig.c_translation.cast(u64, @import("std").zig.c_translation.cast([*c]u8, c)[@as(usize, @intCast(@as(c_int, 6)))]) << @as(c_int, 8))) | @import("std").zig.c_translation.cast([*c]u8, c)[@as(usize, @intCast(@as(c_int, 7)))]);
}
pub const fio_u2str16 = @compileError("unable to translate C expr: unexpected token 'do'");
// vendor/facil.io/lib/facil/fio.h:2281:9
pub const fio_u2str32 = @compileError("unable to translate C expr: unexpected token 'do'");
// vendor/facil.io/lib/facil/fio.h:2288:9
pub const fio_u2str64 = @compileError("unable to translate C expr: unexpected token 'do'");
// vendor/facil.io/lib/facil/fio.h:2297:9

// vendor/facil.io/lib/facil/fio.h:2435:9: warning: macro 'FIO_HASH_SECRET_SEED64_1' contains a runtime value, translated to function
pub inline fn FIO_HASH_SECRET_SEED64_1() @TypeOf(@import("std").zig.c_translation.cast(usize, &fio_hash_secret_marker1)) {
    return @import("std").zig.c_translation.cast(usize, &fio_hash_secret_marker1);
}
// vendor/facil.io/lib/facil/fio.h:2436:9: warning: macro 'FIO_HASH_SECRET_SEED64_2' contains a runtime value, translated to function
pub inline fn FIO_HASH_SECRET_SEED64_2() @TypeOf(@import("std").zig.c_translation.cast(usize, &fio_hash_secret_marker2)) {
    return @import("std").zig.c_translation.cast(usize, &fio_hash_secret_marker2);
}
pub inline fn FIO_HASH_FN(data: anytype, length: anytype, key1: anytype, key2: anytype) @TypeOf(fio_siphash13(data, length, @import("std").zig.c_translation.cast(u64, key1), @import("std").zig.c_translation.cast(u64, key2))) {
    _ = &data;
    _ = &length;
    _ = &key1;
    _ = &key2;
    return fio_siphash13(data, length, @import("std").zig.c_translation.cast(u64, key1), @import("std").zig.c_translation.cast(u64, key2));
}
pub const RISKY_PRIME_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFBBA3FA15B22113B, .hex);
pub const RISKY_PRIME_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xAB137439982B86C9, .hex);
pub const fio_risky_consume = @compileError("unable to translate C expr: unexpected token '+='");
// vendor/facil.io/lib/facil/fio.h:2457:9
pub inline fn fio_siphash(data: anytype, length: anytype, k1: anytype, k2: anytype) @TypeOf(fio_siphash13(data, length, k1, k2)) {
    _ = &data;
    _ = &length;
    _ = &k1;
    _ = &k2;
    return fio_siphash13(data, length, k1, k2);
}
pub const fio_test = @compileError("unable to translate C expr: unexpected token ''");
// vendor/facil.io/lib/facil/fio.h:2824:9
pub const FIO_MEMORY_BLOCK_SIZE_LOG = @as(c_int, 15);
pub const FIO_MEMORY_BLOCK_SIZE = @import("std").zig.c_translation.cast(usize, @as(c_int, 1)) << FIO_MEMORY_BLOCK_SIZE_LOG;
pub const FIO_MEMORY_BLOCK_ALLOC_LIMIT = FIO_MEMORY_BLOCK_SIZE >> @as(c_int, 1);
pub inline fn FIO_MALLOC(size: anytype) @TypeOf(fio_malloc(size)) {
    _ = &size;
    return fio_malloc(size);
}
pub inline fn FIO_CALLOC(size: anytype, units: anytype) @TypeOf(fio_calloc(size, units)) {
    _ = &size;
    _ = &units;
    return fio_calloc(size, units);
}
pub inline fn FIO_REALLOC(ptr: anytype, new_length: anytype, existing_data_length: anytype) @TypeOf(fio_realloc2(ptr, new_length, existing_data_length)) {
    _ = &ptr;
    _ = &new_length;
    _ = &existing_data_length;
    return fio_realloc2(ptr, new_length, existing_data_length);
}
pub const FIO_FREE = fio_free;
pub const timespec = struct_timespec;
pub const sigval = union_sigval;
pub const sigevent = struct_sigevent;
pub const sigcontext = struct_sigcontext;
pub const _aarch64_ctx = struct__aarch64_ctx;
pub const fpsimd_context = struct_fpsimd_context;
pub const esr_context = struct_esr_context;
pub const extra_context = struct_extra_context;
pub const sve_context = struct_sve_context;
pub const tpidr2_context = struct_tpidr2_context;
pub const za_context = struct_za_context;
pub const zt_context = struct_zt_context;
pub const timeval = struct_timeval;
pub const __itimer_which = enum___itimer_which;
pub const itimerval = struct_itimerval;
pub const __pthread_internal_list = struct___pthread_internal_list;
pub const __pthread_internal_slist = struct___pthread_internal_slist;
pub const __pthread_mutex_s = struct___pthread_mutex_s;
pub const __pthread_rwlock_arch_t = struct___pthread_rwlock_arch_t;
pub const __pthread_cond_s = struct___pthread_cond_s;
pub const user_regs_struct = struct_user_regs_struct;
pub const user_fpsimd_struct = struct_user_fpsimd_struct;
pub const elf_siginfo = struct_elf_siginfo;
pub const elf_prstatus = struct_elf_prstatus;
pub const elf_prpsinfo = struct_elf_prpsinfo;
pub const _G_fpos_t = struct__G_fpos_t;
pub const _G_fpos64_t = struct__G_fpos64_t;
pub const _IO_marker = struct__IO_marker;
pub const _IO_codecvt = struct__IO_codecvt;
pub const _IO_wide_data = struct__IO_wide_data;
pub const _IO_FILE = struct__IO_FILE;
pub const _IO_cookie_io_functions_t = struct__IO_cookie_io_functions_t;
pub const obstack = struct_obstack;
pub const __locale_struct = struct___locale_struct;
pub const random_data = struct_random_data;
pub const drand48_data = struct_drand48_data;
pub const timex = struct_timex;
pub const tm = struct_tm;
pub const itimerspec = struct_itimerspec;
pub const flock = struct_flock;
pub const flock64 = struct_flock64;
pub const iovec = struct_iovec;
pub const __pid_type = enum___pid_type;
pub const f_owner_ex = struct_f_owner_ex;
pub const file_handle = struct_file_handle;
pub const statx_timestamp = struct_statx_timestamp;
pub const fio_io_event = enum_fio_io_event;
pub const fio_listen_args = struct_fio_listen_args;
pub const fio_connect_args = struct_fio_connect_args;
pub const fio_start_args = struct_fio_start_args;
pub const fio_protocol_lock_e = enum_fio_protocol_lock_e;
