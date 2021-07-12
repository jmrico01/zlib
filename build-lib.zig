const std = @import("std");

pub fn addLib(step: *std.build.LibExeObjStep) void
{
    const cFlags = &[_][]const u8 {
        "-DHAVE_SYS_TYPES_H=1",
        "-DHAVE_STDINT_H=1",
        "-DHAVE_STDDEF_H=1",
    };
    step.addCSourceFiles(&[_][]const u8 {
        "adler32.c",
        "compress.c",
        "crc32.c",
        "deflate.c",
        "gzclose.c",
        "gzlib.c",
        "gzread.c",
        "gzwrite.c",
        "inflate.c",
        "infback.c",
        "inftrees.c",
        "inffast.c",
        "trees.c",
        "uncompr.c",
        "zutil.c",
    }, cFlags);
}
