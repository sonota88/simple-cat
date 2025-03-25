use std::io::prelude::*;

fn main() {
    for byte_opt in std::io::stdin().bytes() {
        let byte: u8 = byte_opt.unwrap();
        write_byte(byte);
    }
}

fn write_byte(byte: u8) {
    let mut handle = std::io::stdout().lock();
    handle.write_all(&[byte]).unwrap();
}
