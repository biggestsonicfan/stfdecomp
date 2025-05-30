        .section judge
JUDGE_INT:                              # DATA XREF: ROM:0000B034↑o
    lda     0xAE1302, g0    # Label from official source
    call    check_same_sound
    call    sound_request_u
    mov     0, r15
    st      r15, CTRL_TIMER
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
JUDGE_WAIT:                             # DATA XREF: ROM:0000B03C↑o
    ldib    _sub_mode, r15  # Label from official source
    lda     1(r15), r15
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
JUDGE_DSP_INT:                          # DATA XREF: ROM:0000B044↑o
    ldob    gameprogram, r14 # Label from official source
    cmpobe  2, r14, loc_D6BC
    ldob    STAGE_ID, r14
    cmpobne 10, r14, loc_D6BC
    mov     1, r15
    stib    r15, num_rounds_to_win
    ld      not_scr_bg_move, r15
    setbit  4, r15, r15
    st      r15, not_scr_bg_move
loc_D6BC:                               # CODE XREF: ROUND_DSP+ECC↑j
    ld      mod_fa_game_disp, r4
    ld      0x0(r4), r3
    clrbit  27, r3, r3
    st      r3, 0x0(r4)
    ld      fa_rob0, r3
    ld      fa_rob1, r4
    ld      not_scr_bg_move, r15
    bbs     0, r15, loc_D70C
    mov     0, r15
    stib    r15, 0x500050
    ld      0x0(r3), r15
    bbc     5, r15, set_bit_5_P2_PARTS
    ld      0x0(r4), r15
    bbc     5, r15, loc_D85C
    b       loc_D74C
# ---------------------------------------------------------------------------
loc_D70C:                               # CODE XREF: ROUND_DSP+F28↑j
    mov     2, r15
    stib    r15, 0x500050
    ldob    STAGE_ID, r14
    cmpobne 10, r14, loc_D734
    ldob    gameprogram, r11 # bit 0 clear = Player 1
    cmpobe  0, r11, loc_D85C # if gameprogram = 0, branch
    cmpobe  1, r11, set_bit_5_P2_PARTS # if gameprogram = 1, branch
loc_D734:                               # CODE XREF: ROUND_DSP+F60↑j
    ldos    0x1AC(r3), r13  # p1_energy
    ldos    0x1AC(r4), r14  # p2_energy
    cmpobl  r13, r14, loc_D85C
    ldos    0x1AC(r3), r13  # p1_energy
    ldos    0x1AC(r4), r14  # p2_energy
    cmpobg  r13, r14, set_bit_5_P2_PARTS
loc_D74C:                               # CODE XREF: ROUND_DSP+F48↑j
    ld      not_scr_bg_move, r15
    bbc     4, r15, loc_D7B4
    ldos    0x1AC(r3), r13  # p1_energy
    ldos    0x1AC(r4), r14  # p2_energy
    cmpobl  r13, r14, loc_D85C
    ldos    0x1AC(r3), r13  # p1_energy
    ldos    0x1AC(r4), r14  # p2_energy
    cmpobg  r13, r14, set_bit_5_P2_PARTS
    ldob    0x500066, r14
    cmpobe  0, r14, set_bit_5_P2_PARTS
    ldob    0x500066, r14
    cmpobe  1, r14, loc_D85C
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobl  1, r14, loc_D7A4
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobe  1, r14, set_bit_5_P2_PARTS
    b       loc_D85C
# ---------------------------------------------------------------------------
loc_D7A4:                               # CODE XREF: ROUND_DSP+FD0↑j
    ld      frame_counter, r14
    cmpobne 0, r14, loc_D85C
    b       set_bit_5_P2_PARTS
