        .section init
ROUND_INIT:                             # CODE XREF: ROM:loc_B8AC↑p
        mov     0, r15
        stib    r15, p1_wins    # set p1_wins to 0
        mov     0, r15
        stib    r15, p2_wins    # set p2_wins to 0
        call    clear_win_lamp_cntr
        ld      mod_fa_game_disp, r3
        ld      0x0(r3), r15
        setbit  30, r15, r15
        st      r15, 0x0(r3)
        clrbit  26, r4, r4
        ldob    STAGE_ID, r3
        subi    1, r3, r3
        ldob    RANDOM_MODE, r4
        cmpo    1, r4           # Compare RANDOM_MODE to 1
        bne     rnd_mode1_ex    # branch if not equal
        cmpo    8, r3           # if RANDOM_MODE = 1 then go here and compare r3 to 8
        ble     rnd_mode1_ex    # Don't randomize after stage 8
        ldob    randomize_story_order[r3], r3 # This only hits if RANDOM_MODE is active
rnd_mode1_ex:                           # CODE XREF: ROUND_INIT+4C↑j
        ldob    STORY_FIGHTER_ORDER[r3*2], r5 # Label from Fighting Vipers source
        ldob    gameprogram, r14 # bit 0 clear = Player 1
        cmpobe  2, r14, loc_B9B4
        ldob    gameprogram, r14 # bit 0 clear = Player 1
        cmpobe  0, r14, loc_B978
        ld      fa_rob1, r3
        ld      fa_rob0, r4
        b       loc_B988
# ---------------------------------------------------------------------------
loc_B978:                               # CODE XREF: ROUND_INIT+7C↑j
        ld      fa_rob0, r3
        ld      fa_rob1, r4
loc_B988:                               # CODE XREF: ROUND_INIT+90↑j
        stob    r5, 0x1B0(r4)
        ldib    0x1B1(r3), r15
        stib    r15, 0x1B0(r3)
        ldob    0x1B0(r3), r13
        ldob    0x1B0(r4), r14
        cmpobne r13, r14, loc_B9B4
        ldob    0x1B0(r3), r14
        cmpoble 0x1A, r14, loc_B9B4
        ldib    0x1B0(r4), r15
        lda     0x1A(r15), r15
        stib    r15, 0x1B0(r4)
loc_B9B4:                               # CODE XREF: ROUND_INIT+70↑j
        mov     0, r3
        stob    r3, curr_round_num
        shlo    0xD, 1, r15
        stis    r15, 0x500432
        ld      fa_rob0, g7
        mov     0, r3
        stob    r3, 4(g7)
        ldib    0x1B0(g7), r15
        stib    r15, 0x1B1(g7)
        ldob    0x1B1(g7), r14
        cmpobg  0x1A, r14, loc_B9FC
        ldib    0x1B1(g7), r15
        lda     -0x1A(r15), r15
        stib    r15, 0x1B1(g7)
