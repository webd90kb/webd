#!/bin/bash
# From https://webd.cf/blogs/embed_files_into_executable_program.html
dir2c(){
	file2c_str(){
		hexdump -v -e '32/1 "_x%02X" "\n"' "${1}" | sed 's/_/\\/g; s/\\x  //g; s/.*/"&"/'
	}
	local z=$(mktemp); trap "rm ${z}.*" exit
	echo "static const char _data_enc[] =  " > "${z}.1"
	cat > "${z}.2" << "EOF"
static const struct {
	const char *path;
	uint32_t off;
	uint32_t len:15;
} _data_enc_lst[] = {
EOF

	local off=0 f; for f in ${1}/*{,/*{,/*{,/*{,/*}}}}; do
		[[ -f "${f}" ]] || continue
		local len=$(stat -Lc %s "${f}" 2>/dev/null)
		echo "	{ .path = \"${f}\", .off = ${off}, .len = ${len}, }," >> "${z}.3"
		echo "// ${f} len: ${len}" >> "${z}.1"
		: $((off += len))
		file2c_str ${f} >> "${z}.1"
	done
	sort "${z}.3" >> "${z}.2"
	echo -e "};\n//total size: ${off}\n" >> "${z}.2"
	
	echo -e "#if(_DATA_ENC_INC == 1)\n#undef _DATA_ENC_INC\n"
	cat "${z}.2" "${z}.1"
	echo -e ";\n#endif\n"
}

dir2c_test(){
	mkdir -pv 1/{a,b,c/d}
	echo 12345 >> 1/test.txt
	echo abcdd >> 1/test.txt
	cp -v 1/test.txt 1/a
	cp -v 1/test.txt 1/b
	cp -v 1/test.txt 1/c/d
	dir2c 1 > _data_enc.c
	gcc embed_file.c -o embed_file
	./embed_file
}

"${@}"
