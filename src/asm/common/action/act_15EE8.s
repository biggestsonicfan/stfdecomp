        .section action
# =============== S U B R O U T I N E =======================================
ACT_15EE8:                              # DATA XREF: ROM:0001D168↓o
    ldob    0x1B2(g7), r3
    cmpibe  0, r3, loc_15EFC
    cmpibe  1, r3, loc_15F20
    cmpibe  2, r3, loc_16040
    cmpibe  3, r3, loc_16108
loc_15EFC:                              # CODE XREF: ACT_15EE8+4↑j
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
loc_15F20:                              # CODE XREF: ACT_15EE8+8↑j
    ld      0x0(g7), r15
    bbs     2, r15, loc_15F58
    ldos    0x1AA(g7), r13
    ldos    0x872(g7), r14
    cmpobge r13, r14, loc_15F38
    b       loc_1611C
# ---------------------------------------------------------------------------
loc_15F38:                              # CODE XREF: ACT_15EE8+48↑j
    ldt     0x18(g7), r4
    stt     r4, 0x18(g8)
    ldis    0x26(g7), r15
    stis    r15, 0x26(g8)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    b       loc_16040
# ---------------------------------------------------------------------------
loc_15F58:                              # CODE XREF: ACT_15EE8+3C↑j
    ld      0x1A4(g7), r15
    bbs     1, r15, loc_15F70
    mov     0, r15
    st      r15, 0x2C(g7)
    mov     0, r15
    st      r15, 0x2C(g7)
loc_15F70:                              # CODE XREF: ACT_15EE8+74↑j
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
    lda     0x3F19999A, r13
    mulr    r13, r3, r3
    lda     0x3F19999A, r13
    mulr    r13, r4, r4
    ld      0x18(g7), r14
    addr    r3, r14, r15
    st      r15, 0x18(g7)
    ld      0x20(g7), r14
    addr    r4, r14, r15
    st      r15, 0x20(g7)
    ld      0x1A4(g7), r15
    bbs     1, r15, loc_16008
    ld      0x30(g7), r13
    ld      0x84(g7), r14
    subr    r13, r14, r15
    st      r15, 0x1C(g7)
    b       loc_1611C
# ---------------------------------------------------------------------------
loc_16008:                              # CODE XREF: ACT_15EE8+108↑j
    ld      0x84(g7), r13
    ld      0x1C(g7), r14
    subr    r13, r14, r5
    lda     0x3F19999A, r13
    mulr    r13, r5, r5
    ld      0x1C(g7), r14
    subr    r5, r14, r15
    st      r15, 0x1C(g7)
    ld      0x30(g7), r13
    ld      0x1C(g7), r14
    subr    r13, r14, r15
    st      r15, 0x1C(g7)
    b       loc_1611C
# ---------------------------------------------------------------------------
loc_16040:                              # CODE XREF: ACT_15EE8+C↑j
    ldis    0x872(g7), r15
    stis    r15, 0x1AA(g7)
    ldob    0x822(g7), g0
    mov     g0, r4
    ldob    0xA28(g7), r5
    bbc     0, r5, loc_16060
    ldos    0x5DE(g7), r3
    addo    r3, r4, r4
loc_16060:                              # CODE XREF: ACT_15EE8+16C↑j
    stos    r4, 0x5DE(g7)
    cmpobne 0, g0, loc_16088
    ld      0x1A4(g7), r15
    bbs     0xE, r15, loc_1608C
    ld      0x0(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g7)
    mov     0, r15
    st      r15, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_16088:                              # CODE XREF: ACT_15EE8+17C↑j
    call    damage_calculation # g7 = damage reciever
loc_1608C:                              # CODE XREF: ACT_15EE8+184↑j
    ld      fa_camera, r3
    lda     0x3E19999A, r15
    st      r15, 0xFC(r3)
    ld      0x1A4(g7), r15
    bbs     0xE, r15, loc_160FC
    ldos    0x1AC(g7), r14
    cmpobne 0, r14, loc_160E4
    mov     3, r3
    mov     r3, g0
    call    search_shift_data_adr
    cmpobe  0, g0, loc_160D4
    stob    r3, 0x60C(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_160D4:                              # CODE XREF: ACT_15EE8+1D4↑j
    lda     0x80000E1, r15
    st      r15, 0x198(g7)
    ret
# ---------------------------------------------------------------------------
loc_160E4:                              # CODE XREF: ACT_15EE8+1C4↑j
    ld      0x0(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g7)
    mov     0, r15
    st      r15, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_160FC:                              # CODE XREF: ACT_15EE8+1BC↑j
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_16108:                              # CODE XREF: ACT_15EE8+10↑j
    ldos    0x1AA(g7), r13
    ldos    0x800(g7), r14
    cmpobl  r13, r14, loc_1611C
    shlo    0x18, 9, r15
    st      r15, 0x198(g7)
loc_1611C:                              # CODE XREF: ACT_15EE8+4C↑j
    ret
# End of function ACT_15EE8
