
        .section victory
# =============== S U B R O U T I N E =======================================
VIC_INT:                                # DATA XREF: ROM:0000B054↑o
    lda     0x1002000, g9 # Label from official source
    addo    0x1F, 0x1F, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    ld      mod_fa_game_disp, r4
    ld      0x0(r4), r3
    clrbit  0x1B, r3, r3
    setbit  0x1C, r3, r3
    st      r3, 0x0(r4)
    ld      not_scr_bg_move, r15
    setbit  0, r15, r15
    st      r15, not_scr_bg_move
    mov     1, r4
    ld      mod_fa_coli, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     coli_init, r5
    st      r5, 0xC(r3)
    ldib    winner, r15
    stib    r15, look_char
    ld      not_scr_bg_move, r15
    bbc     1, r15, next_program
    ldob    0x50004E, r14
    cmpobe  2, r14, next_program
    mov     2, r15
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobe  r15, r14, loc_E794
    ldob    winner, r13
    cmpobne r13, r14, loc_E7A4
loc_E794:                               # CODE XREF: VIC_INT+98↑j
    shlo    6, 5, r15
    st      r15, CTRL_TIMER
    b       loc_E7D0
# ---------------------------------------------------------------------------
loc_E7A4:                               # CODE XREF: VIC_INT+A4↑j
    ldob    look_char, r13
    notbit  0, r13, r12
    stob    r12, look_char
    ld      not_scr_bg_move, r15
    bbc     1, r15, loc_E7C4
loc_E7C4:                               # CODE XREF: VIC_INT+D4↑j
    shlo    5, 5, r15
    st      r15, CTRL_TIMER
loc_E7D0:                               # CODE XREF: VIC_INT+B4↑j
    lda     0xA00001, g0
    call    check_same_sound
    call    sound_request_u
    ldob    winner, g0
    ldob    look_char, g1
    call    win_voice
    lda     versus10, r15
    stib    r15, draw_vs_routine_flag
    mov     1, r15
    stis    r15, ingame_countdown_FFFF # Rename this, it's not always FFFF
    lda     0x1000700, g9
    shlo    6, 1, g0
    mov     0x18, g1
    call    clr_pattern_s
    ld      not_scr_bg_move, r15
    bbc     1, r15, loc_E890
    lda     start_ip_add, r15
    stib    r15, draw_vs_routine_flag
    ldos    rank_mode, r3
    bbs     8, r3, loc_E878
    ldob    winner, r15
    subo    r15, 6, r15
    bbc     r15, r3, loc_E86C
    bbs     7, r3, loc_E868
    shlo    8, 3, r3
    b       loc_E86C
# ---------------------------------------------------------------------------
loc_E868:                               # CODE XREF: VIC_INT+170↑j
    shlo    8, 1, r3
loc_E86C:                               # CODE XREF: VIC_INT+16C↑j
    clrbit  7, r3, r3
    stos    r3, rank_mode
loc_E878:                               # CODE XREF: VIC_INT+15C↑j
    ld      mod_fa_sound, r3
    ld      0x0(r3), r4
    clrbit  0x1D, r4, r4
    setbit  0x1C, r4, r4
    st      r4, 0x0(r3)
loc_E890:                               # CODE XREF: VIC_INT+140↑j
    mov     1, r4
    ld      mod_fa_win0, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     vic_pose_int0, r5
    st      r5, 0xC(r3)
    mov     1, r4
    ld      mod_fa_win1, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     vic_pose_int1, r5
    st      r5, 0xC(r3)
    ld      fa_camera, g6
    lda     displacement3, r15
    stib    r15, 0x40(g6)
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
# End of function VIC_INT
# =============== S U B R O U T I N E =======================================
VIC_DSP:                                # DATA XREF: ROM:0000B05C↑o
# FUNCTION CHUNK AT 0000E374 SIZE 00000378 BYTES
    ld      debug_flag, r15 # Label from official source
    bbs     2, r15, loc_E994
    ldob    STAGE_ID, r3
    mov     10, r4
    cmpobne r3, r4, loc_E93C
    ld      not_scr_bg_move, r15
    bbc     1, r15, loc_E93C
    ldob    gameprogram, r13 # bit 0 clear = Player 1
    ldob    0x50004E, r14
    cmpobe  r13, r14, loc_E994
