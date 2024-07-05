#include <stdio.h>
#include "mod2.h"

int mod3_func(void) {
	printf("%s ==> %s\n", __FILE__, __FUNCTION__);
	return 0;
}

int mod3_func_2(void) {
	mod2_func();
	mod3_func();
	return 0;
}
