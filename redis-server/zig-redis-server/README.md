# Redis Server

## Start server

```sh
❯ zig build run
info(redis): Server initialised
info(server): Server listening on 127.0.0.1:6379
info(server): Client connected: 127.0.0.1:49803
debug(resp): Serialised: +PONG

info(server): Client connection closed: 127.0.0.1:49803
info(server): Client connected: 127.0.0.1:49823
debug(resp): Serialised: $12
Hello World!

info(server): Client connection closed: 127.0.0.1:49823
info(server): Client connected: 127.0.0.1:49841
debug(resp): Serialised: +OK

info(server): Client connection closed: 127.0.0.1:49841
```

## Connect to server using `redis-cli` 

```sh
❯ redis-cli PING
PONG
❯ redis-cli ECHO "Hello World!"
"Hello World!"
❯ redis-cli GET foo
(nil)
❯ redis-cli SET foo bar
OK
❯ redis-cli GET foo
"bar"
```

---

# References

- [TCP Server in Zig](https://www.openmymind.net/TCP-Server-In-Zig-Part-1-Single-Threaded/)
- [Redis Protocol](https://redis.io/docs/latest/develop/reference/protocol-spec/#resp-protocol-description)
- [Coding Challenge: Implement a Redis Server](https://codingchallenges.fyi/challenges/challenge-redis/)
