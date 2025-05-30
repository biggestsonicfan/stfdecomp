        .section select
SEL_INT:                                # CODE XREF: INTRUDE_DSP+B4↓j
    ld      fa_rob0, r7     # Label from official source
    ld      0x0(r7), r15
    clrbit  30, r15, r15
    st      r15, 0x0(r7)
    ld      fa_rob1, r7
    ld      0x0(r7), r15
    clrbit  30, r15, r15
    st      r15, 0x0(r7)
    mov     0, r15
    st      r15, health_bar_flag
    lda     0x1000000, g9
    addo    0x1F, 0x1F, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    mov     0, g0
    call    bg_col_set
    call    efc_rob_poly_para_init
    stob    g0, curr_round_num
    mov     0, r15
    st      r15, 0x5004C8
    mov     0, r15
    stis    r15, 0x500432
    ldib    TST_RED, r15
    stib    r15, TST_RED_ADD
    ldib    TST_GRN, r15
    stib    r15, TST_GRN_ADD
    ldib    TST_BLUE, r15
    stib    r15, TST_BLUE_ADD
    mov     0, r15
    stis    r15, 0x100A000
    mov     0, r15
    stis    r15, 0x100A008
    mov     0, r15
    stis    r15, scrB_H_page
    mov     0, r15
    stis    r15, scrB_V_page
    shlo    0xE, 3, r3      # r3 = 0xC000
    addo    7, r3, r3       # r3 = 0xC007
    shlo    0x10, r3, r4    # r4 = 0xC0070000
    or      r3, r4, r4      # r4 = 0xC007C007
    mov     r4, r5          # r5 = 0xC007C007
    movl    r4, r6          # r6 = 0xC007C007
    lda     CG_DATA_START, r8
    addo    31, 18, r12     # r12 = 0x31 or 49
    shlo    7, 1, r15       # r15 = 0x80 or 128
blackout_screen:                        # CODE XREF: CONTINUE_DSP-4FCC↓j
    stq     r4, 0x0(r8)     # loops 50 times
    stq     r4, 0x10(r8)
    stq     r4, 0x20(r8)
    stq     r4, 0x30(r8)
    stq     r4, 0x40(r8)
    stq     r4, 0x50(r8)
    stq     r4, 0x60(r8)
    stq     r4, 0x70(r8)
    addo    r15, r8, r8
    cmpdeco 1, r12, r12
    bl      blackout_screen
    ld      not_scr_bg_move, r15
    setbit  0xE, r15, r15
    st      r15, not_scr_bg_move
    call    set_game_setting
    ld      fa_rob0, r3
    ld      0x0(r3), r4
    clrbit  23, r4, r4
    clrbit  22, r4, r4
    setbit  26, r4, r4
    setbit  20, r4, r4
    st      r4, 0x0(r3)
    ld      mod_fa_sound, r3
    ld      0x0(r3), r4
    clrbit  29, r4, r4
    clrbit  28, r4, r4
    st      r4, 0x0(r3)
    ld      fa_rob1, r3
    ld      0x0(r3), r4
    clrbit  23, r4, r4
    clrbit  22, r4, r4
    setbit  26, r4, r4
    setbit  20, r4, r4
    st      r4, 0x0(r3)
    ld      not_scr_bg_move, r15
    clrbit  24, r15, r15
    st      r15, not_scr_bg_move
    ld      fa_camera, r4
    mov     0, r15
    stib    r15, 0x2D4(r4)
    ld      0x0(r4), r15
    clrbit  28, r15, r15
    st      r15, 0x0(r4)
    ld      0x0(r4), r15
    clrbit  29, r15, r15
    st      r15, 0x0(r4)
    ld      mod_fa_game_disp, r4
    ld      0x0(r4), r3
    lda     0x45000100, r13
