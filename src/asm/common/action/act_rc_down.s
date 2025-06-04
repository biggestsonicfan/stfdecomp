        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_DOWN:                            # DATA XREF: ROM:0001D090↓o
    ldob    0x1B2(g7), r3   # Label from official source
    cmpibe  0, r3, loc_14BA8
    cmpibe  1, r3, loc_14BE8
    cmpibe  2, r3, loc_14C1C
    cmpibe  3, r3, loc_14C3C
    cmpibe  4, r3, loc_14CC8
loc_14BA8:                              # CODE XREF: ACT_RC_DOWN+4↑j
    ld      0x0(g7), r14
    setbit  4, r14, r15
    st      r15, 0x0(g7)
    mov     0, r3
    st      r3, 0x2C(g7)
    st      r3, 0x30(g7)
    st      r3, 0x34(g7)
    ldos    0x19C(g7), g0
    ldob    0x19E(g7), r14
    cmpobe  1, r14, loc_14C84
    call    comp_set_motion
    ldob    0x19E(g7), r14
    cmpobe  2, r14, loc_14CC0
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_14BE8:                              # CODE XREF: ACT_RC_DOWN+8↑j
    ldos    0x1AA(g7), r13
    ldos    0x80E(g7), r14
    cmpobl  r13, r14, loc_14CE4
    ld      0x5E0(g7), r15
    st      r15, 0x2C(g7)
    ld      0x5E4(g7), r15
    st      r15, 0x30(g7)
    ld      0x5E8(g7), r15
    st      r15, 0x34(g7)
    call    fix_hara
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_14C1C:                              # CODE XREF: ACT_RC_DOWN+C↑j
    ld      0x0(g7), r15
    bbs     2, r15, loc_14CE4
    ldis    0x818(g7), r15
    stis    r15, 0x1AA(g7)
    call    sub_32948
    b       loc_14C48
# ---------------------------------------------------------------------------
    mov     3, r15
    stib    r15, 0x1B2(g7)
loc_14C3C:                              # CODE XREF: ACT_RC_DOWN+10↑j
    ldos    0x1AA(g7), r13
    ldos    0x818(g7), r14
    cmpobl  r13, r14, loc_14CE4
loc_14C48:                              # CODE XREF: ACT_RC_DOWN+A0↑j
    mov     0, g0
    call    stage_contact_sound
    mov     0, r15
    stib    r15, 0x6F5(g7)
    lda     0xC2C80000, r12
    ld      0x1C(g7), r11
    cmpr    r11, r12
    bg      loc_14CC0
    ld      fa_camera, r3
    lda     0x3E19999A, r15
    st      r15, 0xFC(r3)
    b       loc_14CC0
# ---------------------------------------------------------------------------
loc_14C84:                              # CODE XREF: ACT_RC_DOWN+3C↑j
    ld      0x1A4(g7), r15
    clrbit  6, r15, r15
    st      r15, 0x1A4(g7)
    ldis    0x616(g7), r4
    lda     0x520, r5
    ld      0x0(g7), r15
    bbc     6, r15, loc_14CA8
    lda     0xFFFFFAE0, r5
loc_14CA8:                              # CODE XREF: ACT_RC_DOWN+10C↑j
    subi    r5, r4, r4
    ld      0x1A4(g7), r15
    bbc     0xB, r15, loc_14CB8
    notbit  0xF, r4, r4
loc_14CB8:                              # CODE XREF: ACT_RC_DOWN+120↑j
    stis    r4, 0x26(g7)
    call    comp_set_motion
loc_14CC0:                              # CODE XREF: ACT_RC_DOWN+48↑j
    mov     4, r15
    stib    r15, 0x1B2(g7)
loc_14CC8:                              # CODE XREF: ACT_RC_DOWN+14↑j
    ldos    0x1AA(g7), r13
    ldos    0x800(g7), r14
    cmpobl  r13, r14, loc_14CE4
    ld      0x1A4(g7), r15
    bbs     0xF, r15, loc_14CE8
    shlo    0x18, 9, r15
    st      r15, 0x198(g7)
loc_14CE4:                              # CODE XREF: ACT_RC_DOWN+60↑j
    ret
# ---------------------------------------------------------------------------
loc_14CE8:                              # CODE XREF: ACT_RC_DOWN+148↑j
    ld      0x0(g7), r14
    clrbit  4, r14, r15
    st      r15, 0x0(g7)
    mov     0, r15
    st      r15, 0x19C(g7)
    ret
# End of function ACT_RC_DOWN
