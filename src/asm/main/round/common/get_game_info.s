        .section game_info
# =============== S U B R O U T I N E =======================================
get_game_info:                          # DATA XREF: CONTINUE_DSP-4E58↑o
    ld      fa_rob0, g7     # Label from Virtua Fighter 2 source
    ld      fa_rob1, g8
    ld      0x0(g7), r7
    ld      0x0(g8), r8
    bbc     0x1F, r7, loc_16BBC
    call    get_my_info_new
loc_16BBC:                              # CODE XREF: get_game_info+18↑j
    ld      fa_rob1, g7
    ld      fa_rob0, g8
    bbc     0x1F, r8, loc_16BD4
    call    get_my_info_new
loc_16BD4:                              # CODE XREF: get_game_info+30↑j
    and     r7, r8, r3
    bbc     0x1F, r3, loc_16C04
    ld      fa_rob0, g7
    ld      fa_rob1, g8
    call    get_en_info
    ld      fa_rob1, g7
    ld      fa_rob0, g8
    call    get_en_info
loc_16C04:                              # CODE XREF: get_game_info+3C↑j
    ld      debug_flag, r15
    bbs     5, r15, loc_16C40 # return
    mov     0, r15
    stib    r15, 0x1200(g7)
    mov     0, r15
    stib    r15, 0x1200(g8)
    ldob    nagerenai_timer, r3 # nagerenai = "can't throw"
    cmpobe  0, r3, loc_16C40 # return
    subo    1, r3, r3
    stob    r3, nagerenai_timer # nagerenai = "can't throw"
loc_16C40:                              # CODE XREF: get_game_info+70↑j
    ret                     # return
# End of function get_game_info
        .section check_stage
# =============== S U B R O U T I N E =======================================
rob_check_stage:                        # CODE XREF: get_my_info_new+524↓p
    ld      0x0(g7), r15    # Label from official source
    bbc     7, r15, loc_183CC
    ld      debug_flag, r15
    bbs     5, r15, loc_183CC
    ld      0x0(g7), r15
    clrbit  0xD, r15, r15
    st      r15, 0x0(g7)
    mov     0, r10
    ld      0x1F4(g7), r3
    ld      0x1FC(g7), r5
    ld      0x1A4(g7), r15
    bbc     4, r15, loc_18214
    ld      0x18(g7), r3
    ld      0x20(g7), r5
loc_18214:                              # CODE XREF: rob_check_stage+30↑j
    ld      stage_soko, g4
    mov     1, r11
    ld      stage_x, r14
    clrbit  0x1F, r3, r13
    cmpr    r13, r14
    bge     loc_18248
    clrbit  0x1F, r5, r13
    cmpr    r13, r14
    bge     loc_18248
    mov     0, g4
    mov     0, r11
loc_18248:                              # CODE XREF: rob_check_stage+58↑j
    st      r11, 0x620(g7)
    ld      0x0(g7), r15
    bbs     2, r15, loc_18300
    cmpobe  0, r11, loc_1827C
    ldos    0x624(g7), r14
    cmpobne 0, r14, loc_18264
    b       loc_183CC
