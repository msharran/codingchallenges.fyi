const std = @import("std");
const Resp = @import("Resp.zig");
const Message = Resp.Message;

const iterations = 100_000;
// const iterations = 50;

pub fn benchmarkRespSerDe() !void {
    const sample_commands = [_][]const u8{
        "*2\r\n$3\r\nGET\r\n$3\r\nkey\r\n",
        "*3\r\n$3\r\nSET\r\n$3\r\nkey\r\n$5\r\nvalue\r\n",
    };

    const start = std.time.nanoTimestamp();
    // var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    // defer {
    //     const leak = gpa.deinit();
    //     std.debug.print("Memory leak status: {}\n", .{leak});
    // }
    // const alloc = gpa.allocator();

    for (0..iterations) |_| {
        for (sample_commands) |cmd| {
            var buf: [4096]u8 = undefined;
            var fba = std.heap.FixedBufferAllocator.init(&buf);
            var resp = Resp.init(fba.allocator());
            defer resp.deinit();
            const msg = try resp.deserialise(cmd);
            const got = try resp.serialise(msg);
            try std.testing.expectEqualStrings(cmd, got);
        }
    }

    const end = std.time.nanoTimestamp();
    const duration_ms = @as(f64, @floatFromInt(end - start)) / @as(f64, @floatFromInt(iterations));
    const ops_per_sec = @as(f64, @floatFromInt(iterations)) / (duration_ms / 1000.0);

    std.debug.print("Serialisation + Deserialisation speed: {d:.2} ops/sec\n", .{ops_per_sec});
}

pub fn benchmarkRespDe() !void {
    const sample_commands = [_][]const u8{
        "*2\r\n$3\r\nGET\r\n$3\r\nkey\r\n",
        "*3\r\n$3\r\nSET\r\n$3\r\nkey\r\n$5\r\nvalue\r\n",
    };

    const start = std.time.nanoTimestamp();

    for (0..iterations) |_| {
        for (sample_commands) |cmd| {
            var buf: [4096]u8 = undefined;
            var fba = std.heap.FixedBufferAllocator.init(&buf);
            var resp = Resp.init(fba.allocator());
            defer resp.deinit();
            _ = try resp.deserialise(cmd);
        }
    }

    const end = std.time.nanoTimestamp();
    const duration_ms = @as(f64, @floatFromInt(end - start)) / @as(f64, @floatFromInt(iterations));
    const ops_per_sec = @as(f64, @floatFromInt(iterations)) / (duration_ms / 1000.0);

    std.debug.print("Deserialization speed: {d:.2} ops/sec\n", .{ops_per_sec});
}

pub fn benchmarkRespSer() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer {
        const leak = gpa.deinit();
        std.debug.print("Memory leak status: {}\n", .{leak});
    }
    const alloc = gpa.allocator();

    var list = try std.ArrayList(Message).initCapacity(alloc, 2);
    defer list.deinit();
    try list.append(Message.init(.BulkString, "GET"));
    try list.append(Message.init(.BulkString, "key"));
    const msg1 = Message.initList(.Array, list);

    var list2 = try std.ArrayList(Message).initCapacity(alloc, 3);
    defer list2.deinit();
    try list2.append(Message.init(.BulkString, "SET"));
    try list2.append(Message.init(.BulkString, "key"));
    try list2.append(Message.init(.BulkString, "value"));
    const msg2 = Message.initList(.Array, list2);

    const sample_commands = [_]Message{
        msg1,
        msg2,
    };

    const start = std.time.nanoTimestamp();

    for (0..iterations) |_| {
        for (sample_commands) |cmd| {
            var buf: [4096]u8 = undefined;
            var fba = std.heap.FixedBufferAllocator.init(&buf);
            var resp = Resp.init(fba.allocator());
            defer resp.deinit();
            const serialized = try resp.serialise(cmd);
            _ = serialized;
        }
    }

    const end = std.time.nanoTimestamp();
    const duration_ms = @as(f64, @floatFromInt(end - start)) / @as(f64, @floatFromInt(iterations));
    const ops_per_sec = @as(f64, @floatFromInt(iterations)) / (duration_ms / 1000.0);

    std.debug.print("Serialization speed: {d:.2} ops/sec\n", .{ops_per_sec});
}

test "bench_resp_serde" {
    try benchmarkRespSerDe();
    std.debug.print("=======================\n", .{});
}

test "bench_resp_ser" {
    try benchmarkRespSer();
    std.debug.print("=======================\n", .{});
}

test "bench_resp_de" {
    try benchmarkRespDe();
    std.debug.print("=======================\n", .{});
}
