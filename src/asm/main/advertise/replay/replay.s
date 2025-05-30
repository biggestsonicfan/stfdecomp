        .section replay
# =============== S U B R O U T I N E =======================================
ADV_REPLAY_PIC:                         # DATA XREF: ROM:00007F50↑o
    call    adv_movie_cont  # Label from official source
    call    adv_movie_draw_text
    lda     backup_ram_check, r15
    st      r15, 0x550004
    lda     loc_4E20, r15
    st      r15, 0x550008
    ld      fa_camera, r4
    ld      0x0(r4), r15
    setbit  1, r15, r15
    st      r15, 0x0(r4)
    ld      0x0(r4), r15
    setbit  2, r15, r15
    st      r15, 0x0(r4)
    mov     0, r4           # Possible flag for old char sel
    st      r4, 0x5003E4
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r4
    setbit  0x1E, r4, r4
    setbit  0x17, r4, r4
    clrbit  0x14, r4, r4
    setbit  0x19, r4, r4
    st      r4, 0x0(r3)
    ld      fa_camera, r3
    lda     displacement, r15
    st      r15, 0x18(r3)
    lda     0xBE23D70A, r15
    st      r15, 0x1C(r3)
    lda     0xC090F5C3, r15
    st      r15, 0x20(r3)
    mov     0, r15
    stis    r15, 0x24(r3)
    mov     0, r15
    stis    r15, 0x26(r3)
    mov     0, r15
    stis    r15, 0x28(r3)
    lda     displacement, r15
    stib    r15, 0x40(r3)
    ld      add_BACKUP_RAM_TO_RAM, r15
    ld      0x3320(r15), r14
    bbs     0, r14, loc_8F68
loc_8F68:                               # CODE XREF: ADV_REPLAY_PIC+D4↑j
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    ret
# End of function ADV_REPLAY_PIC
# =============== S U B R O U T I N E =======================================
ADV_REPLAY_INT:                         # DATA XREF: ROM:00007F58↑o
    call    adv_movie_cont  # Label from official source
    call    adv_movie_draw_text
    ld      0x500498, r15
    setbit  0x1F, r15, r15
    st      r15, 0x500498
    ld      0x500498, r15
    setbit  2, r15, r15
    st      r15, 0x500498
    mov     0, r3
    stob    r3, curr_round_num
    ld      fa_rob0, r4
    ld      replay_bank_adr, r5
    ldob    0xC(r5), r3
    stob    r3, 0x1B0(r4)
    ldib    0xFFF(r5), r15
    stib    r15, 0x6CC(r4)
    ld      fa_rob1, r4
    ldob    0x10(r5), r3
    stob    r3, 0x1B0(r4)
    ldib    0xFFE(r5), r15
    stib    r15, 0x6CC(r4)
    lda     0x41000000, r15
    st      r15, stage_x
    ld      fa_rob0, g7
    mov     0, r3
    stob    r3, 4(g7)
    ldib    0x1B0(g7), r15
    stib    r15, 0x1B1(g7)
    ldob    0x1B1(g7), r14
    cmpobg  26, r14, loc_9034 # Most likely branches
    ldib    0x1B1(g7), r15
    lda     -26(r15), r15
    stib    r15, 0x1B1(g7)
loc_9034:                               # CODE XREF: ADV_REPLAY_INT+A0↑j
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
    cmpobg  0x1A, r14, loc_9178
    ldib    0x1B1(g7), r15
    lda     -0x1A(r15), r15
    stib    r15, 0x1B1(g7)
loc_9178:                               # CODE XREF: ADV_REPLAY_INT+1E4↑j
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
    call    efc_rob_poly_para_init
    addo    4, sp, sp
    st      r3, -4(sp)
    addo    0x10, sp, sp
    stq     r4, -0x10(sp)
    addo    0x10, sp, sp
    stq     r8, -0x10(sp)
    addo    0x10, sp, sp
    stq     r12, -0x10(sp)
    addo    0x10, sp, sp
    stq     g0, -0x10(sp)
    addo    0x10, sp, sp
    stq     g4, -0x10(sp)
    addo    0x10, sp, sp
    stq     g8, -0x10(sp)
    addo    4, sp, sp
    st      g12, -4(sp)
    addo    4, sp, sp
    st      g13, -4(sp)
    addo    4, sp, sp
    st      g14, -4(sp)
    ld      fa_rob0, g13
    callx   action_init
    ld      fa_rob1, g13
    callx   action_init
    ld      -4(sp), g14
    subo    4, sp, sp
    ld      -4(sp), g13
    subo    4, sp, sp
    ld      -4(sp), g12
    subo    4, sp, sp
    ldq     -0x10(sp), g8
    subo    0x10, sp, sp
    ldq     -0x10(sp), g4
    subo    0x10, sp, sp
    ldq     -0x10(sp), g0
    subo    0x10, sp, sp
    ldq     -0x10(sp), r12
    subo    0x10, sp, sp
    ldq     -0x10(sp), r8
    subo    0x10, sp, sp
    ldq     -0x10(sp), r4
    subo    0x10, sp, sp
    ld      -4(sp), r3
    subo    4, sp, sp
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
    ldob    0x50005B, r3
    addo    1, r3, r3
    cmpobge 7, r3, loc_940C
    mov     0, r3
