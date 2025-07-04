This project, `gotar`, is a command-line tool written in Go that provides a simplified implementation of the `tar` utility.

**Core Functionality:**
- Parses `.tar` archives by reading them in 512-byte blocks.
- Implements a state machine for parsing, transitioning between `ReadingHeader` and `ReadingContent` states.
- Lists files within an archive using the `-t` flag.
- Extracts and prints file content to standard output.
- Reads archives from a file specified with the `-f` flag or from `stdin`.

**Project Structure:**
- `main.go`: Contains the complete source code for the tool.
- `go.mod`: Specifies the Go module path and version (1.21.0).
- `Makefile`: Includes a `build` target to compile the executable.
- `README.md`: Provides an overview, usage instructions, and development details.