        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_KAESHI:                          # DATA XREF: ROM:0001D0E0↓o
    ldob    0x1B2(g7), r3   # Label from official source
    cmpibe  0, r3, loc_14EE0
    cmpibe  1, r3, loc_14EF4
loc_14EE0:                              # CODE XREF: ACT_RC_KAESHI+4↑j
    ldis    0x1A8(g8), r15
    stis    r15, 0x61E(g7)
    ldob    0x1B2(g7), r14
    addi    1, r14, r15
    stob    r15, 0x1B2(g7)
loc_14EF4:                              # CODE XREF: ACT_RC_KAESHI+8↑j
    ld      0x1A4(g8), r15
    bbc     8, r15, loc_14F1C
    ldos    0x1A8(g8), r3
    cmpobe  0, r3, loc_14F1C
    ldos    0x61E(g7), r14
    cmpobne r3, r14, loc_14F1C
    ld      0x0(g7), r15
    setbit  0xC, r15, r15
    st      r15, 0x0(g7)
    b       ACT_RC_KAMAE
# ---------------------------------------------------------------------------
loc_14F1C:                              # CODE XREF: ACT_RC_KAESHI+24↑j
    ld      0x1A4(g7), r15
    clrbit  0, r15, r15
    st      r15, 0x1A4(g7)
    mov     0, r15
    st      r15, 0x19C(g7)
    ret
# End of function ACT_RC_KAESHI


        .section kamae
# ---------------------------------------------------------------------------
ACT_RC_KAMAE:                           # CODE XREF: ACT_RC_KAESHI+44↓j
    ld      0x1A4(g7), r7   # Label from official source
    ld      0x0(g7), r6     # r6 = P1_PARTS
    bbs     3, r7, loc_135C4
    bbs     9, r7, loc_135F8
    ldos    0x802(g7), r14  # r14 = p1_motd_next
    cmpobne 0, r14, loc_1357C
    bbs     0, r6, loc_135DC
loc_1357C:                              # CODE XREF: ACT_RC_KAESHI-1960↑j
    ldos    prcb(g6), r13
    ldos    0x1A8(g7), r14  # r14 = p1_motion_num
    cmpibe  r13, r14, loc_135F8
    ldos    0x810(g7), r14  # r14 = P1_PARTS+0x810
    bbs     7, r14, loc_135B4
    ld      0x804(g7), r15
    bbs     0xD, r15, loc_135A4
    bbs     2, r7, loc_135F8
    b       loc_135DC
# ---------------------------------------------------------------------------
loc_135A4:                              # CODE XREF: ACT_RC_KAESHI-193C↑j
    ldos    start_ip_add(g6), g0
    bbc     1, r7, loc_135F4
    b       loc_135D4
# ---------------------------------------------------------------------------
loc_135B4:                              # CODE XREF: ACT_RC_KAESHI-1944↑j
    ldos    prcb(g6), g0
    call    sub_1CEA8
    ret
# ---------------------------------------------------------------------------
loc_135C4:                              # CODE XREF: ACT_RC_KAESHI-196C↑j
    ldos    prcb(g6), g0
    ldos    0x810(g7), r14
    bbs     7, r14, loc_135F4
loc_135D4:                              # CODE XREF: ACT_RC_KAESHI-1924↑j
    call    sub_1CE94
    ret
# ---------------------------------------------------------------------------
loc_135DC:                              # CODE XREF: ACT_RC_KAESHI-195C↑j
    ldos    system_address_table_ptr(g6), g0
    ld      0x0(g7), r15
    bbc     0x1D, r15, loc_135F4
    ldos    (system_address_table_ptr+2)(g6), g0
loc_135F4:                              # CODE XREF: ACT_RC_KAESHI-1928↑j
    call    set_motion
loc_135F8:                              # CODE XREF: ACT_RC_KAESHI-1968↑j
    ret
