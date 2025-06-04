        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_DOWN_NAGE_TOUCH:                 # DATA XREF: ROM:0001D190↓o
    ld      0x0(g8), r15    # Label from official source
    bbs     0x1D, r15, loc_150D0
    ld      0x720(g7), r15
    bbc     6, r15, loc_1502C
    ld      0x19C(g7), r15
    bbs     0x11, r15, loc_15040
    b       loc_150D0
# ---------------------------------------------------------------------------
loc_1502C:                              # CODE XREF: ACT_RC_DOWN_NAGE_TOUCH+C↑j
    ld      0x720(g7), r15
    bbc     7, r15, loc_150D0
    ld      0x19C(g7), r15
    bbs     0x10, r15, loc_15040
    b       loc_150D0
# ---------------------------------------------------------------------------
loc_15040:                              # CODE XREF: ACT_RC_DOWN_NAGE_TOUCH+14↑j
    ld      0x1A4(g7), r15
    bbs     1, r15, loc_150D0
    ld      0x1A4(g7), r15
    bbc     8, r15, loc_150D0
    ld      mod_fa_coli, r3
    ld      0x164(r3), r14
    cmpobe  0, r14, loc_150D0
    ldob    0x820(g7), r11
    ld      dword_CE020[r11*4], r11
loc_1506C:                              # CODE XREF: ACT_RC_DOWN_NAGE_TOUCH+78↓j
    scanbit r11, r10
    bbs     0x1F, r10, loc_150D0
    clrbit  r10, r11, r11
    ldob    4(g7), r15
    cmpobe  1, r15, loc_15090
    ld      0x90F600[r10*4], r13
    cmpobe  0, r13, loc_1506C
    b       loc_150AC
# ---------------------------------------------------------------------------
loc_15090:                              # CODE XREF: ACT_RC_DOWN_NAGE_TOUCH+6C↑j
    mov     0xF, r4
loc_15094:                              # CODE XREF: ACT_RC_DOWN_NAGE_TOUCH+94↓j
    ld      0x90F600[r4*4], r5
    bbs     r10, r5, loc_150AC
    cmpdeci 1, r4, r4
    ble     loc_15094
    b       loc_1506C
# ---------------------------------------------------------------------------
loc_150AC:                              # CODE XREF: ACT_RC_DOWN_NAGE_TOUCH+7C↑j
    ld      0xC64(g7), r3
    cmpobe  0, r3, loc_150D0
    mov     0, r15
    st      r15, 0xC64(g7)
    lda     0xC004000, r13
    addi    r13, r3, r15
    st      r15, 0x194(g7)
    b       loc_150FC
# ---------------------------------------------------------------------------
loc_150D0:                              # CODE XREF: ACT_RC_DOWN_NAGE_TOUCH+4↑j
    ldos    0x1AA(g7), r13
    ldos    0x800(g7), r14
    cmpobl  r13, r14, loc_150FC
    ld      0x0(g7), r14
    clrbit  4, r14, r15
    st      r15, 0x0(g7)
    ld      0x1A4(g7), r15
    clrbit  0, r15, r15
    st      r15, 0x1A4(g7)
    mov     0, r15
    st      r15, 0x19C(g7)
loc_150FC:                              # CODE XREF: ACT_RC_DOWN_NAGE_TOUCH+BC↑j
    ret
# End of function ACT_RC_DOWN_NAGE_TOUCH
