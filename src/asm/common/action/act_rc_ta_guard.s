        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_TA_GUARD:                        # DATA XREF: ROM:0001D088↓o
    ld      0x1A4(g7), r7   # Label from official source
    ld      0x0(g7), r6
    ldos    (dword_8+2)(g6), g0
    ld      0x804(g7), r15
    bbs     0xD, r15, loc_1392C
    bbs     0, r6, loc_1393C
    b       loc_1393C
# ---------------------------------------------------------------------------
loc_1392C:                              # CODE XREF: ACT_RC_TA_GUARD+14↑j
    setbit  0xD, r6, r6
    ldos    0x802(g7), r14
    cmpobne 0, r14, loc_13940
    bbc     0, r6, loc_13940
loc_1393C:                              # CODE XREF: ACT_RC_TA_GUARD+18↑j
    call    set_motion
loc_13940:                              # CODE XREF: ACT_RC_TA_GUARD+28↑j
    ret
# End of function ACT_RC_TA_GUARD