loc_B9FC:                               # CODE XREF: ROUND_INIT+104↑j
        lda     array_of_floats, r15
        st      r15, 0x1D00(g7)
        lda     0x50A284, r15
        st      r15, 0x1D04(g7)
        lda     0x50A288, r15
        st      r15, 0x1D08(g7)
        lda     0x506000, r15
        st      r15, 0x1D0C(g7)
        lda     0x506400, r15
        st      r15, 0x1D10(g7)
        lda     0x506480, r15
        st      r15, 0x1D14(g7)
        lda     0x506580, r15
        st      r15, 0x1D18(g7)
        lda     0x506680, r15
        st      r15, 0x1D1C(g7)
        lda     0x5066C0, r15
        st      r15, 0x1D20(g7)
        lda     0xC0000000, r15
        st      r15, 0x18(g7)
        lda     displacement, r15
        st      r15, 0x1C(g7)
        lda     displacement, r15
        st      r15, 0x20(g7)
        mov     0, r15
        stis    r15, 0x26(g7)
        lda     action_init, r15
        st      r15, 0xC(g7)
        mov     0, r15
        stib    r15, 0x2A(g7)
        mov     0, r15
        stis    r15, 0x624(g7)
        ld      0x0(g7), r3
        lda     0xFF000000, r4
        and     r4, r3, r3
        setbit  0x1F, r3, r3
        st      r3, 0x0(g7)
        mov     1, r4
        ld      mod_fa_osage0_1, r3
        ld      0x0(r3), r5
        setbit  0x1F, r5, r5
        st      r5, 0x0(r3)
        lda     osage_init, r5
        st      r5, 0xC(r3)
        lda     0xC0000000, r4
        lda     displacement, r5
        lda     displacement, r6
        ldos    0x500432, r7
        lda     0x800101, r15
        st      r15, (g11)[g12*1]
        lda     0x1800303, r15 # 0x000000
        st      r15, (g11)[g12*1]
        lda     0x4800909, r15
        st      r15, (g11)[g12*1]
        st      r7, (g11)[g12*1]
        lda     0x14802929, r15
        st      r15, (g11)[g12*1]
        st      r4, (g11)[g12*1]
        st      r5, (g11)[g12*1]
        st      r6, (g11)[g12*1]
        ld      (g11)[g12*1], r4
        ld      (g11)[g12*1], r5
        ld      (g11)[g12*1], r6
        lda     0x1000202, r15
        st      r15, (g11)[g12*1]
        stt     r4, 0x18(g7)
        shlo    0xE, 1, r13
        subi    r13, r7, r15
        stos    r15, 0x26(g7)
        ld      fa_rob1, g7
        mov     1, r3
        stob    r3, 4(g7)
        ldib    0x1B0(g7), r15
        stib    r15, 0x1B1(g7)
        ldob    0x1B1(g7), r14
        cmpobg  0x1A, r14, loc_BBC8
        ldib    0x1B1(g7), r15
        lda     -0x1A(r15), r15
        stib    r15, 0x1B1(g7)
loc_BBC8:                               # CODE XREF: ROUND_INIT+2D0↑j
        lda     cb_r_1, r15
        st      r15, 0x1D00(g7)
        lda     cb_mul_R, r15   # cb = collission ball
        st      r15, 0x1D04(g7)
        lda     0x50A310, r15
        st      r15, 0x1D08(g7)
        lda     pos_00_x, r15
        st      r15, 0x1D0C(g7)
        lda     0x506440, r15
        st      r15, 0x1D10(g7)
        lda     0x506500, r15
        st      r15, 0x1D14(g7)
        lda     0x506600, r15
        st      r15, 0x1D18(g7)
        lda     0x5066A0, r15
        st      r15, 0x1D1C(g7)
        lda     0x5066D0, r15
        st      r15, 0x1D20(g7)
        lda     0x40000000, r15
        st      r15, 0x18(g7)
        lda     displacement, r15
        st      r15, 0x1C(g7)
        lda     displacement, r15
        st      r15, 0x20(g7)
        mov     0, r15
        stis    r15, 0x26(g7)
        lda     action_init, r15
        st      r15, 0xC(g7)
        mov     0, r15
        stib    r15, 0x2A(g7)
        mov     0, r15
        stis    r15, 0x624(g7)
        ld      0x0(g7), r3
        lda     0xFF000000, r4
        and     r4, r3, r3
        setbit  0x1F, r3, r3
        st      r3, 0x0(g7)
        mov     1, r4
        ld      mod_fa_osage0_2, r3
        ld      0x0(r3), r5
        setbit  0x1F, r5, r5
        st      r5, 0x0(r3)
        lda     osage_init, r5
        st      r5, 0xC(r3)
        lda     0x40000000, r4
        lda     displacement, r5
        lda     displacement, r6
        ldos    0x500432, r7
        lda     0x800101, r15
        st      r15, (g11)[g12*1]
        lda     0x1800303, r15 # 0x000000
        st      r15, (g11)[g12*1]
        lda     0x4800909, r15
        st      r15, (g11)[g12*1]
        st      r7, (g11)[g12*1]
        lda     0x14802929, r15
        st      r15, (g11)[g12*1]
        st      r4, (g11)[g12*1]
        st      r5, (g11)[g12*1]
        st      r6, (g11)[g12*1]
        ld      (g11)[g12*1], r4
        ld      (g11)[g12*1], r5
        ld      (g11)[g12*1], r6
        lda     0x1000202, r15
        st      r15, (g11)[g12*1]
        stt     r4, 0x18(g7)
        shlo    0xE, 1, r13
        addi    r13, r7, r15
        stos    r15, 0x26(g7)
        mov     1, r4
        ld      fa_camera, r3
        ld      0x0(r3), r5
        setbit  0x1F, r5, r5
        st      r5, 0x0(r3)
        call    efc_rob_poly_para_init
        call    set_vs_cnt_and_stage_num_sel
        ret
