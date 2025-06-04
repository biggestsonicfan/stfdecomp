        .section action
# =============== S U B R O U T I N E =======================================
ACT_163A0:                              # DATA XREF: ROM:0001D0D8↓o
    ldob    0x1B2(g7), r3
    cmpibe  0, r3, loc_163B0
    cmpibe  1, r3, loc_163DC
    cmpibe  2, r3, loc_164A0
loc_163B0:                              # CODE XREF: ACT_163A0+4↑j
    ldos    0x19C(g7), g0
    call    set_motion
    ld      0x1F4(g8), r15
    st      r15, 0x600(g7)
    ld      0x1F8(g8), r15
    st      r15, 0x604(g7)
    ld      0x1FC(g8), r15
    st      r15, 0x608(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_163DC:                              # CODE XREF: ACT_163A0+8↑j
    ldos    0x1AA(g7), r13
    ldos    0x81A(g7), r14
    cmpobl  r13, r14, loc_164D8
    ldis    0x5B6(g7), r7
    stis    r7, 0x61A(g7)
    ld      0x0(g7), r15
    setbit  9, r15, r15
    st      r15, 0x0(g7)
    ld      0x1F4(g7), r13
    ld      0x600(g7), r14
    subr    r13, r14, r4
    ld      0x1FC(g7), r13
    ld      0x608(g7), r14
    subr    r13, r14, r5
    lda     0x16802D2D, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    ld      0x824(g7), r6
    cmpible r3, r6, loc_16440
    divr    r3, r6, r6
    mulr    r6, r4, r4
    mulr    r6, r5, r5
loc_16440:                              # CODE XREF: ACT_163A0+90↑j
    lda     0x2D805B5B, r15
    st      r15, (g11)[g12*1]
    st      r7, (g11)[g12*1]
    ld      0x830(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x834(g7), r15
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], g0
    ld      (g11)[g12*1], g1
    subr    g0, r4, r4
    subr    g1, r5, r5
    ldos    0x808(g7), r3
    ldos    0x1AA(g7), r13
    subi    r13, r3, r3
    addo    1, r3, r3
    cvtir   r3, r3
    divr    r3, r4, r15
    st      r15, 0x638(g7)
    divr    r3, r5, r15
    st      r15, 0x63C(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_164A0:                              # CODE XREF: ACT_163A0+C↑j
    ldos    0x1AA(g7), r13
    ldos    0x808(g7), r14
    cmpobg  r13, r14, loc_164D0
    ld      0x638(g7), r13
    ld      0x18(g7), r14
    addr    r13, r14, r15
    st      r15, 0x18(g7)
    ld      0x63C(g7), r13
    ld      0x20(g7), r14
    addr    r13, r14, r15
    st      r15, 0x20(g7)
    ret
# ---------------------------------------------------------------------------
loc_164D0:                              # CODE XREF: ACT_163A0+108↑j
    mov     0, r15
    st      r15, 0x19C(g7)
loc_164D8:                              # CODE XREF: ACT_163A0+44↑j
    ret
# End of function ACT_163A0
