        .section cpu_battle
ADV_CPU_BATTLE_INT:                     # DATA XREF: ROM:00007F88↑o
    ld      0x500498, r15 # Label from official source
    setbit  0x1F, r15, r15
    st      r15, 0x500498
    ld      0x500498, r15
    setbit  2, r15, r15
    st      r15, 0x500498
    mov     0, r3
    stob    r3, curr_round_num
    ld      fa_rob0, r5     # rob_select from Fighting Vipers below
    call    rand            # Random value stored to g0
    remo    0xA, g0, r3
    cmpobe  8, r3, loc_9A00
    cmpobe  9, r3, loc_9A00
    cmpobe  3, r3, loc_9A00
    b       loc_9A04
# ---------------------------------------------------------------------------
loc_9A00:                               # CODE XREF: ADV_CPU_BATTLE_INT+44↑j
    mov     2, r3
loc_9A04:                               # CODE XREF: ADV_CPU_BATTLE_INT+50↑j
    stob    r3, 0x1B0(r5)
    ld      fa_rob1, r5     # rob_select from Fighting Vipers below
    call    rand            # Random value stored to g0
    remo    0xA, g0, r4
    cmpobe  8, r4, loc_9A28
    cmpobe  9, r4, loc_9A28
    cmpobe  3, r4, loc_9A28
    b       loc_9A2C
# ---------------------------------------------------------------------------
loc_9A28:                               # CODE XREF: ADV_CPU_BATTLE_INT+6C↑j
    mov     0xA, r4
loc_9A2C:                               # CODE XREF: ADV_CPU_BATTLE_INT+78↑j
    cmpobne r3, r4, loc_9A34
    addi    0x1A, r4, r4
loc_9A34:                               # CODE XREF: ADV_CPU_BATTLE_INT:loc_9A2C↑j
    stob    r4, 0x1B0(r5)
    ld      fa_rob0, g7
    mov     0, r3
    stob    r3, 4(g7)
    ldib    0x1B0(g7), r15
    stib    r15, 0x1B1(g7)
    ldob    0x1B1(g7), r14
    cmpobg  0x1A, r14, loc_9A68
    ldib    0x1B1(g7), r15
    lda     -0x1A(r15), r15
    stib    r15, 0x1B1(g7)
loc_9A68:                               # CODE XREF: ADV_CPU_BATTLE_INT+A8↑j
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
    cmpobg  0x1A, r14, loc_9BAC
    ldib    0x1B1(g7), r15
    lda     -0x1A(r15), r15
    stib    r15, 0x1B1(g7)
loc_9BAC:                               # CODE XREF: ADV_CPU_BATTLE_INT+1EC↑j
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
    cmpobge 7, r3, loc_9D30
    mov     0, r3
loc_9D30:                               # CODE XREF: ADV_CPU_BATTLE_INT+37C↑j
    stob    r3, 0x50005B
    stob    r3, stage_num
    call    change_scene
    lda     0x3727C5AC, r15
    st      r15, cage_ypos
    mov     1, r4
    ld      mod_fa_key_record, r3
    ld      0x0(r3), r5
    clrbit  31, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_record, r3
    ld      0x0(r3), r5
    clrbit  31, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_play, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_control0, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    shlo    6, 5, r4
    ld      mod_fa_game_disp, r3
    st      r4, 0x54(r3)
    call    sub_81038
    call    sub_81AFC
    call    ring_tobitiri_init # Ring Scatter
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    ret
# End of function ADV_CPU_BATTLE_INT
# =============== S U B R O U T I N E =======================================
ADV_CPU_BATTLE_WAIT1:                   # DATA XREF: ROM:00007F90↑o
    ld      mod_fa_game_disp, r3 # Label from official source
    ld      0x54(r3), r15
    cmpdeco 0, r15, r15
loc_9DF8:                               # DATA XREF: MAIN_DATA:02804F38↓o
    be      loc_9E0C
    st      r15, 0x54(r3)
    ld      0x54(r3), r5
    cmpobne 20, r5, loc_9E08
