#include <stdio.h>
#include <stdint.h>
int main(int argc, char *argv[]) {
	#define _DATA_ENC_INC 1
	#include "_data_enc.c"
	for (int i = 0; i < sizeof(_data_enc_lst)/sizeof(_data_enc_lst[0]); ++i) {
		printf("%3u, %3u, %s\n", _data_enc_lst[i].off, _data_enc_lst[i].len, _data_enc_lst[i].path);
		// &_data_enc[_data_enc_lst[i].off] is the data ptr, use it by need
	}
	return 0;
}
