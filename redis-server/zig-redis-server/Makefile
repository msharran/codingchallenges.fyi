.PHONY: devpod docker 

devpod:
	devpod up --dotfiles https://github.com/msharran/.dotfiles --recreate zig

docker:
	zig build -Dtarget=aarch64-linux \
	docker run --rm \
	-v ./zig-out/bin/redis-server:/redis \
	-p 6379:6379 \
	--name redis \
	-it ubuntu:latest /redis

