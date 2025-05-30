        .section advertise_mode
ADV_INT:                                # DATA XREF: ROM:00007B14↑o
    ld      mod_fa_pol_string, r3 # Label from official source
    mov     0, r15
    st      r15, rounds_lost_vs_cpu
    mov     0, r15
    st      r15, continue_count
    mov     0, r15
    st      r15, also_continue_count
    mov     1, r15
    stib    r15, 0x200(r3)  # store r15 into mod_fa_pol_string+0x200
    ld      not_scr_bg_move, r15
    clrbit  16, r15, r15
    st      r15, not_scr_bg_move
loc_7FF8:                               # DATA XREF: rob_revise_yang+214↓o
    ld      not_scr_bg_move, r15
loc_8000:                               # DATA XREF: sub_4B240+50↓o
    clrbit  25, r15, r15
    st      r15, not_scr_bg_move
    ld      not_scr_bg_move, r15
    clrbit  4, r15, r15
    st      r15, not_scr_bg_move
loc_8020:                               # DATA XREF: print_hex_w+40↑o
    ld      not_scr_bg_move, r15
    clrbit  23, r15, r15
loc_802C:                               # DATA XREF: sub_60878:loc_608D8↓o
    st      r15, not_scr_bg_move
    ld      not_scr_bg_move, r15
    clrbit  15, r15, r15
loc_8040:                               # DATA XREF: smooth_int+64↓o
    st      r15, not_scr_bg_move
loc_8048:                               # DATA XREF: print_book_time+84↑o
    ld      select0_flag, r15
    clrbit  6, r15, r15
    st      r15, select0_flag
loc_805C:                               # DATA XREF: ending_send_next_tex↓o
    ld      select1_flag, r15
    clrbit  6, r15, r15
    st      r15, select1_flag
    mov     0, r15
    st      r15, total_win
    mov     0, r15
loc_8080:                               # DATA XREF: dbg_menu_variable_init+158↓o
    st      r15, total_time
    mov     0, r15
    st      r15, total_skill
    mov     0, r15
    st      r15, win_points
    mov     0, r15
    st      r15, time_points
    mov     0, r15
    st      r15, skill_points
    mov     0, r15
    st      r15, 0x500070
    mov     0, r15
    st      r15, 0x500074
    ldob    start_stage, r3
    stob    r3, STAGE_ID
    stob    r3, current_stage_played_num
    mov     0, r15
    stis    r15, 0x500432
    mov     0, r15
    stib    r15, 0x500081
    mov     0, r15
    stib    r15, 0x50008D
    mov     0, r15
    stib    r15, 0x50008E
    ld      add_BACKUP_RAM_TO_RAM, r15
    ldob    0x3353(r15), r15 # r15 = BACKUP_RAM_TO_RAM+0x3353
    bbs     5, r15, loc_8138
    mov     0, r15
    stib    r15, 0x50005B
loc_8138:                               # CODE XREF: ROM:00008128↑j
    mov     0, r15
    stis    r15, 0x100A000
    mov     0, r15
    stis    r15, 0x100A008
    lda     0x1008000, r14
    mov     0, r15
    shlo    9, 1, r13
loc_8160:                               # CODE XREF: ROM:0000816C↓j
    stis    r15, (r14)
    addo    2, r14, r14
    cmpdeco 1, r13, r13
    bl      loc_8160
    call    window_data_init
    mov     4, g0
    call    _Scroll_Initialize
    ld      mod_fa_sel_disp, r3
    mov     0, r15
    stib    r15, 0x5C(r3)
    ldib    char_select_array_length, r15
    stib    r15, 0x78(r3)
    ld      fa_camera, r3
    lda     cam_mode9, r15
    stib    r15, 0x40(r3)   # cam_mode = 9
    mov     1, r4
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r5
    setbit  31, r5, r5
    st      r5, 0x0(r3)
    lda     game_display_init, r5
    st      r5, 0xC(r3)
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r4
    setbit  26, r4, r4
    setbit  9, r4, r4
    st      r4, 0x0(r3)
    ldob    time, r3
    shlo    2, 0x19, r13
    mulo    r13, r3, r3
    stos    r3, 0x50006E
    mov     0, r15
    stib    r15, _sub_mode
loc_820C:                               # DATA XREF: dbg_menu_variable_init+FC↓o
    mov     1, r4
    ld      mod_fa_coli, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     coli_init, r5
    st      r5, 0xC(r3)
    ld      mod_fa_coli, r3
    ld      0x1B0(r3), r15  # r15 = mod_fa_coli_add+0x1B0
    clrbit  9, r15, r15
    st      r15, 0x1B0(r3)
    mov     1, r4
    ld      mod_fa_sampling, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      fa_camera, r3
    ld      0x0(r3), r5
    setbit  31, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_win0, r3