loc_A400:                               # DATA XREF: adv_movie_cont+1E7C↓o
    or      r13, r3, r3
    lda     0x8A00000, r13
    andnot  r13, r3, r3
    st      r3, 0x0(r4)
    mov     1, r4
    ld      mod_fa_sel_disp, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     sel_disp_init, r5
    st      r5, 0xC(r3)
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
    mov     1, r4
    ld      mod_fa_coli, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_game_info, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     get_game_info, r5
    st      r5, 0xC(r3)
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
    mov     1, r4
    ld      mod_fa_obj0, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_play, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
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
    ld      mod_fa_record, r3
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
    ld      mod_fa_win0, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_win1, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_burni, r3 # Cloning cutscene
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    call    sub_29104
    call    efc_ram_init
    lda     0xA00001, g0
    call    check_same_sound
    call    sound_request_u
    lda     0xAE1005, g0
    call    sound_request_u
    lda     0x53F, r15
    st      r15, CTRL_TIMER
    ld      add_BACKUP_RAM_TO_RAM, r15
    ldob    0x3340(r15), r15
    cmpobl  5, r15, loc_A690
    stob    r15, p1_match_count_ingame
loc_A670:                               # CODE XREF: CONTINUE_DSP-4C6C↓j
    ld      add_BACKUP_RAM_TO_RAM, r15
    ldob    0x3341(r15), r15
    cmpobl  5, r15, loc_A6A0
    stob    r15, vs_match_count_ingame
    b       loc_A6AC
# ---------------------------------------------------------------------------
loc_A690:                               # CODE XREF: CONTINUE_DSP-4CA4↑j
    mov     2, r15
    stib    r15, p1_match_count_ingame
    b       loc_A670
# ---------------------------------------------------------------------------
loc_A6A0:                               # CODE XREF: CONTINUE_DSP-4C88↑j
    mov     2, r15
    stib    r15, vs_match_count_ingame
loc_A6AC:                               # CODE XREF: CONTINUE_DSP-4C7C↑j
    mov     0, r15
    st      r15, win_points
    mov     0, r15
    st      r15, time_points
    mov     0, r15
    st      r15, skill_points
    mov     1, r15
    stib    r15, curr_round_num
    mov     0, r15
    stib    r15, p1_wins
    mov     0, r15
    stib    r15, p2_wins
    call    clear_win_lamp_cntr
    mov     7, r15
    stib    r15, mode
    mov     0, r15
    stib    r15, POLYGON_DISP
    stos    r15, 0x520F90
    ld      fa_rob0, r3
    mov     0, r15
    st      r15, 0x19C(r3)
    ld      fa_rob1, r3
    mov     0, r15
    st      r15, 0x19C(r3)
    lda     displacement, r15
    stib    r15, draw_vs_routine_flag
    ld      health_bar_flag, r15
    setbit  3, r15, r15
    st      r15, health_bar_flag
    ld      not_scr_bg_move, r15
    clrbit  0x1A, r15, r15
    st      r15, not_scr_bg_move
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
    call    sub_81038
    call    sub_81AFC
    call    ring_tobitiri_init # Ring Scatter
    ret
# END OF FUNCTION CHUNK FOR CONTINUE_DSP
# =============== S U B R O U T I N E =======================================
SEL_DSP:                                # DATA XREF: ROM:00007B3C↑o
    ld      CTRL_TIMER, r15 # Label from official source
    lda     -1(r15), r15
    st      r15, CTRL_TIMER
    ld      fa_rob0, r3
    ld      0x0(r3), r15
    setbit  20, r15, r15    # sets me_muken for p1
    st      r15, 0x0(r3)
    ld      fa_rob1, r3
    ld      0x0(r3), r15
    setbit  20, r15, r15    # sets me_muken for p2
    st      r15, 0x0(r3)
    ld      not_scr_bg_move, r15
    bbc     26, r15, select_char
select_auto:                            # Label from official source
    ld      CTRL_TIMER, r3
    cmpi    20, r3
    bg      sel_wait_chk
    bne     seld_00
    lda     check_word4+3, r15
    stib    r15, draw_vs_routine_flag # loc_7DB54
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r15
    clrbit  26, r15, r15
    st      r15, 0x0(r3)
    mov     1, r4
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r5
    setbit  31, r5, r5      # If not set vs screens and hud won't show
    st      r5, 0x0(r3)