loc_9E08:                               # CODE XREF: ADV_CPU_BATTLE_WAIT1+1C↑j
    ret
# ---------------------------------------------------------------------------
loc_9E0C:                               # CODE XREF: ADV_CPU_BATTLE_WAIT1:loc_9DF8↑j
    ldib    TST_RED, r15
    stib    r15, TST_RED_ADD
    ldib    TST_GRN, r15
    stib    r15, TST_GRN_ADD
    ldib    TST_BLUE, r15
    stib    r15, TST_BLUE_ADD
    ld      busy_signal_flag, r14
    cmpobne 1, r14, loc_9E4C
    ret
# ---------------------------------------------------------------------------
loc_9E4C:                               # CODE XREF: ADV_CPU_BATTLE_WAIT1+5C↑j
    call    scr_bg_int
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    lda     0x1000000, g9
    addo    0x1F, 0x1F, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    ld      mod_fa_game_disp, r3
    ldos    energy_max, r15
    stos    r15, 0x44(r3)
    stos    r15, 0x46(r3)
    ld      mod_fa_sound, r3
    ld      0x0(r3), r4
    setbit  29, r4, r4
    st      r4, 0x0(r3)
    mov     1, r4
    ld      mod_fa_control0, r3
    ld      0x0(r3), r5
    setbit  31, r5, r5
    st      r5, 0x0(r3)
    lda     control_init, r5 # Executes once at start of char sel, once at the start of the vs screen, then once every frame of gameplay once the map is loaded.
    st      r5, 0xC(r3)
    ld      select0_flag, r15
    clrbit  2, r15, r15
    st      r15, select0_flag
    ld      select1_flag, r15
    clrbit  2, r15, r15
    st      r15, select1_flag
    mov     1, r4
    ld      mod_fa_enemy0, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     fa_enemy0, r5
    st      r5, 0xC(r3)
    mov     1, r4
    ld      mod_fa_enemy1, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     fa_enemy1, r5
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
    bbs     0, r15, loc_9FE4
    lda     0x10016DA, g9
    b       loc_9FEC
# ---------------------------------------------------------------------------
loc_9FE4:                               # CODE XREF: ADV_CPU_BATTLE_WAIT1+1EC↑j
    lda     0x1000082, g9
loc_9FEC:                               # CODE XREF: ADV_CPU_BATTLE_WAIT1+1F8↑j
    ret
# End of function ADV_CPU_BATTLE_WAIT1
# =============== S U B R O U T I N E =======================================
ADV_CPU_BATTLE_DSP:                     # DATA XREF: ROM:00007F98↑o
    ld      fa_rob0, r3     # Label from official source
    ld      0x0(r3), r15
    bbs     5, r15, ADV_CPU_BATTLE_DSP_time_over
    ld      fa_rob1, r3
    ld      0x0(r3), r15
    bbs     5, r15, ADV_CPU_BATTLE_DSP_time_over
    ldos    game_timer, r3  # r3 = 0x780
    lda     0x720, r13      # r13 = 0x720
    cmpobne r13, r3, loc_A020
loc_A020:                               # CODE XREF: ADV_CPU_BATTLE_DSP+2C↑j
    shlo    8, 7, r13       # r13 = 0x700
    cmpobne r13, r3, loc_A06C
    lda     0x100001E, g9
    lda     77, g0          # RANKING texture
    call    dsp_pattern_new
    lda     0x1000480, g9
    lda     78, g0          # RANK TIME NAME CHARACTER texture
    call    dsp_pattern_new
    mov     0, r15
    stib    r15, 0x500094
    call    rank_cont
    ld      add_BACKUP_RAM_TO_RAM, r15
    ld      0x3320(r15), r15
    bbs     0, r15, loc_A06C
loc_A06C:                               # CODE XREF: ADV_CPU_BATTLE_DSP+34↑j
    lda     0x5A0, r13
    cmpobne r13, r3, loc_A074
