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

## Optimizations

### Memory I/O Optimisation

**Before Optimisation**

Moved from RESP parsing and connection read and write operations using Heap allocated
buffer to Fixed Buffer allocator to allocate on Stack,

```bash
❯ redis-benchmark -p 6377 -t SET,GET -q
WARNING: Could not fetch server CONFIG
SET: 17513.13 requests per second, p50=2.647 msec
GET: 22867.60 requests per second, p50=2.007 msec
```

**After Optimisation**


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

## Lock Free Single Threaded

Moved from Multi Threaded Non Blocking Evented I/O with
Locks on global dictionary to Lock Free Single Threaded design

**Before Optimisation**

```bash
❯ redis-benchmark -p 6377 -t SET,GET -q
WARNING: Could not fetch server CONFIG
SET: 107526.88 requests per second, p50=0.239 msec
GET: 90171.33 requests per second, p50=0.303 msec
```

**After Optimisation**

```bash
❯ redis-benchmark -p 6377 -t SET,GET -q
WARNING: Could not fetch server CONFIG
SET: 140449.44 requests per second, p50=0.183 msec
GET: 142450.14 requests per second, p50=0.183 msec
```

## Performance Benchmarks

### Benchmark Comparison: Zig Redis Server vs Original Redis

This comparison measures the performance of this Zig Redis implementation against the official Redis server using `redis-benchmark`.

#### Latest Benchmark Results

| Server | Command | Requests/sec | Latency (p50) |
|--------|---------|--------------|---------------|
| Zig Redis (6377) | SET | 140,449.44 | 0.183 ms |
| Original Redis (6379) | SET | 146,198.83 | 0.175 ms |
| Zig Redis (6377) | GET | 142,450.14 | 0.183 ms |
| Original Redis (6379) | GET | 140,646.97 | 0.183 ms |

### Performance Evolution

This Zig implementation has shown significant improvements through optimization:

#### Initial Implementation
```
SET: 17,513.13 requests per second, p50=2.647 msec
GET: 22,867.60 requests per second, p50=2.007 msec
```

#### After Stack Allocation Optimization
```
SET: 107,526.88 requests per second, p50=0.239 msec
GET: 90,171.33 requests per second, p50=0.303 msec
```

#### Current Implementation
```
SET: 140,449.44 requests per second, p50=0.183 msec
GET: 142,450.14 requests per second, p50=0.183 msec
```

This represents an **8x improvement** for SET operations and a **6.2x improvement** for GET operations from the initial implementation.

### Analysis

- The Zig implementation achieves approximately 96% of Redis's performance for SET operations
- For GET operations, the Zig implementation slightly outperforms Redis by about 1.3%
- The current implementation is effectively at performance parity with the official Redis server

These benchmarks were conducted on the same hardware using identical benchmark parameters.

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
