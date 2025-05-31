            .section name
NAME_INT:                               # DATA XREF: ROM:00007B74↑o
    call    scroll_all_init # Label from official source
    mov     1, r4
    ld      mod_fa_sampling, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_effect, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_tobi, r3 # Projectile (tobi = flight)
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    shlo    7, 1, r15
    stib    r15, RED
    shlo    7, 1, r15
    stib    r15, GREEN
    shlo    7, 1, r15
    stib    r15, BLUE
    call    chg_pol_color_req
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r15
    setbit  0x19, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    setbit  0x1E, r15, r15
    st      r15, 0x0(r3)
    mov     0, r3
    stob    r3, curr_round_num
    ld      0x500710, r15
    bbs     0x10, r15, loc_107D4
    ldob    STAGE_ID, r14
    cmpobg  10, r14, loc_10CEC
    ldob    RANDOM_MODE, r14
    cmpobe  0, r14, loc_107D4 # If RANDOM_MODE not equal to 0, then no Name Entry screen
    mov     10, r15
    stib    r15, mode
    ret
# ---------------------------------------------------------------------------
loc_107D4:                              # CODE XREF: ROM:000107A8↑j
    mov     10, r3
    stob    r3, STAGE_ID
    mov     0, r15
    st      r15, 0x5004C8
    mov     1, r4
    ld      fa_camera, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     camera_init, r5
    st      r5, 0xC(r3)
    mov     1, r4
    ld      mod_fa_control0, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     control_init, r5 # Executes once at start of char sel, once at the start of the vs screen, then once every frame of gameplay once the map is loaded.
    st      r5, 0xC(r3)
    lda     0x1000000, g9
    shlo    6, 1, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    call    name_init
    ldob    0x500081, r3
    bbc     0, r3, loc_10CD4
    lda     check_word3+2, r15
    stib    r15, draw_vs_routine_flag
    shlo    9, 5, r15
    st      r15, CTRL_TIMER
    lda     start_ip_add+3, r15
    stib    r15, stage_num
    call    change_scene
    lda     loc_F0C0, g0
    mov     0, g1
    lda     CG_DATA_START, g2
    call    change_bg_color # Adds 0x4000 to g1 for color code
    call    bg_col_set
    mov     1, r4
    ld      mod_fa_coli, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     0, r15
    stib    r15, POLYGON_DISP
    ld      not_scr_bg_move, r15
    setbit  0xE, r15, r15
    st      r15, not_scr_bg_move
    ldib    mode, r15
    lda     1(r15), r15
    stib    r15, mode
    mov     1, r4
    ld      mod_fa_nameentry, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     nameentry_init, r5
    st      r5, 0xC(r3)
    ldob    gameprogram, r4 # bit 0 clear = Player 1
    cmpobne 0, r4, loc_10940
    ld      fa_rob0, r3
    ld      fa_rob1, r4
    ldib    0x1B0(r3), r15
    stib    r15, 0x1B0(r4)
    ldib    0x1B1(r3), r15
    stib    r15, 0x1B1(r4)
loc_10940:                              # CODE XREF: ROM:0001091C↑j
    ld      fa_rob0, r3
    mov     0, r15
    stib    r15, 0x1B0(r3)
    mov     0, r15
    stib    r15, 0x1B1(r3)
    cmpobg  0x1A, r4, loc_10960
    subo    0x1A, r4, r4
loc_10960:                              # CODE XREF: ROM:00010958↑j
    ld      fa_rob0, g7
    mov     0, r3
    stob    r3, 4(g7)
    ldib    0x1B0(g7), r15
    stib    r15, 0x1B1(g7)
    ldob    0x1B1(g7), r14
    cmpobg  0x1A, r14, loc_10990
    ldib    0x1B1(g7), r15
    lda     -0x1A(r15), r15
    stib    r15, 0x1B1(g7)
loc_10990:                              # CODE XREF: ROM:0001097C↑j
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
    lda     displacement, r15
    st      r15, 0x18(g7)
    lda     displacement, r15
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
    cmpobg  0x1A, r14, loc_10AD4
    ldib    0x1B1(g7), r15
    lda     -0x1A(r15), r15
    stib    r15, 0x1B1(g7)
loc_10AD4:                              # CODE XREF: ROM:00010AC0↑j
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
    ld      fa_rob0, r3
    ld      fa_rob1, r4
    ld      0x0(r3), r15
    clrbit  0x11, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r4), r15
    clrbit  0x11, r15, r15
    st      r15, 0x0(r4)
    ret
# ---------------------------------------------------------------------------
NAME_DSP:                               # DATA XREF: ROM:00007B7C↑o
    lda     check_word3+3, r15 # Label from official source
    stib    r15, draw_vs_routine_flag
    ldob    0x500081, r3
    bbs     1, r3, loc_10C78
    ld      CTRL_TIMER, r14
    subi    1, r14, r15
    st      r15, CTRL_TIMER
    ret
# ---------------------------------------------------------------------------
loc_10C78:                              # CODE XREF: ROM:00010C5C↑j
    mov     1, r4
    ld      mod_fa_nameentry, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    call    name_entry_rankdisp
    ld      fa_rob1, r3
    lda     0x3CF5C28F, r13
    ld      0x18(r3), r14
    subr    r13, r14, r15
    st      r15, 0x18(r3)
    ld      CTRL_TIMER, r14
    subi    1, r14, r15
    st      r15, CTRL_TIMER
    ldob    0x500081, r3
    bbs     2, r3, loc_10CEC
    ret
# ---------------------------------------------------------------------------
loc_10CD4:                              # CODE XREF: ROM:00010854↑j
    mov     1, r4
    ld      fa_camera, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
loc_10CEC:                              # CODE XREF: ROM:000107B4↑j
    mov     10, r15
    stib    r15, mode
    call    save_stats_and_reset_counters
    call    sub_77570
    lda     0x1000000, g9
    addo    0x1F, 0x1D, g0
    mov     8, g1
    call    clr_pattern_s
    ret
# ---------------------------------------------------------------------------
