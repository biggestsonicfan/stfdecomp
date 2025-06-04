        .section motion
# =============== S U B R O U T I N E =======================================
comp_set_motion:                        # CODE XREF: ROM:00013B90↑p
    mov     1, r10          # Label from official source
    b       set_motion_comm
# End of function comp_set_motion
# =============== S U B R O U T I N E =======================================
set_motion:                             # CODE XREF: BUNRI_DSP+D8↑p
    mov     0, r10          # Label from official source
set_motion_comm:                        # CODE XREF: comp_set_motion+4↑j
    mov     0, r15          # Label from official source
    st      r15, 0x5CC(g7)  # r15 = P1_PARTS+0x5CC
    mov     0, r15
    stib    r15, 0x60C(g7)  # r15 = P1_PARTS+0x60C
    ld      0x0(g7), r15
    clrbit  9, r15, r15
    st      r15, 0x0(g7)
    ld      0x1A4(g7), r7   # p1_mot_kind
    cmpobe  0, g0, loc_1B250
    ld      0x0(g7), r15
    setbit  0xB, r15, r15
    st      r15, 0x0(g7)
    bbc     0xE, g0, sm_shift_ex
    clrbit  6, r7, r7
    clrbit  5, r7, r7
    clrbit  0x15, r7, r7
    mov     1, r15
    stib    r15, 0xBE4(g7)  # p1_smoth_sw
sm_shift_ex:                            # CODE XREF: set_motion+34↑j
    bbc     0xD, g0, sm_smooth_ex # Label from official source
    clrbit  5, r7, r7
    clrbit  0x15, r7, r7
    mov     1, r15
    stib    r15, 0xBE4(g7)  # p1_smoth_sw
sm_smooth_ex:                           # CODE XREF: set_motion:sm_shift_ex↑j
    bbc     6, r7, sm_turn_ex # Label from official source
    cmpobne 1, r10, sm_turn_nor
    bbc     0xE, r7, sm_turn_nor
    ldis    0x616(g7), r15  # p1_gyang
    stis    r15, 0x26(g7)   # p1_yang_0
    b       sm_turn_ex
# ---------------------------------------------------------------------------
sm_turn_nor:                            # CODE XREF: set_motion+64↑j
    ldis    0x812(g7), r13  # Label from official source
    ldis    0x26(g7), r14
    addi    r13, r14, r15
    stis    r15, 0x26(g7)
sm_turn_ex:                             # CODE XREF: set_motion:sm_smooth_ex↑j
    bbc     5, r7, sm_move_ex # Label from official source
    ld      0x1F4(g7), r15
    st      r15, 0x18(g7)
    ld      0x1FC(g7), r15
    st      r15, 0x20(g7)
    mov     0, r15
    st      r15, 0x80(g7)
    mov     0, r15
    st      r15, 0x88(g7)
sm_move_ex:                             # CODE XREF: set_motion:sm_turn_ex↑j
    bbc     0x15, r7, loc_1B034 # Label from official source
    ld      0x0(g7), r15
    notbit  6, r15, r15
    st      r15, 0x0(g7)
loc_1B034:                              # CODE XREF: set_motion:sm_move_ex↑j
    bbc     0xF, g0, loc_1B044
    ld      0x0(g7), r15
    notbit  6, r15, r15
    st      r15, 0x0(g7)
loc_1B044:                              # CODE XREF: set_motion:loc_1B034↑j
    mov     g0, r11         # g0 amy p = 0x16
    lda     0x1FFF, r13
    and     r13, g0, g0
    stos    g0, 0x1A8(g7)   # p1_motion_num or p2_motion_num
    mov     1, r15
    stis    r15, 0x1AA(g7)  # p1_motion_coma or p2_motion_coma
    ld      0x0(g7), r15    # P1_PARTS or P2_PARTS
    bbc     27, r15, loc_1B15C # Branches when move used
    addo    4, sp, sp
    st      r3, -4(sp)
    addo    0x10, sp, sp
    stq     r4, -0x10(sp)
    addo    0x10, sp, sp
    stq     r8, -0x10(sp)
    addo    0x10, sp, sp
    stq     r12, -0x10(sp)
    addo    0x10, sp, sp
    stq     g0, -0x10(sp)
    addo    0x10, sp, sp
    stq     g4, -0x10(sp)
    addo    0x10, sp, sp
    stq     g8, -0x10(sp)
    addo    4, sp, sp
    st      g12, -4(sp)
    addo    4, sp, sp
    st      g13, -4(sp)
    addo    4, sp, sp
    st      g14, -4(sp)
    call    delete_option
    ld      -4(sp), g14
    subo    4, sp, sp
    ld      -4(sp), g13
    subo    4, sp, sp
    ld      -4(sp), g12
    subo    4, sp, sp
    ldq     -0x10(sp), g8
    subo    0x10, sp, sp
    ldq     -0x10(sp), g4
    subo    0x10, sp, sp
    ldq     -0x10(sp), g0
    subo    0x10, sp, sp
    ldq     -0x10(sp), r12
    subo    0x10, sp, sp
    ldq     -0x10(sp), r8
    subo    0x10, sp, sp
    ldq     -0x10(sp), r4
    subo    0x10, sp, sp
    ld      -4(sp), r3
    subo    4, sp, sp