# ---------------------------------------------------------------------------
loc_18264:                              # CODE XREF: rob_check_stage+84↑j
    ld      0x1A4(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x1A4(g7)
    mov     0, r15
    st      r15, 0x30(g7)
    b       loc_183CC
# ---------------------------------------------------------------------------
loc_1827C:                              # CODE XREF: rob_check_stage+7C↑j
    ldos    0x614(g7), r14
    cmpobne 0, r14, loc_182C4
    shlo    9, 1, r13
    ld      0x1A4(g7), r14
    cmpobne r13, r14, loc_182AC
    ldob    also_mode, r3
    lda     mode9, r4
    cmpobne r4, r3, loc_182AC
    mov     0, r15
    st      r15, 0x1C(g7)
loc_182AC:                              # CODE XREF: rob_check_stage+B4↑j
    ld      0x804(g7), r15
    bbc     4, r15, loc_183CC
    ld      0x1A4(g7), r15
    setbit  4, r15, r15
    st      r15, 0x1A4(g7)
    b       loc_183CC
# ---------------------------------------------------------------------------
loc_182C4:                              # CODE XREF: rob_check_stage+A8↑j
    ld      0x1A4(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x1A4(g7)
    mov     0, r15
    st      r15, 0x30(g7)
    ld      0x1C(g7), r15
    bbc     0x1F, r15, loc_183CC
    ldob    also_mode, r3
    lda     mode9, r4
    cmpobne r4, r3, loc_183CC
    mov     0, r15
    st      r15, 0x1C(g7)
    b       loc_183CC
# ---------------------------------------------------------------------------
loc_18300:                              # CODE XREF: rob_check_stage+78↑j
    ld      0x0(g7), r15
    bbs     3, r15, loc_183CC
    cmpobe  0, r11, loc_18364
    ldos    0x624(g7), r14
    cmpobne 0, r14, loc_18334
    lda     0xBF800000, r3
    ld      0x1C(g7), r4
    cmpr    r3, r4
    bl      loc_183CC
    ldob    0x7D2(g8), r14
    bbc     0, r14, loc_183CC
    b       loc_183CC
# ---------------------------------------------------------------------------
loc_18334:                              # CODE XREF: rob_check_stage+138↑j
    ldob    0xA29(g7), r14
    cmpobe  0, r14, loc_183CC
    ldob    0x7D2(g8), r14
    bbc     0, r14, loc_18344
loc_18344:                              # CODE XREF: rob_check_stage+168↑j
    ld      0x0(g7), r15
    setbit  0xD, r15, r15
    st      r15, 0x0(g7)
    st      g4, 0x1C(g7)
    mov     0, r15
    st      r15, 0x30(g7)
    call    sub_1980C
    b       loc_183CC
# ---------------------------------------------------------------------------
loc_18364:                              # CODE XREF: rob_check_stage+130↑j
    lda     0x3CA3D70A, r13
    addr    r13, g4, r5
    ld      0x1C(g7), r6
    ld      0x81C(g7), r14
    addr    r5, r14, r3
    cmpr    r6, r3
    bge     loc_183BC
    setbit  0, r10, r10
    ld      0x84(g7), r14
    addr    r5, r14, r3
    cmpr    r6, r3
    bge     loc_183BC
loc_18398:                              # CODE XREF: rob_check_stage+1EC↓j
    ld      0x0(g7), r15
    setbit  0xD, r15, r15
    st      r15, 0x0(g7)
    mov     0, r15
    st      r15, 0x1C(g7)
    mov     0, r15
    st      r15, 0x30(g7)
    call    sub_1980C
    b       loc_183CC
# ---------------------------------------------------------------------------
loc_183BC:                              # CODE XREF: rob_check_stage+1A8↑j
    ldos    0x614(g7), r14
    cmpobe  0, r14, loc_183CC
    bbs     0, r10, loc_18398
    b       loc_183CC
# ---------------------------------------------------------------------------
loc_183CC:                              # CODE XREF: rob_check_stage+4↑j
    ld      0x1E18(g7), r15
    bbs     8, r15, loc_18400
    ld      0x1A4(g7), r15
    bbc     8, r15, loc_18400
    ld      mod_fa_coli, r3
    ld      0x1E0(r3), r6
    ldob    4(g7), r14
    cmpobe  0, r14, loc_183FC
    shlo    0xF, 1, r13
    addi    r13, r6, r6
loc_183FC:                              # CODE XREF: rob_check_stage+218↑j
    stis    r6, 0x760(g7)
loc_18400:                              # CODE XREF: rob_check_stage+1FC↑j
    ret
# End of function rob_check_stage

    .section new_info
# =============== S U B R O U T I N E =======================================
get_my_info_new:                        # CODE XREF: get_game_info+1C↑p
    mov     0, r15          # Guessed from Fighting Viper Source
    st      r15, 0x1250(g7)
    lda     0x650(g7), r3
    mov     0, r4
    mov     0, r12
    lda     0x42C80000, r6
loc_18460:                              # CODE XREF: get_my_info_new+3C↓j
    ld      (r3), r5
    cmpr    r6, r5
    bl      loc_18474
    mov     r5, r6
    mov     r4, r12
loc_18474:                              # CODE XREF: get_my_info_new+28↑j
    addo    4, r3, r3
    addo    1, r4, r4
    cmpobne 4, r4, loc_18460
    lda     0x40133333, r3
    cmpr    r6, r3
    bg      loc_184E8
    shlo    0xC, 1, r13
    ldos    0x26(g7), r3
    and     3, r12, r12
    ldos    word_196BC[r12*2], r4
    cmpobne 0, r4, loc_184C4
    shlo    0xF, 1, r5
    addo    r5, r4, r4
    addo    r5, r3, r3
    lda     0xFFFF, r5
    and     r5, r4, r4
    and     r5, r3, r3
loc_184C4:                              # CODE XREF: get_my_info_new+64↑j
    addo    r13, r4, r14
    cmpobl  r14, r3, loc_184E8
    subo    r13, r4, r14
    cmpobg  r14, r3, loc_184E8
    ld      0x1250(g7), r15
    setbit  0, r15, r15
    st      r15, 0x1250(g7)
loc_184E8:                              # CODE XREF: get_my_info_new+4C↑j
    lda     0x650(g7), r3
    mov     0, r4
    mov     0, r12
    lda     0x42C80000, r6
loc_184FC:                              # CODE XREF: get_my_info_new+D8↓j
    ld      (r3), r5
    cmpr    r6, r5
    bl      loc_18510
    mov     r5, r6
    mov     r4, r12
loc_18510:                              # CODE XREF: get_my_info_new+C4↑j
    addo    4, r3, r3
    addo    1, r4, r4
    cmpobne 4, r4, loc_184FC
    lda     0x40133333, r3
    cmpr    r6, r3
    bg      get_my_info
    shlo    0xC, 1, r13
    ldos    0x26(g7), r3
    and     3, r12, r12
    ldos    word_196C4[r12*2], r4
    cmpobne 0, r4, loc_18560
    shlo    0xF, 1, r5
    addo    r5, r4, r4
    addo    r5, r3, r3
    lda     0xFFFF, r5
    and     r5, r4, r4
    and     r5, r3, r3
loc_18560:                              # CODE XREF: get_my_info_new+100↑j
    addo    r13, r4, r14
    cmpobl  r14, r3, get_my_info
    subo    r13, r4, r14
    cmpobg  r14, r3, get_my_info
    ld      0x1250(g7), r15
    setbit  1, r15, r15
    st      r15, 0x1250(g7)
get_my_info:                            # CODE XREF: get_my_info_new+E8↑j
    ldob    0xA00(g7), r14  # Label from Fighting Vipers source
    cmpobne 4, r14, loc_185B4
    mov     0, r15
    stib    r15, 0xA00(g7)
    ld      0x1A4(g7), r5
    bbc     0xF, r5, loc_185B4
    clrbit  0xF, r5, r5
    ldob    rise_base, r3
    stob    r3, nagerenai_timer # nagerenai = "can't throw"
    st      r5, 0x1A4(g7)
loc_185B4:                              # CODE XREF: get_my_info_new+148↑j
    ldos    0x614(g7), r3   # P1_PARTS+0x614 P1_PARTS+0x624
    ldos    0x624(g7), r4
    or      r3, r4, r5
    ldos    0x61C(g7), r6
    stos    r5, 0x61C(g7)
    stos    r6, 0x60E(g7)
    ldos    0x618(g7), r4
    andnot  r5, r4, r3
    stos    r3, 0x628(g7)
    ld      0x1A4(g7), r4
    bbs     0xE, r4, loc_185EC
    bbs     0x10, r4, loc_185EC
    ldis    0x26(g7), r11
    bbc     6, r4, loc_18918
loc_185EC:                              # CODE XREF: get_my_info_new+19C↑j
    lda     0x800101, r15
    st      r15, (g11)[g12*1]
    lda     0x1B003636, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    mov     0xC, r15
    st      r15, (g11)[g12*1]
    lda     0x6800D0D, r15
    st      r15, (g11)[g12*1]
    lda     flt_1CFB0, g0
    lda     0x50E000, g1
    call    calc_gyang_from_fu_vec
    mov     g0, r11
    lda     0x1B003636, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    lda     0xB4, r15
    st      r15, (g11)[g12*1]
    lda     0x6800D0D, r15
    st      r15, (g11)[g12*1]
    lda     flt_1CFC8, g0
    call    calc_gyang_from_fu_vec2
    mov     g0, g2
    lda     0x1B003636, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    shlo    4, 9, r15
    st      r15, (g11)[g12*1]
    lda     0x6800D0D, r15
    st      r15, (g11)[g12*1]
    lda     flt_1CFC8, g0
    call    calc_gyang_from_fu_vec2
    mov     g0, g3
    lda     0x1000202, r15
    st      r15, (g11)[g12*1]
    ld      0x1A4(g7), r3
    bbs     0xE, r3, loc_186C0
    bbc     0x10, r3, loc_186F4
loc_186C0:                              # CODE XREF: get_my_info_new+278↑j
    ld      0x50E004, r4
    lda     0x3ECCCCCD, r5
    ld      0x804(g7), r15
    bbs     0xB, r15, loc_186DC
    setbit  0x1F, r5, r5
loc_186DC:                              # CODE XREF: get_my_info_new+294↑j
    cmpr    r4, r5
    ble     loc_186EC
    clrbit  0xB, r3, r3
    b       loc_186F0
# ---------------------------------------------------------------------------
loc_186EC:                              # CODE XREF: get_my_info_new+2A0↑j
    setbit  0xB, r3, r3
loc_186F0:                              # CODE XREF: get_my_info_new+2A8↑j
    st      r3, 0x1A4(g7)
loc_186F4:                              # CODE XREF: get_my_info_new+27C↑j
    ldt     0x2A8(g7), r4
    ldt     0x284(g7), r8
    ldt     0x1F4(g7), r12
    lda     0x15802B2B, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r8, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    st      r10, (g11)[g12*1]
    ld      (g11)[g12*1], r7
    st      r7, 0x69C(g7)
    mov     0, g0
    ld      gyang_ha_d, r15
    subr    r13, r5, r3
    clrbit  0x1F, r3, r3
    cmpibg  r3, r15, loc_18740
    or      1, g0, g0
loc_18740:                              # CODE XREF: get_my_info_new+2F8↑j
    subr    r13, r9, r3
    clrbit  0x1F, r3, r3
    cmpibg  r3, r15, loc_18750
    or      2, g0, g0
loc_18750:                              # CODE XREF: get_my_info_new+308↑j
    cmpobe  3, g0, loc_1887C
    cmpobe  0, g0, loc_18770
    ld      0x1A4(g7), r3
    bbs     0xE, r3, loc_18764
    bbc     0x10, r3, loc_18770
loc_18764:                              # CODE XREF: get_my_info_new+31C↑j
    cmpobe  2, g0, loc_1889C
    movt    r4, r8
    b       loc_1889C
# ---------------------------------------------------------------------------
loc_18770:                              # CODE XREF: get_my_info_new+314↑j
    ld      gyang_asi_h, r15
    subr    r5, r9, r3
    clrbit  0x1F, r3, r3
    st      r3, 0x6A0(g7)
    cmpibl  r3, r15, loc_18794
    ld      gyang_asi_d, r15
    cmpibg  r7, r15, loc_187B8
loc_18794:                              # CODE XREF: get_my_info_new+344↑j
    mov     1, r15
    stob    r15, 0x60D(g7)
    b       loc_18868
# ---------------------------------------------------------------------------
    ld      gyang_asi_d, r15
    cmpibg  r7, r15, loc_187B8
    mov     3, r15
    stob    r15, 0x60D(g7)
    b       loc_18868
# ---------------------------------------------------------------------------
loc_187B8:                              # CODE XREF: get_my_info_new+350↑j
    mov     0, r15
    stob    r15, 0x60D(g7)
    cmpr    r5, r9
    bg      loc_187EC
    lda     0x17802F2F, r15
    st      r15, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    st      r10, (g11)[g12*1]
    st      r8, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    ld      (g11)[g12*1], r11
    b       loc_18918
# ---------------------------------------------------------------------------
loc_187EC:                              # CODE XREF: get_my_info_new+384↑j
    lda     0x17802F2F, r15
    st      r15, (g11)[g12*1]
    st      r10, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r8, (g11)[g12*1]
    ld      (g11)[g12*1], r11
    b       loc_18918
# ---------------------------------------------------------------------------
    shlo    0x10, r3, r15
    shri    0x10, r15, r3
    ldos    0x50A0C8, r12
    subi    r12, 0, r15
    cmpi    r3, r15
    concmpi r3, r12
    be      loc_18850
    notbit  0xF, r3, r3
    shlo    0x10, r3, r15
    shri    0x10, r15, r3
    subi    r12, 0, r15
    cmpi    r3, r15
    concmpi r3, r12
    bne     loc_18860
    notbit  0xF, r7, r7
loc_18850:                              # CODE XREF: get_my_info_new+3EC↑j
    mov     0, r15
    stob    r15, 0x60D(g7)
    mov     r7, r11
    b       loc_18918
# ---------------------------------------------------------------------------
loc_18860:                              # CODE XREF: get_my_info_new+408↑j
    mov     1, r15
    stob    r15, 0x60D(g7)
loc_18868:                              # CODE XREF: get_my_info_new+35C↑j
    subo    g2, g3, r3
    shlo    0x10, r3, r3
    shri    0x11, r3, r3
    addo    g2, r3, r11
    b       loc_18918
# ---------------------------------------------------------------------------
loc_1887C:                              # CODE XREF: get_my_info_new:loc_18750↑j
    addr    r4, r8, r8
    addr    r6, r10, r10
    lda     0x3F000000, r13
    mulr    r13, r8, r8
    lda     0x3F000000, r13
    mulr    r13, r10, r10
loc_1889C:                              # CODE XREF: get_my_info_new:loc_18764↑j
    lda     0x17802F2F, r15
    st      r15, (g11)[g12*1]
    st      r14, (g11)[g12*1]
    st      r10, (g11)[g12*1]
    st      r8, (g11)[g12*1]
    st      r12, (g11)[g12*1]
    ld      (g11)[g12*1], r7
    mov     2, r15
    stob    r15, 0x60D(g7)
    mov     0, r11
    ld      0x50E004, r3
    chkbit  0x1F, r3
    alterbit 0xF, r11, r11
    ldt     0x50E00C, r4
    subr    r12, r8, r8
    mulr    r4, r8, r4
    subr    r14, r10, r10
    mulr    r6, r10, r6
    addr    r4, r6, r4
    bbs     0x1F, r4, loc_188FC
    notbit  0xF, r11, r11
loc_188FC:                              # CODE XREF: get_my_info_new+4B4↑j
    ld      0x1A4(g7), r3
    bbs     0xE, r3, loc_18908
    bbc     0x10, r3, loc_18914
loc_18908:                              # CODE XREF: get_my_info_new+4C0↑j
    chkbit  0xF, r11
    alterbit 0xB, r3, r3
    st      r3, 0x1A4(g7)
loc_18914:                              # CODE XREF: get_my_info_new+4C4↑j
    addo    r7, r11, r11
loc_18918:                              # CODE XREF: get_my_info_new+1A8↑j
    stis    r11, 0x616(g7)
    ld      0x1A4(g7), r3
    ld      0x0(g7), r4
    shro    0xF, r3, r3
    xor     r4, r3, r3
    chkbit  6, r3
    alterbit 0xA, r4, r4
    st      r4, 0x0(g7)
    lda     0x1F8(g7), r5
    ld      (r5), r4
    mov     0xF, r6
loc_18944:                              # CODE XREF: get_my_info_new+51C↓j
    addo    0xC, r5, r5
    ld      (r5), r3
    cmpr    r4, r3
    ble     loc_18958
    mov     r3, r4
loc_18958:                              # CODE XREF: get_my_info_new+510↑j
    cmpdeco 1, r6, r6
    bl      loc_18944
    st      r4, 0x6A4(g7)
    call    rob_check_stage
    ldis    0x5B4(g7), g0
    call    calc_stage_limit_dist
    st      g1, 0x5F8(g7)
    notbit  0xF, g0, g0
    call    calc_stage_limit_dist
    st      g1, 0x5FC(g7)
    ld      stage_x, r7
    ld      0x1F4(g7), r4
    ld      0x1FC(g7), r6
loc_18990:                              # DATA XREF: MAIN_DATA:026F329C↓o
    clrbit  0x1F, r4, r4
    clrbit  0x1F, r6, r6
    cmpibge r4, r6, loc_189A0
    mov     r6, r4
loc_189A0:                              # CODE XREF: get_my_info_new+558↑j
    subr    r4, r7, r3
    st      r3, 0x6A8(g7)
    ld      0x81C(g7), g0
    call    calc_land_time
    stos    g1, 0x5BC(g7)
    ld      fa_camera, r6
    ldis    0x26(r6), r13
    ldis    0x5B4(g7), r14
    subi    r13, r14, r4
    ld      0x0(g7), r5
    notbit  0xF, r4, r12
    chkbit  0xF, r12
    alterbit 1, r5, r5
    st      r5, 0x0(g7)
    mov     0, r11
    ld      0x1A4(g7), r7
    ldob    0x821(g7), r9
    ldos    0x828(g7), r10
    bbc     8, r7, loc_18A44
    ld      off_189FC[r9*4], r3
    bx      (r3)
# ---------------------------------------------------------------------------
off_189FC:      .long loc_18A20         # DATA XREF: get_my_info_new+5B0↑r
    .long loc_18A24
    .long loc_18A30
    .long loc_18A24
    .long loc_18A24
    .long loc_18A30
    .long loc_18A30
    .long loc_18A24
    .long loc_18A24
# ---------------------------------------------------------------------------
loc_18A20:                              # DATA XREF: get_my_info_new:off_189FC↑o
    setbit  2, r11, r11
loc_18A24:                              # DATA XREF: get_my_info_new+5C0↑o
    bbs     9, r10, loc_18A3C
    setbit  0, r11, r11
    b       loc_18A3C
# ---------------------------------------------------------------------------
loc_18A30:                              # DATA XREF: get_my_info_new+5C4↑o
    setbit  3, r11, r11
    bbs     9, r10, loc_18A3C
    setbit  1, r11, r11
loc_18A3C:                              # CODE XREF: get_my_info_new:loc_18A24↑j
    cmpobne 0, r11, loc_18A44
    setbit  0xF, r11, r11
loc_18A44:                              # CODE XREF: get_my_info_new+5AC↑j
    st      r11, 0x6D4(g7)
    ld      0x864(g7), r14
    cmpobe  0, r14, turn_on_me_muken
    ldos    0x868(g7), r13
    ldos    0x5BC(g7), r14
    cmpibge r13, r14, turn_on_me_muken
    ldos    0x878(g7), r13
    ldos    0x1AA(g7), r14
    cmpobg  r13, r14, turn_on_me_muken
    ld      0x0(g7), r14
    setbit  0xE, r14, r15
    st      r15, 0x0(g7)
    b       loc_18A84
# ---------------------------------------------------------------------------
turn_on_me_muken:                       # CODE XREF: get_my_info_new+60C↑j
    ld      0x0(g7), r14    # r14 = P1_PARTS or P2_PARTS
    clrbit  14, r14, r15
    st      r15, 0x0(g7)
loc_18A84:                              # CODE XREF: get_my_info_new+634↑j
    ret
# End of function get_my_info_new
# =============== S U B R O U T I N E =======================================
get_en_info:                            # CODE XREF: get_game_info+50↑p
    mov     0, r10          # Label from Virtua Fighter 2 source
    mov     0, r12
    mov     0, g1
    ld      0x1A4(g7), r7
    ld      0x1A4(g8), r8
    ld      0x190(g7), g0
    ld      0x10(g0), g0
    lda     0x15802B2B, r15
    st      r15, (g11)[g12*1]
    ld      0x1F4(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x1F4(g8), r15
    st      r15, (g11)[g12*1]
    ld      0x1FC(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x1FC(g8), r15
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r9
    ld      0x5F4(g7), r15
    st      r15, 0x7D4(g7)
    st      r9, 0x5F4(g7)
    lda     0x15802B2B, r15
    st      r15, (g11)[g12*1]
    ld      0x1F4(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x1E0C(g8), r15
    st      r15, (g11)[g12*1]
    ld      0x1FC(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x1E14(g8), r15
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    ld      0x5F4(g7), r4
    lda     0x447A0000, r13
    mulr    r13, r3, r3
    lda     0x447A0000, r13
    mulr    r13, r4, r4
    lda     0xC001818, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    lda     0xC001818, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    ld      (g11)[g12*1], r4
    lda     0xB801717, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    lda     0xB801717, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    ld      (g11)[g12*1], r4
    lda     0x3A83126F, r13
    mulr    r13, r3, r3
    lda     0x3A83126F, r13
    mulr    r13, r4, r4
    cmpr    r3, r4
    bg      loc_18BB0
    be      loc_18BB4
    setbit  8, r10, r10
    b       loc_18BB4
# ---------------------------------------------------------------------------
loc_18BB0:                              # CODE XREF: get_en_info+118↑j
    setbit  7, r10, r10
loc_18BB4:                              # CODE XREF: get_en_info+11C↑j
    bbc     4, r8, loc_18C5C
    ld      0x1F8(g8), r3
    ld      0x1E10(g8), r4
    lda     0x447A0000, r13
    mulr    r13, r3, r3
    lda     0x447A0000, r13
    mulr    r13, r4, r4
    lda     0xC001818, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    lda     0xC001818, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    ld      (g11)[g12*1], r4
    lda     0xB801717, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    lda     0xB801717, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    ld      (g11)[g12*1], r4
    lda     0x3A83126F, r13
    mulr    r13, r3, r3
    lda     0x3A83126F, r13
    mulr    r13, r4, r4
    cmpr    r3, r4
    bg      loc_18C58
    be      loc_18C5C
    setbit  0xA, r10, r10
    b       loc_18C5C
# ---------------------------------------------------------------------------
loc_18C58:                              # CODE XREF: get_en_info+1C0↑j
    setbit  9, r10, r10
loc_18C5C:                              # CODE XREF: get_en_info:loc_18BB4↑j
    lda     0x17802F2F, r15
    st      r15, (g11)[g12*1]
    ld      0x1FC(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x1FC(g8), r15
    st      r15, (g11)[g12*1]
    ld      0x1F4(g8), r15
    st      r15, (g11)[g12*1]
    ld      0x1F4(g7), r15
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r11
    lda     0x3ECCCCCD, r3
    cmpibg  r9, r3, loc_18D00
    bbc     4, r7, loc_18CAC
    ld      0x2C(g7), r4
    ld      0x34(g7), r5
    cmpobne 0, r4, loc_18CC0
    cmpobne 0, r5, loc_18CC0
loc_18CAC:                              # CODE XREF: get_en_info+210↑j
    bbc     4, r8, loc_18D00
    ld      0x2C(g7), r4
    ld      0x34(g7), r5
    cmpobne 0, r4, loc_18CC0
    cmpobe  0, r5, loc_18D00
loc_18CC0:                              # CODE XREF: get_en_info+21C↑j
    lda     0x17802F2F, r15
    st      r15, (g11)[g12*1]
    mov     0, r15
    st      r15, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    subo    r11, r3, r4
    shlo    0xE, 1, r13
    addi    r13, r4, r4
    bbc     0xF, r4, loc_18CF8
    notbit  0xF, r3, r3
loc_18CF8:                              # CODE XREF: get_en_info+268↑j
    mov     r3, r11
    b       loc_18D0C
# ---------------------------------------------------------------------------
loc_18D00:                              # CODE XREF: get_en_info+20C↑j
    ld      en_ang_dist, r3
    cmpible r9, r3, loc_18D10
loc_18D0C:                              # CODE XREF: get_en_info+274↑j
    stis    r11, 0x5B6(g7)
loc_18D10:                              # CODE XREF: get_en_info+280↑j
    ld      0x1A4(g7), r15
    bbc     4, r15, loc_18D70
    ldt     0x1F4(g7), r4
    stt     r4, 0x734(g7)
    ld      0x30(g7), r4
    ld      0x5CC(g7), r5
    ld      0x50A000, r6
    ld      0x3C(g0), r3
loc_18D34:                              # CODE XREF: get_en_info+2E4↓j
    ld      0x2C(g7), r13
    ld      0x734(g7), r14
    addr    r13, r14, r15
    st      r15, 0x734(g7)
    ld      0x34(g7), r13
    ld      0x73C(g7), r14
    addr    r13, r14, r15
    st      r15, 0x73C(g7)
    subr    r6, r4, r4
    addr    r5, r4, r4
    ld      0x738(g7), r14
    addr    r4, r14, r15
    st      r15, 0x738(g7)
    cmpdeco 1, r3, r3
    bl      loc_18D34
loc_18D70:                              # CODE XREF: get_en_info+28C↑j
    ld      0x1A4(g8), r15
    bbc     4, r15, loc_18DD0
    ldt     0x1F4(g8), r4
    stt     r4, 0x734(g8)
    ld      0x30(g8), r4
    ld      0x5CC(g8), r5
    ld      0x50A000, r6
    ld      0x3C(g0), r3
loc_18D94:                              # CODE XREF: get_en_info+344↓j
    ld      0x2C(g8), r13
    ld      0x734(g8), r14
    addr    r13, r14, r15
    st      r15, 0x734(g8)
    ld      0x34(g8), r13
    ld      0x73C(g8), r14
    addr    r13, r14, r15
    st      r15, 0x73C(g8)
    subr    r6, r4, r4
    addr    r5, r4, r4
    ld      0x738(g8), r14
    addr    r4, r14, r15
    st      r15, 0x738(g8)
    cmpdeco 1, r3, r3
    bl      loc_18D94
loc_18DD0:                              # CODE XREF: get_en_info+2EC↑j
    ld      0x1F4(g7), r3
    ld      0x1FC(g7), r4
    ld      0x1A4(g7), r15
    bbc     4, r15, loc_18DE8
    ld      0x734(g7), r3
    ld      0x73C(g7), r4
loc_18DE8:                              # CODE XREF: get_en_info+354↑j
    ld      0x1F4(g8), r5
    ld      0x1FC(g8), r6
    ld      0x1A4(g8), r15
    bbc     4, r15, loc_18E00
    ld      0x734(g8), r5
    ld      0x73C(g8), r6
loc_18E00:                              # CODE XREF: get_en_info+36C↑j
    lda     0x15802B2B, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    st      r3, 0x740(g7)
    st      r3, 0x740(g8)
    ld      0x0(g8), r15
    bbc     0x1D, r15, loc_18E34
    setbit  6, r10, r10
loc_18E34:                              # CODE XREF: get_en_info+3A4↑j
    ldis    0x5B4(g7), r6
    subi    r6, r11, r4
    shlo    0xE, 1, r13
    addi    r13, r4, r4
    bbc     0xF, r4, loc_18E8C
    setbit  0, r10, r10
    ld      0x5B8(g7), r3
    bbs     0, r3, loc_18E8C
    xor     r10, r3, r3
    bbc     0, r10, loc_18E8C
    ld      0x5F4(g7), r3
    lda     0x3ECCCCCD, r4
    cmpr    r3, r4
    bg      loc_18E8C
    or      r7, r8, r3
    bbs     4, r3, loc_18E88
    ld      mod_fa_coli, r3
    ld      0x164(r3), r3
    cmpobe  0, r3, loc_18E8C
loc_18E88:                              # CODE XREF: get_en_info+3EC↑j
    clrbit  0, r10, r10
loc_18E8C:                              # CODE XREF: get_en_info+3BC↑j
    ldis    0x5B4(g8), r6
    subi    r6, r11, r4
    shlo    0xE, 1, r13
    addi    r13, r4, r4
    bbs     0xF, r4, loc_18EA4
    setbit  1, r10, r10
loc_18EA4:                              # CODE XREF: get_en_info+414↑j
    addo    0x1F, 8, r13
    ldob    0x19F(g7), r14
    cmpobne r13, r14, loc_18EB4
    bbs     0x12, r12, loc_18EE0
loc_18EB4:                              # CODE XREF: get_en_info+424↑j
    addo    0x1F, 9, r13
    ldob    0x19F(g7), r14
    cmpobne r13, r14, loc_18EC4
    bbs     6, r12, loc_18EE0
loc_18EC4:                              # CODE XREF: get_en_info+434↑j
    addo    0x1F, 9, r13
    ldob    0x19F(g7), r14
    cmpobne r13, r14, loc_18ED4
    bbs     7, r12, loc_18EE0
loc_18ED4:                              # CODE XREF: get_en_info+444↑j
    addo    0x1F, 0xA, r13
    ldob    0x19F(g7), r14
    cmpobne r13, r14, loc_18EF8
loc_18EE0:                              # CODE XREF: get_en_info+428↑j
    mov     1, g1
    bbs     1, r7, loc_18EF8
    bbc     8, r7, loc_18EF8
    ld      0x0(g8), r15
    bbs     0x1D, r15, loc_18EF8
    setbit  0xF, r12, r12
loc_18EF8:                              # CODE XREF: get_en_info+454↑j
    lda     0x4003D010, r13
    and     r13, r7, r3
    cmpobne 0, r3, loc_18F8C
    lda     0x40009010, r13
    and     r13, r8, r3
    cmpobne 0, r3, loc_18F8C
    ldos    0x1244(g7), r14
    cmpobe  0, r14, loc_18F8C
    ld      0x70C(g7), r15
    bbs     2, r15, loc_18F8C
    ld      0x70C(g8), r15
    bbs     2, r15, loc_18F8C
    ldis    0x5B4(g7), r14
    subi    r11, r14, r3
    shlo    0x10, r3, r15
    shri    0x10, r15, r3
    lda     0x1554, r4
    subi    r4, 0, r15
    cmpi    r3, r15
    concmpi r3, r4
    bne     loc_18F8C
    ldis    0x5B4(g8), r14
    subi    r11, r14, r3
    shlo    0x10, r3, r15
    shri    0x10, r15, r3
    subi    r4, 0, r15
    cmpi    r3, r15
    concmpi r3, r4
    be      loc_18F84
    setbit  0xA, r12, r12
    b       loc_18F8C
# ---------------------------------------------------------------------------
loc_18F84:                              # CODE XREF: get_en_info+4F0↑j
    setbit  0xB, r12, r12
    b       loc_18F8C
# ---------------------------------------------------------------------------
loc_18F8C:                              # CODE XREF: get_en_info+47C↑j
    bbs     4, r7, loc_19260
    ld      0x0(g8), r15
    bbs     0x1D, r15, loc_19260
    ld      0x70C(g8), r15
    bbs     2, r15, loc_19260
    lda     0x40089008, r13
    and     r13, r8, r3
    cmpobne 0, r3, loc_19260
    shlo    0xE, 5, r13
    and     r13, r8, r3
    cmpobne 0, r3, loc_1918C
    bbs     0xF, r12, loc_18FCC
    ldob    nagerenai_timer, r14 # nagerenai = "can't throw"
    cmpobne 0, r14, loc_19260
loc_18FCC:                              # CODE XREF: get_en_info+534↑j
    ldis    0x5B4(g8), r13
    ldis    0x5B4(g7), r14
    subi    r13, r14, r3
    shlo    0xF, 1, r13
    addi    r13, r3, r3
    lda     0xFFFF, r13
    and     r13, r3, r3
    lda     loc_5550, r13
    cmpobg  r13, r3, loc_19008
    lda     loc_AAA0, r13
    cmpobl  r13, r3, loc_19008
    b       loc_19068
# ---------------------------------------------------------------------------
loc_19008:                              # CODE XREF: get_en_info+56C↑j
    bbc     1, r8, loc_1900C
loc_1900C:                              # CODE XREF: get_en_info:loc_19008↑j
    cmpobe  0, g1, loc_19068
    lda     off_1018, r13
    and     r13, r8, r3
    cmpobne 0, r3, loc_19068
    b       loc_19050
# ---------------------------------------------------------------------------
    lda     0x4003614, r13
    and     r13, r8, r3
    cmpobe  0, r3, loc_19068
    and     0x10, r8, r3
    cmpobne 0, r3, loc_19068
    shlo    0xC, 1, r13
    and     r13, r8, r3
    cmpobne 0, r3, loc_19068
    ld      0x0(g8), r15
    bbs     8, r15, loc_19068
loc_19050:                              # CODE XREF: get_en_info+598↑j
    ld      0x0(g0), r3
    ld      0x5F4(g7), r4
    cmpr    r4, r3
    bg      loc_19068
    cmpobe  0, g1, loc_19068
    setbit  0xC, r12, r12
loc_19068:                              # CODE XREF: get_en_info+57C↑j
    ldis    0x5B4(g7), r14
    subi    r11, r14, r3
    shlo    0x10, r3, r15
    shri    0x10, r15, r3
    lda     0x1554, r4
    subi    r4, 0, r15
    cmpi    r3, r15
    concmpi r3, r4
    bne     loc_19260
    ldis    0x5B4(g8), r14
    subi    r11, r14, r3
    shlo    0x10, r3, r15
    shri    0x10, r15, r3
    subi    r4, 0, r15
    cmpi    r3, r15
    concmpi r3, r4
    be      loc_1914C
    notbit  0xF, r3, r3
    shlo    0x10, r3, r15
    shri    0x10, r15, r3
    subi    r4, 0, r15
    cmpi    r3, r15
    concmpi r3, r4
    bne     loc_19260
    mov     0, r4
    bbc     1, r8, loc_190DC
    ld      0x844(g8), r15
    bbs     0x1B, r15, loc_1911C
loc_190DC:                              # CODE XREF: get_en_info+648↑j
    lda     0x4003614, r13
    and     r13, r8, r3
    cmpobe  0, r3, loc_19260
    and     0x10, r8, r3
    cmpobne 0, r3, loc_19224
    shlo    0xC, 1, r13
    and     r13, r8, r3
    cmpobne 0, r3, loc_19260
    ld      0x0(g8), r15
    bbs     8, r15, loc_19134
    setbit  5, r12, r12
    ld      0x0(g0), r3
    ld      0x5F4(g7), r4
    cmpr    r4, r3
    bg      loc_19120
loc_1911C:                              # CODE XREF: get_en_info+650↑j
    setbit  0, r12, r12
loc_19120:                              # CODE XREF: get_en_info+690↑j
    ld      4(g0), r3
    cmpr    r4, r3
    bg      loc_19260
    setbit  1, r12, r12
    b       loc_19260
# ---------------------------------------------------------------------------
loc_19134:                              # CODE XREF: get_en_info+67C↑j
    ld      8(g0), r3
    ld      0x5F4(g7), r4
    cmpr    r4, r3
    bg      loc_19260
    setbit  2, r12, r12
    b       loc_19260
# ---------------------------------------------------------------------------
loc_1914C:                              # CODE XREF: get_en_info+624↑j
    lda     0x4003614, r13
    and     r13, r8, r3
    cmpobe  0, r3, loc_19260
    and     0x10, r8, r3
    cmpobne 0, r3, loc_19260
    ld      0xC(g0), r3
    ld      0x5F4(g7), r4
    cmpr    r4, r3
    bg      loc_19260
    ld      0x0(g8), r15
    bbs     8, r15, loc_19184
    setbit  3, r12, r12
    b       loc_19260
# ---------------------------------------------------------------------------
loc_19184:                              # CODE XREF: get_en_info+6F0↑j
    setbit  4, r12, r12
    b       loc_19260
# ---------------------------------------------------------------------------
loc_1918C:                              # CODE XREF: get_en_info+530↑j
    bbc     0x10, r8, loc_19260
    ldis    0x5B4(g7), r14
    subi    r11, r14, r3
    shlo    0x10, r3, r15
    shri    0x10, r15, r3
    lda     loc_2AA8, r4
    subi    r4, 0, r15
    cmpi    r3, r15
    concmpi r3, r4
    bne     loc_19260
    ldis    0x5B4(g8), r14
    subi    r11, r14, r3
    shlo    0x10, r3, r15
    shri    0x10, r15, r3
    subi    r4, 0, r15
    cmpi    r3, r15
    concmpi r3, r4
    be      loc_1920C
    notbit  0xF, r3, r3
    shlo    0x10, r3, r15
    shri    0x10, r15, r3
    subi    r4, 0, r15
    cmpi    r3, r15
    concmpi r3, r4
    bne     loc_19260
    ld      0x38(g0), r3
    ld      0x5F4(g7), r4
    cmpr    r4, r3
    bg      loc_19260
    setbit  6, r12, r12
    b       loc_19260
# ---------------------------------------------------------------------------
loc_1920C:                              # CODE XREF: get_en_info+74C↑j
    ld      0x38(g0), r3
    ld      0x5F4(g7), r4
    cmpr    r4, r3
    bg      loc_19260
    setbit  7, r12, r12
    b       loc_19260
# ---------------------------------------------------------------------------
loc_19224:                              # CODE XREF: get_en_info+668↑j
    ld      0x2C(g0), r3
    ld      0x740(g7), r4
    cmpr    r4, r3
    bg      loc_19260
    ld      0x0(g8), r15
    bbs     3, r15, loc_19260
    ld      0x738(g8), r3
    ld      0x30(g0), r4
    cmpr    r3, r4
    bg      loc_19260
    ld      0x34(g0), r4
    cmpr    r3, r4
    bl      loc_19260
    setbit  0x14, r12, r12
    b       loc_19260
# ---------------------------------------------------------------------------
loc_19260:                              # CODE XREF: get_en_info:loc_18F8C↑j
    subo    1, 0, r15
    st      r15, 0x750(g7)
    or      r7, r8, r15
    lda     0x650(g8), r3
    mov     0, r4
    mov     0, r15
    lda     0x42C80000, r6
loc_19280:                              # CODE XREF: get_en_info+814↓j
    ld      (r3), r5
    cmpr    r6, r5
    bl      loc_19294
    mov     r5, r6
    mov     r4, r15
loc_19294:                              # CODE XREF: get_en_info+800↑j
    addo    4, r3, r3
    addo    1, r4, r4
    cmpobne 4, r4, loc_19280
    lda     0x3F800000, r3
    cmpr    r6, r3
    bg      loc_19324
    shlo    0xC, 1, r13
    ld      mod_fa_coli, r3
    ldos    0x1E0(r3), r3
    ldos    word_196BC[r15*2], r4
    ldob    4(g7), r14
    cmpobe  0, r14, loc_192D8
    ldos    word_196CC[r15*2], r4
loc_192D8:                              # CODE XREF: get_en_info+844↑j
    cmpobne 0, r4, loc_192F8
    shlo    0xF, 1, r5
    addo    r5, r4, r4
    addo    r5, r3, r3
    lda     0xFFFF, r5
    and     r5, r4, r4
    and     r5, r3, r3
loc_192F8:                              # CODE XREF: get_en_info:loc_192D8↑j
    addo    r13, r4, r14
    cmpobl  r14, r3, loc_19324
    subo    r13, r4, r14
    cmpobg  r14, r3, loc_19324
    st      r15, 0x750(g7)
    ldl     word_1969C[r15*8], r4
    mulr    r4, r6, r4
    mulr    r5, r6, r5
    stl     r4, 0x754(g7)
    setbit  8, r12, r12
loc_19324:                              # CODE XREF: get_en_info+824↑j
    lda     0x650(g7), r3
    mov     0, r4
    mov     0, r15
    lda     0x42C80000, r6
loc_19338:                              # CODE XREF: get_en_info+8CC↓j
    ld      (r3), r5
    cmpr    r6, r5
    bl      loc_1934C
    mov     r5, r6
    mov     r4, r15
loc_1934C:                              # CODE XREF: get_en_info+8B8↑j
    addo    4, r3, r3
    addo    1, r4, r4
    cmpobne 4, r4, loc_19338
    lda     0x3F800000, r3
    cmpr    r6, r3
    bg      loc_193DC
    shlo    0xC, 1, r13
    ld      mod_fa_coli, r3
    ldos    0x1E0(r3), r3
    ldos    word_196C4[r15*2], r4
    ldob    4(g7), r14
    cmpobe  0, r14, loc_19390
    ldos    word_196D4[r15*2], r4
loc_19390:                              # CODE XREF: get_en_info+8FC↑j
    cmpobne 0, r4, loc_193B0
    shlo    0xF, 1, r5
    addo    r5, r4, r4
    addo    r5, r3, r3
    lda     0xFFFF, r5
    and     r5, r4, r4
    and     r5, r3, r3
loc_193B0:                              # CODE XREF: get_en_info:loc_19390↑j
    addo    r13, r4, r14
    cmpobl  r14, r3, loc_193DC
    subo    r13, r4, r14
    cmpobg  r14, r3, loc_193DC
    st      r15, 0x750(g7)
    ldl     word_1969C[r15*8], r4
    mulr    r4, r6, r4
    mulr    r5, r6, r5
    stl     r4, 0x754(g7)
    setbit  9, r12, r12
loc_193DC:                              # CODE XREF: get_en_info+8DC↑j
    bbs     0xF, r8, loc_19404
    bbs     8, r8, loc_19404
    bbs     0x10, r8, loc_19400
    ld      0x70C(g8), r15
    bbs     2, r15, loc_19400
    bbc     0xE, r8, loc_19404
    bbc     4, r8, loc_19400
    ldos    0x5BC(g7), r14
    cmpobne 0, r14, loc_19404
loc_19400:                              # CODE XREF: get_en_info+95C↑j
    setbit  5, r10, r10
loc_19404:                              # CODE XREF: get_en_info:loc_193DC↑j
    bbc     8, r8, loc_194A8
    bbc     1, r8, loc_194A8
    ldis    0x5B4(g7), r14
    subi    r11, r14, r3
    shlo    0x10, r3, r15
    shri    0x10, r15, r3
    lda     0x1554, r4
    subi    r4, 0, r15
    cmpi    r3, r15
    concmpi r3, r4
    bne     loc_194A8
    ldis    0x5B4(g8), r14
    subi    r11, r14, r3
    notbit  0xF, r3, r3
    shlo    0x10, r3, r15
    shri    0x10, r15, r3
    subi    r4, 0, r15
    cmpi    r3, r15
    concmpi r3, r4
    bne     loc_194A8
    lda     0x3FF8000, r5
    lda     0x40000000, r3
    cmpible r9, r3, loc_19474
    clrbit  0x16, r5, r5
    clrbit  0x17, r5, r5
loc_19474:                              # CODE XREF: get_en_info+9E0↑j
    lda     0x3FE66666, r3
    cmpible r9, r3, loc_1948C
    clrbit  0x12, r5, r5
    clrbit  0x15, r5, r5
    clrbit  0x13, r5, r5
loc_1948C:                              # CODE XREF: get_en_info+9F4↑j
    lda     0x3FCCCCCD, r3
    cmpible r9, r3, loc_1949C
    clrbit  0x14, r5, r5
loc_1949C:                              # CODE XREF: get_en_info+A0C↑j
    ld      0x844(g8), r3
    and     r5, r3, r3
    or      r3, r10, r10
loc_194A8:                              # CODE XREF: get_en_info:loc_19404↑j
    shlo    0x1A, 0xF, r13
    ld      0x844(g8), r14
    and     r13, r14, r3
    cmpobe  0, r3, loc_194C8
    ldos    0x84E(g8), r13
    ldos    0x1AA(g8), r14
    cmpobl  r13, r14, loc_194C8
    or      r3, r10, r10
loc_194C8:                              # CODE XREF: get_en_info+A2C↑j
    lda     0xC0000000, r13
    ld      0x844(g8), r14
    and     r13, r14, r3
    or      r3, r10, r10
    shlo    0xC, r10, r3
    shro    5, r10, r3
    ld      0x0(g7), r4
    xor     r4, r3, r3
    chkbit  0xA, r3
    alterbit 3, r10, r10
    ld      0x5B8(g8), r15
    bbs     1, r15, loc_19514
    bbc     0xE, r8, loc_19504
    bbs     4, r8, loc_19514
loc_19504:                              # CODE XREF: get_en_info+A74↑j
    ld      0x5F4(g7), r13
    ld      flt_1D000, r14
    cmpibl  r13, r14, loc_19518
loc_19514:                              # CODE XREF: get_en_info+A70↑j
    setbit  2, r10, r10
loc_19518:                              # CODE XREF: get_en_info+A88↑j
    ld      0x0(g7), r3
    ld      0x0(g8), r4
    xor     r3, r4, r3
    shlo    0xF, r3, r3
    xor     r7, r3, r3
    xor     r8, r3, r3
    bbc     0x15, r3, loc_19538
    setbit  4, r10, r10
loc_19538:                              # CODE XREF: get_en_info+AA8↑j
    ld      0x1A4(g7), r15
    bbc     4, r15, loc_19668
    ld      0x0(g8), r15
    bbs     0x1D, r15, loc_19668
    ldis    0x5B4(g7), r14
    subi    r11, r14, r3
    shlo    0x10, r3, r15
    shri    0x10, r15, r3
    lda     0x1554, r4
    subi    r4, 0, r15
    cmpi    r3, r15
    concmpi r3, r4
    bne     loc_19668
    ldis    0x5B4(g8), r14
    subi    r11, r14, r3
    shlo    0x10, r3, r15
    shri    0x10, r15, r3
    subi    r4, 0, r15
    cmpi    r3, r15
    concmpi r3, r4
    be      loc_19668
    notbit  0xF, r3, r3
    shlo    0x10, r3, r15
    shri    0x10, r15, r3
    subi    r4, 0, r15
    cmpi    r3, r15
    concmpi r3, r4
    bne     loc_19668
    lda     dword_DD010, r13
    and     r13, r8, r3
    cmpobne 0, r3, loc_195F8
    ld      0x20(g0), r3
    ld      0x5F4(g7), r4
    cmpr    r4, r3
    bg      loc_19664
    ld      0x0(g7), r15
    bbs     3, r15, loc_19668
    ld      0x24(g0), r3
    ld      0x1F8(g7), r4
    cmpr    r4, r3
    bg      loc_19668
    ld      0x28(g0), r3
    cmpr    r4, r3
    bl      loc_19668
    setbit  0x12, r12, r12
    b       loc_19668
# ---------------------------------------------------------------------------
loc_195F8:                              # CODE XREF: get_en_info+B30↑j
    shlo    0xF, 0x1B, r13
    and     r13, r8, r3
    cmpobne 0, r3, loc_19668
    and     0x10, r8, r3
    cmpobe  0, r3, loc_19668
    ld      0x10(g0), r3
    ld      0x5F4(g7), r4
    cmpr    r4, r3
    bg      loc_19664
    ld      0x1C(g0), r3
    ld      0x1F8(g8), r4
    cmpr    r4, r3
    bl      loc_19664
    ld      0x14(g0), r3
    ld      0x0(g7), r15
    bbs     3, r15, loc_1963C
    ld      0x18(g0), r3
loc_1963C:                              # CODE XREF: get_en_info+BAC↑j
    ld      0x1F8(g7), r4
    cmpr    r4, r3
    bl      loc_19664
    ld      0x1F8(g8), r3
    subr    r4, r3, r3
    clrbit  0x1F, r3, r3
    ld      0x40(g0), r4
    cmpr    r3, r4
    bg      loc_19664
    setbit  0x10, r12, r12
loc_19664:                              # CODE XREF: get_en_info+B40↑j
    b       loc_19668
# ---------------------------------------------------------------------------
loc_19668:                              # CODE XREF: get_en_info+AB4↑j
    st      r10, 0x5B8(g7)
    st      r12, 0x720(g7)
    ldob    0x19F(g8), r14
    cmpobne 0x12, r14, loc_19698 # return
    ldos    0x1AA(g7), r3
    ldos    0x80A(g7), r4
    subo    1, r4, r4
    cmpobne r3, r4, loc_19698 # return
    lda     0x3FB33333, r3
    cmpibg  r9, r3, loc_19698 # return
    call    sub_19888
loc_19698:                              # CODE XREF: get_en_info+BEC↑j
    ret                     # return
# End of function get_en_info
# ---------------------------------------------------------------------------
word_1969C:     .short 0                # DATA XREF: get_en_info+884↑r
    .short 0x3F80
    .short 0
    .short 0
    .short 0
    .short 0xBF80
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0x3F80
    .short 0
    .short 0
    .short 0
    .short 0xBF80
word_196BC:     .short 0xC000           # DATA XREF: get_my_info_new+5C↑r
    .short 0x4000
    .short 0
    .short 0x8000
word_196C4:     .short 0x4000           # DATA XREF: get_my_info_new+F8↑r
    .short 0xC000
    .short 0x8000
    .short 0
word_196CC:     .short 0x4000           # DATA XREF: get_en_info+848↑r
    .short 0xC000
    .short 0x8000
    .short 0
word_196D4:     .short 0xC000           # DATA XREF: get_en_info+900↑r
    .short 0x4000
    .short 0
    .short 0x8000
        .section 1980C
# =============== S U B R O U T I N E =======================================
sub_1980C:                              # CODE XREF: ROM:00013D78↑p
    ld      0x0(g7), r9
    bbc     2, r9, loc_19884
    ldob    0x83F(g7), r14
    bbs     0, r14, loc_19860
    lda     0x2D805B5B, r15
    st      r15, (g11)[g12*1]
    ldis    0x26(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x80(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x88(g7), r15
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    ld      (g11)[g12*1], r4
    ld      0x18(g7), r14
    subr    r3, r14, r15
    st      r15, 0x18(g7)
    ld      0x20(g7), r14
    subr    r4, r14, r15
    st      r15, 0x20(g7)
loc_19860:                              # CODE XREF: sub_1980C+C↑j
    ld      0x1C(g7), r13
    ld      0x1F8(g7), r14
    subr    r13, r14, r15
    st      r15, 0x84(g7)
    clrbit  2, r9, r9
    st      r9, 0x0(g7)
    ld      0x1A4(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x1A4(g7)
loc_19884:                              # CODE XREF: sub_1980C+4↑j
    ret
# End of function sub_1980C
# =============== S U B R O U T I N E =======================================
sub_19888:                              # CODE XREF: get_en_info+C0C↑p
    ldos    0x19C(g8), r4
    mov     r4, g0
    mov     5, g1
    call    calc_mht_adr
    ldos    1(g0), r3
    bbc     0xF, r4, loc_198A4
    notbit  0xF, r3, r3
loc_198A4:                              # CODE XREF: sub_19888+14↑j
    shlo    0x18, 0xD, r13
    addi    r13, r3, r15
    st      r15, 0x198(g7)
    ld      0x1C(g8), r3
    st      r3, 0x1C(g7)
    call    sub_1980C
    ldib    3(g0), r15
    stib    r15, 0x822(g7)
    shlo    0x1A, 3, r13
    addi    r13, r4, r15
    st      r15, 0x198(g8)
    ld      0x0(g8), r15
    clrbit  4, r15, r15
    st      r15, 0x0(g8)
    ld      0x1A4(g7), r15
    clrbit  0x15, r15, r15
    st      r15, 0x1A4(g7)
    ld      0x0(g8), r3
    ld      0x0(g7), r4
    chkbit  0xA, r3
    alterbit 6, r4, r4
    st      r4, 0x0(g7)
    ret
# End of function sub_19888
# =============== S U B R O U T I N E =======================================
calc_land_time:                         # CODE XREF: ROM:000145E4↑p
    mov     0, g1           # Label from Virtua Fighter 2 source
    ld      0x0(g7), r15
    bbc     2, r15, loc_199F8
    ld      0x50A000, r3
    ld      0x1A4(g7), r15
    bbc     0xE, r15, loc_19930
    ld      flt_1D290, r13
    ld      0x50A000, r14
    mulr    r13, r14, r3
loc_19930:                              # CODE XREF: calc_land_time+18↑j
    ld      0x5CC(g7), r13
    subr    r13, r3, r5
    lda     0x3F000000, r13
    mulr    r13, r5, r4
    ld      0x30(g7), r13
    subr    r13, r4, r6
    ld      0x1F8(g7), r14
    subr    g0, r14, r4
    mulr    r5, r4, r4
    lda     0x40000000, r13
    mulr    r13, r4, r4
    mulr    r6, r6, r3
    addr    r3, r4, r4
    lda     0xD001A1A, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    ld      (g11)[g12*1], r4
    subr    r6, r4, r4
    divr    r5, r4, r4
    lda     0xC001818, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    ld      (g11)[g12*1], g1
    lda     0xB801717, r15
    st      r15, (g11)[g12*1]
    st      g1, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    lda     0x3F800000, r14
    addr    r3, r14, r4
    lda     0x3F000000, r13
    mulr    r13, r4, r4
    mulr    r4, r5, r4
    ld      0x30(g7), r14
    subr    r4, r14, r4
    mulr    r3, r4, r4
    ld      0x1F8(g7), r13
    addr    r13, r4, r4
    lda     0x3CA3D70A, r13
    subr    r13, r4, r4
    cmpr    r4, g0
    ble     loc_199F8
    addi    1, g1, g1
loc_199F8:                              # CODE XREF: calc_land_time+8↑j
    ret
# End of function calc_land_time
# =============== S U B R O U T I N E =======================================
calc_stage_limit_dist:                  # CODE XREF: get_my_info_new+52C↑p
    subi    g0, 0, r12      # Label from Virtua Fighter 2 source
    lda     0x10802121, r15
    st      r15, (g11)[g12*1]
    st      r12, (g11)[g12*1]
    ld      (g11)[g12*1], r5
    lda     0x11002222, r15
    st      r15, (g11)[g12*1]
    st      r12, (g11)[g12*1]
    ld      (g11)[g12*1], r6
    ld      stage_x, r7
    lda     0x461C4000, r8
    mov     r8, r9
    ld      0x1F4(g7), r3
    cmpibe  0, r5, loc_19A70
    bl      loc_19A4C
    notbit  0x1F, r3, r3
loc_19A4C:                              # CODE XREF: calc_stage_limit_dist+48↑j
    subr    r3, r7, r3
    divr    r5, r6, r4
    mulr    r3, r4, r4
    lda     0x16802D2D, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    ld      (g11)[g12*1], r8
loc_19A70:                              # CODE XREF: calc_stage_limit_dist+44↑j
    ld      0x1FC(g7), r4
    cmpibe  0, r6, loc_19AA4
    bl      loc_19A80
    notbit  0x1F, r4, r4
loc_19A80:                              # CODE XREF: calc_stage_limit_dist+7C↑j
    subr    r4, r7, r4
    divr    r6, r5, r3
    mulr    r4, r3, r3
    lda     0x16802D2D, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    ld      (g11)[g12*1], r9
loc_19AA4:                              # CODE XREF: calc_stage_limit_dist+78↑j
    mov     r8, g1
    cmpr    r8, r9
    ble     loc_19AB4
    mov     r9, g1
loc_19AB4:                              # CODE XREF: calc_stage_limit_dist+B0↑j
    ret
# End of function calc_stage_limit_dist
# =============== S U B R O U T I N E =======================================
calc_gyang_from_fu_vec2:                # CODE XREF: get_my_info_new+228↑p
    mov     1, r11          # Label from Virtua Fighter 2 source
    b       loc_19AC4
# ---------------------------------------------------------------------------
calc_gyang_from_fu_vec:                 # CODE XREF: get_my_info_new+1F0↑p
    mov     0, r11          # Label from Virtua Fighter 2 source
loc_19AC4:                              # CODE XREF: calc_gyang_from_fu_vec2+4↑j
    ldt     (g0), r12
    lda     0x14802929, r15
    st      r15, (g11)[g12*1]
    stt     r12, (g11)[g12*1]
    ldt     (g11)[g12*1], r4
    ldt     0xC(g0), r12
    lda     0x14802929, r15
    st      r15, (g11)[g12*1]
    stt     r12, (g11)[g12*1]
    ldt     (g11)[g12*1], r8
    cmpobne 0, r11, loc_19B00
    stt     r4, (g1)
    stt     r8, 0xC(g1)
loc_19B00:                              # CODE XREF: calc_gyang_from_fu_vec2+3C↑j
    mov     0, r7
    ld      gyang_yvec, r12
    cmpibg  r5, r12, loc_19B58
    setbit  0x1F, r12, r12
    cmpr    r5, r12
    bl      loc_19B5C
    lda     0x17802F2F, r15
    st      r15, (g11)[g12*1]
    lda     displacement, r15
    st      r15, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    lda     displacement, r15
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    bbc     0x1F, r9, loc_19B8C
    notbit  0xF, r7, r7
    b       loc_19B8C
# ---------------------------------------------------------------------------
loc_19B58:                              # CODE XREF: calc_gyang_from_fu_vec2+54↑j
    notbit  0xF, r7, r7
loc_19B5C:                              # CODE XREF: calc_gyang_from_fu_vec2+60↑j
    lda     0x17802F2F, r15
    st      r15, (g11)[g12*1]
    lda     displacement, r15
    st      r15, (g11)[g12*1]
    st      r10, (g11)[g12*1]
    st      r8, (g11)[g12*1]
    lda     displacement, r15
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r3
loc_19B8C:                              # CODE XREF: calc_gyang_from_fu_vec2+94↑j
    addi    r7, r3, g0
    ret
# End of function calc_gyang_from_fu_vec2

    .section get_my_info_new_floats
# ---------------------------------------------------------------------------
flt_1CFB0:
    .float 0.0              # DATA XREF: get_my_info_new+1E0↑o
    .float -1.0
    .float 0.0
    .float 1.0
    .float 0.0
    .float 0.0
flt_1CFC8:
    .float 0.0              # DATA XREF: get_my_info_new+220↑o
    .float 0.0
    .float 1.0
    .float 0.0
    .float 1.0
    .float 0.0

    .section get_en_info_floats
flt_1D000:      .float 1.8              # DATA XREF: get_en_info+A80↑r
