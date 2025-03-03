# Zig Redis Server

A Redis-compatible server implementation in Zig using the RESP protocol.

> This implementation has been featured in the [official solutions list](https://github.com/CodingChallengesFYI/SharedSolutions/blob/main/Solutions/challenge-redis.md)
> for the "Build Your Own Redis" coding challenge.

## Features

- RESP Protocol Implementation
  - Supports Simple String, Bulk String, Integer, Error and Nil types
  - Full serialization/deserialization

- Core Redis Commands
  - PING - Server test command
  - ECHO - Echo back input
  - GET/SET - Basic key-value operations

- Architecture
  - Non-blocking I/O using Facil.io
  - Thread pool for concurrent request handling
  - In-memory key-value store with read-write locking
  - Arena allocator for efficient memory management

## Usage

### Build from source

```bash
# Build an optimized binary (ReleaseFast mode)
make

# Start the server (default port: 6377)
./zig-out/bin/redis-server
```

### Connect with redis-cli

```bash
# Basic commands
redis-cli -p 6377 PING
> PONG

redis-cli -p 6377 ECHO "Hello World"
> "Hello World"

redis-cli -p 6377 SET mykey "Hello"
> OK

redis-cli -p 6377 GET mykey
> "Hello"
```

## Benchmarks

**Before Optimisation**

When RESP parsing and connection read and write operations happened using Heap allocated
buffer,

```bash
❯ redis-benchmark -p 6377 -t SET,GET -q
WARNING: Could not fetch server CONFIG
SET: 17513.13 requests per second, p50=2.647 msec
GET: 22867.60 requests per second, p50=2.007 msec
```

**After Optimisation**

Uses Fixed Buffer allocator to allocate on Stack,

```zig
fn on_data(uuid: isize, _: *fio.fio_protocol_s) callconv(.C) void {
    var buf: [4096]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buf);
    const allocator = fba.allocator();
    // rest of the code...
```

```bash
❯ redis-benchmark -p 6377 -t SET,GET -q
WARNING: Could not fetch server CONFIG
SET: 107526.88 requests per second, p50=0.239 msec
GET: 90171.33 requests per second, p50=0.303 msec
```

## Development

```bash
# Build for development,
# then run the server from the executable directory
zig build -freference-trace
./zig-out/bin/redis-server

# Build and run for development
zig build run
```

## License

MIT