# ---------------------------------------------------------------------------
loc_D7B4:                               # CODE XREF: ROUND_DSP+F94↑j
    mov     2, r15
    stib    r15, 0x50004D
    ldib    0x50004D, r15
    stib    r15, winner
    ldib    p1_wins, r15
    lda     1(r15), r15
    stib    r15, p1_wins
    ldib    p2_wins, r15
    lda     1(r15), r15
    stib    r15, p2_wins
    ldob    p1_wins, r13
    ldob    p2_wins, r14
    cmpobe  r13, r14, loc_D954
    mov     0, r15
    stib    r15, 0x50004E
    ldob    num_rounds_to_win, r13
    ldob    p1_wins, r14
    cmpoble r13, r14, loc_D91C
    mov     1, r15
    stib    r15, 0x50004E
    ldob    num_rounds_to_win, r13
    ldob    p2_wins, r14
    cmpoble r13, r14, loc_D91C
    mov     2, r15
    stib    r15, 0x50004E
    b       loc_D954
# ---------------------------------------------------------------------------
loc_D85C:                               # CODE XREF: ROUND_DSP+F44↑j
    ld      0x0(r3), r15
    setbit  5, r15, r15
    st      r15, 0x0(r3)
    mov     1, r15
    stib    r15, 0x50004D
    ldib    0x50004D, r15
    stib    r15, winner
    ldib    p2_wins, r15
    lda     1(r15), r15
    stib    r15, p2_wins
    ldob    num_rounds_to_win, r13
    ldob    p2_wins, r14
    cmpobg  r13, r14, loc_D954
    mov     1, r15
    stib    r15, 0x50004E
    b       loc_D91C
# ---------------------------------------------------------------------------
set_bit_5_P2_PARTS:                     # CODE XREF: ROUND_DSP+F3C↑j
    ld      0x0(r4), r15
    setbit  5, r15, r15     # Sets bit 5 of P2_PARTS
    st      r15, 0x0(r4)
    mov     0, r15
    stib    r15, 0x50004D
    ldib    0x50004D, r15
    stib    r15, winner
    ldib    p1_wins, r15
    lda     1(r15), r15
    stib    r15, p1_wins
    ldob    num_rounds_to_win, r13
    ldob    p1_wins, r14
    cmpobg  r13, r14, loc_D954
    mov     0, r15
    stib    r15, 0x50004E
    b       loc_D91C
# ---------------------------------------------------------------------------
loc_D91C:                               # CODE XREF: ROUND_DSP+1068↑j
    ldib    0x50004E, r15
    stib    r15, winner
    ld      not_scr_bg_move, r15
    setbit  1, r15, r15
    st      r15, not_scr_bg_move
    ld      0x500240, r15
    setbit  0, r15, r15
    st      r15, 0x500240
loc_D954:                               # CODE XREF: ROUND_DSP+1048↑j
    ld      0x500240, r15
    setbit  2, r15, r15
    st      r15, 0x500240
    ldob    STAGE_ID, r14
    cmpobl  10, r14, loc_D978 # if STAGE_ID is less than final Eggman boss fight branch
    call    set_after_check # if Eggman boss fight
loc_D978:                               # CODE XREF: ROUND_DSP+11B0↑j
    ld      finish_wall_flag, r15
    st      r15, 0x50A3F0
    ld      not_scr_bg_move, r15
    bbc     1, r15, loc_DB1C
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobl  1, r14, loc_DAD0
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobne 0, r14, loc_D9CC
loc_D9AC:                               # DATA XREF: ROM:0002B1B0↓o
    ldob    p2_wins, r13
    ld      rounds_lost_vs_cpu, r14
    addi    r13, r14, r15
    st      r15, rounds_lost_vs_cpu
    b       loc_D9E8
# ---------------------------------------------------------------------------
loc_D9CC:                               # CODE XREF: ROUND_DSP+11E8↑j
    ldob    p1_wins, r13
    ld      rounds_lost_vs_cpu, r14
    addi    r13, r14, r15
    st      r15, rounds_lost_vs_cpu
