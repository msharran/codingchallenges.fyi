const std = @import("std");
const std_log = std.log;
const log = std_log.scoped(.server);
const net = std.net;
const posix = std.posix;

const dictionary = @import("dictionary.zig");
const Dictionary = @import("dictionary.zig").Dictionary;
const Router = @import("Router.zig");
const Resp = @import("Resp.zig");
const Message = Resp.Message;
const Request = @import("Router.zig").Request;
const redis_alloc = @import("allocator.zig");

// const ProtocolPool = std.heap.MemoryPool(Protocol);
// https://zig.news/xq/zig-build-explained-part-3-1ima
const fio = @import("fio.zig");

pub const GeneralPurposeAllocator = std.heap.GeneralPurposeAllocator(.{
    .stack_trace_frames = 0, // Disable stack traces
});

pub const Server = struct {
    /// router is responsible for handling the commands received by the server.
    router: Router,

    /// init allocates memory for the server.
    /// Caller should call self.deinit to free the memory.
    pub fn init() !Server {
        // init global dictionary
        redis_alloc.initGlobal();
        dictionary.initGlobal();
        return Server{
            .router = Router.initComptime(),
        };
    }

    pub fn deinit(_: *Server) void {
        fio.fio_stop();
        dictionary.deinitGlobal();
        redis_alloc.deinitGlobal();
    }

    /// Start the IO reactor
    ///
    /// Will start listeners etc.
    pub fn start(self: *Server) !void {
        log.debug("starting server svr_addr={*}", .{self});

        const args = fio.fio_start_args{
            .threads = 4,
            .workers = 4,
        };

        if (fio.fio_listen(.{
            .port = "6377",
            .on_open = on_open,
        }) == -1) {
            return error.PortAlreadyInUse;
        }
        fio.fio_start(args);
    }

    fn on_open(uuid: isize, _: ?*anyopaque) callconv(.C) void {
        // allocate fio_proto
        const fio_proto = redis_alloc.global.?.create(fio.fio_protocol_s) catch unreachable;
        fio_proto.* = fio.fio_protocol_s{
            .on_data = on_data,
            .on_close = on_close,
        };

        fio.fio_attach(uuid, fio_proto);
        fio.fio_timeout_set(uuid, 5);
    }

    fn on_data(uuid: isize, _: *fio.fio_protocol_s) callconv(.C) void {
        const dict = dictionary.getGlobalPtr();
        log.debug("Handling data on connection {d} with dictionary at {*}", .{ uuid, dict });
        dict.debugDictionaryState();
        defer log.debug("Finished handling data on connection {d}", .{uuid});
        defer dict.debugDictionaryState();

        // Allocate read buffer on the heap
        const read_buffer = redis_alloc.global.?.alloc(u8, 1024) catch |err| {
            log.err("failed to allocate read buffer: {}", .{err});
            return;
        };
        defer redis_alloc.global.?.free(read_buffer);

        const read_buffer_ptr: ?*anyopaque = @ptrCast(read_buffer);
        const read: usize = @intCast(fio.fio_read(uuid, read_buffer_ptr, read_buffer.len));

        var resp = Resp.init(redis_alloc.global.?);
        defer resp.deinit();

        const msg = if (read == 0)
            Message.err("empty request")
        else
            resp.deserialise(read_buffer[0..read]) catch |err| blk: {
                log.err("failed to deserialise: {}", .{err});
                break :blk Message.err("failed to deserialise");
            };

        // Create arena for RESP parsing
        var arena = std.heap.ArenaAllocator.init(redis_alloc.global.?);
        defer arena.deinit(); // This will free all RESP-allocated memory
        const request = Request.init(&arena, msg);

        const router = Router.initComptime();

        const response_msg = router.route(request);
        const response_serialised = resp.serialise(response_msg) catch "-Err failed to serialise\r\n";

        const write_buf = redis_alloc.global.?.alloc(u8, response_serialised.len) catch unreachable;
        defer {
            log.debug("Freed write buffer", .{});
            redis_alloc.global.?.free(write_buf);
        }
        @memcpy(write_buf, response_serialised);

        const write_buf_c_ptr: ?*anyopaque = @constCast(write_buf.ptr);
        const write_result = fio.write2(uuid, .{
            .data = .{ .buffer = write_buf_c_ptr },
            .length = response_serialised.len,
            .offset = 0,
            .after = .{ .dealloc = (struct {
                pub fn dealloc(_: ?*anyopaque) void {}
            }).dealloc },
            .urgent = false,
            .is_fd = false,
            .rsv = false,
            .rsv2 = false,
        });
        log.debug("Wrote result={d} bytes={d}", .{ write_result, response_serialised.len });
    }

    fn on_close(uuid: isize, fio_protocol: *fio.fio_protocol_s) callconv(.C) void {
        // get the parent ptr, ie Protocol from fio_protocol
        log.debug("Connection {d} closed. fio_protocol_addr={*}", .{ uuid, fio_protocol });
        // deinit self
        redis_alloc.global.?.destroy(fio_protocol);
    }
};