loc_E93C:                               # CODE XREF: VIC_DSP+18↑j
    ld      INTERUPT_FLAGS_MOMENTARY, r8
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobe  1, r14, loc_E954
    bbs     4, r8, loc_E968
loc_E954:                               # CODE XREF: VIC_DSP+4C↑j
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobe  0, r14, loc_E994
    bbs     5, r8, loc_E968
    b       loc_E994
# ---------------------------------------------------------------------------
loc_E968:                               # CODE XREF: VIC_DSP+50↑j
    ld      CTRL_TIMER, r14
    cmpibge 0xB, r14, loc_E994
    mov     0xA, r15
    st      r15, CTRL_TIMER
    ld      not_scr_bg_move, r15
    clrbit  0, r15, r15
    st      r15, not_scr_bg_move
loc_E994:                               # CODE XREF: VIC_DSP+8↑j
    ld      mod_fa_win1, r3
    ld      fa_rob1, r4
    ldob    look_char, r14
    cmpobe  1, r14, loc_E9C0
    ld      mod_fa_win0, r3
    ld      fa_rob0, r4
loc_E9C0:                               # CODE XREF: VIC_DSP+AC↑j
    ld      not_scr_bg_move, r15
    bbc     0, r15, loc_E9D4
    ld      0x0(r3), r15
    bbc     0x1F, r15, loc_E9E4
loc_E9D4:                               # CODE XREF: VIC_DSP+C8↑j
    ld      CTRL_TIMER, r14
    cmpibge 0, r14, loc_EA08
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
loc_E9E4:                               # CODE XREF: VIC_DSP+D0↑j
    ld      not_scr_bg_move, r15
    clrbit  0, r15, r15
    st      r15, not_scr_bg_move
    shlo    6, 1, r15
loc_E9FC:                               # DATA XREF: ROM:000213A4↓o
    st      r15, CTRL_TIMER
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
loc_EA08:                               # CODE XREF: VIC_DSP+DC↑j
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r15
    setbit  6, r15, r15
    st      r15, 0x0(r3)
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobe  2, r14, loc_EA68
    ldob    0x50004D, r14
    cmpobe  2, r14, loc_EAF8
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobe  0, r14, loc_EA54
    ld      fa_rob1, g8
    ld      0x0(g8), r15
    bbs     5, r15, loc_EB18
    b       loc_EAC4
# ---------------------------------------------------------------------------
loc_EA54:                               # CODE XREF: VIC_DSP+13C↑j
    ld      fa_rob0, g7
    ld      0x0(g7), r15
    bbs     5, r15, loc_EB18
    b       loc_EAC4
# ---------------------------------------------------------------------------
loc_EA68:                               # CODE XREF: VIC_DSP+124↑j
    ld      add_BACKUP_RAM_TO_RAM, r15
    ldob    0x3353(r15), r15
    bbs     5, r15, loc_EB18
    ld      add_BACKUP_RAM_TO_RAM, r8
    ldob    0x332A(r8), r8
    ld      add_BACKUP_RAM_TO_RAM, r15
    ldob    0x332B(r15), r15
    cmpobl  r15, r8, loc_EB18
    ld      add_BACKUP_RAM_TO_RAM, r8
    ldob    0x332D(r8), r8
    ld      add_BACKUP_RAM_TO_RAM, r15
    ldob    0x332E(r15), r15
    cmpobl  r15, r8, loc_EB18
loc_EAC4:                               # CODE XREF: VIC_DSP+150↑j
    ld      not_scr_bg_move, r15
    bbs     0x1B, r15, loc_EB18
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobl  1, r14, loc_EAE8
    ldob    stage_num, r14  # Load LEVEL_ID to r14
    cmpobe  7, r14, loc_EB1C # If LEVEL_ID = 7, load Lunar Fox cutscene
loc_EAE8:                               # CODE XREF: VIC_DSP+1D8↑j
    mov     0x18, r15
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
loc_EAF8:                               # CODE XREF: VIC_DSP+130↑j
    ldob    stage_num, r14
    cmpobne 7, r14, loc_EB18
    ldob    gameprogram, r13 # bit 0 clear = Player 1
    ldob    winner, r14
    cmpobe  r13, r14, loc_EB1C
loc_EB18:                               # CODE XREF: VIC_DSP+14C↑j
    b       next_program
# ---------------------------------------------------------------------------
loc_EB1C:                               # CODE XREF: VIC_DSP+1E4↑j
    mov     0x1E, r15
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# End of function VIC_DSP
