const std = @import("std");

const buildZ = @import("build-lib.zig");

pub fn build(b: *std.build.Builder) void
{
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();
    const lib = b.addStaticLibrary("zlib", null);
    lib.setTarget(target);
    lib.setBuildMode(mode);
    buildZ.addLib(lib);
    lib.linkLibC();
    lib.install();
}
