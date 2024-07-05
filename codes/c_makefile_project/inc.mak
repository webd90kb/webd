ifneq ($(V), 1)
Q := @
endif

# PREFIX ?= arm-none-eabi-
CC	= $(Q)$(PREFIX)gcc
SIZE	= $(Q)$(PREFIX)size
LD	= $(CC)

CFLAGS = -Wall -Wextra -MMD
LDFLAGS = -Wl,--gc-sections

OBJ:=$(OBJ:=.o)

ifeq ($(OS),Windows_NT)
EXE:=$(EXE:=.exe)
endif

$(EXE): $(OBJ)

all: $(EXE)
.DEFAULT_GOAL := all

ifeq ($(OS),Windows_NT)
$(EXE): %.exe: %.o
	@echo $@
	$(LD) $^ $(LDFLAGS) -o $@
	$(SIZE) $@
else
$(EXE): %: %.o
	@echo $@
	$(LD) $^ $(LDFLAGS) -o $@
	$(SIZE) $@
endif

%.o:%.c
	@echo $<
	$(CC) $(CFLAGS) -c $< -o $@


.PHONY:clean
clean:
ifeq ($(OS),Windows_NT)
	@rm -fv $(EXE:.exe=) $(EXE:.exe=.o) $(EXE:.exe=.d)
else #($(OS),Windows_NT)
	@rm -fv $(EXE:=.o) $(EXE:=.d)
endif #($(OS),Windows_NT)
	@rm -fv $(EXE) $(OBJ) $(OBJ:.o=.d)


ifeq ($(OS),Windows_NT)
-include $(EXE:.exe=.d)
else
-include $(EXE:=.d)
endif
-include $(OBJ:.o=.d)
