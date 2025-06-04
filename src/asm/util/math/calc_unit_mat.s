        .section calc_unit
# =============== S U B R O U T I N E =======================================
calc_unit_mat:                          # CODE XREF: action_init:skip_calc_rob_angle_cont↑p
    ld      debug_flag, r15 # Label from official source
    bbs     5, r15, loc_16CE4
    lda     0x3F807F7F, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x70C(g7), r15
    bbc     0x17, r15, loc_16CE4
    ldos    0x1AA(g7), r14
    cmpoble 2, r14, loc_16C84
    ldt     0x1F4(g7), r4
    stt     r4, 0x1E28(g7)
    b       loc_16CE4
# ---------------------------------------------------------------------------
loc_16C84:                              # CODE XREF: calc_unit_mat+2C↑j
    ldos    0x1AA(g7), r14
    cmpobg  0xE, r14, loc_16CE4
    ldos    0x1AA(g7), r14
    cmpobg  0x18, r14, loc_16CA4
    ld      0x70C(g7), r15
    clrbit  0x17, r15, r15
    st      r15, 0x70C(g7)
    b       loc_16CE4
# ---------------------------------------------------------------------------
loc_16CA4:                              # CODE XREF: calc_unit_mat+4C↑j
    ldt     0x1F4(g7), r4
    ldt     0x1E28(g7), r8
    subr    r8, r4, r4
    subr    r9, r5, r5
    subr    r10, r10, r6
    lda     0x3ECCCCCD, r11
    mulr    r11, r4, r4
    mulr    r11, r5, r5
    mulr    r11, r6, r6
    addr    r8, r4, r4
    addr    r9, r5, r5
    addr    r10, r6, r6
    stt     r4, 0x1E28(g7)
