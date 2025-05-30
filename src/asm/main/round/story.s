            .section story
# =============== S U B R O U T I N E =======================================
set_vs_cnt_and_stage_num_sel:           # CODE XREF: ROUND_INIT+49C↓p
    ld      not_scr_bg_move, r15 # Label from official source
    bbc     15, r15, loc_AFA0
    ld      not_scr_bg_move, r15
    bbc     2, r15, loc_AFA0
    ld      not_scr_bg_move, r15
    bbc     3, r15, loc_AFA0
    ldob    0x50005B, r3
    addo    1, r3, r3
    remo    9, r3, r3
    stob    r3, 0x50005B
    ld      frame_counter, r3 # Get number of frames and store in r3
    ldob    num_of_levels_story_mode, r4 # Get number of levels and store to r4
    remo    r4, r3, r4      # Get the remainder ordinal of r4 and r3 and store in r4
    ldob    levels_in_order[r4], r3 # Select level r4 of the levels_in_order array and store to r3
    stob    r3, stage_num   # 2P level is written here
    lda     0x41000000, r15
    st      r15, stage_x
    b       loc_AFC8
# ---------------------------------------------------------------------------
loc_AFA0:                               # CODE XREF: set_vs_cnt_and_stage_num_sel+8↑j
    ldob    STAGE_ID, r3
    ldob    STORY_STAGE_ORDER[r3*2], r3
    stob    r3, stage_num   # 1P Level is written here.
    lda     0x41000000, r15
    st      r15, stage_x
loc_AFC8:                               # CODE XREF: set_vs_cnt_and_stage_num_sel+70↑j
    ld      not_scr_bg_move, r15
    clrbit  15, r15, r15
    st      r15, not_scr_bg_move
    call    change_scene
    ret
# End of function set_vs_cnt_and_stage_num_sel
