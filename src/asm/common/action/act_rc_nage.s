        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_NAGE:                            # DATA XREF: ROM:0001D0B0↓o
    ldob    0x1B2(g7), r3   # Label from official source
    cmpibe  0, r3, loc_15220
    cmpibe  1, r3, loc_15254
    cmpibe  2, r3, loc_152C0
loc_15220:                              # CODE XREF: ACT_RC_NAGE+4↑j
    ld      0x0(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g7)
    ldos    0x19C(g7), g0
    call    set_motion
loc_15234:                              # CODE XREF: ACT_RC_KAWASHI+B4↑j
    mov     0, r3
    st      r3, 0x2C(g7)
    st      r3, 0x30(g7)
    st      r3, 0x34(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_15254:                              # CODE XREF: ACT_RC_NAGE+8↑j
    ld      0x1A4(g7), r15
    bbc     1, r15, loc_152A0
    ld      0x18(g7), r5
    ld      0x20(g7), r6
    ld      0x18(g8), r14
    subr    r5, r14, r3
    ld      0x20(g8), r14
    subr    r6, r14, r4
    lda     0x3F000000, r13
    mulr    r13, r3, r3
    lda     0x3F000000, r13
    mulr    r13, r4, r4
    addr    r5, r3, r15
    st      r15, 0x18(g7)
    addr    r6, r4, r15
    st      r15, 0x20(g7)
    ret
# ---------------------------------------------------------------------------
loc_152A0:                              # CODE XREF: ACT_RC_NAGE+48↑j
    ldt     0x18(g8), r4
    stt     r4, 0x18(g7)
    ldis    0x26(g8), r15
    stis    r15, 0x26(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_152C0:                              # CODE XREF: ACT_RC_NAGE+C↑j
    ldos    0x1AA(g7), r13
    ldos    0x800(g7), r14
    cmpobl  r13, r14, loc_152F0
    ldob    0x814(g7), r14
    cmpobe  4, r14, loc_152E0
    mov     0, r15
    st      r15, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_152E0:                              # CODE XREF: ACT_RC_NAGE+C0↑j
    mov     2, r15
    stis    r15, 0x5DE(g7)
    shlo    0x18, 9, r15
    st      r15, 0x198(g7)
loc_152F0:                              # CODE XREF: ACT_RC_NAGE+B8↑j
    ret
# End of function ACT_RC_NAGE
