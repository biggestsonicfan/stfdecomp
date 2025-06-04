        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_RISE:                            # DATA XREF: ROM:0001D098↓o
    mov     0, g0           # Label from official source
    ldob    0x1B2(g7), r3
    ld      0x5B8(g7), r6
    ld      0x1A4(g7), r7
    cmpibe  0, r3, loc_14D28
    cmpibe  1, r3, loc_14D54
    cmpibe  2, r3, loc_14D7C
    cmpibe  3, r3, loc_14DC4
    cmpibe  4, r3, loc_14E98
    cmpibe  5, r3, loc_14EC8
loc_14D28:                              # CODE XREF: ACT_RC_RISE+10↑j
    mov     0, r15
    stos    r15, 0x5DC(g7)
    st      r15, 0x1218(g7)
    mov     0, r15
    stib    r15, 0x6F5(g7)
    setbit  0x10, r7, r15
    st      r15, 0x1A4(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_14D54:                              # CODE XREF: ACT_RC_RISE+14↑j
    ld      0x0(g7), r3
    bbc     0, r3, loc_14EBC
    bbs     5, r3, loc_14EC8
    ldis    0x1AC(g7), r14
    cmpibge 0, r14, loc_14EC8
    ldos    (byte_30+0x20)(g6), g0
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_14D7C:                              # CODE XREF: ACT_RC_RISE+18↑j
    ldis    0x5DE(g7), r5
    cmpibge 0, r5, loc_14D9C
    ldos    0x5DC(g7), r14
    mulo    4, r14, r3
    cmpibge r3, r5, loc_14D9C
    subi    1, r5, r15
    stis    r15, 0x5DE(g7)
    b       loc_14EBC
# ---------------------------------------------------------------------------
loc_14D9C:                              # CODE XREF: ACT_RC_RISE+80↑j
    mov     0, r15
    stis    r15, 0x5DE(g7)
    ld      0x0(g7), r14
    clrbit  4, r14, r15
    st      r15, 0x0(g7)
    mov     0, r15
    stis    r15, 0x1AE(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_14DC4:                              # CODE XREF: ACT_RC_RISE+1C↑j
    ldob    0x19E(g7), r10
    cmpobne 0, r10, loc_14DD8
    addo    0x1F, 9, r13
    ldos    0x1AE(g7), r14
    cmpobg  r13, r14, loc_14EBC
loc_14DD8:                              # CODE XREF: ACT_RC_RISE+C8↑j
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ld      0x0(g7), r14
    clrbit  6, r14, r15
    st      r15, 0x0(g7)
    cmpobe  6, r10, loc_14E04
    cmpobe  5, r10, loc_14E58
    cmpobe  9, r10, loc_14E20
    cmpobe  0xA, r10, loc_14E3C
    b       loc_14E74
# ---------------------------------------------------------------------------
loc_14E04:                              # CODE XREF: ACT_RC_RISE+F0↑j
    bbs     0, r6, loc_14E14
    ldos    (byte_30+0x26)(g6), g0
    b       loc_14E90
# ---------------------------------------------------------------------------
loc_14E14:                              # CODE XREF: ACT_RC_RISE:loc_14E04↑j
    ldos    (byte_30+0x28)(g6), g0
    b       loc_14E90
# ---------------------------------------------------------------------------
loc_14E20:                              # CODE XREF: ACT_RC_RISE+F8↑j
    bbs     0, r6, loc_14E30
    ldos    (byte_30+0x2E)(g6), g0
    b       loc_14E90
# ---------------------------------------------------------------------------
loc_14E30:                              # CODE XREF: ACT_RC_RISE:loc_14E20↑j
    ldos    (byte_30+0x30)(g6), g0
    b       loc_14E90
# ---------------------------------------------------------------------------
loc_14E3C:                              # CODE XREF: ACT_RC_RISE+FC↑j
    bbs     0, r6, loc_14E4C
    ldos    (byte_30+0x32)(g6), g0
    b       loc_14E90
# ---------------------------------------------------------------------------
loc_14E4C:                              # CODE XREF: ACT_RC_RISE:loc_14E3C↑j
    ldos    (byte_30+0x34)(g6), g0
    b       loc_14E90
# ---------------------------------------------------------------------------
loc_14E58:                              # CODE XREF: ACT_RC_RISE+F4↑j
    bbs     0, r6, loc_14E68
    ldos    (byte_30+0x2A)(g6), g0
    b       loc_14E90
# ---------------------------------------------------------------------------
loc_14E68:                              # CODE XREF: ACT_RC_RISE:loc_14E58↑j
    ldos    (byte_30+0x2C)(g6), g0
    b       loc_14E90
# ---------------------------------------------------------------------------
loc_14E74:                              # CODE XREF: ACT_RC_RISE+100↑j
    bbs     0, r6, loc_14E84
    ldos    (byte_30+0x22)(g6), g0
    b       loc_14E90
# ---------------------------------------------------------------------------
loc_14E84:                              # CODE XREF: ACT_RC_RISE:loc_14E74↑j
    ldos    (byte_30+0x24)(g6), g0
    b       loc_14E90
# ---------------------------------------------------------------------------
loc_14E90:                              # CODE XREF: ACT_RC_RISE+110↑j
    call    set_motion
    ret
# ---------------------------------------------------------------------------
loc_14E98:                              # CODE XREF: ACT_RC_RISE+20↑j
    bbs     2, r7, loc_14EB0
    ld      0x0(g7), r15
    bbc     0xF, r15, loc_14EBC
    ld      0x1A4(g7), r15
    clrbit  0, r15, r15
    st      r15, 0x1A4(g7)
loc_14EB0:                              # CODE XREF: ACT_RC_RISE:loc_14E98↑j
    mov     0, r15
    st      r15, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_14EBC:                              # CODE XREF: ACT_RC_RISE+58↑j
    cmpobe  0, g0, loc_14EC4
    call    set_motion
loc_14EC4:                              # CODE XREF: ACT_RC_RISE:loc_14EBC↑j
    ret
# ---------------------------------------------------------------------------
loc_14EC8:                              # CODE XREF: ACT_RC_RISE+24↑j
    ldis    0x800(g7), r15
    stis    r15, 0x1AA(g7)
    ret
# End of function ACT_RC_RISE
