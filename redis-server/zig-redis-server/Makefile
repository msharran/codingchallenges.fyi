redis/build:
	zig build -freference-trace -Doptimize=ReleaseFast

redis/run: redis/build
	./zig-out/bin/redis-server

fio/translate-c:
	zig translate-c -I vendor/facil.io/lib/facil/ -I vendor/facil.io/lib/facil/cli/ -I vendor/facil.io/lib/facil/fiobj/ -I vendor/facil.io/lib/facil/http/ -I vendor/facil.io/lib/facil/http/parsers/  -lc vendor/facil.io/lib/facil/fio.h > src/fio.zig

.PHONY: redis/build redis/run fio/translate-c
