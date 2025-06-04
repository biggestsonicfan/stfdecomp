TEMP_DIR := ../../temp
CROSS := 960
GCC := gcc
LINKTOOL  := gld
GCC_ARGS := -crt -nostdinc -nostdlib -verbose-asm -v -Felf

all:
	$(GCC)$(CROSS) -r $(GCC_ARGS) story/story.s -o story/story.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) game/game.s -o game/game.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) mask/mask.s -o mask/mask.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) round/round.s -o round/round.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) burni/burni.s -o burni/burni.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) set/set.s -o set/set.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) ready/ready.s -o ready/ready.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) fight/fight.s -o fight/fight.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) rep_waza/rep_waza.s -o rep_waza/rep_waza.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) judge/judge.s -o judge/judge.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) replay/replay.s -o replay/replay.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) next/next.s -o next/next.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) victory/victory.s -o victory/victory.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) win/win.s -o win/win.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) stage_up/stage_up.s -o stage_up/stage_up.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) deathegg/mask.s -o deathegg/mask.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) deathegg/mezase.s -o deathegg/mezase.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) intrude/intrude.s -o intrude/intrude.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) continue/continue.s -o continue/continue.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) set_close/set_close.s -o set_close/set_close.o
	$(GCC)$(CROSS) -r $(GCC_ARGS) over/over.s -o over/over.o

	make -C ending

	$(GCC)$(CROSS) -r $(GCC_ARGS) common/get_game_info.s -o common/get_game_info.o