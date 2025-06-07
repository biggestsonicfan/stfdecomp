        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_JUMP:                            # DATA XREF: ROM:0001D080↓o
    ldob    0x1B2(g7), r3   # Label from official source
    cmpobe  0, r3, loc_13DD0
    cmpobe  1, r3, loc_13DDC
    cmpobe  2, r3, loc_1410C
loc_13DD0:                              # CODE XREF: ACT_RC_JUMP+4↑j
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_13DDC:                              # CODE XREF: ACT_RC_JUMP+8↑j
    ldos    0x1AA(g7), r13
    ldos    0x80E(g7), r14
    cmpobl  r13, r14, loc_148E0
    ld      0x1A4(g7), r15
    clrbit  1, r15, r15
    st      r15, 0x1A4(g7)
    ld      0x0(g7), r15
    bbs     0x1D, r15, loc_13E2C
    ldos    0x19C(g7), g0
    cmpobe  0, g0, loc_13E2C
    ldos    0x1A8(g7), r14
    cmpobe  g0, r14, loc_13E2C
    ld      0x19C(g7), r3
    bbc     0x13, r3, loc_13E28
    ldos    0x5BC(g7), r13
    ldos    0x5C0(g7), r14
    cmpibg  r13, r14, loc_13E2C
    clrbit  0x13, r3, r3
    st      r3, 0x19C(g7)
loc_13E28:                              # CODE XREF: ACT_RC_JUMP+50↑j
    call    set_motion
loc_13E2C:                              # CODE XREF: ACT_RC_JUMP+38↑j
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
    ld      0x19C(g7), r15
    bbs     0x14, r15, loc_13FF4
    ld      0x5C4(g7), r7
    ld      0x724(g7), r13
    mulr    r13, r6, r5
    ld      0x19C(g7), r15
    bbs     0x11, r15, loc_13EE4
    ld      0x19C(g7), r15
    bbc     0x12, r15, loc_13ECC
    ld      0x728(g7), r13
    mulr    r13, r6, r5
    ld      0x19C(g7), r15
    bbc     0x15, r15, loc_13EE4
    ld      0x730(g7), r13
    mulr    r13, r6, r5
    b       loc_13EE4
# ---------------------------------------------------------------------------
loc_13ECC:                              # CODE XREF: ACT_RC_JUMP+EC↑j
    ld      0x724(g7), r13
    mulr    r13, r6, r5
    ld      0x19C(g7), r15
    bbc     0x15, r15, loc_13EE4
    ld      0x72C(g7), r13
    mulr    r13, r6, r5
loc_13EE4:                              # CODE XREF: ACT_RC_JUMP+E4↑j
    cmpobe  0, r7, loc_13F98
    bbs     0x1F, r7, loc_13F04
    ld      0x5F8(g7), r8
    ld      0x5F4(g7), r9
    ld      0x5B8(g7), r15
    bbc     0, r15, loc_13F18
    setbit  0x1F, r9, r9
    b       loc_13F18
# ---------------------------------------------------------------------------
loc_13F04:                              # CODE XREF: ACT_RC_JUMP+128↑j
    ld      0x5FC(g7), r8
    ld      0x5F4(g7), r9
    ld      0x5B8(g7), r15
    bbs     0, r15, loc_13F18
    setbit  0x1F, r9, r9
loc_13F18:                              # CODE XREF: ACT_RC_JUMP+138↑j
    ld      0x19C(g7), r15
    bbs     0x15, r15, loc_13F98
    lda     0x3ECCCCCD, r4
    addr    r4, r9, r3
    cmpibge r5, r3, loc_13F40
    subr    r4, r9, r3
    cmpible r5, r3, loc_13F40
    mov     r3, r5
    b       loc_13F98
# ---------------------------------------------------------------------------
loc_13F40:                              # CODE XREF: ACT_RC_JUMP+16C↑j
    lda     0x3F4CCCCD, r4
    ld      0x5F4(g7), r3
    cmpr    r4, r3
    bl      loc_13F98
    ld      0x710(g8), r3
    lda     0x3FACCCCD, r4
    cmpr    r4, r3
    bg      loc_13F98
    lda     0x3ECCCCCD, r4
    bbs     0x1F, r9, loc_13F88
    subr    r4, r9, r3
    cmpr    r5, r3
    bl      loc_13F98
    mov     r3, r5
    b       loc_13F98
