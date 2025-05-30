        .section int
# ---------------------------------------------------------------------------
GAME_INT:                               # DATA XREF: ROM:00007B44↑o
    mov     0, r15          # Label from official source
    stis    r15, 0x100A000
    mov     0, r15
    stis    r15, 0x100A008
    ld      select0_flag, r15
    bbs     2, r15, loc_B12C # if 500248=2 it disables P1 as a manual character
    ld      fa_rob0, r7
    ld      0x0(r7), r15
    clrbit  0x1E, r15, r15
    st      r15, 0x0(r7)
loc_B12C:                               # CODE XREF: ROM:0000B114↑j
    ld      select1_flag, r15
    bbs     2, r15, loc_B14C
    ld      fa_rob1, r7
    ld      0x0(r7), r15
    clrbit  0x1E, r15, r15
    st      r15, 0x0(r7)
loc_B14C:                               # CODE XREF: ROM:0000B134↑j
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r15
    clrbit  26, r15, r15
    st      r15, 0x0(r3)
    ld      fa_rob0, g7
    mov     0, r3
    stob    r3, 4(g7)
    ldib    0x1B0(g7), r15  # Loads selected player here.
    stib    r15, 0x1B1(g7)
    ldob    0x1B1(g7), r14
    cmpobg  0x1A, r14, loc_B190
    ldib    0x1B1(g7), r15
    lda     -0x1A(r15), r15
    stib    r15, 0x1B1(g7)
loc_B190:                               # CODE XREF: ROM:0000B17C↑j
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
    cmpobg  0x1A, r14, loc_B2D4
    ldib    0x1B1(g7), r15
    lda     -0x1A(r15), r15
    stib    r15, 0x1B1(g7)
loc_B2D4:                               # CODE XREF: ROM:0000B2C0↑j
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
    ld      mod_fa_obj0, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    ld      fa_camera, r3
    mov     0, r15
    stib    r15, 0x41(r3)   # cam_mode
    ld      not_scr_bg_move, r15
    clrbit  4, r15, r15
    st      r15, not_scr_bg_move
    mov     0, r15
    stis    r15, motion_set_mot_val
    mov     0, r15
    stib    r15, 0x508040
    mov     0, r15
    stib    r15, 0x508050
    mov     0, r15
    stib    r15, 0x508008
    stob    r15, 0x520F90
    ld      fa_rob0, r3
    mov     0, r15
    st      r15, 0x1230(r3)
    mov     0, r15
    st      r15, 0x1234(r3)
    ld      fa_rob1, r3
    mov     0, r15
    st      r15, 0x1230(r3)
    mov     0, r15
    st      r15, 0x1234(r3)
    ldob    0x500056, r14
    cmpobe  1, r14, loc_B4CC
    ldob    0x500056, r14
    cmpobe  2, r14, loc_B524
    ld      not_scr_bg_move, r15
    bbc     2, r15, loc_B598
    ld      not_scr_bg_move, r15
    bbc     3, r15, loc_B55C
loc_B4CC:                               # CODE XREF: ROM:0000B4A4↑j
    mov     2, r15
    stib    r15, gameprogram # bit 0 clear = Player 1
    mov     0, r15
    stib    r15, 0x500057
    lda     aPlayer1, r15   # "PLAYER1"
    st      r15, 0x50005C
    mov     0, r15
    stib    r15, 0x500058
    lda     aPlayer2, r15   # "PLAYER2"
    st      r15, 0x500060
    ldib    vs_match_count_ingame, r15
    stib    r15, num_rounds_to_win
    b       loc_B5D0
# ---------------------------------------------------------------------------
loc_B524:                               # CODE XREF: ROM:0000B4B0↑j
    mov     2, r15
    stib    r15, gameprogram # bit 0 clear = Player 1
    ldib    vs_match_count_ingame, r15
    stib    r15, num_rounds_to_win
    mov     1, r15
    stib    r15, 0x500057
    mov     2, r15
    stib    r15, 0x500058
    b       loc_B5D0
# ---------------------------------------------------------------------------
loc_B55C:                               # CODE XREF: ROM:0000B4C8↑j
    mov     0, r15
    stib    r15, gameprogram # bit 0 clear = Player 1
    mov     0, r15
    stib    r15, 0x500057
    lda     aPlayer1, r15   # "PLAYER1"
    st      r15, 0x50005C
    ldib    p1_match_count_ingame, r15
    stib    r15, num_rounds_to_win
    b       loc_B5D0
# ---------------------------------------------------------------------------
loc_B598:                               # CODE XREF: ROM:0000B4BC↑j
    mov     1, r15
    stib    r15, gameprogram # bit 0 clear = Player 1
    mov     0, r15
    stib    r15, 0x500058
    lda     aPlayer2, r15   # "PLAYER2"
    st      r15, 0x500060
    ldib    p1_match_count_ingame, r15
    stib    r15, num_rounds_to_win
