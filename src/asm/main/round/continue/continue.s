        .section continue
# =============== S U B R O U T I N E =======================================
CONTINUE_INT:                           # DATA XREF: ROM:0000B084↑o
    ld      continue_count, r14 # Label from official source
    addi    1, r14, r15
    st      r15, continue_count
    ld      also_continue_count, r14
    addi    1, r14, r15
    st      r15, also_continue_count
    mov     1, r4
    ld      mod_fa_sampling, r3
    ld      0x0(r3), r5
loc_F0C0:                               # DATA XREF: ROM:00010888↓o
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_coli, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    ld      fa_camera, r3
    lda     check_word3+2, r15
    stib    r15, 0x40(r3)
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobe  2, r14, loc_F10C
loc_F100:                               # DATA XREF: sub_56DEC+11F4↓o
    ldos    rank_mode, r14
    bbs     9, r14, loc_F2E4
loc_F10C:                               # CODE XREF: CONTINUE_INT+74↑j
    ld      not_scr_bg_move, r15
    clrbit  2, r15, r15
    st      r15, not_scr_bg_move
    ld      not_scr_bg_move, r15
    clrbit  3, r15, r15
    st      r15, not_scr_bg_move
    ldob    winner, r14
    cmpobe  1, r14, loc_F14C
    ld      fa_rob0, r3
    b       loc_F154
# ---------------------------------------------------------------------------
loc_F14C:                               # CODE XREF: CONTINUE_INT+B4↑j
    ld      fa_rob1, r3
loc_F154:                               # CODE XREF: CONTINUE_INT+C0↑j
    ld      0x0(r3), r15
    clrbit  0x11, r15, r15
    st      r15, 0x0(r3)
    ld      not_scr_bg_move, r15
    clrbit  4, r15, r15
    st      r15, not_scr_bg_move
    ld      not_scr_bg_move, r15
    clrbit  7, r15, r15
    st      r15, not_scr_bg_move
    ld      not_scr_bg_move, r15
    setbit  0x17, r15, r15
    st      r15, not_scr_bg_move
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r15
    setbit  0x18, r15, r15
    st      r15, 0x0(r3)
    ld      not_scr_bg_move, r15
    bbc     0xB, r15, loc_F1E4
    call    sub_783B4
    ld      0x500240, r15
    clrbit  5, r15, r15
    st      r15, 0x500240
    ldob    0x50004E, r14
    cmpobe  0, r14, loc_F1F4
    b       loc_F234
# ---------------------------------------------------------------------------
loc_F1E4:                               # CODE XREF: CONTINUE_INT+130↑j
    call    save_stats_and_reset_counters
    ld      select0_flag, r15
    bbs     2, r15, loc_F234
loc_F1F4:                               # CODE XREF: CONTINUE_INT+154↑j
    ld      select0_flag, r15
    setbit  2, r15, r15
    st      r15, select0_flag
    ld      select1_flag, r15
    clrbit  2, r15, r15
    st      r15, select1_flag
    ld      not_scr_bg_move, r15
    clrbit  0x13, r15, r15
    st      r15, not_scr_bg_move
    b       loc_F270
# ---------------------------------------------------------------------------
loc_F234:                               # CODE XREF: CONTINUE_INT+158↑j
    ld      select0_flag, r15
    clrbit  2, r15, r15
    st      r15, select0_flag
    ld      select1_flag, r15
    setbit  2, r15, r15
    st      r15, select1_flag
    ld      not_scr_bg_move, r15
    clrbit  0x12, r15, r15
    st      r15, not_scr_bg_move
loc_F270:                               # CODE XREF: CONTINUE_INT+1A8↑j
    ld      mod_fa_effect, r13
    shlo    7, 5, r15
    st      r15, CTRL_TIMER
    lda     703, r15
    stis    r15, ingame_countdown_FFFF # Rename this, it's not always FFFF
    lda     check_word1+2, r15
    stib    r15, draw_vs_routine_flag
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r15
    setbit  0x16, r15, r15
    st      r15, 0x0(r3)
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobe  2, r14, loc_F2CC
    ld      0x0(r3), r15
    clrbit  0x16, r15, r15
    st      r15, 0x0(r3)