seld_00:                                # CODE XREF: SEL_DSP+5C↑j
    call    time_rewind_chk # Label from official source
seld_nml:                               # Label from official source
    shlo    6, 1, r13
    ld      CTRL_TIMER, r14
    cmpibg  r13, r14, sel_wait_chk # if r13 is bigger than r14, branch
    ld      select0_flag, r15
    bbc     2, r15, apl0_skp
    ld      select0_flag, r15
    bbc     6, r15, apl1_skp
    ld      select1_flag, r15
    bbc     2, r15, ex_sel
apl0_skp:                               # CODE XREF: SEL_DSP+B8↑j
    ld      select1_flag, r15 # Label from official source
    bbc     2, r15, apl1_skp
    ld      select1_flag, r15
    bbs     6, r15, ex_sel
apl1_skp:                               # CODE XREF: SEL_DSP+C4↑j
    b       sel_dsp_cont    # Label from official source
# ---------------------------------------------------------------------------
ex_sel:                                 # CODE XREF: SEL_DSP+D0↑j
    lda     63, r15         # Label from official source
    st      r15, CTRL_TIMER
    b       sel_dsp_cont
# ---------------------------------------------------------------------------
select_char:                            # CODE XREF: SEL_DSP+48↑j
    call    time_rewind_chk # Label from official source
    ld      select0_flag, r15
    bbc     2, r15, pl0_skp
    ld      select0_flag, r15
    bbc     6, r15, pl1_skp
    b       pl_skp
# ---------------------------------------------------------------------------
pl0_skp:                                # CODE XREF: SEL_DSP+10C↑j
    ld      select1_flag, r15 # Label from official source
    bbc     2, r15, pl1_skp
    ld      select1_flag, r15
    bbc     6, r15, pl1_skp
pl_skp:                                 # CODE XREF: SEL_DSP+11C↑j
    ld      not_scr_bg_move, r15 # Label from official source
    setbit  26, r15, r15
    st      r15, not_scr_bg_move
    lda     1343, r15
    st      r15, CTRL_TIMER
pl1_skp:                                # CODE XREF: SEL_DSP+118↑j
    ld      CTRL_TIMER, r14 # Label from official source
    cmpibl  0, r14, sel_dsp_cont
    ld      not_scr_bg_move, r15
    setbit  26, r15, r15
    st      r15, not_scr_bg_move
    mov     30, r15
    st      r15, CTRL_TIMER
    b       sel_dsp_cont
# ---------------------------------------------------------------------------
sel_wait_chk:                           # CODE XREF: SEL_DSP+58↑j
    ld      select0_flag, r15 # Label from Fighting Vipers source
    clrbit  1, r15, r15
    st      r15, select0_flag
    ld      select1_flag, r15
    clrbit  1, r15, r15
    st      r15, select1_flag
    ld      CTRL_TIMER, r14
    cmpibl  0, r14, sel_dsp_cont
    ld      busy_signal_flag, r14
    cmpobe  1, r14, sel_dsp_cont
    ld      fa_rob0, g7
    mov     0, r3
    stob    r3, 4(g7)
    ldib    0x1B0(g7), r15
    stib    r15, 0x1B1(g7)
    ldob    0x1B1(g7), r14
    cmpobg  26, r14, loc_A9EC
    ldib    0x1B1(g7), r15
    lda     -26(r15), r15
    stib    r15, 0x1B1(g7)
loc_A9EC:                               # CODE XREF: SEL_DSP+1E4↑j
    lda     array_of_floats, r15
    st      r15, 0x1D00(g7) # r15 = P1_PARTS+0x1D00
    lda     0x50A284, r15
    st      r15, 0x1D04(g7) # r15 = P1_PARTS+0x1D04
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
    lda     0xC0000000, r15 # r15 = -2 (float)
    st      r15, 0x18(g7)   # p1_xpos = r15
    lda     displacement, r15
    st      r15, 0x1C(g7)   # p1_ypos = r15
    lda     displacement, r15
    st      r15, 0x20(g7)   # p1_zpos = r15
