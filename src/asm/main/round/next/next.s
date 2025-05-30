
        .section next
next_program:                           # CODE XREF: VIC_INT+7C↓j
    ld      not_scr_bg_move, r15 # Label from official source
    bbs     1, r15, round_over
    mov     4, r15
    stib    r15, _sub_mode
    ldib    curr_round_num, r15
    lda     1(r15), r15
    stib    r15, curr_round_num
    call    set_close
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
round_over:                             # CODE XREF: MEZASE_DEATHEGG_INT-AA4↑j
    call    sub_78270       # Label from Fighting Vipers source
    ld      0x500240, r15
    clrbit  0, r15, r15
    st      r15, 0x500240
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobl  1, r14, vs_conti_game
    ldob    gameprogram, r13 # bit 0 clear = Player 1
    ldob    0x50004E, r14
    cmpobne r13, r14, game_over_int
next_round:                             # Label from official source
    mov     0, r15
    st      r15, continue_count
    ld      not_scr_bg_move, r15
    clrbit  4, r15, r15
    st      r15, not_scr_bg_move
    ldob    STAGE_ID, r14
    cmpoble 0xA, r14, all_round_clear
    call    sub_7832C
    ld      0x500240, r15
    clrbit  1, r15, r15
    st      r15, 0x500240
    ldob    STAGE_ID, r3
    addo    1, r3, r3
    stob    r3, STAGE_ID
    stob    r3, current_stage_played_num
    ld      not_scr_bg_move, r15
    bbs     0x1B, r15, loc_E45C
    mov     0, r15
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
loc_E45C:                               # CODE XREF: MEZASE_DEATHEGG_INT-9D8↑j
    mov     26, r15
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
all_round_clear:                        # CODE XREF: MEZASE_DEATHEGG_INT-A18↑j
    call    sub_78314       # Label from Fighting Vipers source
    ldos    rank_mode, r15
    bbc     0, r15, normal_mode_clear
    or      6, r15, r15
    stos    r15, rank_mode
normal_mode_clear:                      # CODE XREF: MEZASE_DEATHEGG_INT-9A8↑j
    mov     12, r15         # Label from Fighting Vipers source
    stib    r15, mode
    mov     1, r4
    ld      fa_camera, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
vs_conti_game:                          # CODE XREF: MEZASE_DEATHEGG_INT-A58↑j
    ld      add_BACKUP_RAM_TO_RAM, r15 # Label from Fighting Vipers source
    ldob    0x3353(r15), r15 # r15 = BACKUP_RAM_TO_RAM+0x3353 and BACKUP_RAM_START+0x3353
    bbs     5, r15, vs_finish_game
    ldob    winner, r14
    cmpobe  0, r14, vs_game_continue_right_end
    call    sub_77588
    ld      0x500240, r15
    clrbit  3, r15, r15
    st      r15, 0x500240
    b       vs_game_continue_comm_end
# ---------------------------------------------------------------------------
vs_game_continue_right_end:             # CODE XREF: MEZASE_DEATHEGG_INT-954↑j
    call    sub_77828       # Label from Fighting Vipers source
    ld      0x500240, r15
    clrbit  4, r15, r15
    st      r15, 0x500240
vs_game_continue_comm_end:              # CODE XREF: MEZASE_DEATHEGG_INT-938↑j
    ld      0x500074, r15 # Label from Fighting Vipers source
    st      r15, 0x500070
    ldib    current_stage_played_num, r15
    stib    r15, STAGE_ID
    ld      not_scr_bg_move, r15
    clrbit  4, r15, r15
    st      r15, not_scr_bg_move
    ld      add_BACKUP_RAM_TO_RAM, r14
    ld      0x3320(r14), r15
    bbs     1, r15, vs_game_continue_check
    ldob    0x3324(r14), r15
    cmpobe  0x1B, r15, vs_game_continue_check_ex
vs_game_continue_check:                 # CODE XREF: MEZASE_DEATHEGG_INT-8D8↑j
    ldob    0x332D(r14), r15 # Label from Fighting Vipers source
    ldob    0x332E(r14), r14
    cmpobl  r14, r15, not_set_single_game
vs_game_continue_check_ex:              # CODE XREF: MEZASE_DEATHEGG_INT-8CC↑j
    call    sub_783B4       # Label from Fighting Vipers source
    ld      0x500240, r15
    clrbit  5, r15, r15
    st      r15, 0x500240
    ldob    winner, r14
    cmpo    0, r14
    be      pl1_conti_alone
    b       pl2_conti_alone
# ---------------------------------------------------------------------------
not_set_single_game:                    # CODE XREF: MEZASE_DEATHEGG_INT-8B8↑j
    ld      not_scr_bg_move, r15 # Label from Fighting Vipers source
    clrbit  5, r15, r15
    st      r15, not_scr_bg_move
    ld      not_scr_bg_move, r15
    setbit  0xB, r15, r15
    st      r15, not_scr_bg_move
    mov     0x14, r15
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
vs_finish_game:                         # CODE XREF: MEZASE_DEATHEGG_INT-960↑j
    call    sub_77588       # Label from Fighting Vipers source
    ld      0x500240, r15
    clrbit  3, r15, r15
    st      r15, 0x500240
    call    sub_783B4
    ld      0x500240, r15
    clrbit  5, r15, r15
    st      r15, 0x500240
    call    sub_77828
    ld      0x500240, r15
    clrbit  4, r15, r15
    st      r15, 0x500240
    call    save_stats_and_reset_counters
    ld      not_scr_bg_move, r15
    clrbit  5, r15, r15
    st      r15, not_scr_bg_move
    mov     0xA, r15
    stib    r15, mode
    ldos    rank_mode, r3
    clrbit  9, r3, r3
    stos    r3, rank_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
game_over_int:                          # CODE XREF: MEZASE_DEATHEGG_INT-A44↑j
    ldob    gameprogram, r14 # Label from Fighting Vipers source
    cmpobe  0, r14, a1p_game_cont_right_end
    call    sub_77828
    b       a1p_game_cont_comm_end
# ---------------------------------------------------------------------------
a1p_game_cont_right_end:                # CODE XREF: MEZASE_DEATHEGG_INT-7C4↑j
    call    sub_77588       # Label from Fighting Vipers source
a1p_game_cont_comm_end:                 # CODE XREF: MEZASE_DEATHEGG_INT-7BC↑j
    ld      not_scr_bg_move, r15 # Label from Fighting Vipers source
    setbit  5, r15, r15
    st      r15, not_scr_bg_move
    ldob    STAGE_ID, r14
    cmpoble 10, r14, loc_E6DC
    ld      add_BACKUP_RAM_TO_RAM, r15
    ldob    0x3353(r15), r15
    bbs     1, r15, not_conti_mode
    mov     0x14, r15
    stib    r15, _sub_mode
    ld      0x500710, r15
    bbc     16, r15, game_sub_ex # Subtracts 1 from CTRL_TIMER
    mov     0xE, r15
    stib    r15, mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
not_conti_mode:                         # CODE XREF: MEZASE_DEATHEGG_INT-784↑j
    call    save_stats_and_reset_counters # Label from Fighitng Vipers source
    mov     10, r15         # mode 10 = OVER_INT
    stib    r15, mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
loc_E6DC:                               # CODE XREF: MEZASE_DEATHEGG_INT-798↑j
    mov     14, r15         # mode 14 = NAME_INT
    stib    r15, mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
    