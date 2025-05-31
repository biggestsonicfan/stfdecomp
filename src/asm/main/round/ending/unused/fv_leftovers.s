        .section leftover1
# ---------------------------------------------------------------------------
    ld      not_scr_bg_move, r15 # FV leftover sub_106C4
    setbit  14, r15, r15
    st      r15, not_scr_bg_move
    mov     0, r15
    stis    r15, 0x100A006
    mov     0, r15
    stis    r15, 0x100A00E
    lda     0x1006000, r8
    b       loc_1055C
# ---------------------------------------------------------------------------
    ld      not_scr_bg_move, r15 # FV leftover sub_106FC
    setbit  14, r15, r15
    st      r15, not_scr_bg_move
    mov     0, r15
    stis    r15, scrB_H_page
    mov     0, r15
    stis    r15, scrB_V_page
    lda     0x1004000, r8
    b       loc_1055C

        .section leftover2
# ---------------------------------------------------------------------------
    mov     0, r15          # FV leftover sub_10754
    stis    r15, 0x100A002
    mov     0, r15
    stis    r15, 0x100A00A
    lda     0x1002000, r8

        .section leftover3
# ---------------------------------------------------------------------------
    lda     0x100D000, r5   # FV leftover sub_107A0
    lda     0xFFFF, r8
    b       loc_105CC
        .section leftover4
# ---------------------------------------------------------------------------
    lda     0x100C000, r5   # FV leftover 0x107C4
    lda     0xFFFF, r8
    b       loc_105CC
    