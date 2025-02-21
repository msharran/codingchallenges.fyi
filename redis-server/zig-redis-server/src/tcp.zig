const std = @import("std");
const std_log = std.log;
const log = std_log.scoped(.server);
const net = std.net;
const posix = std.posix;

const Dictionary = @import("Dictionary.zig");
const Router = @import("Router.zig");
const Resp = @import("Resp.zig");
const Message = Resp.Message;
const Request = @import("command.zig").Request;
const ThreadPool = xev.ThreadPool;
const Task = xev.ThreadPool.Task;
const Batch = xev.ThreadPool.Batch;
const xev = @import("xev");
const TCP = xev.TCP;

// https://zig.news/xq/zig-build-explained-part-3-1ima
const fio = @import("fio.zig");

const ProtocolPool = std.heap.MemoryPool(Protocol);

const Protocol = struct {
    fio_protocol: fio.fio_protocol_s,
    server: *Server,
    write_buf: ?[]u8 = null,

    pub fn init(server: *Server) *Protocol {
        const p = server.protocol_pool.create() catch unreachable;
        p.* = Protocol{
            .server = server,
            .fio_protocol = fio.fio_protocol_s{
                .on_data = on_data,
                .on_close = on_close,
            },
        };
        return p;
    }

    pub fn init_write_buf(self: *Protocol, size: usize) void {
        self.write_buf = self.server.allocator.alloc(u8, size) catch unreachable;
    }

    pub fn deinit(self: *Protocol) void {
        log.debug("Deinitializing protocol", .{});
        if (self.write_buf) |buf| {
            self.server.allocator.free(buf);
        }
        self.server.protocol_pool.destroy(self);
    }

    fn on_data(uuid: isize, fio_protocol: *fio.fio_protocol_s) callconv(.C) void {
        // get the parent ptr, ie Protocol from fio_protocol
        // const self: *Protocol = @fieldParentPtr("fio_protocol", fio_protocol);
        const proto: *Protocol = @fieldParentPtr("fio_protocol", fio_protocol);
        // echo buffer
        var buffer: [4028]u8 = undefined;
        // cast buffer to ?*anyopaque for passing to c
        const buffer_ptr: ?*anyopaque = @ptrCast(&buffer);

        const read: usize = @intCast(fio.fio_read(uuid, buffer_ptr, 4028));

        log.debug("Read ::::: {s}", .{buffer[0..read]});

        var resp = Resp.init(proto.server.allocator);
        defer resp.deinit();

        const msg = if (read == 0)
            Message.err("empty request")
        else
            resp.deserialise(buffer[0..read]) catch Message.err("failed to deserialise");

        var arena = std.heap.ArenaAllocator.init(proto.server.allocator);
        var req = Request.init(&arena, msg, proto.server.dict);
        defer req.deinit();

        const resp_msg = proto.server.router.route(req);

        const raw_msg = resp.serialise(resp_msg) catch "-Err failed to serialise\r\n";

        proto.init_write_buf(raw_msg.len);
        @memcpy(proto.write_buf.?, raw_msg);

        const write_buf_c_ptr: ?*anyopaque = @constCast(proto.write_buf.?.ptr);
        const wrote = fio.write2(uuid, .{
            .data = .{ .buffer = write_buf_c_ptr },
            .length = raw_msg.len,
            .offset = 0,
            .after = .{ .dealloc = (struct {
                pub fn dealloc(_: ?*anyopaque) void {
                    log.debug("Deallocated buffer", .{});
                }
            }).dealloc },
            .urgent = false,
            .is_fd = false,
            .rsv = false,
            .rsv2 = false,
        });
        log.debug("Wrote {d} bytes: {s}", .{ wrote, raw_msg });

        fio.fio_close(uuid);
    }

    fn on_close(uuid: isize, fio_protocol: *fio.fio_protocol_s) callconv(.C) void {
        // get the parent ptr, ie Protocol from fio_protocol

        const proto: *Protocol = @fieldParentPtr("fio_protocol", fio_protocol);
        log.debug("Connection {d} closed.", .{uuid});
        // deinit self
        proto.deinit();
    }
};

pub const Server = struct {
    // const uuid = @import("uuid");

    /// router is responsible for handling the commands received by the server.
    router: Router,

    /// allocator is used to allocate memory for the server.
    allocator: std.mem.Allocator,

    protocol_pool: ProtocolPool,

    dict: *Dictionary,

    /// pool is used to handle incoming connections concurrently.
    pool: ThreadPool,

    xev_tcp_server: ?*TCP = null,

    /// init allocates memory for the server.
    /// Caller should call self.deinit to free the memory.
    pub fn init(allocator: std.mem.Allocator) !Server {
        const obj_store = try Dictionary.init(allocator);
        const router = try Router.init(allocator);

        return Server{
            .allocator = allocator,
            .router = router,
            .dict = obj_store,
            .pool = ThreadPool.init(.{}),
            .protocol_pool = ProtocolPool.init(allocator),
        };
    }

    pub fn deinit(self: *Server) void {
        defer log.info("Server deinitialised", .{});

        self.protocol_pool.deinit();
        self.dict.deinit();
        self.router.deinit();
        self.* = undefined;
    }

    /////// TEMPPPPPPP

    fn echo_on_open(uuid: isize, udata: ?*anyopaque) callconv(.C) void {
        // Protocol objects MUST be dynamically allocated when multi-threading.
        const self: *Server = @ptrCast(@alignCast(udata));
        const proto = Protocol.init(self);
        log.debug("New connection received", .{});

        fio.fio_attach(uuid, &proto.fio_protocol);
        fio.fio_timeout_set(uuid, 5);
    }

    const StartOptions = struct {
        port: []const u8 = "6377",
    };

    /// Start the IO reactor
    ///
    /// Will start listeners etc.
    pub fn start(self: *Server, _: StartOptions) !void {
        log.info("starting server", .{});

        const args = fio.fio_start_args{
            .threads = 4,
            .workers = 4,
        };

        if (fio.fio_listen(.{
            .port = "6377",
            .on_open = echo_on_open,
            .udata = self,
        }) == -1) {
            return error.NoListeningSocketAvailableForPort;
        }
        fio.fio_start(args);
    }
};
