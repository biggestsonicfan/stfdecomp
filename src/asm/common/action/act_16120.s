        .section action
# =============== S U B R O U T I N E =======================================
ACT_16120:                              # DATA XREF: ROM:0001D0E8↓o
    ld      0x1A4(g7), r15
    clrbit  8, r15, r15
    st      r15, 0x1A4(g7)
    ldos    0x1AA(g7), r13
    ldos    0x808(g7), r14
    cmpobl  r13, r14, loc_16164
    ld      0x5F4(g7), r13
    ld      0x824(g7), r14
    cmpibg  r13, r14, loc_1615C
    ldos    0x19C(g7), g0
    shlo    0x18, 0xD, r13
    addi    r13, g0, r15
    st      r15, 0x19C(g7)
    call    set_motion
    b       loc_1531C
# ---------------------------------------------------------------------------
loc_1615C:                              # CODE XREF: ACT_16120+20↑j
    mov     0, r15
    st      r15, 0x19C(g7)
loc_16164:                              # CODE XREF: ACT_16120+14↑j
    ret
# End of function ACT_16120