# End of function ROUND_INIT

                .section int
ROUND_INT:                              # DATA XREF: ROM:0000AFF4↑o
        ld      not_scr_bg_move, r15 # Label from official source
        clrbit  27, r15, r15
        st      r15, not_scr_bg_move
        ldob    stage_num, r3
        lda     stage8, r4
        cmpobne r3, r4, loc_C388 # Branch if LEVEL_ID not equal to 8
        ld      not_scr_bg_move, r15
        setbit  27, r15, r15
        st      r15, not_scr_bg_move
loc_C388:                               # CODE XREF: ROUND_INT+24↑j
        lda     0xA00001, g0
        call    check_same_sound
        call    sound_request_u
        ld      not_scr_bg_move, r15
        clrbit  23, r15, r15
        st      r15, not_scr_bg_move
        ldis    val_vs_energy_max, r15
        stis    r15, energy_max
        ldob    gameprogram, r14 # bit 0 clear = Player 1
        cmpobl  1, r14, loc_C3D8
        ldis    val_1p_energy_max, r15
        stis    r15, energy_max
loc_C3D8:                               # CODE XREF: ROUND_INT+78↑j
        mov     0, r15
        stis    r15, 0x50A022
        shlo    0xD, 1, r15
        stis    r15, 0x500432
        mov     1, r4
        ld      mod_fa_control0, r3
        ld      0x0(r3), r5
        setbit  31, r5, r5
        st      r5, 0x0(r3)
        lda     control_init, r5 # Executes once at start of char sel, once at the start of the vs screen, then once every frame of gameplay once the map is loaded.
        st      r5, 0xC(r3)
        ld      mod_fa_coli, r3
        ld      0x1B0(r3), r15
        setbit  9, r15, r15
        st      r15, 0x1B0(r3)
        mov     1, r4
        ld      mod_fa_coli, r3
        ld      0x0(r3), r5
        setbit  0x1F, r5, r5
        st      r5, 0x0(r3)
        lda     coli_init, r5
        st      r5, 0xC(r3)
        mov     1, r4
        ld      mod_fa_game_info, r3
        ld      0x0(r3), r5
        setbit  0x1F, r5, r5
        st      r5, 0x0(r3)
        lda     get_game_info, r5
        st      r5, 0xC(r3)
        mov     1, r4
        ld      mod_fa_effect, r3
        ld      0x0(r3), r5
        setbit  0x1F, r5, r5
        st      r5, 0x0(r3)
        lda     fa_effect, r5
        st      r5, 0xC(r3)
        mov     1, r4
        ld      mod_fa_tobi, r3 # Projectile (tobi = flight)
        ld      0x0(r3), r5
        setbit  0x1F, r5, r5
        st      r5, 0x0(r3)
        lda     fa_tobi, r5     # Projectile (tobi = flight)
        st      r5, 0xC(r3)
        mov     1, r4
        ld      mod_fa_win0, r3
        ld      0x0(r3), r5
        clrbit  0x1F, r5, r5
        st      r5, 0x0(r3)
        mov     1, r4
        ld      mod_fa_win1, r3
        ld      0x0(r3), r5
        clrbit  0x1F, r5, r5
        st      r5, 0x0(r3)
        lda     0xA00350, g0
        call    sound_request_u
        lda     0x438C0000, r15
        st      r15, focus_dist_x
        lda     0x438C0000, r15
        st      r15, focus_dist_y
        call    window_data_init
        call    sub_C738
        call    sub_78218
        lda     displacement1, r15
        stib    r15, draw_vs_routine_flag # loc_7B2EC
        ld      mod_fa_game_disp, r3
        ld      0x0(r3), r4
        ldos    energy_max, r15
        setbit  28, r4, r4
        stos    r15, 0x44(r3)
        stos    r15, 0x46(r3)
        st      r4, 0x0(r3)
        ld      mod_fa_sound, r3
        ld      0x0(r3), r4
        setbit  30, r4, r4
        setbit  29, r4, r4
        st      r4, 0x0(r3)
        call    efc_ram_init
        call    voice_init      # return
        ld      mod_fa_game_disp, r3
        ld      0x0(r3), r4
        setbit  7, r4, r4
        setbit  3, r4, r4
        st      r4, 0x0(r3)
        ldob    gameprogram, r14 # bit 0 clear = Player 1
        cmpobl  1, r14, loc_C5B8
        ldib    p1_match_count_ingame, r15
        stib    r15, num_rounds_to_win
        ldob    STAGE_ID, r14
        cmpobg  10, r14, loc_C5C8
        b       loc_C5C8