loc_940C:                               # CODE XREF: ADV_REPLAY_INT+484↑j
    stob    r3, 0x50005B
    stob    r3, stage_num
    call    change_scene
    lda     0x3727C5AC, r15
    st      r15, cage_ypos
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
    ld      mod_fa_play, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    ld      select0_flag, r15
    clrbit  2, r15, r15
    st      r15, select0_flag
    ld      select1_flag, r15
    clrbit  2, r15, r15
    st      r15, select1_flag
    mov     1, r4
    ld      mod_fa_coli, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     coli_init, r5
    st      r5, 0xC(r3)
    mov     1, r4
    ld      mod_fa_control0, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     control_init, r5 # Executes once at start of char sel, once at the start of the vs screen, then once every frame of gameplay once the map is loaded.
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
    ld      mod_fa_control0, r3
    ld      0x0(r3), r15
    setbit  0, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    setbit  1, r15, r15
    st      r15, 0x0(r3)
    shlo    6, 5, r4
    ld      mod_fa_game_disp, r3
    st      r4, 0x54(r3)
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    call    sub_81038
    call    sub_81AFC
    call    ring_tobitiri_init # Ring Scatter
    ret
# End of function ADV_REPLAY_INT
# =============== S U B R O U T I N E =======================================
ADV_REPLAY_WAIT1A:                      # DATA XREF: ROM:00007F60↑o
    call    adv_movie_cont  # Label from official source
    call    adv_movie_draw_text
    lda     0x438C0000, r15
    st      r15, focus_dist_x
    lda     0x438C0000, r15
    st      r15, focus_dist_y
    call    window_data_init
    ld      mod_fa_game_disp, r3
    ld      0x54(r3), r15
    cmpdeco 0, r15, r15
    be      loc_95D4
    st      r15, 0x54(r3)
    ld      0x54(r3), r5
    cmpobne 0x14, r5, loc_95D0
loc_95D0:                               # CODE XREF: ADV_REPLAY_WAIT1A+48↑j
    ret
# ---------------------------------------------------------------------------
loc_95D4:                               # CODE XREF: ADV_REPLAY_WAIT1A+3C↑j
    ld      busy_signal_flag, r14
    cmpobne 1, r14, loc_95E4
    ret
# ---------------------------------------------------------------------------
loc_95E4:                               # CODE XREF: ADV_REPLAY_WAIT1A+58↑j
    call    scr_bg_int
    mov     0, r15
    st      r15, 0x5004C8
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    lda     0x1000000, g9
    addo    0x1F, 0x1F, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
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
    ld      mod_fa_key_play, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     key_play_init, r5
    st      r5, 0xC(r3)
    mov     1, r4
    ld      mod_fa_obj0, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     object_init, r5
    st      r5, 0xC(r3)
    ld      fa_camera, r3
    lda     cam_mode9, r15
    stib    r15, 0x40(r3)
    shlo    7, 0xF, r15
    stis    r15, game_timer
    ld      add_BACKUP_RAM_TO_RAM, r15
    ld      0x3320(r15), r15
    bbs     0, r15, loc_96E0
    lda     0x10016DA, g9
    lda     0x100135C, g9
    mov     11, g0          # AM2 LOGO TEX
    call    dsp_pattern_new
loc_96E0:                               # CODE XREF: ADV_REPLAY_WAIT1A+140↑j
    ret
# End of function ADV_REPLAY_WAIT1A
# =============== S U B R O U T I N E =======================================
ADV_REPLAY_WAIT1B:                      # DATA XREF: ROM:00007F68↑o
    lda     20000, r13      # Label from official source
    ld      VS_COUNT_A_bk, r14 # Load the VS count from backup memory into r14... why
    cmpobge r13, r14, loc_9714
    ld      INTERUPT_FLAGS_HELD, r3
    bbc     4, r3, loc_9714 # 0x500700 = 0x30... P1+P2 Starts
    bbc     5, r3, loc_9714
    mov     1, r3
    stob    r3, _20K_PLAYS_FLAG # This will set flag to 1, let's see what it does!
loc_9714:                               # CODE XREF: ADV_REPLAY_WAIT1B+10↑j
    ld      mod_fa_game_disp, r3
    ld      0x54(r3), r15
    cmpdeco 0, r15, r15
    be      loc_9730
    st      r15, 0x54(r3)
    ret
# ---------------------------------------------------------------------------
loc_9730:                               # CODE XREF: ADV_REPLAY_WAIT1B+40↑j
    ld      busy_signal_flag, r14
    cmpobne 1, r14, loc_9740
    ret
