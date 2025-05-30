        .section fight
# ---------------------------------------------------------------------------
FIGHT_INT:                              # DATA XREF: ROM:0000B024↑o
    ld      mod_fa_coli, r3 # Label from Fighting Vipers source (but it was obvious)
    ld      0x1B0(r3), r15
    clrbit  9, r15, r15
    st      r15, 0x1B0(r3)
    ld      mod_fa_game_disp, r4
    ld      0x0(r4), r3
    clrbit  25, r3, r3
    st      r3, 0x0(r4)
    ld      mod_fa_sound, r3
    ld      0x0(r3), r4
    setbit  28, r4, r4
    st      r4, 0x0(r3)
    ld      mod_fa_play, r4
    ld      0x80(r4), r3
    clrbit  0, r3, r3
    clrbit  1, r3, r3
    st      r3, 0x80(r4)
    ld      not_scr_bg_move, r13
    clrbit  17, r13, r13
    st      r13, not_scr_bg_move
    mov     1, r4
    ld      mod_fa_control0, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     control_init, r5 # Executes once at start of char sel, once at the start of the vs screen, then once every frame of gameplay once the map is loaded.
    st      r5, 0xC(r3)
    ldob    STAGE_ID, r14
    cmpoble 9, r14, loc_D088 # Branch is STAGE_ID is less than or equal to 9
    ld      not_scr_bg_move, r15
    bbs     4, r15, loc_D088
    mov     1, r4
    ld      mod_fa_key_record, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     key_rec_init, r5
    st      r5, 0xC(r3)
    ld      mod_fa_control0, r6
    lda     REPLAY_BANK_ADR_value, r3
    st      r3, replay_bank_adr
    ld      replay_bank_adr, r5
    ld      fa_rob0, r3
    ldib    0x1B0(r3), r15
    stib    r15, 0xC(r5)
    ldib    0x6CC(r3), r15
    stib    r15, 0xFFF(r5)
    ld      fa_rob1, r3
    ldib    0x1B0(r3), r15
    stib    r15, 0x10(r5)
    ldib    0x6CC(r3), r15
    stib    r15, 0xFFE(r5)
    ld      stage_x, r15
    st      r15, 4(r5)
loc_D088:                               # CODE XREF: ROUND_DSP+838↑j
    mov     1, r4
    ld      mod_fa_record, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     rec_init, r5
    st      r5, 0xC(r3)
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
    lda     pcrb+2, r15
    stib    r15, draw_vs_routine_flag # sub_7B690
    ld      mod_fa_control0, r3
    ld      0x0(r3), r15
    setbit  0, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    setbit  1, r15, r15
    st      r15, 0x0(r3)
    ldob    curr_round_num, r14
    cmpobne 1, r14, loc_D140
    ld      debug_flag, r15
    bbc     0xB, r15, loc_D140
    call    stage_bgm_select
loc_D140:                               # CODE XREF: ROUND_DSP+96C↑j
    lda     0xAE1302, g0    # sd_gong_4
    call    check_same_sound
    call    sound_request_u
    ld      fa_camera, r3
    lda     cam_mode9, r15
    stib    r15, 0x40(r3)   # cam_mode = 9
    ld      0x0(r3), r15
    clrbit  0xE, r15, r15
    st      r15, 0x0(r3)
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
FIGHT_DSP:                              # DATA XREF: ROM:0000B02C↑o
    lda     pcrb+3, r15 # Label from official source
    stib    r15, draw_vs_routine_flag
    ld      fa_rob0, r3
    ld      0x0(r3), r15
    bbs     5, r15, loc_D1E0
    ld      fa_rob1, r3
    ld      0x0(r3), r15
    bbs     5, r15, loc_D1EC
    ldos    game_timer, r14
    cmpobe  0, r14, loc_D240
    ldis    game_timer, r15
    lda     -1(r15), r15
    stis    r15, game_timer
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
loc_D1E0:                               # CODE XREF: ROUND_DSP+9E4↑j
    ld      fa_rob1, r7
    b       loc_D1F4
# ---------------------------------------------------------------------------
loc_D1EC:                               # CODE XREF: ROUND_DSP+9F4↑j
    ld      fa_rob0, r7
loc_D1F4:                               # CODE XREF: ROUND_DSP+A28↑j
    ldib    0x843(r7), r15  # P1_PARTS+0x843
    stib    r15, 0x87C(r7)
    ldob    0x843(r7), r4
    cmpobe  4, r4, loc_D20C
    cmpobe  3, r4, loc_D21C
    b       loc_D254
# ---------------------------------------------------------------------------
loc_D20C:                               # CODE XREF: ROUND_DSP+A40↑j
    ldob    0x7D2(r7), r14
    setbit  2, r14, r15
    stob    r15, 0x7D2(r7)
    b       loc_D228
# ---------------------------------------------------------------------------
loc_D21C:                               # CODE XREF: ROUND_DSP+A44↑j
    ldob    0x7D2(r7), r14
    setbit  1, r14, r15
    stob    r15, 0x7D2(r7)
loc_D228:                               # CODE XREF: ROUND_DSP+A58↑j
    ld      fa_camera, r3
    lda     check_word2+2, r15
    stib    r15, 0x40(r3)   # cam_mode to 22
    b       loc_D254
# ---------------------------------------------------------------------------
loc_D240:                               # CODE XREF: ROUND_DSP+A00↑j
    ld      not_scr_bg_move, r15
    setbit  0, r15, r15
    st      r15, not_scr_bg_move
loc_D254:                               # CODE XREF: ROUND_DSP+A48↑j
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
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
    ld      mod_fa_record, r3
    ld      mod_fa_play, r5
    ld      0x6C(r3), r4
    st      r4, 0x7C(r5)
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
    