loc_1B15C:                              # CODE XREF: set_motion+EC↑j
    call    set_mot_dat
    ld      0x0(g7), r15
    bbc     0x12, r15, loc_1B184
    ld      0x1A4(g7), r15
    bbc     8, r15, loc_1B184
    ld      0x1E18(g7), r15
    bbs     8, r15, loc_1B184
    mov     4, r15
    stis    r15, 0x1AA(g7)
loc_1B184:                              # CODE XREF: set_motion+1EC↑j
    ld      0x1A4(g7), r8
    bbc     0xF, r11, loc_1B1A0
    ld      0x804(g7), r4
    bbc     0x15, r4, loc_1B1A0
    setbit  0x15, r4, r3
    st      r3, 0x804(g7)
    notbit  0x15, r8, r8
loc_1B1A0:                              # CODE XREF: set_motion+210↑j
    bbc     8, r8, loc_1B1B0
    ldos    0x6D0(g7), r14
    addi    1, r14, r15
    stos    r15, 0x6D0(g7)
loc_1B1B0:                              # CODE XREF: set_motion:loc_1B1A0↑j
    bbc     5, r7, loc_1B1B8
    setbit  7, r8, r8
loc_1B1B8:                              # CODE XREF: set_motion:loc_1B1B0↑j
    st      r8, 0x1A4(g7)   # p1_mot_kind or p2_mot_kind
    call    calc_rob_angle_int
    call    smooth_int
    ld      0x0(g7), r15
    bbs     4, r15, loc_1B204
    bbc     8, r8, loc_1B210
    ldos    0x1222(g7), r3
    mov     0, r15
    stis    r15, 0x1222(g7)
    cmpobe  0, r3, loc_1B204
    stos    r3, 0x1224(g7)
    ld      0x122C(g7), r15
    st      r15, 0x1228(g7)
    b       loc_1B210
# ---------------------------------------------------------------------------
loc_1B204:                              # CODE XREF: set_motion+250↑j
    mov     0, r15
    stis    r15, 0x1224(g7)
loc_1B210:                              # CODE XREF: set_motion+254↑j
    ld      0x0(g7), r15
    bbs     4, r15, loc_1B240
    bbc     8, r8, loc_1B24C
    ldos    0x1246(g7), r3
    mov     0, r15
    stis    r15, 0x1246(g7)
    cmpobe  0, r3, loc_1B240
    stos    r3, 0x1248(g7)
    b       loc_1B24C
# ---------------------------------------------------------------------------
loc_1B240:                              # CODE XREF: set_motion+29C↑j
    mov     0, r15
    stis    r15, 0x1224(g7)
loc_1B24C:                              # CODE XREF: set_motion+2A0↑j
    b       loc_1B268
# ---------------------------------------------------------------------------
loc_1B250:                              # CODE XREF: set_motion+24↑j
    lda     loc_14060, r13
    ld      0x1A4(g7), r14
    and     r13, r14, r15
    st      r15, 0x1A4(g7)
    stos    g0, 0x1A8(g7)   # p1_motion_num or p2_motion_num
loc_1B268:                              # CODE XREF: set_motion:loc_1B24C↑j
    ret
