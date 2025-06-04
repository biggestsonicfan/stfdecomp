        .section action
# =============== S U B R O U T I N E =======================================
ACT_159B0:                              # DATA XREF: ROM:0001D188↓o
    ld      0x1A4(g7), r15
    bbs     1, r15, loc_15A48
    ld      0x1A4(g7), r15
    bbc     8, r15, loc_15A48
    ld      0x0(g7), r15
    bbc     2, r15, loc_15A10
    ld      0x0(g8), r15
    bbs     2, r15, loc_15A48
    ld      0x720(g7), r15
    bbc     0x12, r15, loc_15A48
    ld      mod_fa_coli, r3
    ld      0x164(r3), r14
    cmpobe  0, r14, loc_15A48
    ldos    0x1A8(g7), g0
    mov     0x16, g1
    call    calc_mht_adr
    cmpobe  0, g0, loc_15A48
    ld      1(g0), r3
    lda     0x20004000, r13
    addi    r13, r3, r15
    st      r15, 0x194(g7)
    b       loc_15A48
# ---------------------------------------------------------------------------
loc_15A10:                              # CODE XREF: ACT_159B0+14↑j
    ld      0x1A4(g7), r15
    bbs     0xE, r15, loc_15A3C
    mov     1, g0
    call    stage_contact_sound
    mov     0, r3
    st      r3, 0x2C(g7)
    st      r3, 0x30(g7)
    st      r3, 0x34(g7)
    mov     0, r15
    st      r15, 0x19C(g7)
    b       loc_15A48
# ---------------------------------------------------------------------------
loc_15A3C:                              # CODE XREF: ACT_159B0+64↑j
    mov     8, r15
    stib    r15, 0x19F(g7)
    b       loc_14CC0
# ---------------------------------------------------------------------------
loc_15A48:                              # CODE XREF: ACT_159B0+4↑j
    ret
# End of function ACT_159B0
