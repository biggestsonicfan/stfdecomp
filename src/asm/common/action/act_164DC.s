        .section action
# =============== S U B R O U T I N E =======================================
ACT_164DC:                              # DATA XREF: ROM:0001D0F0↓o
    ld      0x1A4(g7), r15
    clrbit  8, r15, r15
    st      r15, 0x1A4(g7)
    ld      0x1A4(g7), r15
    clrbit  1, r15, r15
    st      r15, 0x1A4(g7)
    ld      0x1A4(g7), r15
    setbit  2, r15, r15
    st      r15, 0x1A4(g7)
    ldib    0x842(g7), r15
    ldis    0x1AA(g7), r3
    cmpi    0, r15
    be      loc_16520
    cmpi    r15, r3
    bge     loc_16540
    mov     0, r15
    stib    r15, 0x842(g7)
loc_16520:                              # CODE XREF: ACT_164DC+30↑j
    subi    2, r3, r3
    stis    r3, 0x1AA(g7)
    cmpibg  2, r3, loc_16544
    ldib    0x841(g7), r13
    cmpibl  r13, r3, loc_16540
    ld      0x1A4(g7), r15
    clrbit  0, r15, r15
    st      r15, 0x1A4(g7)
loc_16540:                              # CODE XREF: ACT_164DC+38↑j
    ret
# ---------------------------------------------------------------------------
loc_16544:                              # CODE XREF: ACT_164DC+4C↑j
    mov     0, g0
    call    set_motion
    mov     0, r15
    st      r15, 0x19C(g7)
    ret
# End of function ACT_164DC
