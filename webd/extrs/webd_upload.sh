#!/bin/sh

b36enc() {
	local b36=$(echo {0..9} {a..z}); b36=${b36// /}
	awk \
	'BEGIN { b = split(ARGV[1], D, ""); n = ARGV[2]; do { d = int(n / b); i = D[n - b * d + 1]; r = i r; n = d } while(n != 0); print r}' \
	"${b36}" "$1"
}

upload(){
	local def_url='http://192.168.1.2:9212/tmp/'
	local def_cookie='AcMY8R290zo'

	local file="${1}"
	local size=$(stat -c %s "${file}")
	local time=$(stat -c %Y "${file}")

	local url="${2:-${def_url}}"; url="${url%/}/${file##*/}"
	local cookie="${3:-${def_cookie}}"

	echo -e "\e[1;32mupload: ${url}\e[0m"
	
	wget -vdt1 -O- "${url//#/%23}?N$(b36enc ${time})" \
	--header='Content-Type: application/octet-stream' \
	--header="Cookie: u=${cookie}" \
	--header="RaOff: bytes=0/$(b36enc ${size})" \
	--post-file="${file}"

	echo -e "\n\e[1;32mfinish: ${url}\e[0m"

}; upload "$@"
