        .section seeeegaaaaaa
# ---------------------------------------------------------------------------
ADV_SEGA_PIC_INT:                       # CODE XREF: ROM:00008624↑j
    ld      not_scr_bg_move, r15 # Label from official source
    setbit  0x10, r15, r15
    st      r15, not_scr_bg_move
    lda     0xA00003, g0    # Weird audio that doesn't exist
    call    check_same_sound
    call    sound_request_u
    lda     0xA00360, g0    # Weird audio that doesn't exist
    call    check_same_sound
    call    sound_request_u
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r4
    setbit  0x1E, r4, r4
    setbit  0x17, r4, r4
    clrbit  0x14, r4, r4
    setbit  0x19, r4, r4
    st      r4, 0x0(r3)
    addo    31, 19, g0      # Set CG for Sega Logo (2x value of CG)
    call    _Scroll_Initialize
    lda     0x1000000, g9
    shlo    6, 1, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    lda     0x1004000, g9
    shlo    6, 1, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    mov     0, r15
    stis    r15, scrB_H_page
    mov     0, r15
    stis    r15, scrB_V_page
    lda     0x1004000, g9
    lda     175, g0         # Fullscreen Sega logo texture
    call    dsp_pattern_new
    ld      not_scr_bg_move, r15
    setbit  0xE, r15, r15
    st      r15, not_scr_bg_move
    ld      POLYGON_DISP, r15
    clrbit  0, r15, r15
    st      r15, POLYGON_DISP
    mov     1, r4
    ld      mod_fa_coli, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_enemy0, r3
    ld      0x0(r3), r5     # r5 = mod_fa_enemy0_add
    clrbit  31, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_enemy1, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_control0, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    ld      fa_rob0, r4
    ld      replay_bank_adr, r5
    ldob    0xC(r5), r3     # r3 = REPLAY_BANK_ADR_value+0xC
    stob    r3, 0x1B0(r4)   # store r3 to P1_PARTS+0x1B0
    ldib    0xFFF(r5), r15  # r15 = REPLAY_BANK_ADR_value+0xFFE
    stib    r15, 0x6CC(r4)  # store r15 to P1_PARTS+0x6CC
    ld      fa_rob1, r4
    ldob    0x10(r5), r3    # r3 = REPLAY_BANK_ADR_value+0x10
    stob    r3, 0x1B0(r4)   # store r3 to P2_PARTS+0x1B
    ldib    0xFFE(r5), r15  # r15 = REPLAY_BANK_ADR_value+0xFFE
    stib    r15, 0x6CC(r4)  # store r15 to P2_PARTS+0x6CC
    ld      fa_rob0, r4
    mov     0xA, r15
    stib    r15, 0x1B0(r4)  # store r3 to P1_PARTS+0x1B0 (This makes P1 Bean for some reason)
    ld      fa_rob1, r4
    addo    0x1F, 5, r15    # r15 = 0x24
    stib    r15, 0x1B0(r4)
    ld      fa_rob0, g7     # store r3 to P2_PARTS+0x1B0
    mov     0, r3
    stob    r3, 4(g7)
    ldib    0x1B0(g7), r15
    stib    r15, 0x1B1(g7)
    ldob    0x1B1(g7), r14
    cmpobg  0x1A, r14, loc_88D0
    ldib    0x1B1(g7), r15
    lda     -0x1A(r15), r15
    stib    r15, 0x1B1(g7)
loc_88D0:                               # CODE XREF: ROM:000088BC↑j
    lda     array_of_floats, r15
    st      r15, loc_1D00(g7)
    lda     0x50A284, r15
    st      r15, loc_1D04(g7)
    lda     0x50A288, r15
    st      r15, loc_1D08(g7)
    lda     0x506000, r15
    st      r15, loc_1D0C(g7)
    lda     0x506400, r15
    st      r15, loc_1D10(g7)
    lda     0x506480, r15
    st      r15, loc_1D14(g7)
    lda     0x506580, r15
    st      r15, loc_1D18(g7)
    lda     0x506680, r15
    st      r15, loc_1D1C(g7)
    lda     0x5066C0, r15
    st      r15, loc_1D20(g7)
    lda     0xC0000000, r15
    st      r15, 0x18(g7)
    lda     displacement, r15 # Again, it wants the SAT pointer
    st      r15, 0x1C(g7)
    lda     displacement, r15
    st      r15, 0x20(g7)
    shlo    0xE, 3, r15
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
    ld      fa_rob1, g7
    mov     1, r3
    stob    r3, 4(g7)
    ldib    0x1B0(g7), r15
    stib    r15, 0x1B1(g7)
    ldob    0x1B1(g7), r14
    cmpobg  0x1A, r14, loc_8A14
    ldib    0x1B1(g7), r15
    lda     -0x1A(r15), r15
    stib    r15, 0x1B1(g7)
loc_8A14:                               # CODE XREF: ROM:loc_8A00↑j
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
    shlo    0xE, 1, r15
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
    call    efc_ram_init
    ld      debug_flag, r15
    setbit  16, r15, r15    # set bit 16 debug
    st      r15, debug_flag
    mov     1, r4
    ld      mod_fa_obj0, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     object_init, r5
    st      r5, 0xC(r3)
    lda     start_ip_add+3, r3
    stob    r3, stage_num
    lda     0x41000000, r15
    st      r15, stage_x
    call    change_scene
    shlo    6, 3, r15
    st      r15, CTRL_TIMER
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    ret
# =============== S U B R O U T I N E =======================================
ADV_SEGA_PIC_DSP:                       # DATA XREF: ROM:00007F38↑o
    ld      not_scr_bg_move, r15 # Label from official source
    setbit  0x10, r15, r15
    st      r15, not_scr_bg_move
    ld      CTRL_TIMER, r5
    subi    1, r5, r5
    st      r5, CTRL_TIMER
    cmpobne 0x14, r5, loc_8BE4
    call    fill_haikei_makkuro_1 # fill background(haikei) pitch black(makkuro)
    mov     0, g0
    call    bg_col_set
loc_8BE4:                               # CODE XREF: ADV_SEGA_PIC_DSP+28↑j
    shlo    6, 3, r13
    cmpibne r13, r5, loc_8BEC
loc_8BEC:                               # CODE XREF: ADV_SEGA_PIC_DSP+3C↑j
    cmpibl  0, r5, loc_8C04
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
loc_8C04:                               # CODE XREF: ADV_SEGA_PIC_DSP:loc_8BEC↑j
    ret
# End of function ADV_SEGA_PIC_DSP