loc_B5D0:                               # CODE XREF: ROM:0000B520↑j
    ld      not_scr_bg_move, r15
    setbit  5, r15, r15
    st      r15, not_scr_bg_move
    mov     0, r15
    stib    r15, _sub_mode
    ldib    mode, r15
    lda     1(r15), r15
    stib    r15, mode
    mov     0, r15
    st      r15, 0x500240
    ret
# ---------------------------------------------------------------------------
GAME_DSP:                               # DATA XREF: ROM:00007B4C↑o
    mov     0, r15          # Label from official source
    stib    r15, 0x50406A
    call    sub_7E0A0       # return
    ld      fa_rob0, g7
    ld      0x1064(g7), r7
    addo    1, r7, r4
    and     7, r4, r4
    st      r4, 0x1064(g7)
    mulo    0xC, r7, r3
    lda     0x1004(g7), r4
    addo    r3, r4, r4
    ldt     0x1F4(g7), r8
    stt     r8, (r4)
    ld      fa_rob1, g7
    ld      0x1064(g7), r7
    addo    1, r7, r4
    and     7, r4, r4
    st      r4, 0x1064(g7)
    mulo    0xC, r7, r3
    lda     0x1004(g7), r4
    addo    r3, r4, r4
    ldt     0x1F4(g7), r8
    stt     r8, (r4)
    ldob    STAGE_ID, r14
    cmpoble 9, r14, loc_B788
    ldob    also_sub_mode, r14
    cmpobg  13, r14, loc_B6F4
    ld      not_scr_bg_move, r15
    bbc     1, r15, loc_B6F4
    ldob    current_stage_played_num, r14
    cmpobl  10, r14, loc_B788 # If playing any stage before Eggman boss, branch
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobne 0, r14, loc_B6DC
    ldob    0x50004E, r14
    cmpobe  1, r14, loc_B788
loc_B6DC:                               # CODE XREF: ROM:0000B6CC↑j
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobne 1, r14, loc_B6F4
    ldob    0x50004E, r14
    cmpobe  0, r14, loc_B788
loc_B6F4:                               # CODE XREF: ROM:0000B6A8↑j
    ld      not_scr_bg_move, r15
    bbc     5, r15, loc_B788
    ld      not_scr_bg_move, r15
    bbs     0x11, r15, loc_B788
    mov     2, g0
    call    player_entry
    cmpibne 0, g0, loc_B788
    ld      0x500240, r4
    bbc     0, r4, loc_B728
    call    sub_78270
loc_B728:                               # CODE XREF: ROM:0000B720↑j
    bbc     1, r4, loc_B730
    call    sub_7832C
loc_B730:                               # CODE XREF: ROM:loc_B728↑j
    bbc     2, r4, loc_B738
    call    sub_77C2C
loc_B738:                               # CODE XREF: ROM:loc_B730↑j
    bbc     3, r4, loc_B740
    call    sub_77588
loc_B740:                               # CODE XREF: ROM:loc_B738↑j
    bbc     4, r4, loc_B748
    call    sub_77828
loc_B748:                               # CODE XREF: ROM:loc_B740↑j
    bbc     5, r4, loc_B750
    call    sub_783B4
loc_B750:                               # CODE XREF: ROM:loc_B748↑j
    mov     0, r4
    st      r4, 0x500240
    ld      not_scr_bg_move, r15
    clrbit  4, r15, r15
    st      r15, not_scr_bg_move
    mov     18, r15         # set _sub_mode to 18 (begin INTRUDE_INT)
    stib    r15, _sub_mode
    mov     2, r15
    stib    r15, gameprogram # bit 0 clear = Player 1
loc_B788:                               # CODE XREF: ROM:0000B69C↑j
    ldib    _sub_mode, r15
    stib    r15, also_sub_mode
    ldob    _sub_mode, r3
    shlo    r3, 1, r4
    st      r4, 0x500034
    ld      ROUND_STATE[r3*8], r5
    ld      debug_flag, r15
    bbs     9, r15, loc_B818 # if debug_flag bit 9 set, execute ROUND_STATE
    addo    4, sp, sp       # if debug_flag bit 9 not set, display ROUND_STATE_NAME in HUD
    st      g0, -4(sp)
    lda     0x1001604, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
    .asciz "                        "
    .fill 3, 1, 0
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
    lda     0x1001604, g9
    ld      ROUND_STATE_NAMES[r3*8], g0
    call    print_mes
loc_B818:                               # CODE XREF: ROM:0000B7BC↑j
    callx   (r5)
    ret
