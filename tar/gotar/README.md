# GoTar

[![Go Version](https://img.shields.io/badge/Go-1.21+-blue.svg)](https://golang.org)

A simple, educational implementation of the `tar` (tape archive) command-line utility in Go. This project is designed to parse and read `.tar` files, providing a clear example of file format parsing and state management in Go.

## Overview

`gotar` is a command-line tool that can list the contents of a `.tar` archive or extract the files and print their contents to standard output. It demonstrates fundamental Go concepts such as I/O, file handling, command-line flags, and stateful parsing.

The core of the application is a state machine that processes the `.tar` file block by block, transitioning between reading file headers and file content.

## Features

- [x] List files within a `.tar` archive (`-t` flag).
- [x] Extract and display the content of files from an archive.
- [x] Read archives from a specified file (`-f` flag).
- [x] Read archives from standard input via piping.
- [ ] Create new `.tar` archives.
- [ ] Append files to an existing archive.
- [ ] Delete files from an archive.

## Installation

To build the `gotar` binary, you can use the provided `Makefile`.

```sh
make
```

This will compile the Go source and create a `gotar` executable in the project directory.

## Usage

`gotar` can either list the names of the files in an archive or extract and display their content.

### Listing Files

To list the files in an archive, use the `-t` flag. You can read from a file using the `-f` flag or pipe a file into standard input.

**From a file:**
```sh
./gotar -t -f files.tar
```

**From stdin:**
```sh
cat files.tar | ./gotar -t
```

### Extracting Files

To extract files and print their content to the console, simply run `gotar` without the `-t` flag.

**From a file:**
```sh
./gotar -f files.tar
```

**From stdin:**
```sh
cat files.tar | ./gotar
```

## Development

The parsing logic is built around a simple state machine that cycles through the following states:

- `ReadingHeader`: Looking for the next file header block.
- `ReadingContent`: Reading the content blocks for the current file.
- `Stopped`: Reached the end of the archive.
- `Error`: An unexpected error occurred.

This design separates the parsing logic from the main application logic, making the code easier to understand and extend.