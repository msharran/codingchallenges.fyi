const std = @import("std");
const std_log = std.log;
const log = std_log.scoped(.server);
const net = std.net;
const posix = std.posix;
const assert = std.debug.assert;

const Dictionary = @import("dictionary.zig").Dictionary;
const Router = @import("Router.zig");
const Resp = @import("Resp.zig");
const Message = Resp.Message;
const CommandCtx = @import("command.zig").CommandCtx;
const Global = @import("Global.zig");

// const ProtocolPool = std.heap.MemoryPool(Protocol);
// https://zig.news/xq/zig-build-explained-part-3-1ima
const fio = @import("fio.zig");

/// init allocates memory for the server.
/// Caller should call self.deinit to free the memory.
pub fn init() void {
    Global.initAllocator();
    Global.initRouter();
    Global.initDictionary();
}

pub fn deinit() void {
    fio.fio_stop();

    Global.deinitDictionary();
    Global.deinitRouter();
    Global.deinitAllocator();
}

/// Start the IO reactor
///
/// Will start listeners etc.
pub fn start() !void {
    const args = fio.fio_start_args{
        .threads = 1,
        // The number of worker processes to run (in addition to a root process)
        // This invokes facil.io's cluster mode, where a crashed worker will be automatically re-spawned and "hot restart" is enabled (using the USR1 signal).
        // Ref: https://facil.io/0.7.x/fio#running-facil-io
        // NOTE: If we use multiple workers, our dictionary will not be shared since each worker has its own memory space.
        .workers = 1,
    };

    if (fio.fio_listen(.{
        .port = "6377",
        .on_open = on_open,
    }) == -1) {
        return error.PortAlreadyInUse;
    }

    log.info("Starting Redis Server at port 6377", .{});
    fio.fio_start(args);
}

fn on_open(uuid: isize, _: ?*anyopaque) callconv(.C) void {
    // allocate fio_proto
    const fio_proto = Global.allocator.create(fio.fio_protocol_s) catch unreachable;
    fio_proto.* = fio.fio_protocol_s{
        .on_data = on_data,
        .on_close = on_close,
    };

    fio.fio_attach(uuid, fio_proto);
    fio.fio_timeout_set(uuid, 5);
}

fn on_data(uuid: isize, _: *fio.fio_protocol_s) callconv(.C) void {
    const dict = Global.dictionary();

    var buf: [4096]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buf);
    const allocator = fba.allocator();

    log.debug("Handling data on connection {d} with dictionary at {*}", .{ uuid, dict });
    defer log.debug("Finished handling data on connection {d}", .{uuid});

    // Allocate read buffer on the heap
    const read_buffer = allocator.alloc(u8, 1024) catch |err| {
        log.err("failed to allocate read buffer: {}", .{err});
        return;
    };
    defer allocator.free(read_buffer);

    const read_buffer_ptr: ?*anyopaque = @ptrCast(read_buffer);
    const read: usize = @intCast(fio.fio_read(uuid, read_buffer_ptr, read_buffer.len));

    var resp = Resp.init(allocator);
    defer resp.deinit();

    const msg = if (read == 0)
        Message.err("empty request")
    else
        resp.deserialise(read_buffer[0..read]) catch |err| blk: {
            log.err("failed to deserialise: {}", .{err});
            break :blk Message.err("failed to deserialise");
        };

    var cmd_ctx = CommandCtx.init(Global.allocator, msg);
    defer cmd_ctx.deinit();

    const response = Global.router().route(&cmd_ctx);
    const serialised_response = resp.serialise(response) catch "-Err failed to serialise\r\n";

    const write_buf = allocator.alloc(u8, serialised_response.len) catch unreachable;
    defer {
        log.debug("Freed write buffer", .{});
        allocator.free(write_buf);
    }
    @memcpy(write_buf, serialised_response);

    const write_buf_c_ptr: ?*anyopaque = @constCast(write_buf.ptr);
    const write_result = fio.write2(uuid, .{
        .data = .{ .buffer = write_buf_c_ptr },
        .length = serialised_response.len,
        .offset = 0,
        .after = .{ .dealloc = (struct {
            pub fn dealloc(_: ?*anyopaque) void {}
        }).dealloc },
        .urgent = false,
        .is_fd = false,
        .rsv = false,
        .rsv2 = false,
    });
    log.debug("Wrote result={d} bytes={d}", .{ write_result, serialised_response.len });
}

fn on_close(uuid: isize, fio_protocol: *fio.fio_protocol_s) callconv(.C) void {
    // get the parent ptr, ie Protocol from fio_protocol
    log.debug("Connection {d} closed. fio_protocol_addr={*}", .{ uuid, fio_protocol });
    // deinit self
    Global.allocator.destroy(fio_protocol);
}
