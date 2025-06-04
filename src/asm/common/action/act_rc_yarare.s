        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_YARARE:                          # DATA XREF: ROM:0001D0A8↓o
    ld      flt_1CFEC, r13  # Label from official source
    ld      0x5D4(g7), r14
    addr    r13, r14, r15
    st      r15, 0x5D4(g7)
    ldis    0x5DE(g7), r5
    subi    1, r5, r5
    cmpible 0, r5, loc_13B0C
    mov     0, r5
loc_13B0C:                              # CODE XREF: ACT_RC_YARARE+1C↑j
    stis    r5, 0x5DE(g7)
    ldob    0x1B2(g7), r3
    cmpobe  0, r3, loc_13B24
    cmpobe  1, r3, loc_13BA4
    cmpobe  2, r3, loc_13BC0
    cmpobe  3, r3, loc_13BF8
loc_13B24:                              # CODE XREF: ACT_RC_YARARE+2C↑j
    ld      0x0(g7), r15
    setbit  4, r15, r15
    st      r15, 0x0(g7)
    ldob    0x19E(g7), r14
    cmpobe  1, r14, loc_13B88
    ld      0x5E0(g7), r13
    ld      flt_1CFF0, r14
    mulr    r13, r14, r15
    st      r15, 0x2C(g7)
    ld      0x5E8(g7), r13
    ld      flt_1CFF0, r14
    mulr    r13, r14, r15
    st      r15, 0x34(g7)
    ld      0x5E0(g7), r13
    ld      flt_1CFF4, r14
    mulr    r13, r14, r15
    st      r15, 0x5C8(g7)
    ld      0x5E8(g7), r13
    ld      flt_1CFF4, r14
    mulr    r13, r14, r15
    st      r15, 0x5D0(g7)
loc_13B88:                              # CODE XREF: ACT_RC_YARARE+4C↑j
    ldos    0x19C(g7), g0
    cmpobe  0, g0, loc_13B94
    call    comp_set_motion
loc_13B94:                              # CODE XREF: ACT_RC_YARARE+A4↑j
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_13BA4:                              # CODE XREF: ACT_RC_YARARE+30↑j
    ldos    0x80A(g7), r14
    subi    1, r14, r3
    ldos    0x1AA(g7), r13
    cmpobl  r13, r3, loc_13C14
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_13BC0:                              # CODE XREF: ACT_RC_YARARE+34↑j
    ldos    0x80C(g7), r13
    subi    r13, r5, r4
    ldos    0x80A(g7), r3
    subi    1, r3, r3
    addi    r3, r4, r4
    cmpibg  0, r4, loc_13BE0
    stos    r3, 0x1AA(g7)
    ret
# ---------------------------------------------------------------------------
loc_13BE0:                              # CODE XREF: ACT_RC_YARARE+EC↑j
    ld      0x0(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_13BF8:                              # CODE XREF: ACT_RC_YARARE+38↑j
    cmpibl  0, r5, loc_13C14
    mov     0, r15
    st      r15, 0x19C(g7)
    ld      0x1A4(g7), r3
    bbs     0x18, r3, loc_13C14
    clrbit  0, r3, r3
    st      r3, 0x1A4(g7)
loc_13C14:                              # CODE XREF: ACT_RC_YARARE+C8↑j
    ret
# End of function ACT_RC_YARARE
