# zig-strace

A minimal system call tracer implementation in Zig, similar to Linux `strace`. This project demonstrates how to use `ptrace(2)` system call to trace and monitor system calls made by other processes.

## Key Resources Studied
- [ptrace(2) manual page](https://man7.org/linux/man-pages/man2/ptrace.2.html) - Core tracing mechanics
- [waitpid(2) manual page](https://man7.org/linux/man-pages/man2/waitpid.2.html) - Process synchronization
- [Zig std.posix documentation](https://ziglang.org/documentation/master/std/#std.posix.raise) - Language bindings

## Features

- **System Call Tracing**: Captures syscall entry and exit points using `PTRACE_GET_SYSCALL_INFO`
- **ARM64 Support**: Fully supports AArch64/ARM64 architecture with correct syscall mappings
- **Clean Output**: Provides strace-like formatted output for easy analysis
- **Modern ptrace API**: Uses `PTRACE_GET_SYSCALL_INFO` (Linux 5.3+) for reliable syscall information

## Requirements

- Linux kernel 5.3+ (for `PTRACE_GET_SYSCALL_INFO` support)
- Zig 0.15+
- ARM64/AArch64 architecture

## Building

```bash
# Build for local architecture
zig build

# Build for ARM64 Linux (when cross-compiling)
zig build -Dtarget=aarch64-linux
```

## Usage

```bash
# Basic usage
./zig-out/bin/zig_strace <command> [args...]

# Example: trace ls command
./zig-out/bin/zig_strace ls

# Filter only syscall traces (remove debug logs)
./zig-out/bin/zig_strace ls 2>&1 | grep -w syscall

# Enable debug logging
DEBUG=1 ./zig-out/bin/zig_strace ls
```

## Example Output

Running on OrbStack CentOS (ARM64):

```bash
sharranm@centos /U/s/r/p/c/s/zig-strace ((a21f49f1))> ./zig-out/bin/zig_strace ls 2>&1 | grep -w scal
info(scal): brk(0, 0, 0, 0, ffff8557fd58, a)
info(scal): retval=187650549997568 error=0
info(scal): mmap(0, 2000, 3, 22, ffffffffffffffff, 0)
info(scal): retval=281472918843392 error=0
info(scal): faccessat(ffffffffffffff9c, ffff85565e50, 4, 0, 0, aaaab222faa8)
info(scal): retval=-2 error=1
info(scal): openat(ffffffffffffff9c, ffff85563b78, 80000, 0, ffff855825b0, ffffffffffffffff)
info(scal): retval=3 error=0
info(scal): fstat(3, ffffce0e4ab0, 80000, 0, ffff855825b0, ffffffffffffffff)
info(scal): retval=0 error=0
info(scal): mmap(0, 2383, 1, 2, 3, 0)
info(scal): retval=281472918831104 error=0
info(scal): close(3, 2383, 1, 2, 3, 0)
info(scal): retval=0 error=0
info(scal): write(1, aaaacc6032b0, 2d, ffff85572740, 4e128c0908db9974, aaaacc603260)
info(scal): retval=45 error=0
info(scal): exit_group(0, 0, ffff85572f00, 120, ffff85581a30, 17f)
```

## Implementation Details

### Key Components

1. **Process Control**: Uses `fork()` + `execve()` to spawn traced process
2. **Tracing Setup**: Child calls `PTRACE_TRACEME` and `raise(SIGSTOP)`
3. **Parent Tracer**: Sets `PTRACE_O_TRACESYSGOOD` and `PTRACE_O_TRACEEXEC` options
4. **Syscall Capture**: Uses `PTRACE_GET_SYSCALL_INFO` for detailed syscall information
5. **ARM64 Mapping**: Leverages Zig's architecture-specific syscall definitions

### Tracing Flow

```
Child Process           Parent Process
─────────────          ─────────────
fork() ───────────────▶ waitpid() (wait for SIGSTOP)
PTRACE_TRACEME()                │
raise(SIGSTOP) ────────────────▶ PTRACE_SETOPTIONS()
   │ (blocked)                  │
   │                           PTRACE_CONT() ────▶ continue to execve
execve() ──────────────────────▶ waitpid() (wait for exec-stop)
   │ (new program)              │
   │ ◀────────────────────────── PTRACE_SYSCALL() (start tracing)
syscalls... ◀─────────────────▶ PTRACE_GET_SYSCALL_INFO()
```

## Testing Environment

Tested on **OrbStack** running CentOS Linux on macOS:
- **Host**: macOS (Darwin)
- **Container**: CentOS with Linux kernel 6.15.11-orbstack
- **Architecture**: ARM64 (aarch64)
- **Zig Version**: 0.15.1

## Comparison with strace

This implementation captures the same syscalls as the standard `strace` utility:

```bash
# zig-strace output
./zig_strace ls 2>&1 | grep -w scal | head -5

# strace output  
strace ls 2>&1 | head -5
```

Both show identical syscall sequences: `brk`, `mmap`, `faccessat`, `openat`, `fstat`, etc.

## Limitations

- **Linux 5.3+ Required**: Uses modern `PTRACE_GET_SYSCALL_INFO` API
- **ARM64 Only**: Currently optimized for AArch64 architecture
- **Basic Features**: Focuses on core syscall tracing without advanced strace features

## Future Improvements

- [ ] Add syscall argument interpretation (file paths, flags, etc.)
- [ ] Support for multiple architectures (x86-64, RISC-V)
- [ ] Signal handling and process tree tracing
- [ ] Performance timing and statistics
- [ ] Output formatting options
