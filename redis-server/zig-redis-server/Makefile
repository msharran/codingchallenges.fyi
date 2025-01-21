.PHONY: run

run:
	zig build -Dlinux-aarch64=true \
		&& docker run -v ./zig-out/bin/redis-server:/redis -p 6379:6379 -it ubuntu:latest /redis
