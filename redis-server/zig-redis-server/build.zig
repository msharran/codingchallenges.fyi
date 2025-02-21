const std = @import("std");
const build_facilio = @import("vendor/facil.io/build.zig").build_facilio;

// Although this function looks imperative, note that its job is to
// declaratively construct a build graph that will be executed by an external
// runner.
pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    if (target.result.os.tag == .windows) {
        std.log.err("\x1b[31mPlatform Not Supported\x1b[0m\nCurrently, Facil.io is not compatible with Windows. Consider using Linux or Windows Subsystem for Linux (WSL) instead.\nFor more information, please see:\n- https://facil.io/#forking-contributing-and-all-that-jazz\n", .{});
        std.process.exit(1);
    }

    const exe = b.addExecutable(.{
        .name = "redis-server",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const facilio = try build_facilio("vendor/facil.io", b, target, optimize, false);
    exe.root_module.linkLibrary(facilio);
    exe.addIncludePath(b.path("vendor/facil.io/lib/facil"));
    exe.linkLibC();

    const xev = b.dependency("libxev", .{ .target = target, .optimize = optimize });
    exe.root_module.addImport("xev", xev.module("xev"));

    const uuid = b.dependency("uuid", .{ .target = target, .optimize = optimize });
    exe.root_module.addImport("uuid", uuid.module("uuid"));

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    const lib_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);

    const exe_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_lib_unit_tests.step);
    test_step.dependOn(&run_exe_unit_tests.step);
}
