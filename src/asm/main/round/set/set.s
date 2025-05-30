        .section set
SET_INT:                                # DATA XREF: ROM:0000B004↑o
    mov     1, r4           # Label from official source
    ld      mod_fa_tobi, r3 # Projectile (tobi = flight)
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     fa_tobi, r5     # Projectile (tobi = flight)
    st      r5, 0xC(r3)
    lda     0x1000000, g9
    shlo    6, 1, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    lda     0xA00003, g0    # Weird audio that doesn't exist
    call    check_same_sound
    call    sound_request_u
    call    sub_81038
    call    sub_81AFC
    call    ring_tobitiri_init # Ring Scatter
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
    mov     0, r15
    stib    r15, 0x1A18(r3)
    mov     0, r15
    stib    r15, 0x1A18(r7)
    ldob    curr_round_num, r15
    cmpobe  1, r15, loc_CC74
    shlo    0xE, 1, r13
    ldos    0x500432, r14
    addi    r13, r14, r15
    stos    r15, 0x500432
    ld      fa_rob0, g7
    mov     0, r3
    stob    r3, 4(g7)
    ldib    0x1B0(g7), r15
    stib    r15, 0x1B1(g7)
    ldob    0x1B1(g7), r14
    cmpobg  0x1A, r14, loc_C90C
    ldib    0x1B1(g7), r15
    lda     -0x1A(r15), r15
    stib    r15, 0x1B1(g7)
loc_C90C:                               # CODE XREF: ROUND_DSP+138↑j
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
    cmpobg  0x1A, r14, loc_CAD8
    ldib    0x1B1(g7), r15
    lda     -0x1A(r15), r15
    stib    r15, 0x1B1(g7)
loc_CAD8:                               # CODE XREF: ROUND_DSP+304↑j
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
loc_CC74:                               # CODE XREF: ROUND_DSP+100↑j
    mov     1, r4
    ld      mod_fa_play, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    ld      fa_camera, r3
    ld      0x0(r3), r15
    setbit  0xE, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    setbit  1, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    setbit  2, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  0xF, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  0x10, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  0x11, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  0x12, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  0x13, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  0x14, r15, r15
    st      r15, 0x0(r3)
    mov     0, r15
    stis    r15, 0x28(r3)
    lda     displacement, r15
    st      r15, stage_xpos
    call    shifts_graphics_somehow
    call    sub_31AD0
    lda     displacement2, r15
    stib    r15, draw_vs_routine_flag # sub_7B380
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    ld      not_scr_bg_move, r15
    clrbit  0, r15, r15
    st      r15, not_scr_bg_move
    ldob    curr_round_num, r3
    shlo    7, 1, r15
    st      r15, CTRL_TIMER
    cmpobe  1, r3, loc_CD7C
    shlo    6, 1, r15
    st      r15, CTRL_TIMER
loc_CD7C:                               # CODE XREF: ROUND_DSP+5AC↑j
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r4
    setbit  28, r4, r4
    setbit  27, r4, r4
    setbit  25, r4, r4
    st      r4, 0x0(r3)
    call    init_rep_ram
    ld      not_scr_bg_move, r15
    clrbit  24, r15, r15
    st      r15, not_scr_bg_move
    ld      fa_camera, r4
    mov     0, r15
    stib    r15, 0x2D4(r4)  # mod_fa_camera_add+0x2D4
    ld      not_scr_bg_move, r15
    bbs     4, r15, set_no_barriers
    addo    0x1F, 9, g0
    mov     1, g1
    ldob    curr_round_num, r4
    subo    1, r4, r4
    shlo    2, r4, r4
    mov     0, r5
    addo    r4, r5, g0
    mov     0, g1
    call    sound_queue_input
    b       loc_CE14
# ---------------------------------------------------------------------------
set_no_barriers:                        # CODE XREF: ROUND_DSP+608↑j
    mov     0, r15
    ld      fa_rob0, g7
    st      r15, 0xC70(g7)
    ld      fa_rob1, g7
    st      r15, 0xC70(g7)
loc_CE14:                               # CODE XREF: ROUND_DSP+634↑j
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
SET_DSP:                                # DATA XREF: ROM:0000B00C↑o
    call    timewind_dsp    # Label from official source
    lda     displacement3, r15
    stib    r15, draw_vs_routine_flag # sub_7B594
    ld      CTRL_TIMER, r15
    cmpi    0, r15
    bl      game_sub_ex     # Subtracts 1 from CTRL_TIMER
    mov     1, r4
    ld      mod_fa_coli, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     coli_init, r5
    st      r5, 0xC(r3)
    addo    0x1F, 1, r15
    st      r15, CTRL_TIMER
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