# ---------------------------------------------------------------------------
loc_9740:                               # CODE XREF: ADV_REPLAY_WAIT1B+54↑j
    ld      mod_fa_game_disp, r3
    ldos    energy_max, r15
    stos    r15, 0x44(r3)
    stos    r15, 0x46(r3)
    lda     0x1000000, g9
    lda     17, g0          # LIFEBAR HUD TEXTURE
    call    dsp_pattern_new
    call    win_lamp_int
    call    char_nameplate_dsp
    ld      0x0(r3), r4
    clrbit  0x1E, r4, r4
    setbit  0x1C, r4, r4
    setbit  0x17, r4, r4
    clrbit  0x14, r4, r4
    clrbit  0x19, r4, r4
    st      r4, 0x0(r3)
    ld      mod_fa_sound, r3
    ld      0x0(r3), r4
    setbit  0x1D, r4, r4
    st      r4, 0x0(r3)
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    ret
# End of function ADV_REPLAY_WAIT1B
# =============== S U B R O U T I N E =======================================
ADV_REPLAY_DSP:                         # DATA XREF: ROM:00007F70↑o
    ld      fa_rob0, r3     # Label from official source
    ld      0x0(r3), r15
    bbs     5, r15, loc_980C
    ld      fa_rob1, r3
    ld      0x0(r3), r15
    bbs     5, r15, loc_980C
    ldos    game_timer, r3
    subo    1, r3, r3
    stos    r3, game_timer
    cmpobe  0, r3, loc_980C
    shlo    6, 0x1B, r13
    cmpobne r13, r3, loc_9808
    ld      add_BACKUP_RAM_TO_RAM, r14
    ldob    0x3353(r14), r15 # r15 = BACKUP_RAM_TO_RAM+0x3353
loc_9808:                               # CODE XREF: ADV_REPLAY_DSP+3C↑j
    ret
# ---------------------------------------------------------------------------
loc_980C:                               # CODE XREF: ADV_REPLAY_DSP+C↑j
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    mov     1, r4
    ld      mod_fa_key_play, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    shlo    7, 1, r4
    ld      mod_fa_game_disp, r3
    st      r4, 0x54(r3)
    ld      mod_fa_sound, r3
    ld      0x0(r3), r4
    clrbit  0x1D, r4, r4
    setbit  0x1C, r4, r4
    st      r4, 0x0(r3)
    ret
# End of function ADV_REPLAY_DSP
# =============== S U B R O U T I N E =======================================
ADV_REPLAY_WAIT2:                       # DATA XREF: ROM:00007F78↑o
    ld      mod_fa_game_disp, r3 # Label from official source
    ld      0x54(r3), r15
    subo    1, r15, r15
    st      r15, 0x54(r3)
    cmpobe  0, r15, loc_9888
    ld      0x54(r3), r5
    cmpobne 0x14, r5, loc_9884
loc_9884:                               # CODE XREF: ADV_REPLAY_WAIT2+1C↑j
    ret
# ---------------------------------------------------------------------------
loc_9888:                               # CODE XREF: ADV_REPLAY_WAIT2+14↑j
    ld      0x0(r3), r4
    setbit  0x1E, r4, r4
    setbit  0x17, r4, r4
    clrbit  0x14, r4, r4
    clrbit  0x19, r4, r4
    st      r4, 0x0(r3)
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    ret
# End of function ADV_REPLAY_WAIT2
# =============== S U B R O U T I N E =======================================
ADV_REPLAY_PIC2:                        # DATA XREF: ROM:00007F80↑o
    ld      mod_fa_game_disp, r3 # Label from official source
    ld      0x0(r3), r4
    setbit  0x1E, r4, r4
    setbit  0x17, r4, r4
    clrbit  0x14, r4, r4
    setbit  0x19, r4, r4
    st      r4, 0x0(r3)
    lda     0x1000000, g9
    addo    0x1F, 0x1F, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    addo    0x1F, 0x1B, g0
    call    _Scroll_Initialize
    mov     0, r15
    stis    r15, scrB_H_page
    mov     0, r15
    stis    r15, scrB_V_page
    lda     0x1004000, g9
    lda     202, g0         # Sonic the Fighters main logo
    call    dsp_pattern_low
    ld      fa_camera, r3
    lda     displacement, r15
    st      r15, 0x18(r3)
    lda     0xBE23D70A, r15
    st      r15, 0x1C(r3)
    lda     0xC090F5C3, r15
    st      r15, 0x20(r3)
    mov     0, r15
    stis    r15, 0x24(r3)
    mov     0, r15
    stis    r15, 0x26(r3)
    mov     0, r15
    stis    r15, 0x28(r3)
    lda     displacement, r15
    stib    r15, 0x40(r3)
    ld      add_BACKUP_RAM_TO_RAM, r15
    ld      0x3320(r15), r14
    bbs     0, r14, loc_9980
loc_9980:                               # CODE XREF: ADV_REPLAY_PIC2+C4↑j
    ld      not_scr_bg_move, r15
    setbit  0xE, r15, r15
    st      r15, not_scr_bg_move
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    ret
# End of function ADV_REPLAY_PIC2
