        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_KAWASHI:                         # DATA XREF: ROM:0001D0F8↓o
    ldob    0x19F(g8), r14  # Label from official source
    cmpobe  0xD, r14, loc_14FC4
    ldob    4(g8), r13
    ldos    0x1AA(g8), r14
    addi    r13, r14, r5
    ldos    0x626(g7), r14
    subi    r5, r14, r5
    ldos    0x1AE(g7), r4
    addo    1, r4, r4
    addo    r4, r5, r5
    mov     1, r3
    cmpibge r5, r3, loc_14F68
    mov     r3, r5
loc_14F68:                              # CODE XREF: ACT_RC_KAWASHI+2C↑j
    ldob    0x84D(g7), r6
    subo    1, r6, r3
    mulo    r3, r4, r7
    divo    r5, r7, r7
    addo    1, r7, r7
    stos    r7, 0x1AA(g7)
    cmpobe  r6, r7, loc_14FCC
    ret
# ---------------------------------------------------------------------------
    lda     TEXTURE_BUFFER, g1 # Unreachable code
    ldos    0x626(g7), r15
    st      r15, 0x0(sp)
    mov     1, r15
    balx    sub_4ED24, r14
# ---------------------------------------------------------------------------
aTagEnComaError:.asciz "tag_en_coma error?\n\r%d"
    .byte    0
# ---------------------------------------------------------------------------
    mov     1, r5
    b       loc_14F68
# ---------------------------------------------------------------------------
loc_14FC4:                              # CODE XREF: ACT_RC_KAWASHI+4↑j
    ldob    0x84D(g7), r6
    stos    r6, 0x1AA(g7)
loc_14FCC:                              # CODE XREF: ACT_RC_KAWASHI+4C↑j
    ld      0x1A4(g7), r15
    setbit  0x12, r15, r15
    st      r15, 0x1A4(g7)
    shlo    0x1A, 3, r15
    st      r15, 0x19C(g7)
    mov     0, r15
    stib    r15, 0x1B2(g7)
    b       loc_15234
# ---------------------------------------------------------------------------
    ld      0x0(g7), r14
    clrbit  4, r14, r15
    st      r15, 0x0(g7)
    ld      0x1A4(g7), r15
    clrbit  0, r15, r15
    st      r15, 0x1A4(g7)
    mov     0, r15
    st      r15, 0x19C(g7)
    ret
# End of function ACT_RC_KAWASHI