# End of function set_motion
# =============== S U B R O U T I N E =======================================
set_mot_dat:                            # CODE XREF: ROM:00007304↑p
    mov     0, r15          # Label from official source
    stos    r15, 0x87A(g7)  # P1_PARTS+0x87A
    stos    r15, 0x802(g7)  # p1_motd_next or p2_motd_next
    stos    r15, 0x86C(g7)  # P1_PARTS+0x86C
    stos    r15, 0x870(g7)  # P1_PARTS+0x870
    stob    r15, 0xA00(g7)  # p1_mot_basic_step or p2_mot_basic_step
    stos    r15, 0x812(g7)  # p1_mov_yang or p2_mov_yang
    stob    r15, 0x83C(g7)  # P1_PARTS+0x83C
    st      r15, 0x844(g7)  # p1_jump_h or p2_jump_h
    stob    r15, 0x840(g7)  # P1_PARTS+0x840
    stob    r15, 0x823(g7)  # P1_PARTS+0x823
    stos    r15, 0x850(g7)  # P1_PARTS+0x850
    stos    r15, 0x818(g7)  # p1_motd_land_coma or p2_motd_land_coma
    stos    r15, 0x872(g7)  # p1_motd_down_coma or p2_motd_down_coma
    st      r15, 0x854(g7)  # P1_PARTS+0x854
    st      r15, 0x864(g7)  # p1_motd_uk_type or p2_motd_uk_type
    stob    r15, 0xA25(g7)  # P1_PARTS+0xA25
    stob    r15, 0xA28(g7)  # P1_PARTS+0xA28
    st      r15, 0xACC(g7)  # P1_PARTS+0xACC
    stos    r15, 0xC60(g7)  # P1_PARTS+0xC60
    stos    r15, 0x2A94(g7) # P1_PARTS+0x2A94
    stos    r15, 0x2A92(g7) # P1_PARTS+0x2A92
    ld      0x0(g7), r15
    clrbit  0x10, r15, r15  # Clear byte 0x10 of P1_PARTS or P2_PARTS
    st      r15, 0x0(g7)
    ld      0x0(g7), r15
    clrbit  0x11, r15, r15  # Clear byte 0x11 of P1_PARTS or P2_PARTS
    st      r15, 0x0(g7)
    ld      0x7F0(g7), r15  # p1_parts_flag or p2_parts_flag
    clrbit  0x10, r15, r15
    st      r15, 0x7F0(g7)
    mov     0, r3
    stob    r3, 0x2A70(g7)  # write 0 to P1_HEAD_LIST_NUM or P2_HEAD_LIST_NUM
    ld      PLAYER_HEAD_LIST[r3*4], r5 # r3 always = 0
    ldob    0x1B0(g7), r4   # r4 = P1_CHAR_VALUE or P2_CHAR_VALUE
    ld      (r5)[r4*4], r5  # r5 = (offset at PLAYER_HEAD_LIST)+(value at r4)
    ldos    0x0(r5), r3     # reads first 2 bytes of Player Head
    ldos    2(r5), r4       # Reads second 2 bytes of Player Head
    stob    r3, 0x2A79(g7)  # P1_PARTS+0x2A79
    stob    r4, 0x2A7A(g7)  # P1_PARTS+0x2A7A
    lda     4(r5), r5       # Read actual head model number
    st      r5, 0x2A74(g7)  # write r5 to P1_HEAD_OFFSET or P2_HEAD_OFFSET
    lda     sub_mode9, r3
    ldob    _sub_mode, r14
    cmpobne r3, r14, loc_1B3C8 # if _sub_mode is not 9, FIGHT_DSP, branch
    ldob    4(g7), r14      # P1_PARTS+0x04
    cmpobe  1, r14, loc_1B38C # if P1_PARTS+0x04 = 1, branch
    ld      mod_fa_record, r3
    ld      0x6C(r3), r5    # mod_fa_record+0x6C
    st      r5, 0x50039C
    ld      mod_fa_obj0, r9
    ldis    6(r9), r15      # mod_fa_obj0+0x06
    stis    r15, 0x500460
    ldob    0x5003A0, r12
    clrbit  0, r12, r12
    stob    r12, 0x5003A0
    b       loc_1B3C8
# ---------------------------------------------------------------------------
loc_1B38C:                              # CODE XREF: set_mot_dat+DC↑j
    ld      mod_fa_record, r3
    ld      0x6C(r3), r5
    st      r5, 0x50044C
    ld      mod_fa_obj0, r9
    ldis    6(r9), r15
    stis    r15, 0x500462
    ldob    0x5003A0, r12
    clrbit  1, r12, r12
    stob    r12, 0x5003A0