loc_16CE4:                              # CODE XREF: calc_unit_mat+8↑j
    lda     0x1C003838, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x9801313, r15
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    lda     0x800101, r15
    st      r15, (g11)[g12*1]
    lda     0x1800303, r15 # 0x000000
    st      r15, (g11)[g12*1]
    lda     0x7000E0E, r15
    st      r15, (g11)[g12*1]
    lda     displacement, r15
    st      r15, (g11)[g12*1]
    ld      0x678(g7), r15
    st      r15, (g11)[g12*1]
    lda     displacement, r15
    st      r15, (g11)[g12*1]
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ldt     0x18(g7), r12
    stt     r12, (g11)[g12*1]
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    ldis    0x26(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x9801313, r15
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    lda     0x9001212, r15
    st      r15, (g11)[g12*1]
    lda     0x501024, r15
    ldt     (g11)[g12*1], r12
    stt     r12, (r15)
    ldt     (g11)[g12*1], r12
    stt     r12, 0xC(r15)
    ldt     (g11)[g12*1], r12
    stt     r12, 0x18(r15)
    ld      0x0(g7), r15
    bbc     2, r15, loc_16DFC
    ldob    0x83F(g7), r14
    bbc     0, r14, loc_16E18
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ld      0x80(g7), r15
    st      r15, (g11)[g12*1]
    lda     displacement, r15
    st      r15, (g11)[g12*1]
    ld      0x88(g7), r15
    st      r15, (g11)[g12*1]
    b       loc_16E18
# ---------------------------------------------------------------------------
loc_16DFC:                              # CODE XREF: calc_unit_mat+180↑j
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ldt     0x80(g7), r12
    ld      0xC50(g7), r15
    addr    r15, r13, r13
    stt     r12, (g11)[g12*1]
loc_16E18:                              # CODE XREF: calc_unit_mat+188↑j
    lda     0x9801313, r15
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    lda     0x34806969, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    bbs     0, r15, loc_16E4C
    shlo    9, 0x1D, r15
    b       loc_16E54
# ---------------------------------------------------------------------------
loc_16E4C:                              # CODE XREF: calc_unit_mat+1FC↑j
    lda     0x3B00, r15
loc_16E54:                              # CODE XREF: calc_unit_mat+204↑j
    st      r15, (g11)[g12*1]
    ldis    0x26(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x1A803535, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    mov     0, r15
    st      r15, (g11)[g12*1]
    lda     0x7800F0F, r15
    st      r15, (g11)[g12*1]
    ldt     (g11)[g12*1], r12
    stt     r12, 0x1F4(g7)
    mov     0, g0
    call    set_coli_ball_data
    lda     0x800101, r15
    st      r15, (g11)[g12*1]
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ldt     0x8C(g7), r12
    stt     r12, (g11)[g12*1]
    lda     0x34806969, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    bbs     0, r15, loc_16ED8
    lda     0x3A0C, r15
    b       loc_16EE0
# ---------------------------------------------------------------------------
loc_16ED8:                              # CODE XREF: calc_unit_mat+284↑j
    lda     0x3B0C, r15
loc_16EE0:                              # CODE XREF: calc_unit_mat+290↑j
    st      r15, (g11)[g12*1]
    ldis    0x26(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4000808, r15
    st      r15, (g11)[g12*1]
    ldis    0xBE6(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x1FEC(g7), g3
    call    dented_cnt
    movt    g0, r4
    mov     1, g3
    call    scale_parts_cnt
    addr    r4, g0, r4
    addr    r5, g1, r5
    addr    r6, g2, r6
    ldt     player_model_y_scale, g0
    addr    r4, g0, g0
    addr    r5, g1, g1
    addr    r6, g2, g2
    lda     0x3800707, r15
    st      r15, (g11)[g12*1]
    st      g0, (g11)[g12*1]
    st      g1, (g11)[g12*1]
    st      g2, (g11)[g12*1]
    lda     0x1A803535, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    mov     0xC, r15
    st      r15, (g11)[g12*1]
    lda     0x7800F0F, r15
    st      r15, (g11)[g12*1]
    ldt     (g11)[g12*1], r12
    stt     r12, 0x200(g7)
    mov     1, g0
    call    set_coli_ball_data
    lda     0x800101, r15
    st      r15, (g11)[g12*1]
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ldt     0x98(g7), r12
    stt     r12, (g11)[g12*1]
    lda     0x1F803F3F, r15
    st      r15, (g11)[g12*1]
    ldis    0xBB2(g7), r12
    ldis    0xBB0(g7), r13
    ldis    0xBAE(g7), r14
    stt     r12, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    ldis    0xC0E(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4000808, r15
    st      r15, (g11)[g12*1]
    ldis    0xC0C(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x5000A0A, r15
    st      r15, (g11)[g12*1]
    ldis    0xC10(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x1F803F3F, r15
    st      r15, (g11)[g12*1]
    ldis    0x150(g7), r12
    ldis    0x14E(g7), r13
    ldis    0x14C(g7), r14
    stt     r12, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    lda     0x4000808, r15
    st      r15, (g11)[g12*1]
    ldis    0xBE6(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x1F88(g7), g3
    call    dented_cnt
    movt    g0, r4
    mov     0, g3
    call    scale_parts_cnt
    addr    r4, g0, r4
    addr    r5, g1, r5
    addr    r6, g2, r6
    ldt     player_model_y_scale, g0
    addr    r4, g0, g0
    addr    r5, g1, g1
    addr    r6, g2, g2
    lda     0x3800707, r15
    st      r15, (g11)[g12*1]
    st      g0, (g11)[g12*1]
    st      g1, (g11)[g12*1]
    st      g2, (g11)[g12*1]
    lda     0x1A803535, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    mov     0x18, r15
    st      r15, (g11)[g12*1]
    lda     0x7800F0F, r15
    st      r15, (g11)[g12*1]
    ldt     (g11)[g12*1], r12
    stt     r12, 0x20C(g7)
    mov     2, g0
    call    set_coli_ball_data
    lda     0x1000202, r15
    st      r15, (g11)[g12*1]
    lda     0x800101, r15
    st      r15, (g11)[g12*1]
    mov     r15, r15
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ldt     0xA4(g7), r12
    stt     r12, (g11)[g12*1]
    mov     r15, r15
    lda     0x34806969, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    bbs     0, r15, loc_17114
    lda     0x3A24, r15
    b       loc_1711C
# ---------------------------------------------------------------------------
loc_17114:                              # CODE XREF: calc_unit_mat+4C0↑j
    lda     loc_3B24, r15
loc_1711C:                              # CODE XREF: calc_unit_mat+4CC↑j
    st      r15, (g11)[g12*1]
    ldis    0x26(g7), r15
    st      r15, (g11)[g12*1]
    mov     r15, r15
    lda     0x1A803535, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    addo    0x1F, 5, r15
    st      r15, (g11)[g12*1]
    lda     0x7800F0F, r15
    st      r15, (g11)[g12*1]
    ldt     (g11)[g12*1], r12
    stt     r12, 0x218(g7)
    mov     3, g0
    call    set_coli_ball_data
    mov     r15, r15
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ldt     0xB0(g7), r12
    stt     r12, (g11)[g12*1]
    mov     r15, r15
    lda     0x34806969, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    bbs     0, r15, loc_171A0
    lda     0x3A30, r15
    b       loc_171A8
# ---------------------------------------------------------------------------
loc_171A0:                              # CODE XREF: calc_unit_mat+54C↑j
    lda     0x3B30, r15
loc_171A8:                              # CODE XREF: calc_unit_mat+558↑j
    st      r15, (g11)[g12*1]
    ldis    0x26(g7), r15
    st      r15, (g11)[g12*1]
    mov     r15, r15
    lda     0x1A803535, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    addo    0x1F, 0x11, r15
    st      r15, (g11)[g12*1]
    lda     0x7800F0F, r15
    st      r15, (g11)[g12*1]
    ldt     (g11)[g12*1], r12
    stt     r12, 0x224(g7)
    mov     4, g0
    call    set_coli_ball_data
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ldt     0xBC(g7), r12
    stt     r12, (g11)[g12*1]
    lda     0x5000A0A, r15
    st      r15, (g11)[g12*1]
    ldis    0x15E(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    ldis    0x15C(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4000808, r15
    st      r15, (g11)[g12*1]
    ldis    0x15A(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    ldis    0xBEA(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4000808, r15
    st      r15, (g11)[g12*1]
    ldis    0xBE8(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x5000A0A, r15
    st      r15, (g11)[g12*1]
    ldis    0xBEC(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x0(g7), r4
    chkbit  6, r4
    alterbit 0, 0, r4
    mov     3, g3
    subo    r4, g3, g3
    call    scale_parts_cnt
    ld      player_model_y_scale, r4
    addr    r4, g0, g0
    addr    r4, g1, g1
    addr    r4, g2, g2
    lda     0x3800707, r15
    st      r15, (g11)[g12*1]
    st      g0, (g11)[g12*1]
    st      g1, (g11)[g12*1]
    st      g2, (g11)[g12*1]
    lda     0x1A803535, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    addo    0x1F, 0x1D, r15
    st      r15, (g11)[g12*1]
    lda     0x7800F0F, r15
    st      r15, (g11)[g12*1]
    ldt     (g11)[g12*1], r12
    stt     r12, 0x230(g7)
    mov     5, g0
    call    set_coli_ball_data
    lda     0x1000202, r15
    st      r15, (g11)[g12*1]
    mov     r15, r15
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ldt     0xC8(g7), r12
    stt     r12, (g11)[g12*1]
    mov     r15, r15
    lda     0x34806969, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    bbs     0, r15, loc_17340
    lda     loc_3A48, r15
    b       loc_17348
# ---------------------------------------------------------------------------
loc_17340:                              # CODE XREF: calc_unit_mat+6EC↑j
    lda     power_test_check, r15
loc_17348:                              # CODE XREF: calc_unit_mat+6F8↑j
    st      r15, (g11)[g12*1]
    ldis    0x26(g7), r15
    st      r15, (g11)[g12*1]
    mov     r15, r15
    lda     0x1A803535, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    shlo    3, 9, r15
    st      r15, (g11)[g12*1]
    lda     0x7800F0F, r15
    st      r15, (g11)[g12*1]
    ldt     (g11)[g12*1], r12
    stt     r12, 0x23C(g7)
    mov     6, g0
    call    set_coli_ball_data
    mov     r15, r15
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ldt     0xD4(g7), r12
    stt     r12, (g11)[g12*1]
    mov     r15, r15
    lda     0x34806969, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    bbs     0, r15, loc_173CC
    lda     0x3A54, r15
    b       loc_173D4
# ---------------------------------------------------------------------------
loc_173CC:                              # CODE XREF: calc_unit_mat+778↑j
    lda     loc_3B54, r15
loc_173D4:                              # CODE XREF: calc_unit_mat+784↑j
    st      r15, (g11)[g12*1]
    ldis    0x26(g7), r15
    st      r15, (g11)[g12*1]
    mov     r15, r15
    lda     0x1A803535, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    shlo    2, 0x15, r15
    st      r15, (g11)[g12*1]
    lda     0x7800F0F, r15
    st      r15, (g11)[g12*1]
    ldt     (g11)[g12*1], r12
    stt     r12, 0x248(g7)
    mov     7, g0
    call    set_coli_ball_data
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ldt     0xE0(g7), r12
    stt     r12, (g11)[g12*1]
    lda     0x5000A0A, r15
    st      r15, (g11)[g12*1]
    ldis    0x16C(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    ldis    0x16A(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4000808, r15
    st      r15, (g11)[g12*1]
    ldis    0x168(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    ldis    0xBF0(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4000808, r15
    st      r15, (g11)[g12*1]
    ldis    0xBEE(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x5000A0A, r15
    st      r15, (g11)[g12*1]
    ldis    0xBF2(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x0(g7), r4
    chkbit  6, r4
    alterbit 0, 0, r4
    mov     2, g3
    addo    r4, g3, g3
    call    scale_parts_cnt
    ld      player_model_y_scale, r4
    addr    r4, g0, g0
    addr    r4, g1, g1
    addr    r4, g2, g2
    lda     0x3800707, r15
    st      r15, (g11)[g12*1]
    st      g0, (g11)[g12*1]
    st      g1, (g11)[g12*1]
    st      g2, (g11)[g12*1]
    lda     0x1A803535, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    shlo    5, 3, r15
    st      r15, (g11)[g12*1]
    lda     0x7800F0F, r15
    st      r15, (g11)[g12*1]
    ldt     (g11)[g12*1], r12
    stt     r12, 0x254(g7)
    mov     8, g0
    call    set_coli_ball_data
    lda     0x1000202, r15
    st      r15, (g11)[g12*1]
    ld      0x70C(g7), r15
    bbc     0x17, r15, loc_17558
    ldt     0x1E28(g7), r4
    lda     0x7000E0E, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r6, (g11)[g12*1]
loc_17558:                              # CODE XREF: calc_unit_mat+8F0↑j
    lda     0x9801313, r15
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ldt     0xEC(g7), r12
    stt     r12, (g11)[g12*1]
    lda     0x1F803F3F, r15
    st      r15, (g11)[g12*1]
    ldis    0xBC4(g7), r12
    ldis    0xBC2(g7), r13
    ldis    0xBC0(g7), r14
    stt     r12, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    ldis    0xC20(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4000808, r15
    st      r15, (g11)[g12*1]
    ldis    0xC1E(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x5000A0A, r15
    st      r15, (g11)[g12*1]
    ldis    0xC22(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x5000A0A, r15
    st      r15, (g11)[g12*1]
    ldis    0x172(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    ldis    0x170(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x1A803535, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    shlo    2, 0x1B, r15
    st      r15, (g11)[g12*1]
    lda     0x7800F0F, r15
    st      r15, (g11)[g12*1]
    ldt     (g11)[g12*1], r12
    stt     r12, 0x260(g7)
    mov     9, g0
    call    set_coli_ball_data
    ld      0x190(g7), r3
    lda     0x9801313, r15
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    mov     r15, r15
    lda     0x800101, r15
    st      r15, (g11)[g12*1]
    lda     0x9801313, r15
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    mov     r15, r15
    mov     r15, r15
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ldt     0xF8(g7), r12
    stt     r12, (g11)[g12*1]
    mov     r15, r15
    lda     0x34806969, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    bbs     0, r15, loc_176C4
    lda     loc_3A78, r15
    b       loc_176CC
# ---------------------------------------------------------------------------
loc_176C4:                              # CODE XREF: calc_unit_mat+A70↑j
    lda     loc_3B78, r15
loc_176CC:                              # CODE XREF: calc_unit_mat+A7C↑j
    st      r15, (g11)[g12*1]
    ldis    0x26(g7), r15
    st      r15, (g11)[g12*1]
    mov     r15, r15
    lda     0x1A803535, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    shlo    3, 0xF, r15
    st      r15, (g11)[g12*1]
    lda     0x7800F0F, r15
    st      r15, (g11)[g12*1]
    ldt     (g11)[g12*1], r12
    stt     r12, 0x26C(g7)
    mov     0xA, g0
    call    set_coli_ball_data
    mov     r15, r15
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ldt     0x104(g7), r12
    stt     r12, (g11)[g12*1]
    mov     r15, r15
    lda     0x34806969, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    bbs     0, r15, loc_17750
    lda     loc_3A84, r15
    b       loc_17758
# ---------------------------------------------------------------------------
loc_17750:                              # CODE XREF: calc_unit_mat+AFC↑j
    lda     loc_3B84, r15
loc_17758:                              # CODE XREF: calc_unit_mat+B08↑j
    st      r15, (g11)[g12*1]
    ldis    0x26(g7), r15
    st      r15, (g11)[g12*1]
    mov     r15, r15
    lda     0x1A803535, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x84, r15
    st      r15, (g11)[g12*1]
    lda     0x7800F0F, r15
    st      r15, (g11)[g12*1]
    ldt     (g11)[g12*1], r12
    stt     r12, 0x278(g7)
    mov     0xB, g0
    call    set_coli_ball_data
    mov     r15, r15
    lda     0x9801313, r15
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ldt     0x110(g7), r12
    stt     r12, (g11)[g12*1]
    lda     0x8801111, r15
    st      r15, (g11)[g12*1]
    lda     0x501024, r15
    ldt     (r15), r12
    stt     r12, (g11)[g12*1]
    ldt     0xC(r15), r12
    stt     r12, (g11)[g12*1]
    ldt     0x18(r15), r12
    stt     r12, (g11)[g12*1]
    lda     0x5000A0A, r15
    st      r15, (g11)[g12*1]
    ldis    0x180(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    ldis    0x17E(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4000808, r15
    st      r15, (g11)[g12*1]
    ldis    0x17C(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    ldis    0xBF6(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4000808, r15
    st      r15, (g11)[g12*1]
    ldis    0xBF4(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x5000A0A, r15
    st      r15, (g11)[g12*1]
    ldis    0xBF8(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x0(g7), r4
    chkbit  6, r4
    alterbit 0, 0, r4
    mov     5, g3
    subo    r4, g3, g3
    call    scale_parts_cnt
    ld      player_model_y_scale, r4
    addr    r4, g0, g0
    addr    r4, g1, g1
    addr    r4, g2, g2
    lda     0x3800707, r15
    st      r15, (g11)[g12*1]
    st      g0, (g11)[g12*1]
    st      g1, (g11)[g12*1]
    st      g2, (g11)[g12*1]
    lda     0x1A803535, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    shlo    4, 9, r15
    st      r15, (g11)[g12*1]
    lda     0x7800F0F, r15
    st      r15, (g11)[g12*1]
    ldt     (g11)[g12*1], r12
    stt     r12, 0x284(g7)
    mov     0xC, g0
    call    set_coli_ball_data
    mov     r15, r15
    lda     0x1000202, r15
    st      r15, (g11)[g12*1]
    mov     r15, r15
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ldt     0x11C(g7), r12
    stt     r12, (g11)[g12*1]
    mov     r15, r15
    lda     0x34806969, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    bbs     0, r15, loc_1793C
    lda     0x3A9C, r15
    b       loc_17944
# ---------------------------------------------------------------------------
loc_1793C:                              # CODE XREF: calc_unit_mat+CE8↑j
    lda     loc_3B9C, r15
loc_17944:                              # CODE XREF: calc_unit_mat+CF4↑j
    st      r15, (g11)[g12*1]
    ldis    0x26(g7), r15
    st      r15, (g11)[g12*1]
    mov     r15, r15
    lda     0x1A803535, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x9C, r15
    st      r15, (g11)[g12*1]
    lda     0x7800F0F, r15
    st      r15, (g11)[g12*1]
    ldt     (g11)[g12*1], r12
    stt     r12, 0x290(g7)
    mov     0xD, g0
    call    set_coli_ball_data
    mov     r15, r15
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ldt     0x128(g7), r12
    stt     r12, (g11)[g12*1]
    mov     r15, r15
    lda     0x34806969, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    bbs     0, r15, loc_179C8
    lda     loc_3AA8, r15
    b       loc_179D0
# ---------------------------------------------------------------------------
loc_179C8:                              # CODE XREF: calc_unit_mat+D74↑j
    lda     loc_3BA8, r15
loc_179D0:                              # CODE XREF: calc_unit_mat+D80↑j
    st      r15, (g11)[g12*1]
    ldis    0x26(g7), r15
    st      r15, (g11)[g12*1]
    mov     r15, r15
    lda     0x1A803535, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    shlo    3, 0x15, r15
    st      r15, (g11)[g12*1]
    lda     0x7800F0F, r15
    st      r15, (g11)[g12*1]
    ldt     (g11)[g12*1], r12
    stt     r12, 0x29C(g7)
    mov     0xE, g0
    call    set_coli_ball_data
    lda     0x9801313, r15
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ldt     0x134(g7), r12
    stt     r12, (g11)[g12*1]
    lda     0x8801111, r15
    st      r15, (g11)[g12*1]
    lda     0x501024, r15
    ldt     (r15), r12
    stt     r12, (g11)[g12*1]
    ldt     0xC(r15), r12
    stt     r12, (g11)[g12*1]
    ldt     0x18(r15), r12
    stt     r12, (g11)[g12*1]
    lda     0x5000A0A, r15
    st      r15, (g11)[g12*1]
    ldis    0x18E(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    ldis    0x18C(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4000808, r15
    st      r15, (g11)[g12*1]
    ldis    0x18A(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    ldis    0xBFC(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4000808, r15
    st      r15, (g11)[g12*1]
    ldis    0xBFA(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x5000A0A, r15
    st      r15, (g11)[g12*1]
    ldis    0xBFE(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x0(g7), r4
    chkbit  6, r4
    alterbit 0, 0, r4
    mov     4, g3
    addo    r4, g3, g3
    call    scale_parts_cnt
    ld      player_model_y_scale, r4
    addr    r4, g0, g0
    addr    r4, g1, g1
    addr    r4, g2, g2
    lda     0x3800707, r15
    st      r15, (g11)[g12*1]
    st      g0, (g11)[g12*1]
    st      g1, (g11)[g12*1]
    st      g2, (g11)[g12*1]
    lda     0x1A803535, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    lda     0xB4, r15
    st      r15, (g11)[g12*1]
    lda     0x7800F0F, r15
    st      r15, (g11)[g12*1]
    ldt     (g11)[g12*1], r12
    stt     r12, 0x2A8(g7)
    mov     0xF, g0
    call    set_coli_ball_data
    lda     0x1000202, r15
    st      r15, (g11)[g12*1]
    call    rob_ball_data_make
    ld      debug_flag, r15
    bbs     5, r15, loc_17C10
    ldt     0x1F4(g7), r8
    ldt     0x6FC(g7), r12
    stt     r12, 0x1E0C(g7)
    stt     r8, 0x6FC(g7)
    subr    r12, r8, r8
    subr    r14, r10, r10
    ldt     0x1E00(g7), r4
    lda     mode9, r3
    ldob    also_mode, r14
    cmpobne r3, r14, loc_17C10
    lda     sub_mode9, r3
    ldob    also_sub_mode, r14
    cmpobne r3, r14, loc_17C10
    ld      0x0(g7), r15
    bbc     7, r15, loc_17C10
    lda     0x16802D2D, r15
    st      r15, (g11)[g12*1]
    st      r8, (g11)[g12*1]
    st      r10, (g11)[g12*1]
    ld      (g11)[g12*1], r4
    lda     0x3F333333, r3
    cmpr    r4, r3
    bl      loc_17C10
    ld      0x1A4(g7), r3
    bbs     0xE, r3, loc_17C10
    bbs     0x11, r3, loc_17C10
    bbs     0x12, r3, loc_17C10
    bbs     0x13, r3, loc_17C10
loc_17C10:                              # CODE XREF: calc_unit_mat+F38↑j
    ret
# End of function calc_unit_mat
# =============== S U B R O U T I N E =======================================
set_coli_ball_data:                     # CODE XREF: calc_unit_mat+250↑p
    ld      0x1D0C(g7), r3  # Label from official source
    ld      0x1D00(g7), r11
    ld      0x1D14(g7), r8
    lda     (r8)[g0*8], r8
    ld      0x1D20(g7), r9
    ldob    (r9)[g0], r9
    mov     0, r12
    ld      mod_fa_coli, r14
    ld      0x0(r14), r14
loc_17C4C:                              # CODE XREF: set_coli_ball_data+84↓j
    cmpobe  0, r9, loc_17C9C
    ldob    (r8)[r12], r10
    ldq     0x0(r3)[r10*4], r4
    ld      (r11)[r10*4], r7
    shro    2, r10, r13
    lda     0x1C803939, r15
    st      r15, (g11)[g12*1]
    stt     r4, (g11)[g12*1]
    mulo    3, r13, r15
    st      r15, (g11)[g12*1]
    bbs     0x1F, r14, loc_17C94
    lda     0x14802929, r15
    st      r15, (g11)[g12*1]
    stt     r4, (g11)[g12*1]
    ldt     (g11)[g12*1], r4
loc_17C94:                              # CODE XREF: set_coli_ball_data+68↑j
    addo    1, r12, r12
    cmpobne r12, r9, loc_17C4C
loc_17C9C:                              # CODE XREF: set_coli_ball_data:loc_17C4C↑j
    ret
# End of function set_coli_ball_data
