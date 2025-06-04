        .section option
# =============== S U B R O U T I N E =======================================
option_control:                         # CODE XREF: rob_disp+708↑p
    lda     0x788(g7), r6   # Label from official source
    ld      0x0(g7), r15
    bbc     0x1B, r15, loc_1A7F8
    lda     0x7A0(g7), r6
    ldos    0x0(r6), r3
    cmpobne g0, r3, loc_1A814
    ld      0x0(g7), r15
    bbc     4, r15, loc_1A7F8
    call    delete_option
    lda     0x788(g7), r6
loc_1A7F8:                              # CODE XREF: option_control+8↑j
    ldos    0x0(r6), r3
    cmpobne g0, r3, loc_1A814
    ldos    0x16(r6), r3
    bbs     0xF, r3, loc_1A814
    ld      off_1A818[r3*4], r5 # Always returns. Wonder what it was used for...
    callx   (r5)
loc_1A814:                              # CODE XREF: option_control+14↑j
    ret
# End of function option_control
# ---------------------------------------------------------------------------
off_1A818:      .long loc_1A85C         # DATA XREF: option_control+38↑r
    .long loc_1A85C         # return
    .long loc_1A85C         # return
    .long loc_1A85C         # return
    .long loc_1A85C         # return
    .long loc_1A85C         # return
    .long loc_1A85C         # return
    .long loc_1A85C         # return
    .long loc_1A85C         # return
    .long loc_1A85C         # return
    .long loc_1A85C         # return
    .long loc_1A85C         # return
    .long loc_1A85C         # return
    .long loc_1A85C         # return
    .long loc_1A85C         # return
    .long loc_1A85C         # return
    .long loc_1A85C         # return
# ---------------------------------------------------------------------------
loc_1A85C:                              # DATA XREF: ROM:off_1A818↑o
    ret                     # return
        .section del_option
# =============== S U B R O U T I N E =======================================
delete_option:                          # CODE XREF: option_control+20↑p
    ld      0x0(g7), r15    # Label from official source
    clrbit  0x1B, r15, r15
    st      r15, 0x0(g7)
    mov     0, r15
    st      r15, 0xAFC(g7)
    call    send_init_ram_coli_data
    ret
# End of function delete_option
# =============== S U B R O U T I N E =======================================
sub_1CB58:                              # CODE XREF: play_motion+7BC↑p
    call    copy_option_data
    ld      0x784(g7), r3
    cmpobe  0, r3, loc_1CBF4
    ld      0x1D0C(g7), r11
    ld      0x1D18(g7), r12
    ld      0x1D20(g7), r9
    ld      0x1D14(g7), r8
    ld      0x1D08(g7), r13
    ld      0x0(g7), r15
    setbit  0x1B, r15, r15
    st      r15, 0x0(g7)
    ldq     4(r3), r4
    stq     r4, 0x1E0(r11)
    ldq     0x14(r3), r4
    stq     r4, 0x1F0(r11)
    ldos    0x7A0(g7), r3
    st      r3, 0x78(r12)
    st      r3, 0x7C(r12)
    ld      0x1D10(g7), r15
    ld      (r15), r15
    ldob    (r15)[r3], r4
    mov     2, r14
    addo    r4, r14, r15
    stob    r15, (r9)[r3]
    lda     (r8)[r3*8], r15
    shlo    3, 0xF, r12
    stob    r12, (r15)[r4]
    shlo    2, 0x1F, r12
    stob    r12, 1(r15)[r4]
    addo    0x1F, 1, r15
    st      r15, (r13)
    call    send_ram_coli_data
loc_1CBF4:                              # CODE XREF: sub_1CB58+8↑j
    ret
# End of function sub_1CB58
# =============== S U B R O U T I N E =======================================
copy_option_data:                       # CODE XREF: rob_disp:unit_efc_next↑p
    ld      0x190(g7), r7   # Label from official source
    ld      0x18(r7), r3
    ld      0xAFC(g7), r12
    cmpobe  0, r12, loc_1CC18
    subo    1, r12, r12
    shlo    4, 7, r13
    mulo    r12, r13, r12
    addo    r12, r3, r3
loc_1CC18:                              # CODE XREF: copy_option_data+C↑j
    ld      0x0(g7), r15
    bbc     6, r15, loc_1CC28
    addo    0x1F, 0x19, r13
    addo    r13, r3, r3
loc_1CC28:                              # CODE XREF: copy_option_data+24↑j
    ld      0x0(r3), r15
    st      r15, 0x784(g7)
    ldis    4(r3), r15
    stis    r15, 0x788(g7)
    ldis    6(r3), r15
    stis    r15, 0x78A(g7)
    ld      8(r3), r15
    st      r15, 0x78C(g7)
    ld      0xC(r3), r15
    st      r15, 0x790(g7)
    ld      0x10(r3), r15
    st      r15, 0x794(g7)
    ldis    0x14(r3), r15
    stis    r15, 0x798(g7)
    ldis    0x16(r3), r15
    stis    r15, 0x79A(g7)
    ldis    0x18(r3), r15
    stis    r15, 0x79C(g7)
    ldis    0x1A(r3), r15
    stis    r15, 0x79E(g7)
    ldis    0x1C(r3), r15
    stis    r15, 0x7A0(g7)
    ldis    0x1E(r3), r15
    stis    r15, 0x7A2(g7)
    ld      0x20(r3), r15
    st      r15, 0x7A4(g7)
    ld      0x24(r3), r15
    st      r15, 0x7A8(g7)
    ld      0x28(r3), r15
    st      r15, 0x7AC(g7)
    ldis    0x2C(r3), r15
    stis    r15, 0x7B0(g7)
    ldis    0x2E(r3), r15
    stis    r15, 0x7B2(g7)
    ldis    0x30(r3), r15
    stis    r15, 0x7B4(g7)
    ldis    0x32(r3), r15
    stis    r15, 0x7B6(g7)
    ldis    0x34(r3), r15
    stis    r15, 0x7F8(g7)
    ret
# End of function copy_option_data
