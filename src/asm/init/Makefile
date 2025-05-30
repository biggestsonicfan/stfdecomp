TEMP_DIR := ../../temp
CROSS := 960
GCC := gcc
LINKTOOL  := gld
GCC_ARGS := -crt -nostdinc -nostdlib -verbose-asm -v -Felf

all:
	$(GCC)$(CROSS) -r $(GCC_ARGS) kx/kx_init.s -o kx/kx_init.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) ram/fix_prcb.s -o ram/fix_prcb.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) copro/copro_init.s -o copro/copro_init.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) ram/buff_ram.s -o ram/buff_ram.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) gfx/gfx_init.s -o gfx/gfx_init.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) interrupt/interrupt_init.s -o interrupt/interrupt_init.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) serial/serial_init.s -o serial/serial_init.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) gfx/colors_init.s -o gfx/colors_init.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) gfx/texture_init.s -o gfx/texture_init.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) fault/f_handle.s -o fault/f_handle.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) fault/print_fault.s -o fault/print_fault.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) timer/timer.s -o timer/timer.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) vsync/vsync.s -o vsync/vsync.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) other/other.s -o other/other.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) interrupt/i_halt.s -o interrupt/i_halt.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) collision/collision.s -o collision/collision.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) geometry/geo_init.s -o geometry/geo_init.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) player/entry.s -o player/player_entry.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) credits/check.s -o credits/check.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) window/window.s -o window/window.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) ram/sram.s -o ram/sram.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) fault/f_table.s -o fault/f_table.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) interrupt/i_table.s -o interrupt/i_table.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) warn/check.s -o warn/check.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) event/event.s -o event/event.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) obj/poly.s -o obj/poly.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) print/print.s -o print/print.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) math/math.s -o math/math.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) unused/un_disp_floats.s -o unused/un_disp_floats.o