loc_1B3C8:                              # CODE XREF: set_mot_dat+D4↑j
    cmpobe  0, g0, loc_1B60C
    mov     0, r15
    st      r15, 0x2068(g7)
    lda     0x20F0(g7), r3
    mov     0, r15
    st      r15, 0x0(r3)
    mov     0, r15
    st      r15, 0x1C(r3)
    mov     0, r15
    st      r15, 0x38(r3)
    mov     0, r15
    st      r15, 0x54(r3)
    mov     0, r15
    st      r15, 0x70(r3)
    mov     0, r15
    st      r15, 0x8C(r3)
    ld      mot_list[g0*4], r11
    ld      offset_list_motions[g0*4], r15 # 2CC3EE6
    ldos    (r15), r14      # value of AMY_DP_SQUISH_X_DATA to r14
    stos    r14, 0x800(g7)  # p1_motd_leng or p2_motd_leng
    stos    r14, 0x80A(g7)  # p1_follow1 or p2_follow1
    stos    r14, 0x80C(g7)  # p1_follow2 or p2_follow2
    ld      0x1A4(g7), r15  # p1_mot_kind or p2_mot_kind
    st      r15, 0xBD4(g7)  # P1_PARTS+0xBD4 or P2_PARTS+0xBD4
    ld      0x804(g7), r15  # p1_motd_kind or p2_motd_kind
    st      r15, 0xC30(g7)  # p1_old_motd_kind or p2_old_motd_kind
    ld      0x70C(g7), r15
    st      r15, 0xC58(g7)
    ld      0x860(g7), r15
    st      r15, 0xC5C(g7)
    ldob    0x84C(g7), r15
    stob    r15, 0x85B(g7)
    ldib    0x0(r11), r15   # value of animation_related offset to r15
    stib    r15, 0x804(g7)
    ldib    1(r11), r15
    stib    r15, 0x805(g7)
    ldib    2(r11), r15
    stib    r15, 0x806(g7)
    ldib    3(r11), r15
    stib    r15, 0x807(g7)
    ldib    4(r11), r15
    stib    r15, 0x860(g7)
    ldib    5(r11), r15
    stib    r15, 0x861(g7)
    ldib    6(r11), r15
    stib    r15, 0x862(g7)
    ldib    7(r11), r15
    stib    r15, 0x863(g7)
    ldib    8(r11), r15
    stib    r15, 0x810(g7)
    ldib    9(r11), r15
    stib    r15, 0x811(g7)
    ldib    0xA(r11), r15
    stib    r15, 0x814(g7)
    ldib    0xB(r11), r15
    stib    r15, 0x815(g7)
    ldib    0xC(r11), r15   # Sonic r11 = 0xCF565; r15 = 0xCF565+0xC
    stib    r15, 0x84C(g7)  # p1_skeleton_type or p2_skeleton_type
    ldob    0x84C(g7), r15
    cmpobe  0, r15, loc_1B4D4
    ld      0x860(g7), r15
    setbit  0xC, r15, r15
    st      r15, 0x860(g7)
loc_1B4D4:                              # CODE XREF: set_mot_dat+258↑j
    addo    0xD, r11, r11
    ld      0x804(g7), r3
    clrbit  0x15, r3, r3
    bbc     6, r3, loc_1B4EC
    shlo    0xF, 1, r15
    stis    r15, 0x812(g7)
loc_1B4EC:                              # CODE XREF: set_mot_dat+274↑j
    bbc     8, r3, loc_1B4FC
    bbc     0xF, r3, loc_1B4FC
    clrbit  0xF, r3, r3
    setbit  0x10, r3, r3
loc_1B4FC:                              # CODE XREF: set_mot_dat:loc_1B4EC↑j
    st      r3, 0x1A4(g7)
    ld      0x860(g7), r3   # p1_motd_kind2 or p2_motd_kind2
    st      r3, 0x70C(g7)
    ldob    0x84C(g7), r14  # p1_skeleton_type or p2_skeleton_type
    cmpobe  3, r14, loc_1B558
    ldob    0x1B0(g7), r3
    ld      player_hand_animations[r3*4], r5
    ldob    0, r4
    stob    r4, 0x2A7B(g7)
    mov     5, r3
    ldis    (r5)[r4*2], r15
    st      r15, 0x40(g7)[r3*4]
    mov     8, r3
    lda     0x20(r5), r5
    ldis    (r5)[r4*2], r15
    st      r15, 0x40(g7)[r3*4]
    ldos    0x1A8(g7), r3
    stos    r3, 0x2A7C(g7)
loc_1B558:                              # CODE XREF: set_mot_dat+2A0↑j
    ldob    (r11), r3
    ld      off_1B568[r3*4], r4
    bx      (r4)
# ---------------------------------------------------------------------------
off_1B568:      .long loc_1B5D0         # DATA XREF: set_mot_dat+2F0↑r
    .long sub_1B610
    .long sub_1B628
    .long sub_1B674
    .long _uk_read_move_data
    .long sub_1B7C4
    .long sub_1B83C
    .long sub_1B86C
    .long loc_1B5CC
    .long sub_1B884
    .long sub_1B918
    .long sub_1B934
    .long sub_1B9B4
    .long sub_1B9D4
    .long sub_1B9EC
    .long sub_1BB14
    .long sub_1BB1C
    .long sub_1BB3C
    .long sub_1BB44
    .long sub_1BB7C
    .long sub_1BBB4
    .long sub_1BBCC
    .long sub_1BC58
    .long sub_1BC60
    .long sub_1BC78
# ---------------------------------------------------------------------------
loc_1B5CC:                              # DATA XREF: set_mot_dat+31C↑o
    addo    1, r11, r11
loc_1B5D0:                              # DATA XREF: set_mot_dat:off_1B568↑o
    st      r11, 0x82C(g7)
    st      r11, 0x6EC(g7)
    mov     0, r15
    stib    r15, 0xA20(g7)
    ld      0x0(g7), r15
    bbc     6, r15, loc_1B60C
    ldos    0x812(g7), r13
    subi    r13, 0, r15
    stos    r15, 0x812(g7)
    ldos    0x82A(g7), r13
    subi    r13, 0, r15
    stos    r15, 0x82A(g7)
    ld      0x830(g7), r15
    notbit  0x1F, r15, r15
    st      r15, 0x830(g7)
