        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_RUN:                             # DATA XREF: ROM:0001D100↓o
    ldob    0x1B2(g7), r3   # Label from official source
    cmpobe  0, r3, loc_137F4
    cmpobe  1, r3, loc_13850
    cmpobe  2, r3, loc_13898
loc_137F4:                              # CODE XREF: ACT_RC_RUN+4↑j
    ldos    (start_ip_add+2)(g6), g0
    ldos    0x1A8(g7), r14
    cmpobe  g0, r14, loc_13844
    ld      0x5F4(g7), r3
    lda     0x40400000, r4
    cmpr    r4, r3
    bg      loc_13828
    ldos    check_word1(g6), g0
    ldos    0x1A8(g7), r14
    cmpobe  g0, r14, loc_13844
loc_13828:                              # CODE XREF: ACT_RC_RUN+30↑j
    addo    4, sp, sp
    st      g6, -4(sp)
    call    set_motion
    ld      -4(sp), g6
    subo    4, sp, sp
loc_13844:                              # CODE XREF: ACT_RC_RUN+1C↑j
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_13850:                              # CODE XREF: ACT_RC_RUN+8↑j
    ldos    0x1AA(g7), r14
    cmpobg  8, r14, loc_13908
    ld      0x5B8(g7), r15
    bbc     2, r15, loc_138E4
    ldos    (byte_30+2)(g6), g0
    addo    4, sp, sp
    st      g6, -4(sp)
    call    set_motion
    ld      -4(sp), g6
    subo    4, sp, sp
    mov     0xA, r15
    stis    r15, 0x1AA(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_13898:                              # CODE XREF: ACT_RC_RUN+C↑j
    ld      0x0(g7), r15
    bbc     0, r15, loc_13908
    ld      0x5B8(g7), r15
    bbc     2, r15, loc_138D0
    ldos    (byte_30+4)(g6), g0
    ld      0x1A4(g7), r3
    shro    0xF, r3, r3
    ld      0x0(g7), r4
    xor     r3, r4, r3
    bbs     6, r3, loc_138DC
    ldos    (byte_30+6)(g6), g0
    b       loc_138DC
# ---------------------------------------------------------------------------
loc_138D0:                              # CODE XREF: ACT_RC_RUN+C0↑j
    shlo    0x18, 3, r15
    st      r15, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_138DC:                              # CODE XREF: ACT_RC_RUN+DC↑j
    call    set_motion
    ret
# ---------------------------------------------------------------------------
loc_138E4:                              # CODE XREF: ACT_RC_RUN+78↑j
    ldos    (start_ip_add+2)(g6), r3
    ldos    0x1A8(g7), r14
    cmpobne r3, r14, loc_13900
    ldos    0x1AA(g7), r14
    cmpobl  0xF, r14, loc_13900
    ret
# ---------------------------------------------------------------------------
loc_13900:                              # CODE XREF: ACT_RC_RUN+10C↑j
    mov     0, r15
    st      r15, 0x19C(g7)
loc_13908:                              # CODE XREF: ACT_RC_RUN+70↑j
    ret
# End of function ACT_RC_RUN
