        .section action
# =============== S U B R O U T I N E =======================================
ACT_134A8:                              # DATA XREF: ROM:0001D1A4↓o
    lda     0x3F800000, r3
    bbs     0x10, r11, loc_134C4
    lda     0xBF800000, r3
    bbs     0x11, r11, loc_134C4
    mov     0, r3
loc_134C4:                              # CODE XREF: ACT_134A8+8↑j
    st      r3, 0x5C4(g7)
    ld      0x190(g7), r3
    ld      0x20(r3), r3
    ldob    0x0(r3), r3
    stob    r3, 0x5BE(g7)
    lda     0xFFFF, r13
    and     r13, r11, g0
    call    set_motion
    ld      0x1A4(g7), r15
    setbit  0, r15, r15
    st      r15, 0x1A4(g7)
    lda     0xFFFF0000, r13
    and     r13, r11, r11
    mov     0, r15
    stib    r15, 0x1B2(g7)
    st      r11, 0x19C(g7)
    ret
# End of function ACT_134A8