loc_1B60C:                              # CODE XREF: set_mot_dat:loc_1B3C8↑j
    ret
# End of function set_mot_dat
# =============== S U B R O U T I N E =======================================
sub_1B610:                              # DATA XREF: set_mot_dat+300↑o
    ldib    1(r11), r15
    stib    r15, 0x802(g7)
    ldib    2(r11), r15
    stib    r15, 0x803(g7)
    addo    3, r11, r11
    b       loc_1B558
# End of function sub_1B610
# =============== S U B R O U T I N E =======================================
sub_1B628:                              # DATA XREF: set_mot_dat+304↑o
    ldib    1(r11), r15
    stib    r15, 0x808(g7)
    ldib    2(r11), r15
    stib    r15, 0x809(g7)
    ldib    3(r11), r15
    stib    r15, 0x80A(g7)
    ldib    4(r11), r15
    stib    r15, 0x80B(g7)
    ldib    5(r11), r15
    stib    r15, 0x80C(g7)
    ldib    6(r11), r15
    stib    r15, 0x80D(g7)
    addo    7, r11, r11
    mov     1, r15
    stib    r15, 0xA00(g7)
    ld      0x1A4(g7), r5
    setbit  1, r5, r5
    st      r5, 0x1A4(g7)
    b       loc_1B558
# End of function sub_1B628
# =============== S U B R O U T I N E =======================================
sub_1B674:                              # DATA XREF: set_mot_dat+308↑o
    ldib    1(r11), r15
    stib    r15, 0x80E(g7)
    ldib    2(r11), r15
    stib    r15, 0x80F(g7)
    ldib    3(r11), r15
    stib    r15, 0x816(g7)
    ldib    4(r11), r15
    stib    r15, 0x817(g7)
    ldib    5(r11), r15
    stib    r15, 0x818(g7)
    ldib    6(r11), r15
    stib    r15, 0x819(g7)
    ldib    7(r11), r15
    stib    r15, 0x81C(g7)
    ldib    8(r11), r15
    stib    r15, 0x81D(g7)
    ldib    9(r11), r15
    stib    r15, 0x81E(g7)
    ldib    0xA(r11), r15
    stib    r15, 0x81F(g7)
    ldib    0xB(r11), r15
    stib    r15, 0x83F(g7)
    ldib    0xC(r11), r15
    stib    r15, 0x850(g7)
    ldib    0xD(r11), r15
    stib    r15, 0x851(g7)
    addo    0xE, r11, r11
    b       loc_1B558
# End of function sub_1B674
# =============== S U B R O U T I N E =======================================
_uk_read_move_data:                     # DATA XREF: set_mot_dat+30C↑o
    ldib    1(r11), r15
    stib    r15, 0x820(g7)  # P1_PARTS+0x820
    ldib    2(r11), r15
    stib    r15, 0x821(g7)  # P1_PARTS+0x821
    ldib    4(r11), r15
    stib    r15, 0x83E(g7)  # P1_PARTS+0x83E
    ldib    5(r11), r15
    stib    r15, 0x82A(g7)  # P1_PARTS+0x82A
    ldib    6(r11), r15
    stib    r15, 0x82B(g7)  # P1_PARTS+0x82B
    ldib    7(r11), r15
    stib    r15, 0x828(g7)
    ldib    8(r11), r15
    stib    r15, 0x829(g7)
    ldib    9(r11), r15
    stib    r15, 0x823(g7)
    ldib    0xA(r11), r15
    stib    r15, 0x843(g7)
    ldib    0xB(r11), r15
    stib    r15, 0x85C(g7)  # P1_PARTS+0x85C
    ldib    0xC(r11), r15   # Reads face data here
    stib    r15, 0x85D(g7)  # P1_PARTS+0x85D
    ldib    0xD(r11), r15
    stib    r15, 0x85E(g7)
    ldib    3(r11), r15
    stib    r15, 0x822(g7)
    ldib    3(r11), r15
    stib    r15, 0x83D(g7)
    lda     0x50A284, r3
    ldob    4(g7), r14
    cmpobe  0, r14, loc_1B76C
    lda     cb_mul_R, r3    # cb = collission ball
loc_1B76C:                              # CODE XREF: _uk_read_move_data+7C↑j
    ldib    0xE(r11), r15
    stib    r15, 0x0(r3)
    ldib    0xF(r11), r15
    stib    r15, 1(r3)
    ldib    0x10(r11), r15
    stib    r15, 2(r3)
    ldib    0x11(r11), r15
    stib    r15, 3(r3)
    call    send_multi_ball_R
    addo    0x12, r11, r11
    ld      0x1230(g7), r15
    lda     1(r15), r15
    st      r15, 0x1230(g7)
    ld      0x0(g7), r15
    bbc     6, r15, loc_1B558
    ldob    0x820(g7), r15
    ldob    count_0_42(r15), r15
    stob    r15, 0x820(g7)
    b       loc_1B558
