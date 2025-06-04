
        .section action
# =============== S U B R O U T I N E =======================================
ACT_156EC:                              # DATA XREF: ROM:0001D148↓o
    ldob    0x1B2(g7), r3
    cmpibe  0, r3, loc_156FC
    cmpibe  1, r3, loc_15720
    cmpibe  2, r3, loc_15998
loc_156FC:                              # CODE XREF: ACT_156EC+4↑j
    ldos    0x19C(g7), g0
    call    comp_set_motion
    ld      0x0(g7), r15
    setbit  4, r15, r15
    st      r15, 0x0(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_15720:                              # CODE XREF: ACT_156EC+8↑j
    ld      0x80(g8), r6
    ld      0x88(g8), r7
    ldos    0x1A8(g7), g0
    mov     0x18, g1
    call    calc_mht_adr
    cmpobe  0, g0, loc_15748
    ld      1(g0), r8
    ld      9(g0), r9
    addr    r8, r6, r6
    addr    r9, r7, r7
loc_15748:                              # CODE XREF: ACT_156EC+48↑j
    lda     0x2D805B5B, r15
    st      r15, (g11)[g12*1]
    ldis    0x26(g8), r15
    st      r15, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    st      r7, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    ld      (g11)[g12*1], r4
    ld      0x18(g8), r14
    subr    r3, r14, r3
    ld      0x20(g8), r14
    subr    r4, r14, r4
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
    ld      0x84(g8), r13
    ld      0x84(g7), r14
    subr    r13, r14, r5
    ld      0x0(g7), r8
    ld      0x0(g8), r9
    or      r8, r9, r10
    and     r8, r9, r11
    ld      0x1A4(g7), r15
    bbc     1, r15, loc_1582C
    lda     0x3F19999A, r13
    mulr    r13, r3, r3
    lda     0x3F19999A, r13
    mulr    r13, r4, r4
    lda     0x3F19999A, r13
    mulr    r13, r5, r5
    bbs     2, r8, loc_15850
    ldis    0x818(g7), r15
    stis    r15, 0x1AA(g7)
    ld      0x1A4(g7), r15
    clrbit  0xC, r15, r15
    st      r15, 0x1A4(g7)
    ld      0x1A4(g7), r15
    clrbit  1, r15, r15
    st      r15, 0x1A4(g7)
loc_1582C:                              # CODE XREF: ACT_156EC+F4↑j
    bbc     2, r10, loc_158B0
    bbs     2, r11, loc_15850
    bbs     2, r8, loc_159AC
    ldis    0x818(g7), r15
    stis    r15, 0x1AA(g7)
    ld      0x1A4(g7), r15
    clrbit  0xC, r15, r15
    st      r15, 0x1A4(g7)
    b       loc_158C0
# ---------------------------------------------------------------------------
loc_15850:                              # CODE XREF: ACT_156EC+11C↑j
    ld      0x0(g8), r15
    bbc     2, r15, loc_15870
    ld      0x2C(g8), r15
    st      r15, 0x2C(g7)
    ld      0x30(g8), r15
    st      r15, 0x30(g7)
    ld      0x34(g8), r15
    st      r15, 0x34(g7)
loc_15870:                              # CODE XREF: ACT_156EC+168↑j
    ld      0x18(g7), r14
    addr    r3, r14, r15
    st      r15, 0x18(g7)
    ld      0x20(g7), r14
    addr    r4, r14, r15
    st      r15, 0x20(g7)
    ld      0x1C(g8), r14
    addr    r5, r14, r15
    st      r15, 0x1C(g7)
    ldob    4(g7), r14
    cmpobe  0, r14, loc_159AC
    ld      0x30(g7), r13
    ld      0x1C(g7), r14
    subr    r13, r14, r15
    st      r15, 0x1C(g7)
    ret
# ---------------------------------------------------------------------------
loc_158B0:                              # CODE XREF: ACT_156EC:loc_1582C↑j
    ldt     0x18(g8), r4
    stt     r4, 0x18(g7)
    ldis    0x26(g8), r15
    stis    r15, 0x26(g7)
loc_158C0:                              # CODE XREF: ACT_156EC+160↑j
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    mov     0, r4
    st      r4, 0x2C(g7)
    st      r4, 0x34(g7)
    mov     0, r4
    st      r4, 0x2C(g8)
    st      r4, 0x34(g8)
    ldob    0x822(g7), g0
    mov     g0, r4
    ldob    0xA28(g7), r5
    bbc     0, r5, loc_158FC
    ldos    0x5DE(g7), r3
    addo    r3, r4, r4
loc_158FC:                              # CODE XREF: ACT_156EC+204↑j
    stos    r4, 0x5DE(g7)
    cmpobne 0, g0, loc_15924
    ld      0x1A4(g7), r15
    bbs     0xE, r15, loc_15928
    ld      0x0(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g7)
    mov     0, r15
    st      r15, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_15924:                              # CODE XREF: ACT_156EC+214↑j
    call    damage_calculation # g7 = damage reciever
loc_15928:                              # CODE XREF: ACT_156EC+21C↑j
    ld      fa_camera, r3
    lda     0x3E19999A, r15
    st      r15, 0xFC(r3)
    ld      0x1A4(g7), r15
    bbs     0xE, r15, loc_15998
    ldos    0x1AC(g7), r14
    cmpobne 0, r14, loc_15980
    mov     3, r3
    mov     r3, g0
    call    search_shift_data_adr
    cmpobe  0, g0, loc_15970
    stob    r3, 0x60C(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_15970:                              # CODE XREF: ACT_156EC+26C↑j
    lda     0x80000E1, r15
    st      r15, 0x198(g7)
    ret
# ---------------------------------------------------------------------------
loc_15980:                              # CODE XREF: ACT_156EC+25C↑j
    ld      0x0(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g7)
    mov     0, r15
    st      r15, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_15998:                              # CODE XREF: ACT_156EC+C↑j
    ldos    0x1AA(g7), r13
    ldos    0x800(g7), r14
    cmpobl  r13, r14, loc_159AC
    shlo    0x18, 9, r15
    st      r15, 0x198(g7)
loc_159AC:                              # CODE XREF: ACT_156EC+148↑j
    ret
# End of function ACT_156EC
