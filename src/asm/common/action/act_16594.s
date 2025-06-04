
        .section action
# =============== S U B R O U T I N E =======================================
ACT_16594:                              # DATA XREF: ROM:0001D120↓o
    ldob    0x1B2(g7), r3
    cmpibe  0, r3, loc_165A0
    cmpibe  1, r3, loc_165B8
loc_165A0:                              # CODE XREF: ACT_16594+4↑j
    ldos    (check_word4+2)(g6), g0
    call    set_motion
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_165B8:                              # CODE XREF: ACT_16594+8↑j
    ldos    0x1AA(g7), r13
    ldos    0x800(g7), r14
    cmpobl  r13, r14, loc_165CC
    shlo    0x1A, 1, r15
    st      r15, 0x19C(g7)
loc_165CC:                              # CODE XREF: ACT_16594+2C↑j
    ret
# End of function ACT_16594
# =============== S U B R O U T I N E =======================================
ACT_165D0:                              # DATA XREF: ROM:0001D138↓o
    ret
# End of function ACT_165D0
