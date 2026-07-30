# cc-go-tmux — learning log

Devlog notes for [Coding Challenge #127 — Tmux](https://codingchallenges.substack.com/p/coding-challenge-127-tmux).

---

## 2026-07-30 — Step 0: base environment

### Challenge source

Challenge #127 is on Substack (not yet on codingchallenges.fyi sitemap as of today). Goal: build a simplified terminal multiplexer — `cctmux`.

16 steps total. Step 0 is prep only; implementation starts at Step 1 (PTY + shell relay).

### What is a terminal multiplexer? (first principles)

A normal terminal is a **pipe between your keyboard and a shell**:

```
keyboard → terminal emulator → kernel TTY/PTY → shell → output → screen
```

When SSH drops or you close the terminal window, the shell gets **SIGHUP** and dies. You lose everything.

A multiplexer inserts itself **in the middle** and owns the shells:

```
keyboard → client → [unix socket] → server → PTY → shell
                                         ↓
                                    screen state
```

The server keeps running even when the client disconnects. That's detach/attach.

### tmux hierarchy (mental model)

```
server (one per machine, usually)
 └── session  (named, e.g. "work")
      └── window  (like tabs, numbered from 0)
           └── pane  (split regions, each with its own shell)
```

Real tmux uses `Ctrl+b` as a **prefix key** — the next keystroke is a multiplexer command, not shell input.

### Step 0 requirements (from challenge)

1. Choose platform + language → **Go on Linux**
2. Confirm access to: PTY APIs, Unix domain sockets, raw terminal mode
3. Install tmux and use it (sessions, detach, panes, windows)
4. Read about PTYs (`man pty`) and terminal escape sequences

### Environment verified

| Check | Result |
|-------|--------|
| Go | `go1.22.2 linux/amd64` |
| tmux | `tmux 3.5a` at `/exec-daemon/tmux` |
| Platform | Linux (PTY + Unix sockets available) |

### Project scaffold

Created `tmux/cc-go-tmux/` following existing cc-go-* layout:

```
tmux/cc-go-tmux/
├── go.mod          # module cctmux
├── main.go         # stub only — exits with "step 0" message
├── Makefile        # build → ./cctmux
├── .gitignore
├── README.md       # challenge link + step checklist
└── log.md          # this file
```

No dependencies added yet. Deliberately empty — Step 1 is where PTY work begins.

### Go building blocks (identified, not imported)

- **PTY**: `github.com/creack/pty` — battle-tested, wraps `openpty`/`forkpty`
- **Raw mode**: `golang.org/x/term.MakeRaw()` — disables line buffering, echo, etc.
- **Unix sockets**: stdlib `net.Listen("unix", "/tmp/cctmux.sock")`
- **I/O relay**: `io.Copy` between PTY master fd and os.Stdin/Stdout

### Concepts to study before Step 1

**Pseudo-terminal (PTY)**

- Kernel provides a **master/slave pair** (`/dev/ptmx` + `/dev/pts/N`)
- Programs like shells expect a TTY — they check `isatty()` and behave differently without one
- The multiplexer holds the master end; the shell gets the slave end
- Resize signals (`SIGWINCH`) propagate when pane geometry changes

**Raw terminal mode**

- Normal (cooked) mode: kernel buffers lines, handles backspace, Ctrl+C sends SIGINT
- Raw mode: every keystroke arrives immediately as bytes — required to intercept prefix keys
- Must save/restore terminal state on exit (defer cleanup!)

**Escape sequences**

- Shells and TUIs (vim, top) control the screen via ANSI escape codes
- e.g. `\x1b[2J` clear screen, `\x1b[H` cursor home
- The multiplexer mostly **passes these through** in early steps; later it parses them for rendering panes

### tmux exploration (todo)

Run these before starting Step 1:

```bash
tmux new-session -s work
# inside: run commands, try vim/top
# Ctrl+b d  → detach
tmux list-sessions
tmux attach -t work
# Ctrl+b "  → horizontal split
# Ctrl+b %  → vertical split
# Ctrl+b c  → new window
# Ctrl+b 0/1/n/p → switch windows
```

### Open questions for staff review

1. **Binary layout**: flat `main.go` vs `cmd/cctmux/` — went flat to match other cc-go projects. Revisit if CLI grows (urfave/cli like cc-go-git)?
2. **Socket path**: `/tmp/cctmux-<uid>.sock`? challenge suggests `/tmp/cctmux-*`
3. **Step 1 scope**: single file or split `pty/`, `term/` packages from the start?
4. **Testing strategy**: how do we test PTY relay without a human typing? (script/expect? go test with pty?)

### Next step

**Step 1** — allocate a PTY, spawn shell, put our terminal in raw mode, relay I/O both ways. No client/server yet.
