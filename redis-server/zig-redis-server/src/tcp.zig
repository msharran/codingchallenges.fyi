const std = @import("std");
const std_log = std.log;
const log = std_log.scoped(.server);
const net = std.net;
const posix = std.posix;

const Dictionary = @import("Dictionary.zig");
const Router = @import("Router.zig");
const Resp = @import("Resp.zig");
const Message = Resp.Message;
const Request = @import("Router.zig").Request;
// const ProtocolPool = std.heap.MemoryPool(Protocol);
// https://zig.news/xq/zig-build-explained-part-3-1ima
const fio = @import("fio.zig");

pub const Server = struct {
    /// router is responsible for handling the commands received by the server.
    router: Router,

    /// allocator is used to allocate memory for the server.
    allocator: std.mem.Allocator,

    dict: Dictionary,

    /// init allocates memory for the server.
    /// Caller should call self.deinit to free the memory.
    pub fn init(allocator: std.mem.Allocator) !Server {
        return Server{
            .allocator = allocator,
            .router = Router.initComptime(),
            .dict = try Dictionary.init(allocator),
        };
    }

    pub fn deinit(self: *Server) void {
        defer log.info("Server deinitialised", .{});
        self.dict.deinit();
    }

    fn on_open(uuid: isize, udata: ?*anyopaque) callconv(.C) void {
        // Protocol objects MUST be dynamically allocated when multi-threading.
        const self: *Server = @ptrCast(@alignCast(udata));

        const proto = Protocol.init(self.allocator, &self.router, &self.dict);
        log.debug("New connection received {d} proto_addr={*}", .{ uuid, proto });

        // refer Protocol struct callbacks,
        // on_data and on_close. These get called when data is received or connection is closed.
        fio.fio_attach(uuid, proto.fio_protocol);
        fio.fio_timeout_set(uuid, 5);
    }

    const StartOptions = struct {
        port: []const u8 = "6377",
    };

    /// Start the IO reactor
    ///
    /// Will start listeners etc.
    pub fn start(self: *Server, _: StartOptions) !void {
        log.debug("starting server svr_addr={*} dict_addr={*}", .{ self, &self.dict });

        const args = fio.fio_start_args{
            .threads = 4,
            .workers = 4,
        };

        if (fio.fio_listen(.{
            .port = "6377",
            .on_open = on_open,
            .udata = self,
        }) == -1) {
            return error.NoListeningSocketAvailableForPort;
        }
        fio.fio_start(args);
    }
};

// const RwLock = std.Thread.RwLock;
const Protocol = struct {
    allocator: std.mem.Allocator,
    fio_protocol: *fio.fio_protocol_s,
    resp: Resp,

    // there are no writes happening to router, it is
    // initialized during server startup, so it is safe to use
    router: *Router,
    safe_dict: *Dictionary,
    write_buf: ?[]u8 = null,

    pub fn init(allocator: std.mem.Allocator, router: *Router, dict: *Dictionary) *Protocol {
        const proto = allocator.create(Protocol) catch unreachable;
        const f_proto = allocator.create(fio.fio_protocol_s) catch unreachable;
        f_proto.* = fio.fio_protocol_s{
            .on_data = on_data,
            .on_close = on_close,
        };

        proto.* = Protocol{
            .allocator = allocator,
            .fio_protocol = f_proto,
            .router = router,
            .safe_dict = dict,
            .resp = Resp.init(allocator),
        };
        return proto;
    }

    pub fn alloc_write_buffer(self: *Protocol, size: usize) void {
        self.write_buf = self.allocator.alloc(u8, size) catch unreachable;
    }

    pub fn deinit(self: *Protocol) void {
        log.debug("Deinitializing protocol proto_addr={*}", .{self});
        if (self.write_buf) |buf| {
            self.allocator.free(buf);
        }
        self.resp.deinit();
        self.allocator.destroy(self.fio_protocol);
        self.allocator.destroy(self);
    }

    fn on_data(uuid: isize, fio_protocol: *fio.fio_protocol_s) callconv(.C) void {
        errdefer fio.fio_close(uuid);

        const proto: *Protocol = @fieldParentPtr("fio_protocol", @constCast(&fio_protocol));
        log.debug("Connection {d} accepted", .{uuid});

        // Allocate read buffer on the heap
        const read_buffer = proto.allocator.alloc(u8, 1024) catch |err| {
            log.err("failed to allocate read buffer: {}", .{err});
            return;
        };
        defer proto.allocator.free(read_buffer);

        const read_buffer_ptr: ?*anyopaque = @ptrCast(read_buffer);
        const read: usize = @intCast(fio.fio_read(uuid, read_buffer_ptr, read_buffer.len));

        const msg = if (read == 0)
            Message.err("empty request")
        else
            proto.resp.deserialise(read_buffer[0..read]) catch |err| blk: {
                log.err("failed to deserialise: {}", .{err});
                break :blk Message.err("failed to deserialise");
            };

        var request = Request.init(proto.allocator, msg, proto.safe_dict);
        defer request.deinit();
        const response_msg = proto.router.route(request);
        const response_raw = proto.resp.serialise(response_msg) catch "-Err failed to serialise\r\n";

        proto.alloc_write_buffer(response_raw.len);
        @memcpy(proto.write_buf.?, response_raw);

        const write_buf_c_ptr: ?*anyopaque = @constCast(proto.write_buf.?.ptr);
        const write_result = fio.write2(uuid, .{
            .data = .{ .buffer = write_buf_c_ptr },
            .length = response_raw.len,
            .offset = 0,
            .after = .{ .dealloc = (struct {
                pub fn dealloc(_: ?*anyopaque) void {}
            }).dealloc },
            .urgent = false,
            .is_fd = false,
            .rsv = false,
            .rsv2 = false,
        });
        log.debug("Wrote result={d} bytes={d}", .{ write_result, response_raw.len });

        fio.fio_close(uuid);
    }

    fn on_close(uuid: isize, fio_protocol: *fio.fio_protocol_s) callconv(.C) void {
        // get the parent ptr, ie Protocol from fio_protocol

        const proto: *Protocol = @fieldParentPtr("fio_protocol", @constCast(&fio_protocol));
        log.debug("Connection {d} closed. fio_protocol_addr={*}", .{ uuid, fio_protocol });
        // deinit self
        proto.deinit();
    }
};
