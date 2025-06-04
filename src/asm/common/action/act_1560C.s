        .section action
# =============== S U B R O U T I N E =======================================
ACT_1560C:                              # DATA XREF: ROM:0001D140↓o
    ldob    0x1B2(g7), r3
    cmpibe  0, r3, loc_15620
    cmpibe  1, r3, loc_1565C
    cmpibe  2, r3, loc_15694
    cmpibe  3, r3, loc_156B8
loc_15620:                              # CODE XREF: ACT_1560C+4↑j
    ld      0x0(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g7)
    ldos    0x19C(g7), g0
    call    set_motion
    ld      0x0(g7), r15
    bbs     3, r15, loc_1564C
    mov     0, r3
    st      r3, 0x2C(g7)
    st      r3, 0x30(g7)
    st      r3, 0x34(g7)
loc_1564C:                              # CODE XREF: ACT_1560C+2C↑j
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_1565C:                              # CODE XREF: ACT_1560C+8↑j
    ld      0x0(g7), r15
    bbs     2, r15, loc_156E8
    ld      0x1A4(g7), r15
    clrbit  0xC, r15, r15
    st      r15, 0x1A4(g7)
    ld      0x1A4(g7), r15
    clrbit  1, r15, r15
    st      r15, 0x1A4(g7)
    ldis    0x818(g7), r15
    stis    r15, 0x1AA(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    b       loc_156E8
# ---------------------------------------------------------------------------
loc_15694:                              # CODE XREF: ACT_1560C+C↑j
    ld      0x0(g7), r8
    ld      0x0(g8), r9
    or      r8, r9, r10
    bbs     2, r10, loc_156E8
    ldis    0x1AA(g8), r15
    stis    r15, 0x1AA(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_156B8:                              # CODE XREF: ACT_1560C+10↑j
    ldos    0x1AA(g7), r13
    ldos    0x800(g7), r14
    cmpobl  r13, r14, loc_156E8
    ldob    0x814(g7), r14
    cmpobe  4, r14, loc_156D8
    mov     0, r15
    st      r15, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_156D8:                              # CODE XREF: ACT_1560C+BC↑j
    mov     2, r15
    stis    r15, 0x5DE(g7)
    shlo    0x18, 9, r15
    st      r15, 0x198(g7)
loc_156E8:                              # CODE XREF: ACT_1560C+54↑j
    ret
# End of function ACT_1560C
