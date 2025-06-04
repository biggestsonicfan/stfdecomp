        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_MOTION:                          # DATA XREF: ROM:ACTUAL_MOVES↓o
    ldob    0x1B2(g7), r14  # Label from official source
    cmpobe  0, r14, load_player_action
    b       load_player_motion
# ---------------------------------------------------------------------------
load_player_action:                     # CODE XREF: ACT_RC_MOTION+4↑j
    ldos    0x19C(g7), g0   # g0 = P1_PARTS+0x19C
    call    set_motion
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
load_player_motion:                     # CODE XREF: ACT_RC_MOTION+8↑j
    ldos    0x1A8(g7), r14  # r14 = p1_mot_num
    cmpibne 0, r14, load_player_motion_is_0
    mov     0, r15
    st      r15, 0x19C(g7)  # p1_action = 0
load_player_motion_is_0:                # CODE XREF: ACT_RC_MOTION+24↑j
    ret
# End of function ACT_RC_MOTION
