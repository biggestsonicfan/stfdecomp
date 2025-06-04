        .section action
# =============== S U B R O U T I N E =======================================
ACT_15A4C:                              # DATA XREF: ROM:0001D150↓o
    ldob    0x1B2(g7), r3
    cmpibe  0, r3, loc_15A5C
    cmpibe  1, r3, loc_15A88
    cmpibe  2, r3, loc_15C14
loc_15A5C:                              # CODE XREF: ACT_15A4C+4↑j
    ld      0x0(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g7)
    ldos    0x19C(g7), g0
    call    set_motion
    movt    0, r4
    stt     r4, 0x2C(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_15A88:                              # CODE XREF: ACT_15A4C+8↑j
    ld      0x0(g7), r15
    bbs     2, r15, loc_15B30
    ld      0x1A4(g7), r15
    bbc     1, r15, loc_15B10
    ld      0x18(g7), r5
    ld      0x20(g7), r6
    ld      0x18(g8), r14
    subr    r5, r14, r3
    ld      0x20(g8), r14
    subr    r6, r14, r4
    ldos    0x80A(g7), r10
    ldos    0x1AA(g7), r11
    cmpobe  r11, r10, loc_15B10
    lda     0xB801717, r15
    st      r15, (g11)[g12*1]
    st      r10, (g11)[g12*1]
    ld      (g11)[g12*1], r10
    lda     0xB801717, r15
    st      r15, (g11)[g12*1]
    st      r11, (g11)[g12*1]
    ld      (g11)[g12*1], r11
    subr    r11, r10, r10
    divr    r10, r3, r3
    divr    r10, r4, r4
    addr    r5, r3, r15
    st      r15, 0x18(g7)
    addr    r6, r4, r15
    st      r15, 0x20(g7)
    ld      0x1A4(g7), r15
    clrbit  0xC, r15, r15
    st      r15, 0x1A4(g7)
    b       loc_15C44
# ---------------------------------------------------------------------------
loc_15B10:                              # CODE XREF: ACT_15A4C+48↑j
    ldt     0x18(g8), r4
    stt     r4, 0x18(g7)
    ldis    0x26(g8), r15
    stis    r15, 0x26(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_15B30:                              # CODE XREF: ACT_15A4C+40↑j
    ld      0x1A4(g7), r15
    bbs     1, r15, loc_15B48
    call    sub_1980C
    movt    0, r4
    stt     r4, 0x2C(g7)
    b       loc_15B10
# ---------------------------------------------------------------------------
loc_15B48:                              # CODE XREF: ACT_15A4C+E8↑j
    ld      0x18(g8), r3
    ld      0x20(g8), r4
    lda     0x2D805B5B, r15
    st      r15, (g11)[g12*1]
    ldis    0x26(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x80(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x88(g7), r15
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r8
    ld      (g11)[g12*1], r9
    ld      0x18(g7), r14
    subr    r8, r14, r8
    ld      0x20(g7), r14
    subr    r9, r14, r9
    subr    r8, r3, r3
    subr    r9, r4, r4
    ld      0x84(g7), r13
    ld      0x1C(g7), r14
    subr    r13, r14, r5
    ldos    0x808(g7), r10
    ldos    0x1AA(g7), r11
    cmpobge r11, r10, loc_15BE4
    lda     0xB801717, r15
    st      r15, (g11)[g12*1]
    st      r10, (g11)[g12*1]
    ld      (g11)[g12*1], r10
    lda     0xB801717, r15
    st      r15, (g11)[g12*1]
    st      r11, (g11)[g12*1]
    ld      (g11)[g12*1], r11
    subr    r11, r10, r10
    divr    r10, r3, r3
    divr    r10, r4, r4
    divr    r10, r5, r5
loc_15BE4:                              # CODE XREF: ACT_15A4C+15C↑j
    ld      0x18(g7), r14
    addr    r3, r14, r15
    st      r15, 0x18(g7)
    ld      0x20(g7), r14
    addr    r4, r14, r15
    st      r15, 0x20(g7)
    ld      0x84(g7), r8
    ld      0x1C(g7), r9
    cmpr    r8, r9
    bl      loc_15C44
    st      r8, 0x1C(g7)
    b       loc_15C44
# ---------------------------------------------------------------------------
loc_15C14:                              # CODE XREF: ACT_15A4C+C↑j
    ldos    0x1AA(g7), r13
    ldos    0x800(g7), r14
    cmpobl  r13, r14, loc_15C44
    ldob    0x814(g7), r14
    cmpobe  4, r14, loc_15C34
    mov     0, r15
    st      r15, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_15C34:                              # CODE XREF: ACT_15A4C+1D8↑j
    mov     2, r15
    stis    r15, 0x5DE(g7)
    shlo    0x18, 9, r15
    st      r15, 0x198(g7)
loc_15C44:                              # CODE XREF: ACT_15A4C+C0↑j
    ret
# End of function ACT_15A4C
