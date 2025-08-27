# Coding Challenges

<div align="center">

🚀 A collection of implementations for system programming challenges from [codingchallenges.fyi](https://codingchallenges.fyi)

</div>

## Overview

This repository contains my implementations of various system programming challenges, focusing on building fundamental components like networking tools, web servers and containers from scratch.
These projects help maintain programming skills while exploring low-level system concepts.

## Featured Projects

### Redis Server (Zig)
[![Featured Solution](https://img.shields.io/badge/Status-Featured-brightgreen)](redis-server/zig-redis-server)

A Redis-compatible server implementation in Zig that implements the RESP protocol and core Redis functionality.
The implementation is listed in the [official solutions repository](https://github.com/CodingChallengesFYI/SharedSolutions/blob/main/Solutions/challenge-redis.md).

**Key Features:**
- RESP protocol implementation
- Basic Redis commands support
- Pure Zig implementation

### DNS Resolver (Go)
[![Status](https://img.shields.io/badge/Status-Complete-blue)](dns-resolver/cc-go-dns-resolver)

A DNS resolver implementation in Go that handles domain name resolution from scratch.

**Key Features:**
- DNS protocol implementation
- Query resolution
- Record parsing

### Docker Container Runtime (Rust)
[![Status](https://img.shields.io/badge/Status-Complete-blue)](docker/rust-docker)

A basic container runtime implementation in Rust, similar to Docker.

**Key Features:**
- Container isolation
- Run Alpine Linux

### strace System Call Tracer (Zig)
[![Status](https://img.shields.io/badge/Status-In_Progress-yellow)](strace/zig-strace)

A system call tracer implementation in Zig, similar to the Linux strace utility.

**Key Features:**
- Process tracing with ptrace
- System call interception
- Fork and exec handling

## License

[MIT License](LICENSE)