# ---------------------------------------------------------------------------
loc_C5B8:                               # CODE XREF: ROUND_INT+248↑j
        ldib    vs_match_count_ingame, r15
        stib    r15, num_rounds_to_win
loc_C5C8:                               # CODE XREF: ROUND_INT+264↑j
        mov     0, r15
        stis    r15, game_timer
        mov     0, r15
        st      r15, 0x500434
        mov     1, r15
        stib    r15, curr_round_num
        mov     0, r15
        stib    r15, p1_wins
        mov     0, r15
        stib    r15, p2_wins
        call    clear_win_lamp_cntr
        ld      not_scr_bg_move, r15
        clrbit  1, r15, r15
        st      r15, not_scr_bg_move
        ldob    curr_round_num, r15
        cmpobne 1, r15, loc_C720
        ld      0x5004C0, r15
        bbs     0, r15, loc_C708
        mov     1, r4
        ld      mod_fa_obj0, r3
        ld      0x0(r3), r5
        setbit  0x1F, r5, r5
        st      r5, 0x0(r3)
        lda     object_init, r5
        st      r5, 0xC(r3)
        ld      mod_fa_obj0, r3
        mov     0, r15
        stis    r15, 6(r3)
        ldob    stage_num, r4
        mov     9, r5
        cmpobe  r4, r5, loc_C720
        ld      fa_rob0, r4
        ldob    0x1B1(r4), r5
        ldos    CHAR_INTRO_ACTIONS[r5*2], r5
        cmpobe  0, r5, loc_C694
        st      r5, 0x194(r4)   # Write P1 Intro
loc_C694:                               # CODE XREF: ROUND_INT+340↑j
        ld      fa_rob1, r4
        ldob    0x1B1(r4), r5
        ldos    CHAR_INTRO_ACTIONS[r5*2], r5
        cmpobe  0, r5, loc_C6B0
        st      r5, 0x194(r4)   # Write P2 intro
loc_C6B0:                               # CODE XREF: ROUND_INT+35C↑j
        b       loc_C720
# ---------------------------------------------------------------------------
un_self_destruct:                       # Unreachable code
        ldob    gameprogram, r14
        cmpobne 0, r14, loc_C6DC
        ld      fa_rob0, r4
        ldob    0x1B1(r4), r5
        ldos    motions_518[r5*2], r5
        cmpobe  0, r5, loc_C6DC
        st      r5, 0x194(r4)
loc_C6DC:                               # CODE XREF: ROUND_INT+370↑j
        ldob    gameprogram, r14 # bit 0 clear = Player 1
        cmpobne 1, r14, loc_C704
        ld      fa_rob1, r4
        ldob    0x1B1(r4), r5
        ldos    motions_518[r5*2], r5
        cmpobe  0, r5, loc_C704
        st      r5, 0x194(r4)
loc_C704:                               # CODE XREF: ROUND_INT+398↑j
        b       loc_C720
# ---------------------------------------------------------------------------
loc_C708:                               # CODE XREF: ROUND_INT+2E4↑j
        mov     1, r4
        ld      mod_fa_coli, r3
        ld      0x0(r3), r5
        clrbit  0x1F, r5, r5
        st      r5, 0x0(r3)
loc_C720:                               # CODE XREF: ROUND_INT+2D8↑j
        ldib    _sub_mode, r15
        lda     2(r15), r15
        stib    r15, _sub_mode
        b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# End of function ROUND_INT
# =============== S U B R O U T I N E =======================================
sub_C738:                               # CODE XREF: BUNRI_INT+50↑p
        call    scr_bg_int
        call    sub_81038
        call    sub_7F0E8       # Inits player bodies
        call    scale_something
        movt    0, g0
        movt    0, g4
        ld      fa_rob0, r3
        ld      fa_rob1, r7
        lda     0x1F88(r3), g3
        call    sub_7F408
        lda     0x1F88(r7), g3
        call    sub_7F408
        lda     0x1FEC(r3), g3
        call    sub_7F408
        lda     0x1FEC(r7), g3
        call    sub_7F408
        mov     0, r4
        st      r4, 0x219C(r3)
        st      r4, 0x219C(r7)
        lda     0x2758(r3), g3
        call    write_scale
        lda     0x2758(r7), g3
        call    write_scale
        ret