loc_8280:                               # DATA XREF: draw_game_over+74↓o
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
    call    voice_init      # return
    lda     0x1000000, g9
    addo    0x1F, 0x1F, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    ldib    mode, r15
    lda     1(r15), r15
    stib    r15, mode
    ret
# ---------------------------------------------------------------------------
ADV_DSP:                                # DATA XREF: ROM:00007B1C↑o
    ld      fa_rob0, g7     # Label from official source
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
    ldib    _sub_mode, r15
    stib    r15, also_sub_mode
    ldob    _sub_mode, r3
    shlo    r3, 1, r4
    st      r4, 0x500034
    ld      advertise_steps[r3*8], r5
    ld      debug_flag, r15
    bbs     9, r15, loc_83EC
    addo    4, sp, sp
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
    ld      advertise_ascii[r3*8], g0
    call    print_mes
loc_83EC:                               # CODE XREF: ROM:00008390↑j
    callx   (r5)
    mov     0, g0
    call    player_entry
    cmpibne 0, g0, loc_84B0
    ld      not_scr_bg_move, r15
    clrbit  0x10, r15, r15
    st      r15, not_scr_bg_move
    mov     1, r4
    ld      mod_fa_key_play, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    ld      mod_fa_control0, r3
    ld      0x0(r3), r15
    clrbit  0, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  1, r15, r15
    st      r15, 0x0(r3)
    mov     2, r15
    stib    r15, 0x500056
    ldib    mode, r15
    lda     1(r15), r15
    stib    r15, mode
    ldob    start_stage, r3
    stob    r3, STAGE_ID
    stob    r3, current_stage_played_num
    ld      add_BACKUP_RAM_TO_RAM, r15
    ldob    0x3353(r15), r15 # r15 = BACKUP_RAM_START+0x3353
    bbs     5, r15, loc_84A0 # if barrier_reset_val_bak bit 5 set, branch
    mov     0, r15
    stib    r15, 0x50005B
loc_84A0:                               # CODE XREF: ROM:00008490↑j
    lda     0xA00001, g0
    call    sound_request_u
    call    sub_77BA8
loc_84B0:                               # CODE XREF: ROM:000083F8↑j
    ret
# ---------------------------------------------------------------------------

        .section repeat
# =============== S U B R O U T I N E =======================================
ADV_REPEAT:                             # DATA XREF: ROM:00007FA8↑o
    lda     0x1000000, g9   # Label from official source
    shlo    6, 1, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    mov     0, r15
    stib    r15, _sub_mode
    ret
# End of function ADV_REPEAT

        .section adv_mode_data
advertise_steps:
    .long ADV_FBI_PIC_INT   # DATA XREF: ROM:00008380↓r
advertise_ascii:
    .long aAdvFbiPicInt     # DATA XREF: ROM:loc_83E0↓r
    .long ADV_FBI_PIC_DSP
    .long aAdvFbiPicDsp     # "ADV_FBI_PIC_DSP"
    .long ADV_SEGA_PIC_INT
    .long aAdvSegaPicInt    # "ADV_SEGA_PIC_INT"
    .long ADV_SEGA_PIC_DSP
    .long aAdvSegaPicDsp    # "ADV_SEGA_PIC_DSP"
    .long ADV_MOVIE_INT
    .long aAdvMovieInt      # "ADV_MOVIE_INT"
    .long ADV_MOVIE_DSP
    .long aAdvMovieDsp      # "ADV_MOVIE_DSP"
    .long ADV_REPLAY_PIC
    .long aAdvReplayPic     # "ADV_REPLAY_PIC"
    .long ADV_REPLAY_INT
    .long aAdvReplayInt     # "ADV_REPLAY_INT"
    .long ADV_REPLAY_WAIT1A
    .long aAdvReplayWait1   # "ADV_REPLAY_WAIT1A"
    .long ADV_REPLAY_WAIT1B
    .long aAdvReplayWait1_0 # "ADV_REPLAY_WAIT1B"
    .long ADV_REPLAY_DSP
    .long aAdvReplayDsp     # "ADV_REPLAY_DSP"
    .long ADV_REPLAY_WAIT2
    .long aAdvReplayWait2   # "ADV_REPLAY_WAIT2"
    .long ADV_REPLAY_PIC2
    .long aAdvReplayPic2    # "ADV_REPLAY_PIC2"
    .long ADV_CPU_BATTLE_INT
    .long aAdvCpuBattleIn   # "ADV_CPU_BATTLE_INT"
    .long ADV_CPU_BATTLE_WAIT1
    .long aAdvCpuBattleWa   # "ADV_CPU_BATTLE_WAIT1"
    .long ADV_CPU_BATTLE_DSP
    .long aAdvCpuBattleDs   # "ADV_CPU_BATTLE_DSP"
    .long ADV_CPU_BATTLE_WAIT2
    .long aAdvCpuBattleWa_0 # "ADV_CPU_BATTLE_WAIT2"
    .long ADV_REPEAT
    .long aAdvRepeat        # "ADV_REPEAT"
