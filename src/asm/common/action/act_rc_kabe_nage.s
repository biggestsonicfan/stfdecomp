        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_KABE_NAGE:                       # DATA XREF: ROM:0001D170↓o
    ldob    0x1B2(g7), r3   # Label from official source
    cmpibe  0, r3, loc_15498
    cmpibe  1, r3, loc_154CC
    cmpibe  2, r3, loc_15540
loc_15498:                              # CODE XREF: ACT_RC_KABE_NAGE+4↑j
    ld      0x0(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g7)
    ldos    0x19C(g7), g0
    call    set_motion
    mov     0, r3
    st      r3, 0x2C(g7)
    st      r3, 0x30(g7)
    st      r3, 0x34(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_154CC:                              # CODE XREF: ACT_RC_KABE_NAGE+8↑j
    ld      0x1A4(g7), r15
    bbc     1, r15, loc_15518
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
loc_15518:                              # CODE XREF: ACT_RC_KABE_NAGE+48↑j
    ld      0x18(g8), r4
    ld      0x20(g8), r6
    st      r4, 0x18(g7)
    st      r6, 0x20(g7)
    ldis    0x26(g8), r15
    stis    r15, 0x26(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_15540:                              # CODE XREF: ACT_RC_KABE_NAGE+C↑j
    ldos    0x1AA(g7), r13
    ldos    0x800(g7), r14
    cmpobge r13, r14, loc_155E0
    ldos    0x1A8(g7), g0
    mov     5, g1
    call    calc_mht_adr
    ldob    0xC(g0), r10
    ldob    0xD(g0), r15
    shlo    8, r15, r15
    addo    r15, r10, r10
    ldob    0xA(g0), r11
    ldob    0xB(g0), r15
    shlo    8, r15, r15
    addo    r15, r11, r11
    ldos    0x1AA(g7), r13
    cmpobge r13, r10, loc_15604
    ldos    0x1AA(g7), r13
    cmpobl  r13, r11, loc_15604
    subo    r11, r10, r10
    lda     0xB801717, r15
    st      r15, (g11)[g12*1]
    st      r10, (g11)[g12*1]
    ld      (g11)[g12*1], r10
    ldl     0x754(g7), r4
    divr    r10, r4, r4
    divr    r10, r5, r5
    ld      0x18(g7), r14
    addr    r4, r14, r15
    st      r15, 0x18(g7)
    ld      0x20(g7), r14
    addr    r5, r14, r15
    st      r15, 0x20(g7)
    ld      0x18(g8), r14
    addr    r4, r14, r15
    st      r15, 0x18(g8)
    ld      0x20(g8), r14
    addr    r5, r14, r15
    st      r15, 0x20(g8)
    b       loc_15604
# ---------------------------------------------------------------------------
loc_155E0:                              # CODE XREF: ACT_RC_KABE_NAGE+C0↑j
    ldob    0x814(g7), r14
    cmpobe  4, r14, loc_155F4
    mov     0, r15
    st      r15, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_155F4:                              # CODE XREF: ACT_RC_KABE_NAGE+15C↑j
    mov     2, r15
    stis    r15, 0x5DE(g7)
    shlo    0x18, 9, r15
    st      r15, 0x198(g7)
loc_15604:                              # CODE XREF: ACT_RC_KABE_NAGE+F4↑j
    ret
# End of function ACT_RC_KABE_NAGE