# End of function sub_C738
# =============== S U B R O U T I N E =======================================
ROUND_DSP:                              # DATA XREF: ROM:0000AFFC↑o
        ldib    _sub_mode, r15  # Label from official source
        lda     1(r15), r15
        stib    r15, _sub_mode
        b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------

        .section states
# ---------------------------------------------------------------------------
ROUND_STATE:
        .long ROUND_MASK_INT    # DATA XREF: ROM:0000B7AC↓r
ROUND_STATE_NAMES:
        .long aRoundMaskInt   # DATA XREF: ROM:0000B80C↓r
        .long ROUND_MASK_DSP
        .long aRoundMaskDsp     # "ROUND_MASK_DSP"
        .long ROUND_INT
        .long aRoundInt         # "ROUND_INT"
        .long ROUND_DSP
        .long aRoundDsp         # "ROUND_DSP"
        .long SET_INT
        .long aSetInt           # "SET_INT"
        .long SET_DSP
        .long aSetDsp           # "SET_DSP"
        .long READY_INT
        .long aReadyInt         # "READY_INT"
        .long READY_DSP
        .long aReadyDsp         # "READY_DSP"
        .long FIGHT_INT
        .long aFightInt         # "FIGHT_INT"
        .long FIGHT_DSP
        .long aFightDsp         # "FIGHT_DSP"
        .long JUDGE_INT
        .long aJudgeInt         # "JUDGE_INT"
        .long JUDGE_WAIT
        .long aJudgeWait        # "JUDGE_WAIT"
        .long JUDGE_DSP_INT
        .long aJudgeDspInt      # "JUDGE_DSP_INT"
        .long JUDGE_DSP
        .long aJudgeDsp         # "JUDGE_DSP"
        .long VIC_INT
        .long aVicInt           # "VIC_INT"
        .long VIC_DSP
        .long aVicDsp           # "VIC_DSP"
        .long REPLAY_INT
        .long aReplayInt        # "REPLAY_INT"
        .long REPLAY_DSP
        .long aReplayDsp        # "REPLAY_DSP"
        .long INTRUDE_INT
        .long aIntrudeInt       # "INTRUDE_INT"
        .long INTRUDE_DSP
        .long aIntrudeDsp       # "INTRUDE_DSP"
        .long CONTINUE_INT
        .long aContinueInt      # "CONTINUE_INT"
        .long CONTINUE_DSP
        .long aContinueDsp      # "CONTINUE_DSP"
        .long REP_WAZA_INT      # "REPLAY TECHNIQUE" Int
        .long aRepWazaInt       # "REP_WAZA_INT"
        .long REP_WAZA_DSP      # "REPLAY TECHNIQUE" Display
        .long aRepWazaDsp       # "REP_WAZA_DSP"
        .long WIN_CLOSE_INT
        .long aWinCloseInt      # "WIN_CLOSE_INT"
        .long WIN_CLOSE_DSP
        .long aWinCloseDsp      # "WIN_CLOSE_DSP"
        .long STAGE_UP_INT
        .long aStageUpInt       # "STAGE_UP_INT"
        .long STAGE_UP_DSP
        .long aStageUpDsp       # "STAGE_UP_DSP"
        .long BUNRI_INT         # This is the UFO EGGMAN clone cutscene
        .long aBunriInt         # "BUNRI_INT"
        .long BUNRI_DSP
        .long aBunriDsp         # "BUNRI_DSP"
        .long MEZASE_DEATHEGG_MASK_INT # mezase = "go toward"
        .long aMezaseDeathegg   # "MEZASE_DEATHEGG_MASK_INT"
        .long MEZASE_DEATHEGG_MASK_DSP # mezase = "go toward"
        .long aMezaseDeathegg_0 # "MEZASE_DEATHEGG_MASK_DSP"
        .long MEZASE_DEATHEGG_INT # mezase = "go toward"
        .long aMezaseDeathegg_1 # "MEZASE_DEATHEGG_INT"
        .long MEZASE_DEATHEGG_DSP # mezase = "go toward"
        .long aMezaseDeathegg_2 # "MEZASE_DEATHEGG_DSP"
