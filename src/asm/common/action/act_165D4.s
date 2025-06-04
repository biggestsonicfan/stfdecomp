        .section action
# =============== S U B R O U T I N E =======================================
ACT_165D4:                              # DATA XREF: ROM:0001D1A0↓o
    ldob    0x1B2(g7), r3
    cmpibe  0, r3, loc_165E0
    cmpibe  2, r3, loc_16648
loc_165E0:                              # CODE XREF: ACT_165D4+4↑j
    call    fix_hara
    ldis    0x800(g7), r15
    stis    r15, 0xA0E(g7)
    ldt     0x18(g7), r4
    stt     r4, 0xA38(g7)
    ld      cage_height, r15
    ld      0x81C(g7), r9
    addr    r15, r9, r9
    st      r9, 0xA30(g7)
    subr    r5, r9, r5
    ldos    0x80A(g7), r3
    lda     0xB801717, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    ld      (g11)[g12*1], r4
    divr    r4, r5, r5
    st      r5, 0xA44(g7)
    ldob    0x1B2(g7), r14
    addi    2, r14, r15
    stob    r15, 0x1B2(g7)
    ld      0x1A4(g7), r15
    clrbit  0, r15, r15
    st      r15, 0x1A4(g7)
    b       loc_168D8
# ---------------------------------------------------------------------------
loc_16648:                              # CODE XREF: ACT_165D4+8↑j
    ldos    0xA0E(g7), r8
    cmpobe  0, r8, loc_166BC
    ldt     0x80(g7), r4
    lda     0x2D805B5B, r15
    st      r15, (g11)[g12*1]
    ldis    0x26(g7), r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    ld      (g11)[g12*1], r4
    ld      (g11)[g12*1], r6
    ld      0xA44(g7), r5
    ldos    0x80A(g7), r7
    ldos    0x1AA(g7), r15
    cmpobge r15, r7, loc_1668C
    mov     r15, r7
loc_1668C:                              # CODE XREF: ACT_165D4+B0↑j
    lda     0xB801717, r15
    st      r15, (g11)[g12*1]
    st      r7, (g11)[g12*1]
    ld      (g11)[g12*1], r7
    mulr    r7, r5, r5
    ldt     0xA38(g7), r8
    addr    r8, r4, r4
    addr    r9, r5, r5
    addr    r10, r6, r6
    stt     r4, 0x18(g7)
    b       loc_168D8
# ---------------------------------------------------------------------------
loc_166BC:                              # CODE XREF: ACT_165D4+78↑j
    addo    0x1F, 0xF, r15
    stib    r15, 0x5BE(g7)
    ldis    0x5B6(g7), r3
    stis    r3, 0x26(g7)
    ld      0xA08(g7), r15
    bbs     0x13, r15, loc_16760
    lda     0x3DCCCCCD, r6
    lda     0x12002424, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    ld      (g11)[g12*1], r4
    lda     0x12802525, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    ld      (g11)[g12*1], r5
    notbit  0x1F, r4, r4
    ld      0xA08(g7), r12
    and     0xF, r12, r11
    ld      flt_16B1C[r11*8], r7
    ldis    word_16B20[r11*8], g0
    mulr    r7, r4, r4
    mulr    r7, r5, r5
    st      r4, 0x2C(g7)
    st      r5, 0x34(g7)
    mov     0, r15
    st      r15, 0x30(g7)
    cmpibg  0, g0, loc_16750
    call    sub_16A4C
    cmpobne 0, g1, loc_1675C
    b       loc_1675C
# ---------------------------------------------------------------------------
loc_16750:                              # CODE XREF: ACT_165D4+16C↑j
    lda     0xBCF5C28F, r8
    st      r8, 0x30(g7)
loc_1675C:                              # CODE XREF: ACT_165D4+174↑j
    b       loc_16840
# ---------------------------------------------------------------------------
loc_16760:                              # CODE XREF: ACT_165D4+FC↑j
    mov     0, r15
    st      r15, 0x30(g7)
    mov     6, g0
    call    sub_16A4C
    ld      0x1F4(g7), r5
    ld      0x1FC(g7), r6
    ld      0x1F4(g8), r7
    ld      0x1FC(g8), r8
    subr    r5, r7, r3
    subr    r6, r8, r4
    or      r3, r4, r5
    clrbit  0x1F, r5, r5
    cmpobne 0, r5, loc_167A4
    lda     system_address_table_ptr, r3
    lda     0x3F800000, r4
loc_167A4:                              # CODE XREF: ACT_165D4+1BC↑j
    lda     0x2D005A5A, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    ld      (g11)[g12*1], r4
    ldos    0x5BC(g7), r6
    cmpobne 0, r6, loc_167CC
    mov     1, r6
loc_167CC:                              # CODE XREF: ACT_165D4+1F0↑j
    lda     0xB801717, r15
    st      r15, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    ld      (g11)[g12*1], r6
    ldos    0x19C(g7), g0
    mov     9, g1
    call    calc_mht_adr
    cmpobe  0, g0, loc_167FC
    lda     0x3F000000, r13
    mulr    r13, r6, r6
loc_167FC:                              # CODE XREF: ACT_165D4+218↑j
    ld      0x5F4(g7), r7
    ld      stage_x, r11
    cmpr    r7, r11
    bl      loc_16814
    mov     r11, r7
loc_16814:                              # CODE XREF: ACT_165D4+238↑j
    lda     0x3F333333, r11
    subr    r11, r7, r7
    bbc     0x1F, r7, loc_16828
    mov     0, r7
loc_16828:                              # CODE XREF: ACT_165D4+24C↑j
    mulr    r7, r3, r3
    mulr    r7, r4, r4
    divr    r6, r3, r3
    divr    r6, r4, r4
    st      r3, 0x2C(g7)
    st      r4, 0x34(g7)
loc_16840:                              # CODE XREF: ACT_165D4:loc_1675C↑j
    ldos    (byte_30+0x16)(g6), r3
    stos    r3, 0x852(g7)
    mov     0x1F, r15
    stib    r15, 0x60C(g7)
    mov     6, r3
    stob    r3, 0x19F(g7)
    mov     2, r3
    stob    r3, 0x1B2(g7)
    ld      0x1A4(g7), r15
    setbit  0xC, r15, r15
    st      r15, 0x1A4(g7)
    ld      0x0(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g7)
    ld      0xA08(g7), r15
    setbit  0x15, r15, r15
    st      r15, 0xA08(g7)
    ld      0xA08(g7), r15
    clrbit  0xA, r15, r15
    st      r15, 0xA08(g7)
    ld      0xA08(g7), r15
    setbit  0x1A, r15, r15
    st      r15, 0xA08(g7)
    ld      0x19C(g7), r15
    bbs     0x13, r15, loc_168B8
    ldos    0x19C(g7), g0
    cmpobe  0, g0, loc_168D8
    call    set_motion
    b       loc_168D8
# ---------------------------------------------------------------------------
loc_168B8:                              # CODE XREF: ACT_165D4+2D0↑j
    ldos    0x19C(g7), g0
    mov     3, g1
    call    calc_mht_adr
    ldob    5(g0), r3
    ldob    6(g0), r15
    shlo    8, r15, r15
    addo    r15, r3, r3
    stos    r3, 0x5C0(g7)
loc_168D8:                              # CODE XREF: ACT_165D4+70↑j
    ret
# End of function ACT_165D4
