TEMP_DIR := ../../temp
CROSS := 960
GCC := gcc
LINKTOOL  := gld
GCC_ARGS := -crt -nostdinc -nostdlib -verbose-asm -v -Felf

all:
	$(GCC)$(CROSS) -r $(GCC_ARGS) math/calc_unit_mat.s -o math/calc_unit_mat.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) math/damage_calculation.s -o math/damage_calculation.o
