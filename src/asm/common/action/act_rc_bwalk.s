        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_BWALK:                           # DATA XREF: ROM:0001D070↓o
    ld      0x1A4(g7), r7   # Label from official source
    ld      0x0(g7), r6
    bbs     0x1D, r6, loc_1378C
    bbc     0xA, r7, loc_13754
    bbc     0xB, r7, loc_13758
    b       loc_13770
# ---------------------------------------------------------------------------
loc_13754:                              # CODE XREF: ACT_RC_BWALK+C↑j
    bbs     0, r6, loc_13758
loc_13758:                              # CODE XREF: ACT_RC_BWALK+10↑j
    ldos    (dword_28+2)(g6), g0
    bbc     0xA, r6, loc_137C4
    ldos    (check_word4+2)(g6), g0
    b       loc_137C4
# ---------------------------------------------------------------------------
loc_13770:                              # CODE XREF: ACT_RC_BWALK+14↑j
    bbc     0, r6, loc_137C8
    ldos    (dword_2C+2)(g6), g0
    bbc     1, r7, loc_137C4
    ldos    (dword_28+2)(g6), g0
    b       loc_137C4
# ---------------------------------------------------------------------------
loc_1378C:                              # CODE XREF: ACT_RC_BWALK+8↑j
    bbc     0xA, r7, loc_137B0
    bbc     0xB, r7, loc_137B0
    bbc     0, r6, loc_137C8
    ldos    byte_30(g6), g0
    bbc     1, r7, loc_137C4
    ldos    dword_2C(g6), g0
    b       loc_137C4
# ---------------------------------------------------------------------------
loc_137B0:                              # CODE XREF: ACT_RC_BWALK:loc_1378C↑j
    ldos    dword_2C(g6), g0
    bbc     0xA, r6, loc_137C4
    ldos    dword_20(g6), g0
loc_137C4:                              # CODE XREF: ACT_RC_BWALK+24↑j
    call    set_motion
loc_137C8:                              # CODE XREF: ACT_RC_BWALK:loc_13770↑j
    ret
# End of function ACT_RC_BWALK