loc_D9E8:                               # CODE XREF: ROUND_DSP+1208↑j
    ld      0x500070, r15
    st      r15, 0x500074
    ldob    STAGE_ID, r4
    ldob    gameprogram, r13 # bit 0 clear = Player 1
    ldob    0x50004E, r14
    cmpobne r13, r14, loc_DB1C
    addi    1, r4, r15
    stob    r15, current_stage_played_num
    ld      0x500240, r15
    setbit  1, r15, r15
    st      r15, 0x500240
    ldos    rank_mode, r15
    bbc     0, r15, loc_DAD0
    bbs     7, r15, loc_DAD0
    or      2, r15, r15
    stos    r15, rank_mode
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobne 0, r14, loc_DA98
    ldob    p1_wins, r13
    ld      total_win, r14
    addi    r13, r14, r15
    st      r15, total_win
    ldob    p2_wins, r13
    ld      total_time, r14
    addi    r13, r14, r15
    st      r15, total_time
    b       loc_DAD0
# ---------------------------------------------------------------------------
loc_DA98:                               # CODE XREF: ROUND_DSP+1298↑j
    ldob    p2_wins, r13
    ld      total_win, r14
    addi    r13, r14, r15
    st      r15, total_win
    ldob    p1_wins, r13
    ld      total_time, r14
    addi    r13, r14, r15
    st      r15, total_time
loc_DAD0:                               # CODE XREF: ROUND_DSP+11DC↑j
    ld      0x500240, r15
    setbit  5, r15, r15
    st      r15, 0x500240
    ldob    winner, r14
    cmpobe  0, r14, loc_DB08
    ld      0x500240, r15
    setbit  3, r15, r15
    st      r15, 0x500240
    b       loc_DB1C
# ---------------------------------------------------------------------------
loc_DB08:                               # CODE XREF: ROUND_DSP+132C↑j
    ld      0x500240, r15
    setbit  4, r15, r15
    st      r15, 0x500240
loc_DB1C:                               # CODE XREF: ROUND_DSP+11D0↑j
    ldob    0x500050, r14
    cmpobne 0, r14, loc_DB60
    ldos    energy_max, r13
    ldos    0x1AC(r3), r14
    cmpobne r13, r14, loc_DB40
    shlo    2, 0x11, g0
    b       jdi_set_sound
# ---------------------------------------------------------------------------
loc_DB40:                               # CODE XREF: ROUND_DSP+1374↑j
    ldos    energy_max, r13
    ldos    0x1AC(r4), r14
    cmpobne r13, r14, loc_DB58
    shlo    2, 0x11, g0
    b       jdi_set_sound
# ---------------------------------------------------------------------------
loc_DB58:                               # CODE XREF: ROUND_DSP+138C↑j
    shlo    3, 9, g0
    b       jdi_set_sound
# ---------------------------------------------------------------------------
loc_DB60:                               # CODE XREF: ROUND_DSP+1364↑j
    ldob    0x500050, r14
    cmpobne 1, r14, loc_DB74
    shlo    2, 0x15, g0
    b       jdi_set_sound
# ---------------------------------------------------------------------------
loc_DB74:                               # CODE XREF: ROUND_DSP+13A8↑j
    ldob    0x50004D, r14
    cmpobe  2, r14, loc_DB88
    shlo    4, 5, g0
    b       jdi_set_sound
# ---------------------------------------------------------------------------
loc_DB88:                               # CODE XREF: ROUND_DSP+13BC↑j
    shlo    2, 0x13, g0
jdi_set_sound:                          # CODE XREF: ROUND_DSP+137C↑j
    mov     0, g1           # Label from official source
    call    sound_queue_input
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r15
    setbit  4, r15, r15
    st      r15, 0x0(r3)
    ld      not_scr_bg_move, r15
    bbc     1, r15, loc_DC14
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobne 2, r14, loc_DC14
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r15
    setbit  21, r15, r15
    st      r15, 0x0(r3)
    ldob    0x50004E, r3
    ldob    0x500066, r4
    cmpobne r3, r4, loc_DC00
    ldis    0x5000A2, r15
    lda     1(r15), r15
    stis    r15, 0x5000A2
    b       loc_DC14
