const std = @import("std");
const os = std.os;
const linux = os.linux;
const posix = std.posix;

pub fn sigStop(pid: posix.pid_t, flags: u32) !posix.WaitPidResult {
    const res = posix.waitpid(pid, flags);
    if (linux.W.IFEXITED(res.status)) return error.ChildExited;
    if (!linux.W.IFSTOPPED(res.status)) return error.ChildNotStopped;
    return res;
}

pub fn sigSyscallStop(pid: posix.pid_t, flags: u32) !posix.WaitPidResult {
    const res = try sigStop(pid, flags);

    const stop_signal = linux.W.STOPSIG(res.status);
    if (stop_signal == (linux.SIG.TRAP | 0x80)) {
        return res;
    } else {
        return error.NotSyscallStopSignal;
    }
}