loc_A074:                               # CODE XREF: ADV_CPU_BATTLE_DSP+80↑j
    shlo    7, 0xB, r13
    cmpobne r13, r3, loc_A08C
    mov     1, r15
    stib    r15, 0x500094
    call    rank_cont
loc_A08C:                               # CODE XREF: ADV_CPU_BATTLE_DSP+88↑j
    lda     0x460, r13
    cmpobne r13, r3, loc_A094
loc_A094:                               # CODE XREF: ADV_CPU_BATTLE_DSP+A0↑j
    shlo    6, 0x11, r13
    cmpobne r13, r3, loc_A0AC
    mov     2, r15
    stib    r15, 0x500094
    call    rank_cont
loc_A0AC:                               # CODE XREF: ADV_CPU_BATTLE_DSP+A8↑j
    shlo    5, 0x19, r13
    cmpobne r13, r3, loc_A0B4
loc_A0B4:                               # CODE XREF: ADV_CPU_BATTLE_DSP+C0↑j
    shlo    8, 3, r13
    cmpobne r13, r3, loc_A0E4
    lda     0x1000000, g9
    addo    0x1F, 0x1F, g0
    addo    0x1F, 7, g1
    call    clr_pattern_s
    lda     0x1000020, g9
    shlo    2, 0x13, g0     # Tex num 76
    call    dsp_pattern_new
    call    char_rank_cont
loc_A0E4:                               # CODE XREF: ADV_CPU_BATTLE_DSP+C8↑j
    shlo    5, 0xD, r13
    cmpobne r13, r3, loc_A0EC
loc_A0EC:                               # CODE XREF: ADV_CPU_BATTLE_DSP+F8↑j
    shlo    6, 1, r13
    cmpobne r13, r3, loc_A108
    lda     0x1000000, g9
    addo    0x1F, 0x1F, g0
loc_A100:                               # DATA XREF: b_crx_copro_down+48↑o
    addo    0x1F, 7, g1
    call    clr_pattern_s
loc_A108:                               # CODE XREF: ADV_CPU_BATTLE_DSP+100↑j
    ldos    energy_max, r15
loc_A110:                               # DATA XREF: b_crx_copro_down+AC↑o
    ld      fa_rob0, r3
    stos    r15, 0x1AC(r3)
    ld      fa_rob1, r3
    stos    r15, 0x1AC(r3)
    ldos    game_timer, r3
    subo    1, r3, r3
    stos    r3, game_timer
    cmpobe  0, r3, ADV_CPU_BATTLE_DSP_time_over # compare ordinal 0 to GAME_TIMER and branch if equal
    ret
# ---------------------------------------------------------------------------
ADV_CPU_BATTLE_DSP_time_over:           # CODE XREF: ADV_CPU_BATTLE_DSP+C↑j
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    mov     1, r4
    ld      mod_fa_key_play, r3
    ld      0x0(r3), r5
    clrbit  31, r5, r5
    st      r5, 0x0(r3)
    shlo    7, 1, r4
    ld      mod_fa_game_disp, r3
    st      r4, 0x54(r3)
    ld      mod_fa_sound, r3
    ld      0x0(r3), r4
    clrbit  29, r4, r4
    setbit  28, r4, r4
    st      r4, 0x0(r3)
    ret
# End of function ADV_CPU_BATTLE_DSP
# =============== S U B R O U T I N E =======================================
ADV_CPU_BATTLE_WAIT2:                   # DATA XREF: ROM:00007FA0↑o
    ld      mod_fa_game_disp, r3 # Label from official source
    ld      0x54(r3), r15
    subo    1, r15, r15
    st      r15, 0x54(r3)
    cmpobe  0, r15, loc_A1C0
    ld      0x54(r3), r5
    cmpobne 0x14, r5, loc_A1BC
loc_A1BC:                               # CODE XREF: ADV_CPU_BATTLE_WAIT2+1C↑j
    ret
# ---------------------------------------------------------------------------
loc_A1C0:                               # CODE XREF: ADV_CPU_BATTLE_WAIT2+14↑j
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    ret
# End of function ADV_CPU_BATTLE_WAIT2
