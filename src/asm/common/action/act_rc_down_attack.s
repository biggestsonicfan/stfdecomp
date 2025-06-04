        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_DOWN_ATTACK:                     # DATA XREF: ROM:0001D180↓o
    ldob    0x1B2(g7), r3   # Label from official source
    cmpobe  0, r3, loc_13C28
    cmpobe  1, r3, loc_13C34
    cmpobe  2, r3, loc_13DA4
loc_13C28:                              # CODE XREF: ACT_RC_DOWN_ATTACK+4↑j
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_13C34:                              # CODE XREF: ACT_RC_DOWN_ATTACK+8↑j
    ldob    0x5BE(g7), r6
    cvtir   r6, r6
    ldis    0x1AC(g7), r13
    ldis    0x1AC(g8), r14
    subi    r13, r14, r3
    shli    1, r3, r3
    addo    0x1F, 0x13, r4
    cmpibge r4, r3, loc_13C5C
    mov     r4, r3
    b       loc_13C68
# ---------------------------------------------------------------------------
loc_13C5C:                              # CODE XREF: ACT_RC_DOWN_ATTACK+38↑j
    subo    0x14, 0, r4
    cmpible r4, r3, loc_13C68
    mov     r4, r3
loc_13C68:                              # CODE XREF: ACT_RC_DOWN_ATTACK+40↑j
    cvtir   r3, r3
    lda     0x3C23D70A, r13
    mulr    r13, r3, r3
    lda     0x3F800000, r13
    addr    r13, r3, r3
    lda     0x40400000, r5
    ld      add_BACKUP_RAM_TO_RAM, r14
    ldob    0x3353(r14), r14
    bbs     7, r14, loc_13CB0
    ld      0x1A4(g8), r15
    bbs     4, r15, loc_13CB0
    ld      0x1A4(g7), r15
    bbs     0x1F, r15, loc_13CB8
loc_13CB0:                              # CODE XREF: ACT_RC_DOWN_ATTACK+84↑j
    lda     0x3F000000, r5
loc_13CB8:                              # CODE XREF: ACT_RC_DOWN_ATTACK+94↑j
    mulr    r3, r5, r5
    lda     0x2D805B5B, r15
    st      r15, (g11)[g12*1]
    ldis    0x26(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x830(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x834(g7), r15
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    ld      (g11)[g12*1], r4
    ld      0x600(g7), r14
    subr    r3, r14, r3
    ld      0x608(g7), r14
    subr    r4, r14, r4
    ld      0x1F4(g7), r13
    subr    r13, r3, r3
    ld      0x1FC(g7), r13
    subr    r13, r4, r4
    lda     0x16802D2D, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    ld      (g11)[g12*1], g0
    cmpible g0, r5, loc_13D3C
    lda     0x3ECCCCCD, g1
    subr    g1, r5, r5
    divr    g0, r5, g0
    mulr    g0, r3, r3
    mulr    g0, r4, r4
loc_13D3C:                              # CODE XREF: ACT_RC_DOWN_ATTACK+108↑j
    divr    r6, r3, r15
    st      r15, 0x2C(g7)
    divr    r6, r4, r15
    st      r15, 0x34(g7)
    mov     0, r5
    st      r5, 0x30(g7)
    lda     0x17802F2F, r15
    st      r15, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    ld      (g11)[g12*1], r6
    stis    r6, 0x5C2(g7)
    call    sub_1980C
    ldos    0x1AA(g7), r13
    ldos    0x5BE(g7), r14
    cmpobl  r13, r14, loc_13DA4
    mov     0, r15
    st      r15, 0x2C(g7)
    mov     0, r15
    st      r15, 0x34(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_13DA4:                              # CODE XREF: ACT_RC_DOWN_ATTACK+C↑j
    ldos    0x1AA(g7), r13
    ldos    0x80C(g7), r14
    cmpibg  r13, r14, loc_13DBC
    ld      0x1A4(g7), r15
    setbit  0, r15, r15
    st      r15, 0x1A4(g7)
loc_13DBC:                              # CODE XREF: ACT_RC_DOWN_ATTACK+194↑j
    ret
# End of function ACT_RC_DOWN_ATTACK
