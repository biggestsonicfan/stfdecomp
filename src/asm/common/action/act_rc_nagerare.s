        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_NAGERARE:                        # CODE XREF: j_ACT_RC_NAGERARE↓j
    ldob    0x1B2(g7), r3   # Label from official source
    cmpibe  0, r3, loc_15308
    cmpibe  1, r3, loc_1533C
    cmpibe  2, r3, loc_1536C
    cmpibe  3, r3, loc_1543C
loc_15308:                              # CODE XREF: ACT_RC_NAGERARE+4↑j
    ldos    0x19C(g7), g0
    call    comp_set_motion
    ld      0x0(g7), r15
    setbit  4, r15, r15
    st      r15, 0x0(g7)
loc_1531C:                              # CODE XREF: ACT_16120+38↓j
    mov     0, r3
    st      r3, 0x2C(g7)
    st      r3, 0x30(g7)
    st      r3, 0x34(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_1533C:                              # CODE XREF: ACT_RC_NAGERARE+8↑j
    ldos    0x1AA(g7), r13
    ldos    0x872(g7), r14
    cmpobge r13, r14, loc_15354
    ld      0x1A4(g8), r15
    bbs     0x12, r15, loc_15484
    b       loc_15484
# ---------------------------------------------------------------------------
loc_15354:                              # CODE XREF: ACT_RC_NAGERARE+50↑j
    ld      0x0(g7), r15
    clrbit  3, r15, r15
    st      r15, 0x0(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_1536C:                              # CODE XREF: ACT_RC_NAGERARE+C↑j
    ld      0x0(g7), r15
    bbc     2, r15, loc_15380
    ldis    0x872(g7), r15
    stis    r15, 0x1AA(g7)
    ret
# ---------------------------------------------------------------------------
loc_15380:                              # CODE XREF: ACT_RC_NAGERARE+7C↑j
    ld      0x1A4(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x1A4(g7)
    ldob    0x822(g7), g0
    mov     g0, r4
    ldob    0xA28(g7), r5
    bbc     0, r5, loc_153A4
    ldos    0x5DE(g7), r3
    addo    r3, r4, r4
loc_153A4:                              # CODE XREF: ACT_RC_NAGERARE+A4↑j
    stos    r4, 0x5DE(g7)
    cmpobne 0, g0, loc_153BC
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_153BC:                              # CODE XREF: ACT_RC_NAGERARE+B4↑j
    call    damage_calculation # g7 = damage reciever
    ld      fa_camera, r3
    lda     0x3E19999A, r15
    st      r15, 0xFC(r3)
    ld      0x1A4(g7), r15
    bbs     0xE, r15, loc_15430
    ldos    0x1AC(g7), r14
    cmpobne 0, r14, loc_15418
    mov     3, r3
    mov     r3, g0
    call    search_shift_data_adr
    cmpobe  0, g0, loc_15408
    stob    r3, 0x60C(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_15408:                              # CODE XREF: ACT_RC_NAGERARE+FC↑j
    lda     0x80000E1, r15
    st      r15, 0x198(g7)
    ret
# ---------------------------------------------------------------------------
loc_15418:                              # CODE XREF: ACT_RC_NAGERARE+EC↑j
    ld      0x0(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g7)
    mov     0, r15
    st      r15, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_15430:                              # CODE XREF: ACT_RC_NAGERARE+E4↑j
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_1543C:                              # CODE XREF: ACT_RC_NAGERARE+10↑j
    ldos    0x1AA(g7), r13
    ldos    0x800(g7), r14
    cmpobl  r13, r14, loc_15484
    ld      0x1A4(g7), r15
    bbs     0xE, r15, loc_1547C
    ldos    0x802(g7), r14
    cmpobne 0, r14, loc_15464
    ld      0x1A4(g7), r15
    clrbit  0, r15, r15
    st      r15, 0x1A4(g7)
loc_15464:                              # CODE XREF: ACT_RC_NAGERARE+160↑j
    ld      0x0(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g7)
    mov     0, r15
    st      r15, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_1547C:                              # CODE XREF: ACT_RC_NAGERARE+158↑j
    shlo    0x18, 9, r15
    st      r15, 0x198(g7)
loc_15484:                              # CODE XREF: ACT_RC_NAGERARE+58↑j
    ret
# End of function ACT_RC_NAGERARE

        .section jump
# =============== S U B R O U T I N E =======================================
# Attributes: thunk
j_ACT_RC_NAGERARE:                      # DATA XREF: ROM:0001D178↓o
    b       ACT_RC_NAGERARE
# End of function j_ACT_RC_NAGERARE
