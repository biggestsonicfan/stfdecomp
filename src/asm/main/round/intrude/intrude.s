        .section intrude
# =============== S U B R O U T I N E =======================================
INTRUDE_INT:                            # DATA XREF: ROM:0000B074↑o
    subo    1, 0, r3        # Label from official source
    st      r3, 0x500498
    ld      mod_fa_sound, r3
    ld      0x0(r3), r4
    clrbit  0x1D, r4, r4
    setbit  0x1C, r4, r4
    st      r4, 0x0(r3)
    call    write_intrude_times
    lda     0xA00003, g0    # Weird audio that doesn't exist
    call    check_same_sound
    call    sound_request_u
    lda     0xAE1302, g0    # sd_gong_4
    call    sound_request_u
    ld      mod_fa_control0, r3
    ld      0x0(r3), r15
    clrbit  0, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  1, r15, r15
    st      r15, 0x0(r3)
    shlo    6, 1, r15
    st      r15, CTRL_TIMER
    lda     check_word1+1, r15
    stib    r15, draw_vs_routine_flag
    ld      not_scr_bg_move, r15
    clrbit  5, r15, r15
    st      r15, not_scr_bg_move
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r4
    clrbit  0x1B, r4, r4
    setbit  5, r4, r4
    st      r4, 0x0(r3)
    mov     0xC, r3
    ldob    COIN_INTERUPT_FLAGS, r14 # 0x00 = INSERT COINS
    andnot  r3, r14, r14
    stob    r14, COIN_INTERUPT_FLAGS # 0x00 = INSERT COINS
    mov     0, r15
    stis    r15, 0x100A000
    mov     0, r15
    stis    r15, 0x100A008
    lda     0x1000700, g9
    addo    0x1F, 0x1F, g0
    mov     0x18, g1
    call    clr_pattern_s
    lda     0x100C000, r14
    mov     0, r15
    shlo    0xB, 1, r13
loc_EFA8:                               # CODE XREF: INTRUDE_INT+10C↓j
    stis    r15, (r14)
    addo    2, r14, r14
    cmpdeco 1, r13, r13
    bl      loc_EFA8
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# End of function INTRUDE_INT
# =============== S U B R O U T I N E =======================================
INTRUDE_DSP:                            # DATA XREF: ROM:0000B07C↑o
    ld      fa_rob0, r3     # Label from official source
    ld      fa_rob1, r4
    ld      0x0(r3), r15
    setbit  0x11, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r4), r15
    setbit  0x11, r15, r15
    st      r15, 0x0(r4)
    ld      CTRL_TIMER, r15
    bbs     2, r15, loc_F008
    b       loc_F008
# ---------------------------------------------------------------------------
loc_F008:                               # CODE XREF: INTRUDE_DSP+30↑j
    ld      CTRL_TIMER, r14
    cmpibl  0, r14, game_sub_ex # Subtracts 1 from CTRL_TIMER
    ld      not_scr_bg_move, r15
    clrbit  0x10, r15, r15
    st      r15, not_scr_bg_move
    call    set_close
    call    close_obj       # return
    mov     0, r15
    stib    r15, 0x500056
    ld      not_scr_bg_move, r15
    setbit  0xF, r15, r15
    st      r15, not_scr_bg_move
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r15
    setbit  6, r15, r15
    st      r15, 0x0(r3)
    mov     6, r3
    stob    r3, mode
    stob    r3, also_mode
    shlo    r3, 1, r4
    st      r4, mode_flag
    b       SEL_INT
# End of function INTRUDE_DSP