# ---------------------------------------------------------------------------
loc_13F88:                              # CODE XREF: ACT_RC_JUMP+1B0↑j
    addr    r4, r9, r3
    cmpr    r5, r3
    bg      loc_13F98
    mov     r3, r5
loc_13F98:                              # CODE XREF: ACT_RC_JUMP:loc_13EE4↑j
    divr    r6, r5, r3
    mulr    r7, r3, r3
    ldis    0x26(g7), r4
    mov     r4, r12
    bbc     0x1F, r3, loc_13FB0
    notbit  0xF, r4, r12
loc_13FB0:                              # CODE XREF: ACT_RC_JUMP+1E8↑j
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
    b       loc_140CC
# ---------------------------------------------------------------------------
loc_13FF4:                              # CODE XREF: ACT_RC_JUMP+D0↑j
    ld      0x6C8(g7), r5
    ldos    0x26(g7), r7
    ld      0x5B8(g7), r15
    bbc     0, r15, loc_14018
    shlo    0xF, 1, r13
    addi    r13, r7, r7
    lda     0xFFFF, r13
    and     r13, r7, r7
loc_14018:                              # CODE XREF: ACT_RC_JUMP+240↑j
    lda     0x2D805B5B, r15
    st      r15, (g11)[g12*1]
    st      r7, (g11)[g12*1]
    ld      0x830(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x834(g7), r15
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    ld      (g11)[g12*1], r4
    ld      0x600(g7), r14
    subr    r3, r14, r3
    ld      0x608(g7), r14
    subr    r4, r14, r4
    ld      0x1F4(g7), r13
    subr    r13, r3, r3
    ld      0x1FC(g7), r13
    subr    r13, r4, r4
loc_14060:                              # DATA XREF: set_motion:loc_1B250↓o
    lda     0x16802D2D, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    ld      (g11)[g12*1], g0
    cmpible g0, r5, loc_14094
    lda     0x3ECCCCCD, g1
    subr    g1, r5, r5
    divr    g0, r5, g0
    mulr    g0, r3, r3
    mulr    g0, r4, r4
loc_14094:                              # CODE XREF: ACT_RC_JUMP+2B8↑j
    divr    r6, r3, r15
    st      r15, 0x2C(g7)
    divr    r6, r4, r15
    st      r15, 0x34(g7)
    mov     0, r5
    lda     0x17802F2F, r15
    st      r15, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    ld      (g11)[g12*1], r6
    stis    r6, 0x5C2(g7)
loc_140CC:                              # CODE XREF: ACT_RC_JUMP+230↑j
    call    fix_hara
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ld      0x19C(g7), r15
    bbs     18, r15, loc_140F8 # sd_jump_2
    lda     0xAE1100, g0    # sd_jump_1
    call    check_same_sound
    call    sound_request_u
    ret
# ---------------------------------------------------------------------------
loc_140F8:                              # CODE XREF: ACT_RC_JUMP+320↑j
    lda     0xAE1101, g0    # sd_jump_2
    call    check_same_sound
    call    sound_request_u
    ret
# ---------------------------------------------------------------------------
loc_1410C:                              # CODE XREF: ACT_RC_JUMP+C↑j
    ld      0x0(g7), r15
    bbs     0x1D, r15, loc_14144
    ld      0xA08(g7), r15
    bbs     0x19, r15, loc_14144
    ld      0x19C(g7), r15
    bbc     0x13, r15, loc_14144
    ldos    0x5BC(g7), r13
    ldos    0x5C0(g7), r14
    cmpibg  r13, r14, loc_14144
    ldos    0x19C(g7), g0
    call    set_motion
    ld      0x19C(g7), r15
    clrbit  0x13, r15, r15
    st      r15, 0x19C(g7)
loc_14144:                              # CODE XREF: ACT_RC_JUMP+350↑j
    ld      0x0(g7), r15
    bbc     2, r15, loc_14870
    ld      0x0(g7), r15
    bbs     0x1D, r15, loc_14174
    ld      0xA08(g7), r15
    bbs     0x1A, r15, loc_148E0
    ld      0xA08(g7), r15
    bbs     6, r15, loc_144E4
    ld      0xA08(g7), r15
    bbs     0xC, r15, loc_14560
    ld      0xA08(g7), r15
    bbs     0x19, r15, loc_14410
loc_14174:                              # CODE XREF: ACT_RC_JUMP+390↑j
    ld      0x0(g7), r15
    bbs     3, r15, loc_14224
    ld      0xA08(g7), r15
    bbs     0x1D, r15, loc_14224
    ld      0x1A4(g8), r15
    bbs     0xD, r15, loc_141A0
    bbs     8, r15, loc_14224
    bbs     0x11, r15, loc_14224
    bbs     0xE, r15, loc_14224
    ld      0x1A4(g7), r15
    bbs     8, r15, loc_14224
loc_141A0:                              # CODE XREF: ACT_RC_JUMP+3C8↑j
    ld      mod_fa_coli, r3
    ld      0x164(r3), r14
    cmpobe  0, r14, loc_14224
    ld      0xA08(g7), r15
    setbit  0x1D, r15, r15
    st      r15, 0xA08(g7)
    ldt     0x2C(g7), r4
    lda     0x3F000000, r7
    mulr    r7, r4, r4
    mulr    r7, r6, r6
    lda     0x16802D2D, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    ld      (g11)[g12*1], r8
    lda     0x3D4CCCCD, r9
    cmpr    r9, r8
    bge     loc_14204
    divr    r8, r9, r9
    mulr    r9, r4, r4
    mulr    r9, r6, r6
loc_14204:                              # CODE XREF: ACT_RC_JUMP+434↑j
    ld      0xA08(g7), r13
    ld      0xA08(g8), r15
    xor     r13, r15, r11
    bbs     0x10, r11, loc_14220
    bbs     0x11, r11, loc_14220
    notbit  0x1F, r4, r4
    notbit  0x1F, r6, r6
loc_14220:                              # CODE XREF: ACT_RC_JUMP+450↑j
    stt     r4, 0x2C(g7)
loc_14224:                              # CODE XREF: ACT_RC_JUMP+3B8↑j
    ld      0x0(g7), r15
    bbs     0x1D, r15, loc_148E0
    ld      0xA08(g7), r15
    bbc     0x1E, r15, loc_148E0
    ld      0x644(g7), r3
    ld      0x64C(g7), r4
    or      r3, r4, r3
    cmpobe  0, r3, loc_148E0
    ldos    0x5BC(g7), r14
    cmpibge 1, r14, loc_148E0
    ld      0x70C(g7), r15
    bbc     3, r15, loc_148E0
    ldob    4(g7), r3
    ld      mod_fa_coli, r4
    ldos    0x1F4(r4)[r3*2], r3
    clrbit  3, r3, r3
    cmpobl  3, r3, loc_148E0
    ld      0x1F8(g7), r3
    lda     0x3FB33333, r4
    cmpr    r3, r4
    bl      loc_148E0
    ld      0xA08(g7), r3
    shro    1, r3, r4
    or      r3, r4, r3
    bbc     0x10, r3, loc_148E0
    ld      0xA08(g7), r15
    bbc     0x1F, r15, loc_142A4
    ld      0xA08(g7), r15
    bbc     0, r15, loc_148E0
loc_142A4:                              # CODE XREF: ACT_RC_JUMP+4D8↑j
    ld      0x2C(g7), r3
    clrbit  0x1F, r3, r4
    lda     0x3DB851EC, r10
    cmpr    r10, r4
    bg      loc_142D0
    lda     0x80000000, r13
    and     r13, r3, r3
    or      r3, r10, r3
    st      r3, 0x2C(g7)
loc_142D0:                              # CODE XREF: ACT_RC_JUMP+4F8↑j
    ld      0x34(g7), r3
    clrbit  0x1F, r3, r4
    cmpr    r10, r4
    bg      loc_142F4
    lda     0x80000000, r13
    and     r13, r3, r3
    or      r3, r10, r3
    st      r3, 0x34(g7)
loc_142F4:                              # CODE XREF: ACT_RC_JUMP+51C↑j
    ld      0x19C(g7), r15
    bbc     0x17, r15, loc_143AC
    ld      0x19C(g7), r15
    clrbit  0x17, r15, r15
    st      r15, 0x19C(g7)
    ldos    0x19C(g7), g0
    call    set_motion
    ld      0xA08(g7), r15
    clrbit  0x13, r15, r15
    st      r15, 0xA08(g7)
    ld      0xA08(g7), r15
    bbc     0x11, r15, loc_14390
    lda     0x80000000, r4
    lda     0x3E99999A, r12
    ld      0x644(g7), r3
    cmpobe  0, r3, loc_14358
    not     r3, r3
    and     r4, r3, r3
    or      r3, r12, r12
    ld      0x18(g7), r5
    addr    r12, r5, r5
    st      r5, 0x18(g7)
    b       loc_14378
# ---------------------------------------------------------------------------
loc_14358:                              # CODE XREF: ACT_RC_JUMP+578↑j
    ld      0x64C(g7), r3
    cmpobe  0, r3, loc_14378
    not     r3, r3
    and     r4, r3, r3
    or      r3, r12, r12
    ld      0x20(g7), r5
    addr    r12, r5, r5
    st      r5, 0x20(g7)
loc_14378:                              # CODE XREF: ACT_RC_JUMP+594↑j
    ldos    0x26(g7), r14
    notbit  0xF, r14, r15
    stos    r15, 0x26(g7)
    ldos    0x61A(g7), r14
    notbit  0xF, r14, r15
    stos    r15, 0x61A(g7)
loc_14390:                              # CODE XREF: ACT_RC_JUMP+560↑j
    shlo    0x17, 5, r13
    ld      0xA08(g7), r14
    or      r13, r14, r15
    st      r15, 0xA08(g7)
    ldt     0x2C(g7), r4
    stt     r4, 0xA10(g7)
    b       loc_144E4
# ---------------------------------------------------------------------------
loc_143AC:                              # CODE XREF: ACT_RC_JUMP+538↑j
    lda     0x2800020, r13
    ld      0xA08(g7), r14
    or      r13, r14, r15
    st      r15, 0xA08(g7)
    mov     6, r15
    stis    r15, 0xA0E(g7)
    ldt     0x2C(g7), r4
    stt     r4, 0xA10(g7)
    movt    0, r4
    stt     r4, 0x2C(g7)
    ldos    (byte_30+0x12)(g6), r3
    ldob    4(g7), r5
    ld      mod_fa_coli, r4
    ldos    0x1F4(r4)[r5*2], r5
    bbc     3, r5, loc_14400
    ldos    (byte_30+0x14)(g6), r3
loc_14400:                              # CODE XREF: ACT_RC_JUMP+634↑j
    mov     0x1F, r15
    stib    r15, 0x60C(g7)
    stos    r3, 0x852(g7)
    b       loc_148E0
# ---------------------------------------------------------------------------
loc_14410:                              # CODE XREF: ACT_RC_JUMP+3B0↑j
    ldos    0xA0E(g7), r14
    cmpobe  0, r14, loc_1466C
    ld      0x19C(g7), r15
    bbc     0x17, r15, loc_148E0
    ld      0x19C(g7), r15
    clrbit  0x17, r15, r15
    st      r15, 0x19C(g7)
    ld      0x804(g7), r3
    ldos    0x19C(g7), g0
    call    set_motion
    ld      0xA08(g7), r15
    bbc     0x11, r15, loc_144AC
loc_14440:                              # DATA XREF: MAIN_DATA:02810EFC↓o
    lda     0x80000000, r4
    lda     0x3E99999A, r12
    ld      0x644(g7), r3
    cmpobe  0, r3, loc_14474
    not     r3, r3
    and     r4, r3, r3
    or      r3, r12, r12
    ld      0x18(g7), r5
    addr    r12, r5, r5
    st      r5, 0x18(g7)
    b       loc_14494
# ---------------------------------------------------------------------------
loc_14474:                              # CODE XREF: ACT_RC_JUMP+694↑j
    ld      0x64C(g7), r3
    cmpobe  0, r3, loc_14494
    not     r3, r3
    and     r4, r3, r3
    or      r3, r12, r12
    ld      0x20(g7), r5
    addr    r12, r5, r5
    st      r5, 0x20(g7)
loc_14494:                              # CODE XREF: ACT_RC_JUMP+6B0↑j
    ldos    0x26(g7), r14
    notbit  0xF, r14, r15
    stos    r15, 0x26(g7)
    ldos    0x61A(g7), r14
    notbit  0xF, r14, r15
    stos    r15, 0x61A(g7)
loc_144AC:                              # CODE XREF: ACT_RC_JUMP+67C↑j
    bbc     0x14, r3, loc_144C8
    ldos    0x26(g7), r14
    notbit  0xF, r14, r15
    stos    r15, 0x26(g7)
    ldos    0x61A(g7), r14
    notbit  0xF, r14, r15
    stos    r15, 0x61A(g7)
loc_144C8:                              # CODE XREF: ACT_RC_JUMP:loc_144AC↑j
    shlo    0x17, 5, r13
    ld      0xA08(g7), r14
    or      r13, r14, r15
    st      r15, 0xA08(g7)
    ldt     0x2C(g7), r4
    stt     r4, 0xA10(g7)
    b       loc_144E4
# ---------------------------------------------------------------------------
loc_144E4:                              # CODE XREF: ACT_RC_JUMP+3A0↑j
    ld      0x70C(g7), r15
    clrbit  3, r15, r15
    st      r15, 0x70C(g7)
    ldis    0x800(g7), r15
    stis    r15, 0xA0E(g7)
    ldos    0xA0E(g7), r14
    subi    1, r14, r15
    stos    r15, 0xA0E(g7)
    ld      0xA08(g7), r15
    clrbit  9, r15, r15
    st      r15, 0xA08(g7)
    ld      0xA08(g7), r15
    setbit  0xC, r15, r15
    st      r15, 0xA08(g7)
    ld      cage_height, r15
    ld      0x81C(g7), r5
    addr    r15, r5, r5
    st      r5, 0xA3C(g7)
    ldt     0x18(g7), r8
    stt     r8, 0xA2C(g7)
    subr    r9, r5, r5
    ldos    0x80A(g7), r3
    lda     0xB801717, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    ld      (g11)[g12*1], r4
    divr    r4, r5, r5
    st      r5, 0xA44(g7)
    b       loc_148E0
# ---------------------------------------------------------------------------
loc_14560:                              # CODE XREF: ACT_RC_JUMP+3A8↑j
    ldos    0xA0E(g7), r8
    cmpobe  0, r8, loc_145D4
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
    cmpobge r15, r7, loc_145A4
    mov     r15, r7
loc_145A4:                              # CODE XREF: ACT_RC_JUMP+7DC↑j
    lda     0xB801717, r15
    st      r15, (g11)[g12*1]
    st      r7, (g11)[g12*1]
    ld      (g11)[g12*1], r7
    mulr    r7, r5, r5
    ldt     0xA2C(g7), r8
    addr    r8, r4, r4
    addr    r9, r5, r5
    addr    r10, r6, r6
    stt     r4, 0x18(g7)
    b       loc_148E0
# ---------------------------------------------------------------------------
loc_145D4:                              # CODE XREF: ACT_RC_JUMP+7A4↑j
    lda     system_address_table_ptr, r15
    st      r15, 0x30(g7)
    ld      0x81C(g7), g0
    call    calc_land_time
    stos    g1, 0x5BC(g7)
    shlo    1, g1, g1
    stob    g1, 0x5BE(g7)
    ld      0xA08(g7), r15
    clrbit  0xC, r15, r15
    clrbit  0x19, r15, r15
    setbit  0x1A, r15, r15
    st      r15, 0xA08(g7)
    ld      0x70C(g7), r15
    clrbit  3, r15, r15
    st      r15, 0x70C(g7)
    ld      0x19C(g7), r15
    bbc     0x16, r15, loc_1463C
    ldos    0x19C(g7), g0
    call    set_motion
    mov     0, r15
    st      r15, 0x5CC(g7)
    ld      0x19C(g7), r15
    clrbit  0x16, r15, r15
    st      r15, 0x19C(g7)
    b       loc_14648
# ---------------------------------------------------------------------------
loc_1463C:                              # CODE XREF: ACT_RC_JUMP+858↑j
    ldos    (byte_30+0x16)(g6), g0
    call    set_motion
loc_14648:                              # CODE XREF: ACT_RC_JUMP+878↑j
    ld      0xA08(g7), r12
    and     0xF, r12, r11
    ld      flt_16B1C[r11*8], r4
    ldis    word_16B20[r11*8], r5
    ld      0xA08(g7), r15
    bbc     0x13, r15, loc_14708
    b       loc_14790
# ---------------------------------------------------------------------------
loc_1466C:                              # CODE XREF: ACT_RC_JUMP+654↑j
    ld      0xA08(g7), r15
    clrbit  0x19, r15, r15
    st      r15, 0xA08(g7)
    ld      0x70C(g7), r15
    clrbit  3, r15, r15
    st      r15, 0x70C(g7)
    ld      0xA08(g7), r15
    setbit  0x1A, r15, r15
    st      r15, 0xA08(g7)
    mov     0x1F, r15
    stib    r15, 0x60C(g7)
    ld      0xA08(g7), r12
    and     0xF, r12, r11
    ld      flt_16B1C[r11*8], r4
    lda     0x3F0E353F, r3
    ld      0xA08(g7), r15
    bbc     0x12, r15, loc_146BC
    mulr    r3, r4, r4
loc_146BC:                              # CODE XREF: ACT_RC_JUMP+8F4↑j
    ldis    word_16B20[r11*8], r5
    bbc     2, r12, loc_146D8
    ld      0xA08(g7), r15
    setbit  0xD, r15, r15
    st      r15, 0xA08(g7)
    b       loc_146F8
# ---------------------------------------------------------------------------
loc_146D8:                              # CODE XREF: ACT_RC_JUMP+904↑j
    bbc     3, r12, loc_146EC
    ld      0xA08(g7), r15
    setbit  0xD, r15, r15
    st      r15, 0xA08(g7)
    b       loc_146F8
# ---------------------------------------------------------------------------
loc_146EC:                              # CODE XREF: ACT_RC_JUMP:loc_146D8↑j
    ld      0xA08(g7), r15
    setbit  0xE, r15, r15
    st      r15, 0xA08(g7)
loc_146F8:                              # CODE XREF: ACT_RC_JUMP+914↑j
    ldos    (byte_30+0x16)(g6), r3
    stos    r3, 0x852(g7)
    bbs     0x13, r12, loc_1474C
loc_14708:                              # CODE XREF: ACT_RC_JUMP+8A4↑j
    ld      0xA10(g7), r3
    notbit  0x1F, r3, r3
    mulr    r3, r4, r3
    st      r3, 0x2C(g7)
    ld      0xA18(g7), r3
    notbit  0x1F, r3, r3
    mulr    r3, r4, r3
    st      r3, 0x34(g7)
    cmpibg  0, r5, loc_1473C
    mov     r5, g0
    call    sub_16A4C
    cmpobne 0, g1, loc_14774
    b       loc_148E0
# ---------------------------------------------------------------------------
loc_1473C:                              # CODE XREF: ACT_RC_JUMP+968↑j
    lda     0xBCF5C28F, r8
    st      r8, 0x30(g7)
    b       loc_148E0
# ---------------------------------------------------------------------------
loc_1474C:                              # CODE XREF: ACT_RC_JUMP+944↑j
    ld      0xA08(g7), r15
    setbit  0x16, r15, r15
    st      r15, 0xA08(g7)
    cmpibg  0, r5, loc_14708
    mov     r5, g0
    call    sub_16A4C
    cmpobe  0, g1, loc_14790
    ld      0xA08(g7), r15
    clrbit  0x16, r15, r15
    st      r15, 0xA08(g7)
loc_14774:                              # CODE XREF: ACT_RC_JUMP+974↑j
    mov     0, r3
    st      r3, 0x2C(g7)
    st      r3, 0x34(g7)
    lda     0x3CF5C28F, r8
    st      r8, 0x30(g7)
    b       loc_148E0
# ---------------------------------------------------------------------------
loc_14790:                              # CODE XREF: ACT_RC_JUMP+8A8↑j
    ld      0xA08(g7), r15
    bbs     0x18, r15, loc_148E0
    ld      mod_fa_coli, r3
    ld      0x164(r3), r14
    cmpobe  0, r14, loc_147B8
    ld      0xA08(g7), r15
    setbit  0x18, r15, r15
    st      r15, 0xA08(g7)
    b       loc_148E0
# ---------------------------------------------------------------------------
loc_147B8:                              # CODE XREF: ACT_RC_JUMP+9E4↑j
    ld      0x1F4(g7), r5
    ld      0x1FC(g7), r6
    ld      0x1F4(g8), r7
    ld      0x1FC(g8), r8
    subr    r5, r7, r3
    subr    r6, r8, r4
    or      r3, r4, r5
    clrbit  0x1F, r5, r5
    cmpobne 0, r5, loc_147EC
    lda     system_address_table_ptr, r3
    lda     0x3F800000, r4
loc_147EC:                              # CODE XREF: ACT_RC_JUMP+A18↑j
    lda     0x2D005A5A, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    ld      (g11)[g12*1], r4
    ldos    0x5BC(g7), r6
    cmpobne 0, r6, loc_14814
    mov     1, r6
loc_14814:                              # CODE XREF: ACT_RC_JUMP+A4C↑j
    lda     0xB801717, r15
    st      r15, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    ld      (g11)[g12*1], r6
    ld      0x5F4(g7), r7
    ld      stage_x, r11
    cmpr    r7, r11
    bl      loc_14840
    mov     r11, r7
loc_14840:                              # CODE XREF: ACT_RC_JUMP+A78↑j
    lda     0x3F333333, r11
    subr    r11, r7, r7
    bbc     0x1F, r7, loc_14854
    mov     0, r7
loc_14854:                              # CODE XREF: ACT_RC_JUMP+A8C↑j
    mulr    r7, r3, r3
    mulr    r7, r4, r4
    divr    r6, r3, r3
    divr    r6, r4, r4
    st      r3, 0x2C(g7)
    st      r4, 0x34(g7)
    b       loc_148E0
# ---------------------------------------------------------------------------
loc_14870:                              # CODE XREF: ACT_RC_JUMP+388↑j
    ld      0x19C(g7), r15
    bbs     0x12, r15, loc_14884
    mov     1, g0
    call    stage_contact_sound
    b       loc_1488C
# ---------------------------------------------------------------------------
loc_14884:                              # CODE XREF: ACT_RC_JUMP+AB4↑j
    mov     2, g0
    call    stage_contact_sound
loc_1488C:                              # CODE XREF: ACT_RC_JUMP+AC0↑j
    ld      0xA08(g7), r15
    bbs     0x1D, r15, loc_148A8
    mov     0, r3
    st      r3, 0x2C(g7)
    st      r3, 0x30(g7)
    st      r3, 0x34(g7)
    b       loc_148C0
# ---------------------------------------------------------------------------
loc_148A8:                              # CODE XREF: ACT_RC_JUMP+AD0↑j
    ldt     0x2C(g7), r4
    lda     0x3F4CCCCD, r7
    mulr    r7, r4, r4
    mulr    r7, r6, r6
    stt     r4, 0x2C(g7)
loc_148C0:                              # CODE XREF: ACT_RC_JUMP+AE4↑j
    mov     0, r15
    st      r15, 0x19C(g7)
    ldos    0x1AA(g7), r13
    ldos    0x80C(g7), r14
    cmpibg  r13, r14, loc_148E0
    ld      0x1A4(g7), r15
    setbit  0, r15, r15
    st      r15, 0x1A4(g7)
loc_148E0:                              # CODE XREF: ACT_RC_JUMP+24↑j
    ret
# End of function ACT_RC_JUMP
# ---------------------------------------------------------------------------
    .float 1.0              # unreachable code
    .float 0.0
    .float -1.0
    .float 0.0
    .float 0.0
    .float 1.0
    .float 0.0
    .float -1.0
    .float 0.0
    .float 1.0
    .float 0.0
    .float 1.0
    .float 1.0
    .float 0.0
    .float 1.0
    .float 0.0

    .section data
# ---------------------------------------------------------------------------
flt_16B1C:
    .float 1.0              # DATA XREF: ACT_RC_JUMP+890↑r
word_16B20:
    .short 0                # DATA XREF: ACT_RC_JUMP+898↑r
    .short 0
    .float 1.3
    .short 0
    .short 0
    .float 0.2
    .short 0
    .short 0
    .float 0.0
    .short 0
    .short 0
    .float 1.0
    .short 0xA
    .short 0
    .float 1.3
    .short 0xA
    .short 0
    .float 0.2
    .short 0xA
    .short 0
    .float 0.0
    .short 0
    .short 0
    .float 1.0
    .short 0xFFFF
    .short 0
    .float 1.3
    .short 0xFFFF
    .short 0
    .float 0.2
    .short 0xFFFF
    .short 0
    .float 0.0
    .short 0
    .short 0
    .float 0.0
    .short 0
    .short 0
    .float 0.0
    .short 0
    .short 0
    .float 0.0
    .short 0
    .short 0
    .float 0.0
    .short 0
    .short 0

        .section act_rc_jump_float
flt_1D290:      .float 0.69999999       # DATA XREF: sub_16A4C+74↑r
