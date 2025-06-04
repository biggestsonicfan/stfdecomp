
        .section action
# =============== S U B R O U T I N E =======================================
sub_16A4C:                              # CODE XREF: ACT_RC_JUMP+970↑p
    ldob    0x5BE(g7), r12
    addo    g0, r12, r12
    stob    r12, 0x5BE(g7)
    lda     0xB801717, r15
    st      r15, (g11)[g12*1]
    st      r12, (g11)[g12*1]
    ld      (g11)[g12*1], r6
    ld      0x5CC(g7), r13
    ld      0x50A000, r14
    subr    r13, r14, r3
    lda     0x3F800000, r13
    addr    r13, r6, r4
    mulr    r3, r4, r3
    lda     0x3F000000, r13
    mulr    r13, r3, r3
    lda     0x3F99999A, r13
    ld      0x81C(g7), r14
    subr    r13, r14, r4
    divr    r6, r4, r4
    addr    r3, r4, r8
    ld      0x50A000, r5
    ld      0x1A4(g7), r15
    bbc     0xE, r15, loc_16AD4
    ld      flt_1D290, r13
    ld      0x50A000, r14
    mulr    r13, r14, r5
loc_16AD4:                              # CODE XREF: sub_16A4C+70↑j
    ld      0x1C(g7), r9
    lda     0x3F99999A, r10
    mov     0, r11
loc_16AE4:                              # CODE XREF: sub_16A4C+B0↓j
    addr    r8, r10, r10
    subr    r5, r8, r8
    addo    1, r11, r11
    shlo    2, 0x19, r13
    cmpobe  r13, r11, loc_16B14
    cmpr    r9, r10
    bg      loc_16AE4
    st      r8, 0x30(g7)
    subo    r11, r12, r12
    stos    r12, 0x5BC(g7)
    mov     0, g1
    ret
# ---------------------------------------------------------------------------
loc_16B14:                              # CODE XREF: sub_16A4C+A8↑j
    mov     1, g1
    ret
# End of function sub_16A4C
