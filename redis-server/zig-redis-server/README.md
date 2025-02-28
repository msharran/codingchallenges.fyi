# Redis Server

# Features

- RESP Protocol Serialisation and Deserialisation (Simple String, Bulk String, Integer, Error, Nil)
- Commands Supported: PING, ECHO, SET, GET
- Non Blocking IO for accepting connections: uses libxev
- ThreadPool strategy for handling connections concurrently in multiple threads

# Getting Started

## Start server

```sh
❯ ./zig-out/bin/redis-server
info(server): Starting Redis Server at port 6377
^Cinfo(dictionary):   Dictionary state: [1]
info(dictionary):     Map capacity: 0
info(dictionary):     Map count: 0
info(dictionary):   Actual items found: 0
```

## Connect to server using `redis-cli`

```sh
❯ redis-cli -p 6377 PING
PONG
❯ redis-cli -p 6377 ECHO "Hello World!"
"Hello World!"
❯ redis-cli -p 6377 GET foo
(nil)
❯ redis-cli -p 6377 SET foo bar
OK
❯ redis-cli -p 6377 GET foo
"bar"

❯ redis-benchmark -p 6377 -t SET,GET -q
WARNING: Could not fetch server CONFIG
SET: 17513.13 requests per second, p50=2.647 msec
GET: 22867.60 requests per second, p50=2.007 msec
```

## All supported commands

![image](./images/commands.png)

---

# References

- [TCP Server in Zig](https://www.openmymind.net/TCP-Server-In-Zig-Part-1-Single-Threaded/)
- [Redis Protocol](https://redis.io/docs/latest/develop/reference/protocol-spec/#resp-protocol-description)
- [Coding Challenge: Implement a Redis Server](https://codingchallenges.fyi/challenges/challenge-redis/)

```
/home/msharran/.local/share/zed/remote_extensions/work/zig/zls-0.13.0/zls
```
