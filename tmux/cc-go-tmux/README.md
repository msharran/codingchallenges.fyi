# cc-go-tmux

Build your own terminal multiplexer in Go.

**Challenge:** [Coding Challenge #127 — Tmux](https://codingchallenges.substack.com/p/coding-challenge-127-tmux)

**Status:** Step 0 — environment setup

## What we're building

A simplified `tmux` (`cctmux`) with:

- Pseudo-terminals (PTY) and shell spawning
- Client/server over Unix domain sockets
- Named sessions, detach/attach
- Windows, panes, status bar, copy mode

## Requirements

- Linux or macOS (PTY + Unix domain sockets)
- Go 1.22+
- `tmux` installed (for reference / comparison)

## Step 0 checklist

- [x] Pick language: **Go**
- [x] Pick platform: **Linux** (this dev environment)
- [x] Scaffold project (`go.mod`, `Makefile`, stub binary)
- [ ] Install and explore real `tmux` (sessions, detach, panes, windows)
- [ ] Read up on PTYs and terminal escape sequences
- [ ] Identify Go libraries for PTY, raw mode, and sockets

## Go ecosystem notes (for later steps)

| Need | Likely approach |
|------|-----------------|
| PTY allocation | [`github.com/creack/pty`](https://github.com/creack/pty) or `golang.org/x/sys/unix` |
| Raw terminal mode | [`golang.org/x/term`](https://pkg.go.dev/golang.org/x/term) |
| Unix domain sockets | `net` package (`net.Listen("unix", path)`) |

We are **not** pulling these in until Step 1 — step 0 is understanding, not coding.

## Build

```bash
make build   # produces ./cctmux
make run     # stub exits with message (expected for now)
```

## Learning log

See [`log.md`](./log.md) for session notes (devlog source material).
