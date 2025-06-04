        .section action
# =============== S U B R O U T I N E =======================================
ACT_168DC:                              # DATA XREF: ROM:0001D1A8↓o
    ldob    0x1B2(g7), r3
    cmpobe  0, r3, loc_168EC
    cmpobe  1, r3, loc_168F8
    cmpobe  2, r3, loc_16A48
loc_168EC:                              # CODE XREF: ACT_168DC+4↑j
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_168F8:                              # CODE XREF: ACT_168DC+8↑j
    ldos    0x1AA(g7), r13
    ldos    0x80E(g7), r14
    cmpobl  r13, r14, loc_16A48
    ld      0x1A4(g7), r15
    clrbit  1, r15, r15
    st      r15, 0x1A4(g7)
    ldob    0x5BE(g7), r6
    stos    r6, 0x5BC(g7)
    lda     0xB801717, r15
    st      r15, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    ld      (g11)[g12*1], r6
    ld      0x5CC(g7), r13
    ld      0x50A000, r14
    subr    r13, r14, r3
    lda     0x3F800000, r13
    addr    r13, r6, r4
    mulr    r3, r4, r3
    lda     0x3F000000, r13
    mulr    r13, r3, r3
    ld      0x1F8(g7), r13
    ld      0x81C(g7), r14
    subr    r13, r14, r4
    divr    r6, r4, r4
    addr    r3, r4, r15
    st      r15, 0x30(g7)
    ld      0x5C4(g7), r7
    ld      0x724(g7), r13
    mulr    r13, r6, r5
    divr    r6, r5, r3
    mulr    r7, r3, r3
    ldis    0x26(g7), r4
    mov     r4, r12
    bbc     0x1F, r3, loc_16994
    notbit  0xF, r4, r12
loc_16994:                              # CODE XREF: ACT_168DC+B0↑j
    stis    r12, 0x5C2(g7)
    subi    r4, 0, r12
    lda     0x12002424, r15
    st      r15, (g11)[g12*1]
    st      r12, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    st      r15, 0x2C(g7)
    lda     0x12802525, r15
    st      r15, (g11)[g12*1]
    st      r12, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    st      r15, 0x34(g7)
    call    fix_hara
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    lda     0xAE1100, g0    # sd_jump_1
    call    check_same_sound
    call    sound_request_u
    ld      0x1A4(g7), r15
    clrbit  0, r15, r15
    st      r15, 0x1A4(g7)
    lda     0x50080200, r15
    st      r15, 0xA08(g7)
    ld      0x19C(g7), r15
    bbs     0x11, r15, loc_16A24
    ld      0xA08(g7), r15
    setbit  0x10, r15, r15
    st      r15, 0xA08(g7)
    b       loc_16A30
# ---------------------------------------------------------------------------
loc_16A24:                              # CODE XREF: ACT_168DC+134↑j
    ld      0xA08(g7), r15
    setbit  0x11, r15, r15
    st      r15, 0xA08(g7)
loc_16A30:                              # CODE XREF: ACT_168DC+144↑j
    ldos    (byte_30+0x1A)(g6), r11
    lda     0x6804000, r13
    addi    r13, r11, r11
    st      r11, 0x19C(g7)
loc_16A48:                              # CODE XREF: ACT_168DC+C↑j
    ret
# End of function ACT_168DC
