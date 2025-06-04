        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_KABEHIT:                         # DATA XREF: ROM:0001D128↓o
    ldob    0x1B2(g7), r3   # Label from Fighting Vipers source
    cmpibe  0, r3, arkh_0
    cmpibe  1, r3, arkh_1
    cmpibe  2, r3, loc_16344
    cmpibe  3, r3, loc_16368
arkh_0:                                 # CODE XREF: ACT_RC_KABEHIT+4↑j
    ldos    0x19C(g7), g0   # Label from Fighting Vipers source
    call    comp_set_motion
    ld      0x0(g7), r15
    setbit  4, r15, r15
    st      r15, 0x0(g7)
    ldob    0x7D2(g8), r14
    bbc     0, r14, loc_161DC
    xor     r3, r3, r3
    st      r3, 0x2C(g7)
    st      r3, 0x34(g7)
    lda     0x3D4CCCCD, r3
    st      r3, 0x30(g7)
    ldob    0x7D2(g8), r14
    bbs     1, r14, loc_1622C
    ldob    0x7D2(g8), r14
    bbs     3, r14, loc_1622C
    ldob    0x7D2(g8), r14
    clrbit  2, r14, r15
    stob    r15, 0x7D2(g8)
    ldob    0x7D2(g8), r14
    setbit  3, r14, r15
    stob    r15, 0x7D2(g8)
    b       loc_1622C
# ---------------------------------------------------------------------------
loc_161DC:                              # CODE XREF: ACT_RC_KABEHIT+2C↑j
    ld      0x2C(g7), r3
    lda     0x3E800000, r13
    mulr    r13, r3, r3
    notbit  0x1F, r3, r3
    st      r3, 0x2C(g7)
    ld      0x34(g7), r3
    lda     0x3E800000, r13
    mulr    r13, r3, r3
    notbit  0x1F, r3, r3
    st      r3, 0x34(g7)
    lda     0x3F000000, r15
    st      r15, 0x30(g7)
    ldob    0x6F5(g7), r3
    cmpobge 0, r3, loc_1622C
    lda     0x3DCCCCCD, r15
    st      r15, 0x30(g7)
loc_1622C:                              # CODE XREF: ACT_RC_KABEHIT+4C↑j
    call    fix_hara
    ld      fa_camera, r3
    lda     0x3E19999A, r15
    st      r15, 0xFC(r3)
    ldt     0x1A00(g7), r4
    stt     r4, 0x1A0C(g7)
    lda     0x42700000, r7
    lda     0xC1A00000, r10
    lda     0x41A00000, r11
    ld      0x5D8(g7), r8
    subr    r7, r8, r9
    cmpr    r10, r9
    bl      loc_16284
    mov     r10, r9
    b       loc_16290
# ---------------------------------------------------------------------------
loc_16284:                              # CODE XREF: ACT_RC_KABEHIT+110↑j
    cmpr    r11, r9
    bg      loc_16290
    mov     r11, r9
loc_16290:                              # CODE XREF: ACT_RC_KABEHIT+118↑j
    divr    r7, r9, r7
    lda     0x41100000, r3
    mulr    r3, r7, r7
    lda     0xC001818, r15
    st      r15, (g11)[g12*1]
    st      r7, (g11)[g12*1]
    ld      (g11)[g12*1], r7
    mov     7, r8
    addo    r8, r7, r7
    and     0xF, r7, r7
    stos    r7, 0xA0E(g7)
    ldob    0x7D2(g8), r14
    bbc     0, r14, loc_162D4
    mov     0x1E, r15
    stis    r15, 0xA0E(g7)
loc_162D4:                              # CODE XREF: ACT_RC_KABEHIT+160↑j
    ld      0x2C(g7), r15
    st      r15, 0xA10(g7)
    ld      0x30(g7), r15
    st      r15, 0xA14(g7)
    ld      0x34(g7), r15
    st      r15, 0xA18(g7)
    movt    0, r4
    stt     r4, 0x2C(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
arkh_1:                                 # CODE XREF: ACT_RC_KABEHIT+8↑j
    ldt     0x1A0C(g7), r4  # Label from Fighting Vipers source
    stt     r4, 0x18(g7)
    ldos    0xA0E(g7), r14
    cmpobne 0, r14, loc_1639C
    ld      0xA10(g7), r15
    st      r15, 0x2C(g7)
    ld      0xA14(g7), r15
    st      r15, 0x30(g7)
    ld      0xA18(g7), r15
    st      r15, 0x34(g7)
    movt    0, r4
    stt     r4, 0xA10(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_16344:                              # CODE XREF: ACT_RC_KABEHIT+C↑j
    ldos    0x1AA(g7), r13
    ldos    0x818(g7), r14
    cmpobl  r13, r14, loc_1639C
    call    sub_32948
    mov     0, g0
    call    stage_contact_sound
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_16368:                              # CODE XREF: ACT_RC_KABEHIT+10↑j
    ldos    0x1AA(g7), r13
    ldos    0x80C(g7), r14
    cmpobl  r13, r14, loc_1639C
    ld      0x804(g7), r15
    bbs     0xE, r15, loc_16394
    shlo    0x18, 1, r15
    st      r15, 0x198(g7)
    ld      0x0(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g7)
    b       loc_1639C
# ---------------------------------------------------------------------------
loc_16394:                              # CODE XREF: ACT_RC_KABEHIT+210↑j
    shlo    0x18, 9, r15
    st      r15, 0x198(g7)
loc_1639C:                              # CODE XREF: ACT_RC_KABEHIT+1AC↑j
    ret
# End of function ACT_RC_KABEHIT
