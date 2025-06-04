        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_NAGE_TOUCH:                      # DATA XREF: ROM:0001D198↓o
    ld      0x720(g7), r15  # Label from official source
    bbc     0xC, r15, loc_151E0
    ld      0x19C(g7), r15
    bbs     0x12, r15, loc_15118
    ld      0x1A4(g8), r15
    bbs     0xD, r15, loc_151E0
loc_15118:                              # CODE XREF: ACT_RC_NAGE_TOUCH+C↑j
    ld      0x1A4(g7), r15
    bbs     1, r15, loc_151E0
    ld      0x1A4(g7), r15
    bbc     8, r15, loc_151E0
    ld      0x0(g8), r15
    bbs     5, r15, loc_151E0
    ld      0x0(g8), r15
    bbs     0x1D, r15, loc_151E0
    ld      0x1A4(g8), r15
    bbs     0xE, r15, loc_151E0
    ld      mod_fa_coli, r3
    ld      0x164(r3), r14
    cmpobe  0, r14, loc_151E0
    ldob    0x820(g7), r11
    ld      dword_CE020[r11*4], r11
loc_1515C:                              # CODE XREF: ACT_RC_NAGE_TOUCH+78↓j
    scanbit r11, r10
    bbs     0x1F, r10, loc_151E0
    clrbit  r10, r11, r11
    ldob    4(g7), r15
    cmpobe  1, r15, loc_15180
    ld      0x90F600[r10*4], r13
    cmpobe  0, r13, loc_1515C
    b       loc_1519C
# ---------------------------------------------------------------------------
loc_15180:                              # CODE XREF: ACT_RC_NAGE_TOUCH+6C↑j
    mov     0xF, r4
loc_15184:                              # CODE XREF: ACT_RC_NAGE_TOUCH+94↓j
    ld      0x90F600[r4*4], r5
    bbs     r10, r5, loc_1519C
    cmpdeci 1, r4, r4
    ble     loc_15184
    b       loc_1515C
# ---------------------------------------------------------------------------
loc_1519C:                              # CODE XREF: ACT_RC_NAGE_TOUCH+7C↑j
    addo    0x1F, 0xA, r13
    ldob    0x19F(g8), r14
    cmpobne r13, r14, loc_151BC
    ldos    game_timer, r12
    and     1, r12, r12
    ldob    4(g7), r13
    cmpobne r13, r12, loc_151E0
loc_151BC:                              # CODE XREF: ACT_RC_NAGE_TOUCH+A4↑j
    ld      0xC64(g7), r3
    cmpobe  0, r3, loc_151E0
    mov     0, r15
    st      r15, 0xC64(g7)
    lda     0xC004000, r13
    addi    r13, r3, r15
    st      r15, 0x194(g7)
    b       loc_1520C
# ---------------------------------------------------------------------------
loc_151E0:                              # CODE XREF: ACT_RC_NAGE_TOUCH+4↑j
    ldos    0x1AA(g7), r13
    ldos    0x800(g7), r14
    cmpobl  r13, r14, loc_1520C
    ld      0x0(g7), r14
    clrbit  4, r14, r15
    st      r15, 0x0(g7)
    ld      0x1A4(g7), r15
    clrbit  0, r15, r15
    st      r15, 0x1A4(g7)
    mov     0, r15
    st      r15, 0x19C(g7)
loc_1520C:                              # CODE XREF: ACT_RC_NAGE_TOUCH+DC↑j
    ret
# End of function ACT_RC_NAGE_TOUCH
