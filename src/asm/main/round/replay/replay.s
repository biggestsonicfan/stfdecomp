        .section replay
REPLAY_INT:                             # DATA XREF: ROM:0000B064↑o
    lda     0x1000000, g9   # Label from official source
    addo    0x1F, 0x1F, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r15
    setbit  30, r15, r15
    st      r15, 0x0(r3)
    lda     0xA00003, g0    # Weird audio that doesn't exist
    call    check_same_sound
    call    sound_request_u
    call    sub_81038
    call    sub_81AFC
    call    ring_tobitiri_init # Ring Scatter
    lda     0x3F800000, r15
    st      r15, 0x50A004
    ld      fa_rob0, r3
    mov     0, r15
    stis    r15, 0xC60(r3)
    ld      fa_rob1, r3
    mov     0, r15
    stis    r15, 0xC60(r3)
    mov     1, r4
    ld      fa_rob0, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      fa_rob1, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_control0, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_play, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     play_init, r5
    st      r5, 0xC(r3)
    mov     1, r4
    ld      mod_fa_key_play, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_key_record, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_enemy0, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_sampling, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_enemy1, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_coli, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     0, r15
    stib    r15, 0x500446
    mov     0, r15
    stib    r15, 0x500447
    ld      mod_fa_control0, r3
    ld      0x0(r3), r15
    clrbit  0, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  1, r15, r15
    st      r15, 0x0(r3)
    mov     1, r4
    lda     0x1000700, g9
    shlo    6, 1, g0
    mov     0x18, g1
    call    clr_pattern_s
    ld      fa_camera, r3
    lda     cam_mode34, r15
    stib    r15, 0x40(r3)
    ld      fa_rob0, r7
    ld      fa_rob1, r8
    ld      not_scr_bg_move, r15
    bbs     1, r15, loc_E108
    ldob    0x50004D, r14
    cmpobe  0, r14, loc_E120
    mov     r8, r15
    mov     r7, r8
loc_E100:                               # DATA XREF: nameentry_init+90↓o
    mov     r15, r7
    b       loc_E120
# ---------------------------------------------------------------------------
loc_E108:                               # CODE XREF: ROUND_DSP+1928↑j
    ldob    0x50004E, r14
    cmpobe  0, r14, loc_E120
    mov     r8, r15
    mov     r7, r8
    mov     r15, r7
loc_E120:                               # CODE XREF: ROUND_DSP+1934↑j
    ld      mod_fa_play, r3
    ld      not_scr_bg_move, r15
    bbs     4, r15, loc_E150
    ldob    0x500050, r14
    cmpobe  2, r14, loc_E150
    ldob    0x50004D, r14
    cmpobe  2, r14, loc_E150
    b       loc_E19C
# ---------------------------------------------------------------------------
loc_E150:                               # CODE XREF: ROUND_DSP+1970↑j
    mov     0xE, r15
    stib    r15, _sub_mode
    mov     1, r4
    ld      mod_fa_play, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_coli, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     coli_init, r5
    st      r5, 0xC(r3)
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
loc_E19C:                               # CODE XREF: ROUND_DSP+198C↑j
    shlo    7, 5, r11
    st      r11, replay_countdown
    ldob    stage_num, r3
    lda     displacement2, r4
    cmpobe  r3, r4, loc_E1D0
    ld      fa_camera, r3
    ld      0x0(r3), r15
    setbit  0xE, r15, r15
    st      r15, 0x0(r3)
loc_E1D0:                               # CODE XREF: ROUND_DSP+19F8↑j
    ld      mod_fa_obj0, r11
    ldos    0x50045C, r3
    lda     0xEF, r13
    subi    r13, r3, r3
    cmpible 0, r3, loc_E1F0
    mov     0, r3
loc_E1F0:                               # CODE XREF: ROUND_DSP+1A28↑j
    stos    r3, 6(r11)
    lda     check_word2, r15
    stib    r15, draw_vs_routine_flag
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
game_sub_ex:                            # CODE XREF: ROM:0000B8DC↑j
    ld      CTRL_TIMER, r15 # Label from official source
    lda     -1(r15), r15
    st      r15, CTRL_TIMER
    ret
# End of function ROUND_DSP
# =============== S U B R O U T I N E =======================================
REPLAY_DSP:                             # DATA XREF: ROM:0000B06C↑o
    ld      mod_fa_game_disp, r3 # Label from official source
    ld      0x0(r3), r15
    setbit  0x1E, r15, r15
    st      r15, 0x0(r3)
    lda     check_word2+1, r15
    stib    r15, draw_vs_routine_flag
    mov     0, r15
    st      r15, CTRL_TIMER
    ld      mod_fa_play, r3
    ld      0x0(r3), r3
    bbc     0x1F, r3, loc_E2A0
    ldos    replay_countdown, r14
    cmpobe  0, r14, loc_E2A0
    ldis    replay_countdown, r15
    lda     -1(r15), r15
    stis    r15, replay_countdown
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
loc_E2A0:                               # CODE XREF: REPLAY_DSP+3C↑j
    ld      mod_fa_control0, r3
    mov     1, r4
    ld      mod_fa_key_play, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_play, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_enemy0, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_enemy1, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_coli, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     coli_init, r5
    st      r5, 0xC(r3)
    ld      not_scr_bg_move, r13
    clrbit  17, r13, r13
    st      r13, not_scr_bg_move
    lda     0x3CCE9ED5, r15
    st      r15, 0x50A000
    ld      fa_camera, r3
    ld      0x0(r3), r15
    clrbit  0xE, r15, r15
    st      r15, 0x0(r3)
    mov     0xE, r15
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# End of function REPLAY_DSP