loc_F2CC:                               # CODE XREF: CONTINUE_INT+234↑j
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
loc_F2E4:                               # CODE XREF: CONTINUE_INT+80↑j
    ld      not_scr_bg_move, r15
    clrbit  0xD, r15, r15
    st      r15, not_scr_bg_move
    mov     0xA, r15
    stib    r15, mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# End of function CONTINUE_INT
# =============== S U B R O U T I N E =======================================
CONTINUE_DSP:                           # DATA XREF: ROM:0000B08C↑o
    lda     639, r13        # Label from official source
    ld      CTRL_TIMER, r14
    cmpobne r13, r14, loc_F318
loc_F318:                               # CODE XREF: CONTINUE_DSP+C↑j
    lda     check_word1+3, r15
    stib    r15, draw_vs_routine_flag
    ld      INTERUPT_FLAGS_HELD, r8
    ldob    look_char, r14
    cmpobe  1, r14, loc_F34C
    bbs     13, r8, loc_F358
    ld      mod_fa_effect, r7
    b       loc_F358
# ---------------------------------------------------------------------------
loc_F34C:                               # CODE XREF: CONTINUE_DSP+30↑j
    bbs     21, r8, loc_F358
    ld      mod_fa_effect, r7
loc_F358:                               # CODE XREF: CONTINUE_DSP+34↑j
    ld      INTERUPT_FLAGS_MOMENTARY, r8
    mov     1, g0
    ldob    gameprogram, r15 # bit 0 clear = Player 1
    cmpobge 1, r15, loc_F388
    addo    2, g0, g0
    ld      not_scr_bg_move, r15
    clrbit  23, r15, r15
    st      r15, not_scr_bg_move
loc_F388:                               # CODE XREF: CONTINUE_DSP+64↑j
    mov     g0, r15
    call    player_entry
    cmpibne 0, g0, loc_F3D8
    lda     check_word4+2, r15
    stib    r15, draw_vs_routine_flag
    mov     r15, g0
    call    sub_78184
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r15
    clrbit  24, r15, r15
    st      r15, 0x0(r3)
    ld      not_scr_bg_move, r15
    bbs     2, r15, loc_F500
    ld      not_scr_bg_move, r15
    bbs     3, r15, loc_F4DC
loc_F3D8:                               # CODE XREF: CONTINUE_DSP+88↑j
    ld      not_scr_bg_move, r15
    bbc     10, r15, loc_F410
    shlo    7, 5, r15
    st      r15, CTRL_TIMER
    lda     0x2BF, r15
    stis    r15, ingame_countdown_FFFF # Rename this, it's not always FFFF
    ld      not_scr_bg_move, r15
    clrbit  0xA, r15, r15
    st      r15, not_scr_bg_move
loc_F410:                               # CODE XREF: CONTINUE_DSP+D8↑j
    shlo    6, 7, r13
    ld      CTRL_TIMER, r14
    cmpibl  r13, r14, loc_F45C
    ldob    0x50004E, r14
    cmpobe  0, r14, loc_F438
    shlo    8, 7, r13
    and     r13, r8, r3
    b       loc_F440
# ---------------------------------------------------------------------------
loc_F438:                               # CODE XREF: CONTINUE_DSP+120↑j
    shlo    0x10, 7, r13
    and     r13, r8, r3
loc_F440:                               # CODE XREF: CONTINUE_DSP+12C↑j
    cmpobe  0, r3, loc_F45C
    ld      CTRL_TIMER, r15
    lda     -0x40(r15), r15
    st      r15, CTRL_TIMER
loc_F45C:                               # CODE XREF: CONTINUE_DSP+114↑j
    ld      CTRL_TIMER, r14
    cmpi    0, r14
    ble     game_sub_ex     # Subtracts 1 from CTRL_TIMER
cont_over:                              # Label from official source
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r15
    clrbit  0x18, r15, r15
    st      r15, 0x0(r3)
    ld      not_scr_bg_move, r15
    bbc     0xB, r15, loc_F4B8
    ld      not_scr_bg_move, r15
    clrbit  0xC, r15, r15
    st      r15, not_scr_bg_move
    ld      select0_flag, r15
    bbs     2, r15, pl1_conti_alone
    ld      select1_flag, r15
    bbs     2, r15, pl2_conti_alone
