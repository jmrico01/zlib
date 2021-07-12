const std = @import("std");

pub fn build(b: *std.build.Builder) void
{
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();
    const lib = b.addStaticLibrary("zlib", null);
    lib.setTarget(target);
    lib.setBuildMode(mode);
    lib.linkLibC();
    lib.install();

    addLib(lib, ".");
}

pub fn addLib(step: *std.build.LibExeObjStep, comptime dir: []const u8) void
{
    const cFlags = &[_][]const u8 {
        "-DHAVE_SYS_TYPES_H=1",
        "-DHAVE_STDINT_H=1",
        "-DHAVE_STDDEF_H=1",
    };
    step.addCSourceFiles(&[_][]const u8 {
        dir ++ "/adler32.c",
        dir ++ "/compress.c",
        dir ++ "/crc32.c",
        dir ++ "/deflate.c",
        dir ++ "/gzclose.c",
        dir ++ "/gzlib.c",
        dir ++ "/gzread.c",
        dir ++ "/gzwrite.c",
        dir ++ "/inflate.c",
        dir ++ "/infback.c",
        dir ++ "/inftrees.c",
        dir ++ "/inffast.c",
        dir ++ "/trees.c",
        dir ++ "/uncompr.c",
        dir ++ "/zutil.c",
    }, cFlags);
}
