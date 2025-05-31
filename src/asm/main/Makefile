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
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/story.s -o round/story.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/game/game.s -o round/game/game.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/mask/mask.s -o round/mask/mask.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/round.s -o round/round.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/burni/burni.s -o round/burni/burni.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/set/set.s -o round/set/set.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/ready/ready.s -o round/ready/ready.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/fight/fight.s -o round/fight/fight.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/rep_waza/rep_waza.s -o round/rep_waza/rep_waza.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/judge/judge.s -o round/judge/judge.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/replay/replay.s -o round/replay/replay.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/next/next.s -o round/next/next.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/victory/victory.s -o round/victory/victory.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/win/win.s -o round/win/win.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/stage_up/stage_up.s -o round/stage_up/stage_up.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/deathegg/mask.s -o round/deathegg/mask.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/deathegg/mezase.s -o round/deathegg/mezase.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/intrude/intrude.s -o round/intrude/intrude.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/continue/continue.s -o round/continue/continue.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/set_close/set_close.s -o round/set_close/set_close.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/over/over.s -o round/over/over.o

	make -C round/ending

	$(GCC)$(CROSS) -r $(GCC_ARGS) name/name/name.s -o name/name/name.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) rank/all_end/all_end.s -o rank/all_end/all_end.o
