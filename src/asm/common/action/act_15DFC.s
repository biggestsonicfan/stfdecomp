        .section action
# =============== S U B R O U T I N E =======================================
ACT_15DFC:                              # DATA XREF: ROM:0001D160↓o
    ldob    0x1B2(g7), r3
    cmpibe  0, r3, loc_15E10
    cmpibe  1, r3, loc_15E44
    cmpibe  2, r3, loc_15E6C
    cmpibe  3, r3, loc_15EB4
loc_15E10:                              # CODE XREF: ACT_15DFC+4↑j
    ld      0x0(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g7)
    ldos    0x19C(g7), g0
    call    set_motion
    mov     0, r15
    st      r15, 0x2C(g7)
    mov     0, r15
    st      r15, 0x34(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_15E44:                              # CODE XREF: ACT_15DFC+8↑j
    ld      0x1A4(g7), r15
    bbs     1, r15, loc_15EE4
    ld      0xA10(g7), r15
    st      r15, 0x2C(g7)
    ld      0xA18(g7), r15
    st      r15, 0x34(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_15E6C:                              # CODE XREF: ACT_15DFC+C↑j
    lda     0x3F733333, r13
    ld      0x2C(g7), r14
    mulr    r13, r14, r15
    st      r15, 0x2C(g7)
    lda     0x3F733333, r13
    ld      0x34(g7), r14
    mulr    r13, r14, r15
    st      r15, 0x34(g7)
    ldos    0x1AA(g7), r13
    ldos    0x80A(g7), r14
    cmpobg  r13, r14, loc_15EA4
    ret
# ---------------------------------------------------------------------------
loc_15EA4:                              # CODE XREF: ACT_15DFC+A0↑j
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_15EB4:                              # CODE XREF: ACT_15DFC+10↑j
    ldos    0x1AA(g7), r13
    ldos    0x800(g7), r14
    cmpobl  r13, r14, loc_15EE4
    ldob    0x814(g7), r14
    cmpobe  4, r14, loc_15ED4
    mov     0, r15
    st      r15, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_15ED4:                              # CODE XREF: ACT_15DFC+C8↑j
    mov     2, r15
    stis    r15, 0x5DE(g7)
    shlo    0x18, 9, r15
    st      r15, 0x198(g7)
loc_15EE4:                              # CODE XREF: ACT_15DFC+4C↑j
    ret
# End of function ACT_15DFC
