TEMP_DIR := ../../temp
CROSS := 960
GCC := gcc
LINKTOOL  := gld
GCC_ARGS := -crt -nostdinc -nostdlib -verbose-asm -v -Felf

all:
	$(GCC)$(CROSS) -r $(GCC_ARGS) main/main.s -o main/main.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) advertise/init_adv_rep.s -o advertise/init_adv_rep.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) buffer/clear_buffer.s -o buffer/clear_buffer.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) coprocessor/error.s -o coprocessor/coproc_error.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) mode/mode_control.s -o mode/mode_control.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) mode/test_enter_exit.s -o mode/test_enter_exit.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) warning/warning.s -o warning/warning.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) advertise/advertise.s -o advertise/advertise_mode.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) unused/un_check_credit.s -o unused/un_check_credit.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) advertise/fbi_pic/fbi_pic.s -o advertise/fbi_pic/fbi_pic.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) advertise/sega_pic/sega_pic.s -o advertise/sega_pic/sega_pic.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) advertise/movie/movie.s -o advertise/movie/movie.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) advertise/replay/replay.s -o advertise/replay/replay.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) advertise/cpu_battle/cpu_battle.s -o advertise/cpu_battle/cpu_battle.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) info/info.s -o info/info.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) select/select.s -o select/select.o
	
	make -C round

	make -C round/ending

	$(GCC)$(CROSS) -r $(GCC_ARGS) name/name/name.s -o name/name/name.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) rank/all_end/all_end.s -o rank/all_end/all_end.o

	make -C debug

	$(GCC)$(CROSS) -r $(GCC_ARGS) rank/rank/rank.s -o rank/rank/rank.o