# ---------------------------------------------------------------------------
loc_DC00:                               # CODE XREF: ROUND_DSP+1424↑j
    mov     1, r15
    stis    r15, 0x5000A2
    stob    r3, 0x500066
loc_DC14:                               # CODE XREF: ROUND_DSP+13F0↑j
    lda     versus8, r15
    stib    r15, draw_vs_routine_flag
    mov     0, r15
    stis    r15, replay_countdown
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    shlo    7, 1, r15
    st      r15, CTRL_TIMER
    mov     0, r15
    st      r15, CTRL_TIMER
    lda     cam_mode10, r4
    ldob    0x40(g13), r5
    cmpobe  r4, r5, game_sub_ex # Subtracts 1 from CTRL_TIMER
    shlo    7, 1, r15
    st      r15, CTRL_TIMER
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
JUDGE_DSP:                              # DATA XREF: ROM:0000B04C↑o
    ldob    winner, r13     # Label from official source
    shlo    8, 7, r14       # not_slow_sw_on
    shlo    3, r13, r15
    shlo    r15, r14, r14
    ld      INTERUPT_FLAGS_HELD, r15
    and     r15, r14, r15
    cmpobne r14, r15, gong_ring_1
    ldis    replay_countdown, r15
    lda     1(r15), r15
    stis    r15, replay_countdown
gong_ring_1:                            # CODE XREF: ROUND_DSP+14DC↑j
    lda     versus9, r15  # Label from official source
    stib    r15, draw_vs_routine_flag
    ld      CTRL_TIMER, r3
    lda     113, r13
    cmpobne r13, r3, gong_ring_2
    lda     0xAE1302, g0    # sd_gong_4
    call    check_same_sound
    call    sound_request_u
gong_ring_2:                            # CODE XREF: ROUND_DSP+1510↑j
    lda     98, r13         # Label from official source
    cmpobne r13, r3, loc_DCFC
    lda     0xAE1302, g0    # sd_gong_4
    call    check_same_sound
    call    sound_request_u
loc_DCFC:                               # CODE XREF: ROUND_DSP+1528↑j
    ld      CTRL_TIMER, r14 # Label from official source
    cmpibl  0, r14, game_sub_ex # Subtracts 1 from CTRL_TIMER
no_start_rep_w1:                        # CODE XREF: ROUND_DSP+E70↑j
    ld      0x500240, r15 # Label from official source
    clrbit  2, r15, r15
    st      r15, 0x500240
    call    sub_77C2C
    ldob    0x50004D, r14
    cmpobne 2, r14, not_sudden
    ldob    p1_wins, r13
    ldob    p2_wins, r14
    cmpobne r13, r14, not_sudden
    ldob    num_rounds_to_win, r13
    ldob    p1_wins, r14
    cmpobg  r13, r14, not_sudden
    ld      not_scr_bg_move, r15
    setbit  4, r15, r15
    st      r15, not_scr_bg_move
    call    set_close
    mov     4, r15
    stib    r15, _sub_mode
    ldib    p1_wins, r15
    lda     -1(r15), r15
    stib    r15, p1_wins
    ldib    p2_wins, r15
    lda     -1(r15), r15
    stib    r15, p2_wins
    ld      mod_fa_control0, r3
    ld      0x0(r3), r15
    clrbit  0, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  1, r15, r15
    st      r15, 0x0(r3)
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
    ld      mod_fa_control0, r3
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
    ld      mod_fa_enemy0, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_enemy1, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
not_sudden:                             # CODE XREF: ROUND_DSP+1568↑j
    ld      mod_fa_control0, r3 # Label from official source
    ld      0x0(r3), r15
    clrbit  0, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  1, r15, r15
    st      r15, 0x0(r3)
    mov     0x10, r15
    stib    r15, _sub_mode
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobe  2, r14, loc_DEB0
    call    save_ending_rep_data
loc_DEB0:                               # CODE XREF: ROUND_DSP+16E8↑j
    mov     1, r4
    ld      mod_fa_record, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_key_record, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_key_play, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