# End of function _uk_read_move_data
# =============== S U B R O U T I N E =======================================
sub_1B7C4:                              # DATA XREF: set_mot_dat+310↑o
    ldib    1(r11), r15
    stib    r15, 0x828(g7)
    ldib    2(r11), r15
    stib    r15, 0x829(g7)
    ldib    3(r11), r15
    stib    r15, 0x822(g7)
    ldib    4(r11), r15
    stib    r15, 0x824(g7)
    ldib    5(r11), r15
    stib    r15, 0x825(g7)
    ldib    6(r11), r15
    stib    r15, 0x826(g7)
    ldib    7(r11), r15
    stib    r15, 0x827(g7)
    ldib    8(r11), r15
    stib    r15, 0x812(g7)
    ldib    9(r11), r15
    stib    r15, 0x813(g7)
    addo    0xE, r11, r11
    ld      0x1230(g7), r15
    lda     1(r15), r15
    st      r15, 0x1230(g7)
    ld      0x1234(g7), r15
    lda     1(r15), r15
    st      r15, 0x1234(g7)
    b       loc_1B558
# End of function sub_1B7C4
# =============== S U B R O U T I N E =======================================
sub_1B83C:                              # DATA XREF: set_mot_dat+314↑o
    ldib    1(r11), r15
    stib    r15, 0x872(g7)
    ldib    2(r11), r15
    stib    r15, 0x873(g7)
    ldib    3(r11), r15
    stib    r15, 0x812(g7)
    ldib    4(r11), r15
    stib    r15, 0x813(g7)
    ldib    5(r11), r15
    stib    r15, 0x85F(g7)
    addo    6, r11, r11
    b       loc_1B558
# End of function sub_1B83C
# =============== S U B R O U T I N E =======================================
sub_1B86C:                              # DATA XREF: set_mot_dat+318↑o
    ldib    1(r11), r15
    stib    r15, 0x812(g7)
    ldib    2(r11), r15
    stib    r15, 0x813(g7)
    addo    3, r11, r11
    b       loc_1B558
# End of function sub_1B86C
# =============== S U B R O U T I N E =======================================
sub_1B884:                              # DATA XREF: set_mot_dat+320↑o
    ldib    1(r11), r15
    stib    r15, 0x830(g7)
    ldib    2(r11), r15
    stib    r15, 0x831(g7)
    ldib    3(r11), r15
    stib    r15, 0x832(g7)
    ldib    4(r11), r15
    stib    r15, 0x833(g7)
    ldib    5(r11), r15
    stib    r15, 0x834(g7)
    ldib    6(r11), r15
    stib    r15, 0x835(g7)
    ldib    7(r11), r15
    stib    r15, 0x836(g7)
    ldib    8(r11), r15
    stib    r15, 0x837(g7)
    ldib    9(r11), r15
    stib    r15, 0x5BE(g7)
    ldob    0xA(r11), r3
    ldob    0xB(r11), r15
    shlo    8, r15, r15
    addo    r15, r3, r3
    ldob    0xC(r11), r15
    shlo    0x10, r15, r15
    addo    r15, r3, r3
    ldob    0xD(r11), r15
    shlo    0x18, r15, r15
    addo    r15, r3, r3
    ld      0x50A000, r14
    mulr    r3, r14, r3
    setbit  0x1F, r3, r3
    st      r3, 0x5CC(g7)
    ldob    0xE(r11), r3
    stos    r3, 0x81A(g7)
    addo    0xF, r11, r11
    b       loc_1B558
# End of function sub_1B884
# =============== S U B R O U T I N E =======================================
sub_1B918:                              # DATA XREF: set_mot_dat+324↑o
    ldob    0x83C(g7), r3
    cmpobne 0, r3, loc_1B924
    st      r11, 0x838(g7)
loc_1B924:                              # CODE XREF: sub_1B918+4↑j
    addo    1, r3, r3
    stob    r3, 0x83C(g7)
    addo    6, r11, r11
    b       loc_1B558
# End of function sub_1B918
# =============== S U B R O U T I N E =======================================
sub_1B934:                              # DATA XREF: set_mot_dat+328↑o
    ldob    1(r11), r3
    ldob    2(r11), r15
    shlo    8, r15, r15
    addo    r15, r3, r3
    ldob    3(r11), r15
    shlo    0x10, r15, r15
    addo    r15, r3, r3
    ldob    4(r11), r15
    shlo    0x18, r15, r15
    addo    r15, r3, r3
    ld      0x0(g7), r15
    bbc     6, r15, loc_1B968
    notbit  0xF, r3, r3
