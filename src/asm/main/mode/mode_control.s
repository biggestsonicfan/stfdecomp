        .section debug_mode_control
# ---------------------------------------------------------------------------
mode_control:                           # CODE XREF: main_loop+60↑p
                ld      debug_flag, r15 # Label from official source
                bbs     5, r15, loc_7B00 # if bit 5 of debug mode is set, just return
                ldob    mode, r3        # load mode to r3
                stob    r3, also_mode   # store mode to also_mode
                shlo    r3, 1, r4       # shift left ordinal 1 and store to r4
                st      r4, mode_flag   # store that value to memory
                ld      mode_names[r3*8], r5
                ld      debug_flag, r15
                bbs     9, r15, loc_7AFC
                addo    4, sp, sp
                st      g0, -4(sp)
                lda     0x1001584, g9
                balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
                .asciz "                        "
                .fill 3, 1, 0
# ---------------------------------------------------------------------------
                ld      -4(sp), g0
                subo    4, sp, sp
                lda     0x1001584, g9
                ld      mode_names_ascii[r3*8], g0
                call    print_mes
loc_7AFC:                               # CODE XREF: ROM:00007AA0↑j
                callx   (r5)
loc_7B00:                               # CODE XREF: ROM:00007A70↑j
                ret
# ---------------------------------------------------------------------------
mode_names:     .long WARNING_INT       # DATA XREF: ROM:00007A90↑r
mode_names_ascii:.long aWarningInt      # DATA XREF: ROM:00007AF0↑r
                .long WARNING_DSP
                .long aWarningDsp       # "WARNING_DSP"
                .long ADV_INT
                .long aAdvInt           # "ADV_INT"
                .long ADV_DSP
                .long aAdvDsp           # "ADV_DSP"
                .long INFO_INT
                .long aInfoInt          # "INFO_INT"
                .long INFO_INT
                .long aInfoDsp          # "INFO_DSP"
                .long SEL_INT
                .long aSelInt           # "SEL_INT"
                .long SEL_DSP
                .long aSelDsp           # "SEL_DSP"
                .long GAME_INT
                .long aGameInt          # "GAME_INT"
                .long GAME_DSP
                .long aGameDsp          # "GAME_DSP"
                .long OVER_INT
                .long aOverInt          # "OVER_INT"
                .long OVER_DSP
                .long aOverDsp          # "OVER_DSP"
                .long ENDING_INT
                .long aEndingInt        # "ENDING_INT"
                .long ENDING_DSP
                .long aEndingDsp        # "ENDING_DSP"
                .long NAME_INT
                .long aNameInt          # "NAME_INT"
                .long NAME_DSP
                .long aNameDsp          # "NAME_DSP"
                .long TEST_INT
                .long aTestInt          # "TEST_INT"
                .long TEST_DSP
                .long aTestDsp          # "TEST_DSP"
                .long RANK_INT
                .long aRankInt          # "RANK_INT"
                .long RANK_DSP
                .long aRankDsp          # "RANK_DSP"