loc_AAA0:                               # DATA XREF: get_en_info+570↓o
    shlo    0xE, 3, r15     # r15 = 0xC000
    stis    r15, 0x26(g7)
    lda     action_init, r15
    st      r15, 0xC(g7)    # P1_PARTS+0x0C
    mov     0, r15
    stib    r15, 0x2A(g7)   # P1_PARTS+0x2A
    mov     0, r15
    stis    r15, 0x624(g7)  # p1_out_on
    ld      0x0(g7), r3
    lda     0xFF000000, r4
    and     r4, r3, r3
    setbit  0x1F, r3, r3
    st      r3, 0x0(g7)
    mov     1, r4
    ld      mod_fa_osage0_1, r3
    ld      0x0(r3), r5
    setbit  31, r5, r5
    st      r5, 0x0(r3)
    lda     osage_init, r5
    st      r5, 0xC(r3)
loc_AB00:                               # DATA XREF: sub_56DEC+1204↓o
    ld      fa_rob1, g7
    mov     1, r3
    stob    r3, 4(g7)
    ldib    0x1B0(g7), r15
    stib    r15, 0x1B1(g7)
    ldob    0x1B1(g7), r14
    cmpobg  0x1A, r14, loc_AB30
    ldib    0x1B1(g7), r15
    lda     -0x1A(r15), r15
    stib    r15, 0x1B1(g7)
loc_AB30:                               # CODE XREF: SEL_DSP+328↑j
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
    setbit  31, r3, r3
    st      r3, 0x0(g7)
    mov     1, r4
    ld      mod_fa_osage0_2, r3
    ld      0x0(r3), r5
    setbit  31, r5, r5
    st      r5, 0x0(r3)
    lda     osage_init, r5
    st      r5, 0xC(r3)
    ld      health_bar_flag, r15
    clrbit  3, r15, r15
    st      r15, health_bar_flag
    ld      mod_fa_sel_disp, r4
    ld      select0_flag, r15
    bbc     2, r15, loc_ACA0
    ld      0x61(r4), r3
    ld      fa_rob0, g7
    ld      0x0(g7), r5
    chkbit  0, r3
    alterbit 30, r5, r5
    notbit  30, r5, r5
    st      r5, 0x0(g7)
    ld      select0_flag, r15
    setbit  6, r15, r15
    st      r15, select0_flag
loc_ACA0:                               # CODE XREF: SEL_DSP+474↑j
    ld      select1_flag, r15
    bbc     2, r15, loc_ACE0
    ld      0x7D(r4), r3
    ld      fa_rob1, g7
    ld      0x0(g7), r5
    chkbit  0, r3
    alterbit 0x1E, r5, r5
    notbit  0x1E, r5, r5
    st      r5, 0x0(g7)
    ld      select1_flag, r15
    setbit  6, r15, r15
    st      r15, select1_flag
loc_ACE0:                               # CODE XREF: SEL_DSP+4B4↑j
    lda     displacement, r15
    stib    r15, draw_vs_routine_flag # sub_7B2E8
    lda     scrB_H_page, r3
    mov     0, r4
    stos    r4, 8(r3)
    setbit  0xF, r4, r4
    stos    r4, (r3)
    stos    r4, 2(r3)
    lda     0x100D000, r5
    shlo    4, 17, r9
    mov     0, r8