loc_F4B8:                               # CODE XREF: CONTINUE_DSP+180↑j
    ld      not_scr_bg_move, r15
    clrbit  0xD, r15, r15
    st      r15, not_scr_bg_move
    mov     0xA, r15
    stib    r15, mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
loc_F4DC:                               # CODE XREF: CONTINUE_DSP+CC↑j
    ld      not_scr_bg_move, r15
    bbs     0xB, r15, vs_conti
    ld      not_scr_bg_move, r15
    setbit  0xD, r15, r15
    st      r15, not_scr_bg_move
    b       pl2_conti_alone
# ---------------------------------------------------------------------------
loc_F500:                               # CODE XREF: CONTINUE_DSP+C0↑j
    ld      not_scr_bg_move, r15
    bbs     0xB, r15, vs_conti
    ld      not_scr_bg_move, r15
    setbit  0xD, r15, r15
    st      r15, not_scr_bg_move
    b       pl1_conti_alone
# ---------------------------------------------------------------------------
vs_conti:                               # CODE XREF: CONTINUE_DSP+1DC↑j
    ld      select0_flag, r15 # Label from official source
    setbit  2, r15, r15
    st      r15, select0_flag
    ld      select1_flag, r15
    setbit  2, r15, r15
    st      r15, select1_flag
    ld      not_scr_bg_move, r15
    clrbit  0xB, r15, r15
    st      r15, not_scr_bg_move
    ld      not_scr_bg_move, r15
    clrbit  5, r15, r15
    st      r15, not_scr_bg_move
    call    set_close
    call    close_obj       # return
    mov     0, r15
    stib    r15, 0x500056
    ld      not_scr_bg_move, r15
    setbit  12, r15, r15
    st      r15, not_scr_bg_move
    ld      not_scr_bg_move, r15
    setbit  0xF, r15, r15
    st      r15, not_scr_bg_move
    mov     6, r3
    stob    r3, mode
    stob    r3, also_mode
    shlo    r3, 1, r4
    st      r4, mode_flag
    b       SEL_INT
# ---------------------------------------------------------------------------
pl1_conti_alone:                        # CODE XREF: MEZASE_DEATHEGG_INT-890↑j
    ld      select0_flag, r15 # Label from Fighting Vipers source
    setbit  2, r15, r15
    st      r15, select0_flag
    ld      select0_flag, r15
    clrbit  0, r15, r15
    st      r15, select0_flag
    ld      select1_flag, r15
    clrbit  2, r15, r15
    st      r15, select1_flag
    mov     0, r15
    stib    r15, gameprogram # bit 0 clear = Player 1
    b       conti_1p_com
# ---------------------------------------------------------------------------
pl2_conti_alone:                        # CODE XREF: MEZASE_DEATHEGG_INT-88C↑j
    ld      select0_flag, r15 # Label from Fighting Vipers source
    clrbit  2, r15, r15
    st      r15, select0_flag
    ld      select1_flag, r15
    clrbit  0, r15, r15
    st      r15, select1_flag
    ld      select1_flag, r15
    setbit  2, r15, r15
    st      r15, select1_flag
    mov     1, r15
    stib    r15, gameprogram # bit 0 clear = Player 1
conti_1p_com:                           # CODE XREF: CONTINUE_DSP+314↑j
    ld      not_scr_bg_move, r15 # Label from Fighting Vipers source
    setbit  5, r15, r15
    st      r15, not_scr_bg_move
    ld      not_scr_bg_move, r15
    setbit  7, r15, r15
    st      r15, not_scr_bg_move
    mov     0, r15
    stib    r15, 0x500056
conti_com:                              # Label from Fighting Vipers source
    ld      not_scr_bg_move, r15
    clrbit  0xB, r15, r15
    st      r15, not_scr_bg_move
    mov     0, r15
    stib    r15, _sub_mode
    call    set_game_setting
# End of function CONTINUE_DSP
