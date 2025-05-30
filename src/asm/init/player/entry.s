        .extern check_credit
        .extern dec_credit
        .section player
# =============== S U B R O U T I N E =======================================
player_entry:                           # CODE XREF: ROM:000083F4↓p
    mov     g0, r10         # Label from official source
    subo    1, 0, g0
    ld      debug_flag, r15 # bit 3 (set) - enable debug mode
    bbs     1, r15, player_entry_ex # return
    ld      INTERUPT_FLAGS_MOMENTARY, r9
    bbc     4, r9, no_push_st1 # P1 Start
    ld      select0_flag, r15
    bbs     2, r15, no_push_st1
pushed_st1:                             # Label from Fighting Vipers source
    mov     r10, g1
    mov     0, g0
    call    check_credit
    cmpobne 0, g0, no_push_st1
    mov     r10, g1
    mov     0, g0
    call    dec_credit
    mov     r10, g0
    call    bookkeep_left_player_start
    bbs     0, r10, pushed_st1_data_bd_contine
    b       pushed_st1_data_bd_contine
# ---------------------------------------------------------------------------
pushed_st1_data_bd_contine:             # CODE XREF: player_entry+50↑j
    xor     g0, g0, g0      # Label from Fighting Vipers source
    ld      not_scr_bg_move, r15
    setbit  2, r15, r15
    st      r15, not_scr_bg_move
    ld      select0_flag, r15
    setbit  0, r15, r15
    st      r15, select0_flag
    ldos    rank_mode, r7
    cmpo    0, r7
    bne     check_vs_or_continue1 # rank_mode typically 0 so it falls through
    shlo    8, 1, r7        # r7 = 0x100
    ld      add_BACKUP_RAM_TO_RAM, r3
    ldob    0x3353(r3), r3  # BACKUP_RAM_TO_RAM+0x3353
    b       original_start1
# ---------------------------------------------------------------------------
entry_rank_mode1:                       # Label from Fighting Vipers source
    lda     0x229, r7
    b       original_start1
# ---------------------------------------------------------------------------
check_vs_or_continue1:                  # CODE XREF: player_entry+90↑j
    bbs     8, r7, continue_start1 # Label from Fighting Vipers source
    setbit  7, r7, r7
    b       original_start1
# ---------------------------------------------------------------------------
continue_start1:                        # CODE XREF: player_entry:check_vs_or_continue1↑j
    shlo    8, 1, r7        # Label from Fighting Vipers source
    b       original_start1
# ---------------------------------------------------------------------------
original_start1:                        # CODE XREF: player_entry+A8↑j
    stos    r7, rank_mode   # Label from Fighting Vipers source
    cmpoble 2, r10, no_push_st1 # falls through because r10 = 0
    addo    2, r10, r10     # r10 = 2
no_push_st1:                            # CODE XREF: player_entry+1C↑j
    bbc     5, r9, player_entry_ex # Label from Fighting Vipers source
    ld      select1_flag, r15
    bbs     2, r15, player_entry_ex # return
    addo    4, sp, sp
    st      g0, -4(sp)
    mov     r10, g1
    mov     1, g0
    call    check_credit
    cmpobe  0, g0, pushed_st2
    ld      -4(sp), g0
    subo    4, sp, sp
    b       player_entry_ex # return
# ---------------------------------------------------------------------------
pushed_st2:                             # CODE XREF: player_entry+100↑j
    ld      -4(sp), g0      # Label from Fighting Vipers source
    subo    4, sp, sp
    mov     r10, g1
    mov     1, g0
    call    dec_credit
    mov     r10, g0
    call    bookkeep_right_player_start
    bbs     0, r10, pushed_st2_data_bd_ex
    b       pushed_st2_data_bd_ex
# ---------------------------------------------------------------------------
pushed_st2_data_bd_ex:                  # CODE XREF: player_entry+134↑j
    xor     g0, g0, g0      # Label from Fighting Vipers source
    ld      not_scr_bg_move, r15
    setbit  3, r15, r15
    st      r15, not_scr_bg_move
    ld      select1_flag, r15
    setbit  0, r15, r15
    st      r15, select1_flag
    ldos    rank_mode, r7
    cmpo    0, r7
    bne     check_vs_or_continue2 # We don't want this to fall through when we want rank mode
    shlo    8, 1, r7
    ld      add_BACKUP_RAM_TO_RAM, r3
    ldob    0x3353(r3), r3  # BACKUP_RAM_TO_RAM+0x3353
    b       original_start2
# ---------------------------------------------------------------------------
entry_rank_mode2:                       # Label from Fighting Vipers source
    lda     0x249, r7
    b       original_start2
# ---------------------------------------------------------------------------
check_vs_or_continue2:                  # CODE XREF: player_entry+174↑j
    bbs     8, r7, continue_start2 # Label from Fighting Vipers source
    setbit  7, r7, r7
    b       original_start2
# ---------------------------------------------------------------------------
continue_start2:                        # CODE XREF: player_entry:check_vs_or_continue2↑j
    shlo    8, 1, r7        # Label from Fighting Vipers source
    b       original_start2
# ---------------------------------------------------------------------------
original_start2:                        # CODE XREF: player_entry+18C↑j
    stos    r7, rank_mode   # Label from Fighting Vipers source
player_entry_ex:                        # CODE XREF: player_entry+10↑j
    ret                     # Label from Fighting Vipers source
# End of function player_entry
# ---------------------------------------------------------------------------
