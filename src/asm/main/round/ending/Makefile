TEMP_DIR := ../../temp
CROSS := 960
GCC := gcc
LINKTOOL  := gld
GCC_ARGS := -crt -nostdinc -nostdlib -verbose-asm -v -Felf

all:
	$(GCC)$(CROSS) -r $(GCC_ARGS) ending/ending.s -o ending/ending.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) movie/movie.s -o movie/movie.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) sub/sub.s -o sub/sub.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) wait/wait.s -o wait/wait.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) unused/wait1_alt.s -o unused/wait1_alt.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) unused/fv_leftovers.s -o unused/fv_leftovers.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) unused/time_dsp.s -o unused/time_dsp.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) unused/staff.s -o unused/staff.o