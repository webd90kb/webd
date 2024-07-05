#include <stdio.h>
#include "mod1.h"
#include "liba/mod2.h"
#include "liba/mod3.h"

int main() {
	printf("%s\n", __FILE__);
	mod1_func();
	mod2_func();
	mod3_func();
	mod3_func_2();
	return 0;
}
