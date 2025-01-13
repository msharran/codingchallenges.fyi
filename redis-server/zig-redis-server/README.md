# Redis Server

## Start server

```sh
zig run src/main.zig
```

## Test server

```sh
echo -ne "*1\r\n\$4\r\nPING\r\n" | nc localhost 6379
```

---

# References

- [TCP Server in Zig](https://www.openmymind.net/TCP-Server-In-Zig-Part-1-Single-Threaded/)
- [Redis Protocol](https://redis.io/docs/latest/develop/reference/protocol-spec/#resp-protocol-description)
- [Coding Challenge: Implement a Redis Server](https://codingchallenges.fyi/challenges/challenge-redis/)
