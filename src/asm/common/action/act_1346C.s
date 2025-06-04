            .section action
# =============== S U B R O U T I N E =======================================
ACT_1346C:                              # DATA XREF: ROM:0001D19C↓o
    ldos    0x194(g7), g0
    cmpobe  0, g0, loc_1348C
    ld      0xA08(g7), r15
    bbs     0xA, r15, loc_134A0
    call    set_motion
    lda     0xFFFF0000, r13
    and     r13, r11, r11
loc_1348C:                              # CODE XREF: ACT_1346C+4↑j
    ld      0xA08(g7), r15
    setbit  0xA, r15, r15
    st      r15, 0xA08(g7)
    mov     0, r15
    stib    r15, 0x1B2(g7)
loc_134A0:                              # CODE XREF: ACT_1346C+C↑j
    st      r11, 0x19C(g7)
    ret
# End of function ACT_1346C
