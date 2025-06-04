        .section action
# =============== S U B R O U T I N E =======================================
ACT_15C48:                              # DATA XREF: ROM:0001D158↓o
    ldob    0x1B2(g7), r3
    cmpibe  0, r3, loc_15C5C
    cmpibe  1, r3, loc_15C98
    cmpibe  2, r3, loc_15D04
    cmpibe  3, r3, loc_15DE4
loc_15C5C:                              # CODE XREF: ACT_15C48+4↑j
    ldos    0x19C(g7), g0
    shlo    0xE, 1, r13
    addi    r13, g0, g0
    call    comp_set_motion
    ld      0x0(g7), r15
    setbit  4, r15, r15
    st      r15, 0x0(g7)
    mov     0, r3
    st      r3, 0x2C(g7)
    st      r3, 0x30(g7)
    st      r3, 0x34(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_15C98:                              # CODE XREF: ACT_15C48+8↑j
    ldos    0x1AA(g7), r13
    ldos    0x872(g7), r14
    cmpobge r13, r14, loc_15CEC
    ld      0x1A4(g8), r15
    bbs     0x12, r15, loc_15DF8
    ld      0x0(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g7)
    shlo    0x18, 1, r15
    st      r15, 0x198(g7)
    ld      0x1A4(g7), r15
    clrbit  6, r15, r15
    st      r15, 0x1A4(g7)
    ld      0x804(g7), r15
    bbc     0x14, r15, loc_15DF8
    ld      0x1A4(g7), r15
    setbit  6, r15, r15
    st      r15, 0x1A4(g7)
    shlo    0xF, 1, r15
    stis    r15, 0x812(g7)
    b       loc_15DF8
# ---------------------------------------------------------------------------
loc_15CEC:                              # CODE XREF: ACT_15C48+58↑j
    ld      0x0(g7), r15
    clrbit  3, r15, r15
    st      r15, 0x0(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_15D04:                              # CODE XREF: ACT_15C48+C↑j
    ld      0x0(g7), r15
    bbc     2, r15, loc_15D18
    ldis    0x872(g7), r15
    stis    r15, 0x1AA(g7)
    ret
# ---------------------------------------------------------------------------
loc_15D18:                              # CODE XREF: ACT_15C48+C0↑j
    ld      0x1A4(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x1A4(g7)
    ldob    0x822(g7), g0
    mov     g0, r4
    ldob    0xA28(g7), r5
    bbc     0, r5, loc_15D3C
    ldos    0x5DE(g7), r3
    addo    r3, r4, r4
loc_15D3C:                              # CODE XREF: ACT_15C48+E8↑j
    stos    r4, 0x5DE(g7)
    cmpobne 0, g0, loc_15D64
    ld      0x1A4(g7), r15
    bbs     0xE, r15, loc_15D68
    ld      0x0(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g7)
    mov     0, r15
    st      r15, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_15D64:                              # CODE XREF: ACT_15C48+F8↑j
    call    damage_calculation # g7 = damage reciever
loc_15D68:                              # CODE XREF: ACT_15C48+100↑j
    ld      fa_camera, r3
    lda     0x3E19999A, r15
    st      r15, 0xFC(r3)
    ld      0x1A4(g7), r15
    bbs     0xE, r15, loc_15DD8
    ldos    0x1AC(g7), r14
    cmpobne 0, r14, loc_15DC0
    mov     3, r3
    mov     r3, g0
    call    search_shift_data_adr
    cmpobe  0, g0, loc_15DB0
    stob    r3, 0x60C(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_15DB0:                              # CODE XREF: ACT_15C48+150↑j
    lda     0x80000E1, r15
    st      r15, 0x198(g7)
    ret
# ---------------------------------------------------------------------------
loc_15DC0:                              # CODE XREF: ACT_15C48+140↑j
    ld      0x0(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g7)
    mov     0, r15
    st      r15, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_15DD8:                              # CODE XREF: ACT_15C48+138↑j
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_15DE4:                              # CODE XREF: ACT_15C48+10↑j
    ldos    0x1AA(g7), r13
    ldos    0x800(g7), r14
    cmpobl  r13, r14, loc_15DF8
    shlo    0x18, 9, r15
    st      r15, 0x198(g7)
loc_15DF8:                              # CODE XREF: ACT_15C48+60↑j
    ret
# End of function ACT_15C48
