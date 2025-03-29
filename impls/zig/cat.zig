const std = @import("std");

pub fn main() !void {
    const outstream = std.io.getStdOut().writer();
    const instream = std.io.getStdIn().reader();

    while (true) {
        const byte = instream.readByte() catch |err| switch (err) {
            error.EndOfStream => {
                break;
            },
            else => |e| {
                return e;
            },
        };

        try outstream.writeByte(byte);
    }
}
