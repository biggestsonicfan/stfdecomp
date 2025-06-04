        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_WALK:                            # DATA XREF: ROM:0001D068↓o
    ld      0x1A4(g7), r7   # Label from official source
    ld      0x0(g7), r6
    bbs     0x1D, r6, loc_136FC
    bbc     0xA, r7, loc_136C4
    bbs     0xB, r7, loc_136C8
    b       loc_136E0
# ---------------------------------------------------------------------------
loc_136C4:                              # CODE XREF: ACT_RC_WALK+C↑j
    bbs     0, r6, loc_136C8
loc_136C8:                              # CODE XREF: ACT_RC_WALK+10↑j
    ldos    (dword_20+2)(g6), g0
    bbc     0xA, r6, loc_13734
    ldos    (check_word3+2)(g6), g0
    b       loc_13734
# ---------------------------------------------------------------------------
loc_136E0:                              # CODE XREF: ACT_RC_WALK+14↑j
    bbc     0, r6, loc_13738
    ldos    (dword_24+2)(g6), g0
    bbc     1, r7, loc_13734
    ldos    (dword_20+2)(g6), g0
    b       loc_13734
# ---------------------------------------------------------------------------
loc_136FC:                              # CODE XREF: ACT_RC_WALK+8↑j
    bbc     0xA, r7, loc_13720
    bbs     0xB, r7, loc_13720
    bbc     0, r6, loc_13738
    ldos    dword_28(g6), g0
    bbc     1, r7, loc_13734
    ldos    dword_24(g6), g0
    b       loc_13734
# ---------------------------------------------------------------------------
loc_13720:                              # CODE XREF: ACT_RC_WALK:loc_136FC↑j
    ldos    dword_24(g6), g0
    bbc     0xA, r6, loc_13734
    ldos    check_word4(g6), g0
loc_13734:                              # CODE XREF: ACT_RC_WALK+24↑j
    call    set_motion
loc_13738:                              # CODE XREF: ACT_RC_WALK:loc_136E0↑j
    ret
# End of function ACT_RC_WALK