sss_loop:                               # CODE XREF: SEL_DSP+538↓j
    st      r8, (r5)        # Label from Fighting Vipers source
    st      r8, 4(r5)
    addo    8, r5, r5
    cmpdeco 1, r9, r9
    bl      sss_loop
    mov     0, r15
    stis    r15, scrB_H_page
    mov     0, r15
    stis    r15, scrB_V_page
    mov     1, r4
    ld      fa_camera, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_sel_disp, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    ld      select0_flag, r15
    clrbit  0, r15, r15
    st      r15, select0_flag
    ld      select1_flag, r15 # This is 0
    clrbit  0, r15, r15
    st      r15, select1_flag
    ldib    mode, r15
    lda     1(r15), r15
    stib    r15, mode
    mov     2, g0
    call    _Scroll_Initialize
    lda     162, g0
    call    _Scroll_Initialize
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r4
    setbit  0x1A, r4, r4
    clrbit  0x18, r4, r4
    st      r4, 0x0(r3)
    call    shifts_graphics_somehow
    ldob    stage_num, r12
    shlo    8, r12, r4
    ld      0x8F3D4(r4), r5 # r5 = mod_fa_game_disp_add+0x8F3D4
    ldos    0x8F3D8(r4), r6 # r6 = mod_fa_game_disp_add+0x8F3D8
    ldos    0x8F3DA(r4), r7 # r7 = mod_fa_game_disp_add+0x8F3DA
    st      r5, BRIGHT
    stos    r6, VECTER_X
    stos    r7, VECTER_Y
    call    stage_disp
    ldob    STAGE_ID, r3
    subi    1, r3, r3       # Subtract 1 from STAGE_ID
    ldob    STORY_FIGHTER_ORDER[r3*2], r5
    ld      select0_flag, r15
    bbs     2, r15, si_50
    ld      fa_rob1, r3
    ld      fa_rob0, r4
    stob    r5, 0x1B0(r4)
    ldob    0x1B0(r3), r13
    ldob    0x1B0(r4), r14
    cmpobne r13, r14, sel_dsp_cont
    ldib    0x1B0(r4), r15
    lda     0x1A(r15), r15
    stib    r15, 0x1B0(r4)
    b       sel_dsp_cont
# ---------------------------------------------------------------------------
si_50:                                  # CODE XREF: SEL_DSP+648↑j
    ld      select1_flag, r15 # Label from Fighting Vipers source
    bbs     2, r15, sel_dsp_cont
    ld      fa_rob0, r3
    ld      fa_rob1, r4
    stob    r5, 0x1B0(r4)
    ldob    0x1B0(r3), r13
    ldob    0x1B0(r4), r14
    cmpobne r13, r14, sel_dsp_cont
    ldib    0x1B0(r4), r15
    lda     0x1A(r15), r15
    stib    r15, 0x1B0(r4)
    b       sel_dsp_cont
# ---------------------------------------------------------------------------
sel_dsp_cont:                           # CODE XREF: SEL_DSP:apl1_skp↑j
    ld      replay_bank_adr, r5 # Label from Fighting Vipers source
    ret
# End of function SEL_DSP
# =============== S U B R O U T I N E =======================================
time_rewind_chk:                        # CODE XREF: SEL_DSP:seld_00↑p
    ld      INTERUPT_FLAGS_MOMEN_ON_REL, r15 # Label from official source
    bbs     0, r15, sel_dsp_count_down_coin_in # P1 Coin
    bbs     1, r15, sel_dsp_count_down_coin_in # P2 Coin
    ld      INTERUPT_FLAGS_MOMENTARY, r15
    bbs     3, r15, sel_dsp_count_down_coin_in # Service Coin
    bbs     27, r15, sel_dsp_count_down_coin_in
    b       sel_dsp_count_down_cont
# ---------------------------------------------------------------------------
sel_dsp_count_down_coin_in:             # CODE XREF: time_rewind_chk+8↑j
    lda     1343, r15       # Label from Fighting Vipers source
    st      r15, CTRL_TIMER
sel_dsp_count_down_cont:                # CODE XREF: time_rewind_chk+20↑j
    mov     2, g0           # Label from Fighting Vipers source
    call    player_entry
    cmpibne 0, g0, sel_dsp_next
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r15
    setbit  8, r15, r15
    st      r15, 0x0(r3)
    lda     1343, r15
    st      r15, CTRL_TIMER
    ld      not_scr_bg_move, r15
    setbit  15, r15, r15
    st      r15, not_scr_bg_move
sel_dsp_next:                           # CODE XREF: time_rewind_chk+38↑j
    ret                     # Label from Fighting Vipers source
# End of function time_rewind_chk