loc_1B968:                              # CODE XREF: sub_1B934+2C↑j
    st      r3, 0x844(g7)
    lda     0x7FFF, r13
    and     r13, r3, r15
    stos    r15, 0x6DA(g7)
    ldib    5(r11), r15
    stib    r15, 0x848(g7)
    ldib    6(r11), r15
    stib    r15, 0x849(g7)
    ldib    7(r11), r15
    stib    r15, 0x84A(g7)
    ldib    8(r11), r15
    stib    r15, 0x84B(g7)
    ldib    9(r11), r15
    stib    r15, 0x84E(g7)
    ldib    0xA(r11), r15
    stib    r15, 0x84F(g7)
    addo    0xB, r11, r11
    b       loc_1B558
# End of function sub_1B934
# =============== S U B R O U T I N E =======================================
sub_1B9B4:                              # DATA XREF: set_mot_dat+32C↑o
    ldib    1(r11), r15
    stib    r15, 0x840(g7)
    ldib    2(r11), r15
    stib    r15, 0x841(g7)
    ldib    3(r11), r15
    stib    r15, 0x842(g7)
    addo    4, r11, r11
    b       loc_1B558
# End of function sub_1B9B4
# =============== S U B R O U T I N E =======================================
sub_1B9D4:                              # DATA XREF: set_mot_dat+330↑o
    ldib    1(r11), r15
    stib    r15, 0x84D(g7)
    ldob    2(r11), r3
    stos    r3, 0x858(g7)
    addo    3, r11, r11
    b       loc_1B558
# End of function sub_1B9D4
# =============== S U B R O U T I N E =======================================
sub_1B9EC:                              # DATA XREF: set_mot_dat+334↑o
    ldob    1(r11), r8
    ldob    2(r11), r15
    shlo    8, r15, r15
    addo    r15, r8, r8
    ldob    3(r11), r15
    shlo    0x10, r15, r15
    addo    r15, r8, r8
    ldob    4(r11), r15
    shlo    0x18, r15, r15
    addo    r15, r8, r8
    ldib    5(r11), r9
    ldob    6(r11), r10
    ldob    7(r11), r15
    shlo    8, r15, r15
    addo    r15, r10, r10
    ldob    8(r11), r15
    shlo    0x10, r15, r15
    addo    r15, r10, r10
    ldob    9(r11), r15
    shlo    0x18, r15, r15
    addo    r15, r10, r10
    ldib    0xA(r11), r12
    ldob    0xB(r11), r13
    ldob    0xC(r11), r15
    shlo    8, r15, r15
    addo    r15, r13, r13
    ldob    0xD(r11), r15
    shlo    0x10, r15, r15
    addo    r15, r13, r13
    ldob    0xE(r11), r15
    shlo    0x18, r15, r15
    addo    r15, r13, r13
    ld      0x5F4(g7), r14
    lda     displacement, r15
    mov     r9, r3
    subr    r10, r8, r4
    subr    r10, r14, r5
    ldib    0x822(g7), r6
    cmpibe  0, r12, loc_1BAB0
    subr    r10, r13, r7
    cmpr    r7, r5
    bl      loc_1BAA8
    mov     r12, r3
    subr    r13, r8, r4
    subr    r13, r14, r5
    b       loc_1BAB0
# ---------------------------------------------------------------------------
loc_1BAA8:                              # CODE XREF: sub_1B9EC+A8↑j
    mov     r7, r4
    mov     r12, r6
loc_1BAB0:                              # CODE XREF: sub_1B9EC+9C↑j
    cmpibg  0, r4, loc_1BAD4
    cmpr    r15, r5
    bl      loc_1BAC4
    mov     r15, r5
    b       loc_1BAD0
# ---------------------------------------------------------------------------
loc_1BAC4:                              # CODE XREF: sub_1B9EC+CC↑j
    cmpr    r4, r5
    bg      loc_1BAD0
    mov     r4, r5
loc_1BAD0:                              # CODE XREF: sub_1B9EC+D4↑j
    b       loc_1BAF0
# ---------------------------------------------------------------------------
loc_1BAD4:                              # CODE XREF: sub_1B9EC:loc_1BAB0↑j
    cmpr    r4, r5
    bl      loc_1BAE4
    mov     r4, r5
    b       loc_1BAF0
# ---------------------------------------------------------------------------
loc_1BAE4:                              # CODE XREF: sub_1B9EC+EC↑j
    cmpr    r15, r5
    bg      loc_1BAF0
    mov     r15, r5
loc_1BAF0:                              # CODE XREF: sub_1B9EC:loc_1BAD0↑j
    subi    r3, r6, r6
    cvtir   r6, r6
    divr    r4, r5, r5
    mulr    r6, r5, r5
    cvtri   r5, r5
    addi    r5, r3, r3
    stib    r3, 0x822(g7)
    addo    0xF, r11, r11
    b       loc_1B558
# End of function sub_1B9EC
# =============== S U B R O U T I N E =======================================
sub_1BB14:                              # DATA XREF: set_mot_dat+338↑o
    addo    3, r11, r11
    b       loc_1B558
