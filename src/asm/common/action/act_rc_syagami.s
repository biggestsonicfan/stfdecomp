        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_SYAGAMI:                         # DATA XREF: ROM:0001D060↓o
    ld      0x1A4(g7), r7   # Label from official source
    ld      0x0(g7), r6
    bbc     3, r7, loc_13640
    bbs     9, r7, loc_1366C
    bbs     0, r6, loc_13660
    ldos    (prcb+2)(g6), r13
    ldos    0x1A8(g7), r14
    cmpibe  r13, r14, syagami_yoke
    ldos    0x810(g7), r14
    bbc     7, r14, loc_13630
    bbs     2, r7, loc_1366C
    b       loc_13660
# ---------------------------------------------------------------------------
loc_13630:                              # CODE XREF: ACT_RC_SYAGAMI+28↑j
    ldos    (prcb+2)(g6), g0
    call    sub_1CEA8
    b       syagami_yoke
# ---------------------------------------------------------------------------
loc_13640:                              # CODE XREF: ACT_RC_SYAGAMI+8↑j
    ldos    (prcb+2)(g6), g0
    ldos    0x810(g7), r14
    bbs     7, r14, loc_13658
    call    set_motion
    b       syagami_yoke
# ---------------------------------------------------------------------------
loc_13658:                              # CODE XREF: ACT_RC_SYAGAMI+50↑j
    call    sub_1CE94
    b       syagami_yoke
# ---------------------------------------------------------------------------
loc_13660:                              # CODE XREF: ACT_RC_SYAGAMI+10↑j
    ldos    dword_8(g6), g0
    call    set_motion
loc_1366C:                              # CODE XREF: ACT_RC_SYAGAMI+C↑j
    ret
# ---------------------------------------------------------------------------
syagami_yoke:                           # CODE XREF: ACT_RC_SYAGAMI+20↑j
    ld      0x1A4(g8), r15  # Label from official source
    bbc     8, r15, loc_136A8
    ldos    0x1AA(g7), r7
    ldos    0x800(g7), r6
    subo    r7, r6, r5
    ldos    0x1AA(g8), r13
    ldos    0x808(g8), r14
    subi    r13, r14, r4
    ldob    4(g7), r13
    addi    r13, r4, r4
    cmpibge 1, r4, loc_136A4
    divo    r4, r5, r6
    addo    r7, r6, r6
loc_136A4:                              # CODE XREF: ACT_RC_SYAGAMI+9C↑j
    stos    r6, 0x1AA(g7)
loc_136A8:                              # CODE XREF: ACT_RC_SYAGAMI+78↑j
    ret
# End of function ACT_RC_SYAGAMI
