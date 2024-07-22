package regex_common

@require import "core:os"
import "core:io"
import "core:strings"

ODIN_DEBUG_REGEX :: #config(ODIN_DEBUG_REGEX, false)

when ODIN_DEBUG_REGEX {
	debug_stream := os.stream_from_handle(os.stderr)
}

write_padded_hex :: proc(w: io.Writer, #any_int n, zeroes: int) {
	sb := strings.builder_make()
	defer strings.builder_destroy(&sb)

	sbw := strings.to_writer(&sb)
	io.write_int(sbw, n, 0x10)

	io.write_string(w, "0x")
	for _ in 0..<max(0, zeroes - strings.builder_len(sb)) {
		io.write_byte(w, '0')
	}
	io.write_int(w, n, 0x10)
}