# End of function sub_1BB14
# =============== S U B R O U T I N E =======================================
sub_1BB1C:                              # DATA XREF: set_mot_dat+33C↑o
    ldob    1(r11), r3
    lda     2(r11), r4
    st      r4, 0x854(g7)
    ldob    -2(r4)[r3*2], r5
    stos    r5, 0x800(g7)
    lda     (r4)[r3*2], r11
    b       loc_1B558
# End of function sub_1BB1C
# =============== S U B R O U T I N E =======================================
sub_1BB3C:                              # DATA XREF: set_mot_dat+340↑o
    addo    7, r11, r11
    b       loc_1B558
# End of function sub_1BB3C
# =============== S U B R O U T I N E =======================================
sub_1BB44:                              # DATA XREF: set_mot_dat+344↑o
    ldib    1(r11), r15
    stib    r15, 0x864(g7)
    ldib    2(r11), r15
    stib    r15, 0x865(g7)
    ldib    3(r11), r15
    stib    r15, 0x868(g7)
    ldib    4(r11), r15
    stib    r15, 0x869(g7)
    ldib    5(r11), r15
    stib    r15, 0x878(g7)
    ldib    6(r11), r15
    stib    r15, 0x879(g7)
    addo    7, r11, r11
    b       loc_1B558
# End of function sub_1BB44
# =============== S U B R O U T I N E =======================================
sub_1BB7C:                              # DATA XREF: set_mot_dat+348↑o
    ldib    1(r11), r15
    stib    r15, 0x802(g7)
    ldib    2(r11), r15
    stib    r15, 0x803(g7)
    ldib    3(r11), r15
    stib    r15, 0x86C(g7)
    ldib    4(r11), r15
    stib    r15, 0x86D(g7)
    ldib    5(r11), r15
    stib    r15, 0x86E(g7)
    ldib    6(r11), r15
    stib    r15, 0x86F(g7)
    addo    7, r11, r11
    b       loc_1B558
# End of function sub_1BB7C
# =============== S U B R O U T I N E =======================================
sub_1BBB4:                              # DATA XREF: set_mot_dat+34C↑o
    ldib    1(r11), r15
    stib    r15, 0x870(g7)
    ldib    2(r11), r15
    stib    r15, 0x871(g7)
    addo    3, r11, r11
    b       loc_1B558
# End of function sub_1BBB4
# =============== S U B R O U T I N E =======================================
sub_1BBCC:                              # DATA XREF: set_mot_dat+350↑o
    ldob    1(r11), r3
    ldob    0xA20(g7), r4
    ldob    0xA21(g7), r5
    cmpobge r3, r4, loc_1BC50
    subo    r5, r4, r6
    cmpoble r6, r3, loc_1BC50
    cmpibl  1, r5, loc_1BBF8
    ldib    0x822(g7), r10
    shro    2, r10, r3
    addo    r3, r10, r10
    b       loc_1BC4C
# ---------------------------------------------------------------------------
loc_1BBF8:                              # CODE XREF: sub_1BBCC+18↑j
    ldob    2(r11), r6
    ldob    3(r11), r15
    shlo    8, r15, r15
    addo    r15, r6, r6
    ldob    4(r11), r15
    shlo    0x10, r15, r15
    addo    r15, r6, r6
    ldob    5(r11), r15
    shlo    0x18, r15, r15
    addo    r15, r6, r6
    ldib    0x822(g7), r10
    cvtir   r10, r10
    subo    r3, r4, r7
    cvtir   r7, r7
    cvtir   r5, r8
    divr    r7, r8, r9
    mulr    r6, r9, r9
    mulr    r6, r10, r12
    mulr    r9, r10, r13
    addr    r12, r13, r10
    cvtri   r10, r10
loc_1BC4C:                              # CODE XREF: sub_1BBCC+28↑j
    stib    r10, 0x822(g7)
loc_1BC50:                              # CODE XREF: sub_1BBCC+C↑j
    addo    6, r11, r11
    b       loc_1B558
# End of function sub_1BBCC
# =============== S U B R O U T I N E =======================================
sub_1BC58:                              # DATA XREF: set_mot_dat+354↑o
    addo    5, r11, r11
    b       loc_1B558
# End of function sub_1BC58
# =============== S U B R O U T I N E =======================================
sub_1BC60:                              # DATA XREF: set_mot_dat+358↑o
    ldib    1(r11), r15
    stib    r15, 0x87A(g7)
    ldib    2(r11), r15
    stib    r15, 0x87B(g7)
    addo    3, r11, r11
    b       loc_1B558
# End of function sub_1BC60
# =============== S U B R O U T I N E =======================================
sub_1BC78:                              # DATA XREF: set_mot_dat+35C↑o
    addo    0xD, r11, r11
    b       loc_1B558
# End of function sub_1BC78
