        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_GUARD:                           # DATA XREF: ROM:0001D0A0↓o
    ld      flt_1CFE0, r13  # Label from official source
    ld      0x5D4(g7), r14
    addr    r13, r14, r15
    st      r15, 0x5D4(g7)
    ldis    0x5DE(g7), r5
    subi    1, r5, r5
    stis    r5, 0x5DE(g7)
    ldob    0x19E(g7), r14
    cmpobne 1, r14, loc_13970
    call    sub_1CED4
loc_13970:                              # CODE XREF: ACT_RC_GUARD+24↑j
    ldob    0x1B2(g7), r3
    cmpobe  0, r3, loc_13984
    cmpobe  1, r3, loc_13A48
    cmpobe  2, r3, loc_13A64
    cmpobe  3, r3, loc_13A90
loc_13984:                              # CODE XREF: ACT_RC_GUARD+30↑j
    ld      0x0(g7), r15
    setbit  4, r15, r15
    st      r15, 0x0(g7)
    ld      0x5E0(g7), r13
    ld      flt_1CFE4, r14
    mulr    r13, r14, r15
    st      r15, 0x2C(g7)
    ld      0x5E8(g7), r13
    ld      flt_1CFE4, r14
    mulr    r13, r14, r15
    st      r15, 0x34(g7)
    ld      0x5E0(g7), r13
    ld      flt_1CFE8, r14
    mulr    r13, r14, r15
    st      r15, 0x5C8(g7)
    ld      0x5E8(g7), r13
    ld      flt_1CFE8, r14
    mulr    r13, r14, r15
    st      r15, 0x5D0(g7)
    ldos    0x19C(g7), g0
    cmpobne 0, g0, loc_139F0
    ldos    (dword_8+2)(g6), g0
loc_139F0:                              # CODE XREF: ACT_RC_GUARD+A0↑j
    call    set_motion
    ld      0x1A4(g7), r15
    setbit  0, r15, r15
    st      r15, 0x1A4(g7)
    ldob    0xA00(g7), r14
    cmpobne 0, r14, loc_13A24
    mov     1, r3
    stos    r3, 0x808(g7)
    addo    1, r3, r3
    stos    r3, 0x80A(g7)
    addo    1, r3, r3
    stos    r3, 0x80C(g7)
    b       loc_13A3C
# ---------------------------------------------------------------------------
loc_13A24:                              # CODE XREF: ACT_RC_GUARD+C0↑j
    ldos    0x80C(g7), r3
    ldos    0x800(g7), r4
    cmpoble r3, r4, loc_13A34
    stos    r4, 0x80C(g7)
loc_13A34:                              # CODE XREF: ACT_RC_GUARD+E8↑j
    ldos    0x808(g7), r3
    stos    r3, 0x1AA(g7)
loc_13A3C:                              # CODE XREF: ACT_RC_GUARD+DC↑j
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_13A48:                              # CODE XREF: ACT_RC_GUARD+34↑j
    ldos    0x80A(g7), r14
    subi    1, r14, r3
    ldos    0x1AA(g7), r13
    cmpobl  r13, r3, loc_13AE4
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_13A64:                              # CODE XREF: ACT_RC_GUARD+38↑j
    ldos    0x80C(g7), r13
    subi    r13, r5, r4
    ldos    0x80A(g7), r3
    subi    1, r3, r3
    addi    r3, r4, r4
    cmpibg  0, r4, loc_13A84
    stos    r3, 0x1AA(g7)
    b       loc_13AB4
# ---------------------------------------------------------------------------
loc_13A84:                              # CODE XREF: ACT_RC_GUARD+134↑j
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_13A90:                              # CODE XREF: ACT_RC_GUARD+3C↑j
    cmpibl  0, r5, loc_13AB4
    mov     0, r15
    st      r15, 0x19C(g7)
    ld      0x1A4(g7), r15
    clrbit  0, r15, r15
    st      r15, 0x1A4(g7)
    ld      0x0(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g7)
loc_13AB4:                              # CODE XREF: ACT_RC_GUARD+13C↑j
    ldos    0x6D0(g8), r10
    ldos    0x6D8(g7), r13
    cmpobe  r13, r10, loc_13AE4
    ld      0x6D4(g8), r3
    bbs     0, r3, loc_13ACC
    bbc     1, r3, loc_13AE4
loc_13ACC:                              # CODE XREF: ACT_RC_GUARD+180↑j
    call    sub_1CED4
    cmpobe  0, g0, loc_13AE4
    mov     1, r15
    stib    r15, 0x19E(g7)
    mov     3, r15
    stib    r15, 0x1B2(g7)
loc_13AE4:                              # CODE XREF: ACT_RC_GUARD+110↑j
    ret
# End of function ACT_RC_GUARD

.section unknown0
# =============== S U B R O U T I N E =======================================
sub_1CED4:                              # CODE XREF: ROM:0001396C↑p
        ldos    0x6D0(g8), r10
        ld      0x1A4(g7), r15
        bbc     0xD, r15, loc_1CEE8
        ldos    0x6D8(g7), r13
        cmpobe  r13, r10, loc_1CF84
loc_1CEE8:                              # CODE XREF: sub_1CED4+8↑j
        ld      0x5B8(g7), r15
        bbs     0, r15, loc_1CFA8
        mov     0, g0
        mov     g8, r15
        mov     g7, g8
        mov     r15, g7
        ldib    0x83E(g7), r15
        stib    r15, 0x50FE03
        ldib    0x843(g7), r15
        stib    r15, 0x50FE02
        ldis    0x828(g7), r15
        stis    r15, 0x50FE00
        call    sub_2B94C
        mov     g8, r15
        mov     g7, g8
        mov     r15, g7
        cmpobe  0, g0, loc_1CFA8
        ldob    4(g8), r13
        ldos    0x1AA(g8), r14
        addi    r13, r14, r3
        ldos    0x808(g8), r14
        subi    r3, r14, r3
        mov     2, g1
        mov     g0, r11
        call    calc_mht_adr
        ldob    1(g0), r4
        ldob    2(g0), r15
        shlo    8, r15, r15
        addo    r15, r4, r4
        subo    1, r4, r4
        cmpobl  r4, r3, loc_1CFA8
        mov     r11, g0
        call    set_motion
        stos    r10, 0x6D8(g7)
        mov     1, g0
        ret
# ---------------------------------------------------------------------------
loc_1CF84:                              # CODE XREF: sub_1CED4+10↑j
        ldos    0x808(g7), r3
        cmpobe  0, r3, loc_1CF90
        subo    1, r3, r3
loc_1CF90:                              # CODE XREF: sub_1CED4+B4↑j
        ldos    0x1AA(g7), r4
        cmpible r4, r3, loc_1CF9C
        mov     r3, r4
loc_1CF9C:                              # CODE XREF: sub_1CED4+C0↑j
        stos    r4, 0x1AA(g7)
        mov     1, g0
        ret
# ---------------------------------------------------------------------------
loc_1CFA8:                              # CODE XREF: sub_1CED4+18↑j
        mov     0, g0
        ret
# End of function sub_1CED4

    .section act_rc_guard_floats
flt_1CFE0:      .float 1.0              # DATA XREF: ROM:ACT_RC_GUARD↑r
flt_1CFE4:      .float 1.0              # DATA XREF: ROM:00013994↑r
flt_1CFE8:      .float 5.0              # DATA XREF: ROM:000139BC↑r
