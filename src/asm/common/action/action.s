        .section init
# =============== S U B R O U T I N E =======================================
action_init:                            # CODE XREF: ADV_REPLAY_INT+394↑p
    mov     g13, g7         # Label from official source
    ldob    0x1B0(g7), r3   # r3 = P1_PARTS+0x1B0 or P2_PARTS+0x1B0
    ld      CHAR_PARTS[r3*4], g5 # This loads the character data, even in char select
    st      g5, 0x190(g7)   # P1_PARTS+0x190 = P1_CHAR_PARTS and P2_PARTS+0x190 = P2_CHAR_PARTS
    ld      0xC(g5), g6     # ex SONIC+0xC = g6 so g6 = ANIMATIONS
    st      g6, 0x1A0(g7)   # P1_PARTS+0x1A0 = P1_ANIMATIONS and P2_PARTS+0x1A0 = P2_ANIMATIONS
    ldos    0x762(g7), r14  # P1_PARTS+0x762 and P2_PARTS+0x762
    cmpobne 0, r14, efc_rob_set_set
    ldob    also_mode, r3
    lda     start_ip_add+1, r4
    cmpobe  r4, r3, efc_rob_set_set
    lda     check_word1, r4
    cmpobe  r4, r3, efc_rob_barrier_set
    lda     check_word1+1, r4
    cmpobe  r4, r3, efc_rob_barrier_set
    ldob    curr_round_num, r3
    cmpobl  1, r3, efc_rob_barrier_set
efc_rob_set_set:                        # CODE XREF: action_init+20↑j
    ld      fa_rob0, r3     # Label from Fighting Vipers source
    mov     0, r4
    stos    r4, 0x1F48(r3)  # P1_PARTS+0x1F48 = 0
    stos    r4, 0x1F60(r3)
    stos    r4, 0x1F62(r3)
    stos    r4, 0x1F64(r3)
    stos    r4, 0x1F66(r3)
    st      r4, 0x1F4C(r3)
    st      r4, 0x1F50(r3)
    st      r4, 0x1F54(r3)
    st      r4, 0x1F58(r3)
    stos    r4, 0x2A90(r3)
    st      r4, 0x2A8C(r3)
    ld      0x0(r3), r15
    clrbit  28, r15, r15
    st      r15, 0x0(r3)
    ld      fa_rob1, r3
    st      r4, 0x1F4C(r3)
    st      r4, 0x1F50(r3)
    st      r4, 0x1F54(r3)
    st      r4, 0x1F58(r3)
    stos    r4, 0x1F48(r3)
    stos    r4, 0x1F60(r3)
    stos    r4, 0x1F62(r3)
    stos    r4, 0x1F64(r3)
    stos    r4, 0x1F66(r3)
    stos    r4, 0x2A90(r3)
    st      r4, 0x2A8C(r3)
    ld      0x0(r3), r15
    clrbit  0x1C, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(g5), r4
    lda     (r4), r14
    lda     0x40(g7), r13
    mov     0x10, r12
load_player_parts:                      # CODE XREF: action_init+15C↓j
    ld      (r14), r15
    st      r15, (r13)
    addo    4, r14, r14
    addo    4, r13, r13
    cmpdeco 1, r12, r12
    bl      load_player_parts
    ld      8(g5), r4
    lda     (r4), r14
    lda     0x1B4(g7), r13
    mov     0x10, r12
loc_12508:                              # CODE XREF: action_init+184↓j
    ld      (r14), r15
    st      r15, (r13)
    addo    4, r14, r14
    addo    4, r13, r13
    cmpdeco 1, r12, r12
    bl      loc_12508
    ld      4(g5), r4
    lda     (r4), r14
    lda     0x8C(g7), r13
    addo    0x1F, 0xE, r12
loc_12530:                              # CODE XREF: action_init+1AC↓j
    ld      (r14), r15
    st      r15, (r13)
    addo    4, r14, r14
    addo    4, r13, r13
    cmpdeco 1, r12, r12
    bl      loc_12530
    ldob    4(g7), r15
    cmpobe  1, r15, loc_1255C
    lda     0x520000, r15
    b       loc_12564
# ---------------------------------------------------------------------------
loc_1255C:                              # CODE XREF: action_init+1B4↑j
    lda     0x5207C8, r15
loc_12564:                              # CODE XREF: action_init+1C0↑j
    st      r15, 0xBD8(g7)
    ld      0x28(g5), r6
    ldob    num_rounds_to_win, r12
    ldob    num_rounds_to_win, r13
    ld      0x0(r6), r14
    mulo    r13, r14, r15
    st      r15, 0xAF0(g13)
    ldob    num_rounds_to_win, r13
    ld      4(r6), r14
    mulo    r13, r14, r15
    st      r15, 0xAF4(g13)
    ld      8(r6), r15
    st      r15, 0xAF8(g13)
    ld      0x18(g5), r3
    ld      0x0(r3), r15
    st      r15, 0x784(g13)
    ldis    4(r3), r15
    stis    r15, 0x788(g13)
    ldis    6(r3), r15
    stis    r15, 0x78A(g13)
    ld      8(r3), r15
    st      r15, 0x78C(g13)
    ld      0xC(r3), r15
    st      r15, 0x790(g13)
    ld      0x10(r3), r15
    st      r15, 0x794(g13)
    ldis    0x14(r3), r15
    stis    r15, 0x798(g13)
    ldis    0x16(r3), r15
    stis    r15, 0x79A(g13)
    ldis    0x18(r3), r15
    stis    r15, 0x79C(g13)
    ldis    0x1A(r3), r15
    stis    r15, 0x79E(g13)
    ldis    0x1C(r3), r15
    stis    r15, 0x7A0(g13)
    ldis    0x1E(r3), r15
    stis    r15, 0x7A2(g13)
    ld      0x20(r3), r15
    st      r15, 0x7A4(g13)
    ld      0x24(r3), r15
    st      r15, 0x7A8(g13)
    ld      0x28(r3), r15
    st      r15, 0x7AC(g13)
    ldis    0x2C(r3), r15
    stis    r15, 0x7B0(g13)
    ldis    0x2E(r3), r15
    stis    r15, 0x7B2(g13)
    ldis    0x30(r3), r15
    stis    r15, 0x7B4(g13)
    ldis    0x32(r3), r15
    stis    r15, 0x7B6(g13)
    ldis    0x34(r3), r15
    stis    r15, 0x7F8(g13)
    mov     0, r15
    stis    r15, 0x7BC(g13)
    mov     0, r15
    stis    r15, 0x7BE(g13)
    mov     0, r15
    st      r15, 0x7C0(g13)
    mov     0, r15
    st      r15, 0x7C4(g13)
    ld      0x0(g13), r15
    clrbit  0x1B, r15, r15
    st      r15, 0x0(g13)
    mov     0, r15
    stib    r15, 0x7CA(g13)
    mov     0, r15
    stib    r15, 0x7CB(g13)
    mov     0, r15
    st      r15, 0xAFC(g13)
    ld      0x1C(g5), r3
    ld      (r3), r15
    st      r15, 0x7CC(g13)
    ld      0x14(g5), r15
    st      r15, 0x7DC(g7)
    call    sub_3261C
    st      g0, 0x7D8(g7)
    stos    g1, 0x7E8(g7)
    stos    g1, 0x7EA(g7)
    ld      0x7DC(g7), r3
    addr    g0, r3, r3
    st      r3, 0x5D8(g7)
efc_rob_barrier_set:                    # CODE XREF: action_init+40↑j
    ld      add_BACKUP_RAM_TO_RAM, r4
    ldob    0x3353(r4), r3  # r3 = BACKUP_RAM_TO_RAM+0x3353
    bbs     3, r3, init_barrier_count_for_player_per_match
    ldob    curr_round_num, r14
    cmpobne 0, r14, loc_126E8
init_barrier_count_for_player_per_match: # CODE XREF: action_init+334↑j
    ld      barrier_default_num, r15
    st      r15, 0xC70(g7)  # P1_PARTS+0xC70 or P2_PARTS+0xC70
loc_126E8:                              # CODE XREF: action_init+340↑j
    ld      0x0(g7), r15
    clrbit  0x12, r15, r15
    st      r15, 0x0(g7)
    ld      0x0(g7), r15
    clrbit  0x1D, r15, r15
    st      r15, 0x0(g7)
    lda     0x140(g7), r14
    mov     0, r15
    addo    0x1F, 9, r13
loc_1270C:                              # CODE XREF: action_init+380↓j
    stis    r15, (r14)
    addo    2, r14, r14
    cmpdeco 1, r13, r13
    bl      loc_1270C
loc_1271C:                              # DATA XREF: ROM:00072880↓o
    ldt     0x18(g7), r4
    addr    1.0,r5,r5
    stt     r4, 0x1F4(g7)
    stt     r4, 0x6FC(g7)
    stt     r4, 0x1004(g7)
    stt     r4, 0x1010(g7)
    stt     r4, 0x101C(g7)
    stt     r4, 0x1028(g7)
    ldis    0x26(g7), r15
    stis    r15, 0x616(g7)
    mov     0, r3
    st      r3, 0x198(g7)
    st      r3, 0x194(g7)
    st      r3, 0x684(g7)
    st      r3, 0x19C(g7)
    st      r3, 0x1A4(g7)
    st      r3, 0x804(g7)
    st      r3, 0xBD4(g7)
    st      r3, 0xC30(g7)
    st      r3, 0xC58(g7)
    st      r3, 0xC5C(g7)
    st      r3, 0xC6C(g7)
    st      r3, 0xC78(g7)
    st      r3, 0x2C(g7)
    st      r3, 0x30(g7)
    st      r3, 0x34(g7)
    st      r3, 0x5C8(g7)
    st      r3, 0x5CC(g7)
    st      r3, 0x5D0(g7)
    st      r3, 0x5D4(g7)
    st      r3, 0x620(g7)
    st      r3, 0x1224(g7)
    st      r3, 0x1222(g7)
    st      r3, 0x1248(g7)
    st      r3, 0x678(g7)
    st      r3, 0x6D4(g7)
    st      r3, 0x1064(g7)
    stob    r3, 0x60C(g7)
    stos    r3, 0xC7C(g7)
    stos    r3, 0xC7E(g7)
    stos    r3, 0x6D0(g7)
    stos    r3, 0x6D8(g7)
    stos    r3, 0x6F0(g7)
    stos    r3, 0x614(g7)
    stos    r3, 0x624(g7)
    stos    r3, 0x61C(g7)
    stos    r3, 0x60E(g7)
    stos    r3, 0x618(g7)
    stos    r3, 0x1A8(g7)
    stos    r3, 0x1AA(g7)
    stos    r3, 0xC4C(g7)
    stob    r3, 0x6F4(g7)
    stob    r3, 0x6F5(g7)
    stos    r3, 0x7D0(g7)
    stos    r3, 0xBE6(g7)
    stob    r3, nagerenai_timer # nagerenai = "can't throw"
    stob    r3, 0x7D2(g7)
    stos    r3, 0xA0E(g7)
    stob    r3, 0xA29(g7)
    stob    r3, 0x1A18(g7)
    st      r3, 0x768(g7)
    st      r3, 0xAC8(g7)
    lda     0xB54(g7), r14
    mov     0, r15
    mov     0x15, r13
loc_12848:                              # CODE XREF: action_init+4BC↓j
    st      r15, (r14)
    lda     4(r14), r14
    cmpdeco 1, r13, r13
    bl      loc_12848
    ld      mod_fa_coli, r3
    mov     0, r15
    st      r15, 0x2AC(r3)
    mov     1, r15
    stob    r15, 0xBE4(g7)
    ld      0x0(g7), r15
    clrbit  0x1A, r15, r15
    st      r15, 0x0(g7)
    ld      not_scr_bg_move, r15
    bbc     4, r15, loc_12894
    mov     1, r15
    stis    r15, 0x1AC(g7)  # p1_energy or p2_energy
    b       loc_128A0
# ---------------------------------------------------------------------------
loc_12894:                              # CODE XREF: action_init+4EC↑j
    ldis    energy_max, r15
    stis    r15, 0x1AC(g7)  # Store energy_max to the CPU player
loc_128A0:                              # CODE XREF: action_init+4F8↑j
    ld      0x24(g5), r15
    st      r15, 0x6C8(g7)
    ld      0x2C(g5), r15
    st      r15, 0xC68(g7)
    ld      0x10(g5), r3
    ld      0x0(r3), r15
    st      r15, 0x62C(g7)
    ld      4(r3), r15
    st      r15, 0x698(g7)
    ld      8(r3), r15
    st      r15, 0x630(g7)
    ld      0xC(r3), r15
    st      r15, 0x634(g7)
    ld      0x20(g5), r3
    ld      4(r3), r15
    st      r15, 0x724(g7)
    ld      8(r3), r15
    st      r15, 0x728(g7)
    ld      0xC(r3), r15
    st      r15, 0x72C(g7)
    ld      0x10(r3), r15
    st      r15, 0x730(g7)
    ldos    displacement(g6), g0
    ld      0x0(g7), r15
    bbc     29, r15, loc_12910
    ldos    (displacement2)(g6), g0
loc_12910:                              # CODE XREF: action_init+56C↑j
    call    set_motion
    ld      0x0(g7), r15
    setbit  0x1A, r15, r15
    st      r15, 0x0(g7)
    call    set_kamae_ram   # Set Stance Ram
    lda     0x501500, r15
    st      r15, 0x10(g7)
    lda     rob_action, r15
    st      r15, 0xC(g7)
    ldob    also_mode, r15
    lda     prcb+2, r14
    cmpobe  r14, r15, loc_1295C
    lda     prcb+3, r14
    cmpobe  r14, r15, loc_1295C
loc_1295C:                              # CODE XREF: action_init+5B4↑j
    ld      0x0(g7), r14
    setbit  0x15, r14, r14
    st      r14, 0x0(g7)
    call    send_init_ram_coli_data
    mov     0, r15
    stis    r15, 0x762(g7)
rob_action:                             # DATA XREF: action_init+598↑o
    ldob    0x530005, r14 # Label from official source
    cmpobe  0, r14, loc_12990
    mov     0, r15
    stib    r15, 0x530005
    b       action_init
# ---------------------------------------------------------------------------
loc_12990:                              # CODE XREF: action_init+5E4↑j
    mov     g13, g7
    ldob    4(g7), r13
    subi    r13, 1, r12
    ld      fa_rob0[r12*4], g8
    ld      0x1A0(g7), g6
    ldos    0x7D0(g7), r3
    cmpdeco 0, r3, r3
    be      loc_129B8
    stos    r3, 0x7D0(g7)
loc_129B8:                              # CODE XREF: action_init+618↑j
    ld      debug_flag, r15
    bbs     5, r15, calc_rob_angle_cont_call # Should always branch (may be the other way around)
    ld      0x0(g7), r15    # If we get here, player models will be broken and unable to move
    clrbit  11, r15, r15
    st      r15, 0x0(g7)
    ldob    4(g7), r14
    cmpobne 0, r14, loc_129DC
    call    decide_command
loc_129DC:                              # CODE XREF: action_init+63C↑j
    ld      0x0(g7), r5
    st      r5, 0x7EC(g7)
    ldis    0x1AC(g7), r15
    stis    r15, 0x6D2(g7)
    clrbit  0, r5, r5
    ld      0x1A4(g7), r3
    st      r3, 0x1E18(g7)
    ld      0x70C(g7), r3
    st      r3, 0x1E24(g7)
    ldos    0x1A8(g7), r3
    stos    r3, 0x1E1C(g7)
    cmpobe  0, r3, loc_12A44
    ld      0x0(g7), r15
    bbc     7, r15, loc_12A48
    ldos    0x1AA(g7), r4
    stos    r4, 0xC4E(g7)
    addo    1, r4, r4
    ldos    0x1AE(g7), r14
    addi    1, r14, r15
    stos    r15, 0x1AE(g7)
    stos    r4, 0x1AA(g7)
    ldos    0x800(g7), r3
    cmpoble r4, r3, loc_12A48
loc_12A44:                              # CODE XREF: action_init+67C↑j
    setbit  0, r5, r5
loc_12A48:                              # CODE XREF: action_init+684↑j
    st      r5, 0x0(g7)     # Somewhere in here moves get written
    call    original_combo_control
    call    air_mot_control
    call    exec_command
    mov     0, r15
    st      r15, 0x194(g7)
    call    exec_action
    call    shift_mot_control
    call    play_motion
    call    rob_revise_yang
    call    rob_spd_control
    b       skip_calc_rob_angle_cont
# ---------------------------------------------------------------------------
calc_rob_angle_cont_call:               # CODE XREF: action_init+628↑j
    call    calc_rob_angle_cont # Why is this bypassed
skip_calc_rob_angle_cont:               # CODE XREF: action_init+6DC↑j
    call    calc_unit_mat
    call    action_after
    ld      0x0(g7), r15
    setbit  7, r15, r15
    st      r15, 0x0(g7)
    ret
# End of function action_init
# =============== S U B R O U T I N E =======================================
decide_command:                         # CODE XREF: action_init+640↑p
    mov     g7, r10         # Label from official source
    mov     g8, r11
    call    decide_my_command
    mov     r11, g7
    mov     r10, g8
    call    decide_my_command
    mov     r10, g7
    mov     r11, g8
    ldob    0x19B(g7), r14
    cmpobe  0xC, r14, loc_12F80
    ldob    0x19B(g8), r14
    cmpobe  0xC, r14, loc_12F80
    ldob    0x197(g7), r7
    ldob    0x197(g8), r8
    cmpobe  0x14, r7, loc_12ADC
    cmpobne 0x14, r8, loc_12B08
    mov     r11, g7
    mov     r10, g8
loc_12ADC:                              # CODE XREF: decide_command+38↑j
    ldob    0x19F(g8), r6
    cmpobe  0x15, r6, loc_12AE8
    cmpobne 0x12, r6, loc_12B00
loc_12AE8:                              # CODE XREF: decide_command+4C↑j
    shlo    0x18, 1, r15
    st      r15, 0x194(g8)
    ld      0x1A4(g8), r15
    clrbit  0, r15, r15
    st      r15, 0x1A4(g8)
    b       loc_12F80
# ---------------------------------------------------------------------------
loc_12B00:                              # CODE XREF: decide_command+50↑j
    mov     r10, g7
    mov     r11, g8
loc_12B08:                              # CODE XREF: decide_command+3C↑j
    cmpobe  0x15, r7, loc_12B18
    cmpobne 0x15, r8, loc_12B90
    mov     r11, g7
    mov     r10, g8
loc_12B18:                              # CODE XREF: decide_command:loc_12B08↑j
    ldos    0x194(g7), g0
    call    set_motion
    mov     1, r15
    stis    r15, 0x1AA(g7)
    ldis    0x1A8(g8), r15
    stis    r15, 0x61E(g7)
    ldos    0x858(g7), r13
    ldos    0x808(g8), r14
    subi    r13, r14, r4
    stos    r4, 0x626(g7)
    ldib    0x822(g7), r15
    stib    r15, 0x822(g8)
    shlo    0x18, 0xD, r13
    ldos    0x828(g7), r14
    addi    r13, r14, r5
    ld      0x0(g7), r3
    shlo    4, r3, r3
    ld      0x0(g8), r13
    xor     r13, r3, r3
    chkbit  0xA, r3
    alterbit 0xF, r5, r5
    subo    1, r4, r3
    ldos    0x1AA(g8), r13
    cmpobl  r13, r3, loc_12B80
    st      r5, 0x194(g8)
    b       loc_12F80
# ---------------------------------------------------------------------------
loc_12B80:                              # CODE XREF: decide_command+E0↑j
    st      r5, 0x684(g8)
    stos    r3, 0x62A(g8)
    mov     r10, g7
    mov     r11, g8
loc_12B90:                              # CODE XREF: decide_command+78↑j
    cmpobe  0x17, r7, loc_12BA4
    cmpobne 0x17, r8, loc_12BB0
    mov     g8, r15
    mov     g7, g8
    mov     r15, g7
loc_12BA4:                              # CODE XREF: decide_command:loc_12B90↑j
    mov     0xC, r15
    stib    r15, 0x197(g7)
    b       loc_12E40
# ---------------------------------------------------------------------------
loc_12BB0:                              # CODE XREF: decide_command+100↑j
    addo    0x1F, 3, r13
    cmpobne r13, r7, loc_12BD0
    addo    0x1F, 3, r13
    cmpobne r13, r8, loc_12BE4
    ld      game_timer, r15
    bbc     0, r15, loc_12BE4
    b       loc_12BD8
# ---------------------------------------------------------------------------
loc_12BD0:                              # CODE XREF: decide_command+120↑j
    addo    0x1F, 3, r13
    cmpobne r13, r8, loc_12C9C
loc_12BD8:                              # CODE XREF: decide_command+138↑j
    mov     g8, r15
    mov     g7, g8
    mov     r15, g7
loc_12BE4:                              # CODE XREF: decide_command+128↑j
    ldos    0x194(g7), g0
    mov     5, g1
    call    calc_mht_adr
    ldos    1(g0), r3
    lda     0x23004000, r13
    addi    r13, r3, r15
    st      r15, 0x194(g8)
    ld      0x2C(g8), r15
    st      r15, 0xA10(g7)
    ld      0x34(g8), r15
    st      r15, 0xA18(g7)
    ld      0x1A4(g8), r15
    bbs     0xC, r15, loc_12C44
    mov     g8, r15
    mov     g7, g8
    mov     r15, g7
    call    fix_hara
    mov     g8, r15
    mov     g7, g8
    mov     r15, g7
    ld      0x1A4(g8), r15
    setbit  12, r15, r15
    st      r15, 0x1A4(g8)
loc_12C44:                              # CODE XREF: decide_command+184↑j
    ldob    3(g0), r3
    lda     aAirn, g0       # "airn    "
    stob    r3, 0x822(g8)
    ld      debug_flag, r15
    bbs     9, r15, loc_12C6C
    lda     0x10006E8, g9
    call    print_mes
loc_12C6C:                              # CODE XREF: decide_command+1C8↑j
    ld      0x1A4(g8), r15
    clrbit  0x15, r15, r15
    st      r15, 0x1A4(g8)
    ld      0x1A4(g7), r3
    shro    0xF, r3, r3
    ld      0x0(g7), r13
    xor     r13, r3, r3
    ld      0x0(g8), r4
    chkbit  6, r3
    alterbit 6, r4, r4
    st      r4, 0x0(g8)
    b       loc_12F80
# ---------------------------------------------------------------------------
loc_12C9C:                              # CODE XREF: decide_command+140↑j
    addo    0x1F, 1, r13
    cmpobne r13, r7, loc_12CBC
    addo    0x1F, 1, r13
    cmpobne r13, r8, loc_12CD0
    ld      game_timer, r15
    bbc     0, r15, loc_12CD0
    b       loc_12CC4
# ---------------------------------------------------------------------------
loc_12CBC:                              # CODE XREF: decide_command+20C↑j
    addo    0x1F, 1, r13
    cmpobne r13, r8, loc_12D48
loc_12CC4:                              # CODE XREF: decide_command+224↑j
    mov     g8, r15
    mov     g7, g8
    mov     r15, g7
loc_12CD0:                              # CODE XREF: decide_command+214↑j
    ldos    0x194(g7), g0
    mov     5, g1
    call    calc_mht_adr
    ldos    1(g0), r3
    lda     0x21004000, r13
    addi    r13, r3, r15
    st      r15, 0x194(g8)
    ldob    3(g0), r3
    lda     aAirn, g0       # "airn    "
    stob    r3, 0x822(g8)
    ld      debug_flag, r15
    bbs     9, r15, loc_12D18
    lda     0x10006E8, g9
    call    print_mes
loc_12D18:                              # CODE XREF: decide_command+274↑j
    ld      0x1A4(g8), r15
    clrbit  0x15, r15, r15
    st      r15, 0x1A4(g8)
    ld      0x1A4(g7), r3
    shro    0xF, r3, r3
    ld      0x0(g7), r13
    xor     r13, r3, r3
    ld      0x0(g8), r4
    chkbit  6, r3
    alterbit 6, r4, r4
    st      r4, 0x0(g8)
    b       loc_12F80
# ---------------------------------------------------------------------------
loc_12D48:                              # CODE XREF: decide_command+22C↑j
    cmpobne 0x1E, r7, loc_12D60
    cmpobne 0x1E, r8, loc_12D70
    ld      game_timer, r15
    bbc     0, r15, loc_12D70
    b       loc_12D64
# ---------------------------------------------------------------------------
loc_12D60:                              # CODE XREF: decide_command:loc_12D48↑j
    cmpobne 0x1E, r8, loc_12E18
loc_12D64:                              # CODE XREF: decide_command+2C8↑j
    mov     g8, r15
    mov     g7, g8
    mov     r15, g7
loc_12D70:                              # CODE XREF: decide_command+2B8↑j
    ldos    0x194(g7), g0
    mov     5, g1
    call    calc_mht_adr
    ldos    1(g0), r3
    lda     0x1F004000, r13
    addi    r13, r3, r15
    st      r15, 0x194(g8)
    ld      0x1A4(g8), r15
    bbs     0xC, r15, loc_12DC0
    mov     g8, r15
    mov     g7, g8
    mov     r15, g7
    call    fix_hara
    mov     g8, r15
    mov     g7, g8
    mov     r15, g7
    ld      0x1A4(g8), r15
    setbit  0xC, r15, r15
    st      r15, 0x1A4(g8)
loc_12DC0:                              # CODE XREF: decide_command+300↑j
    ldob    3(g0), r3
    lda     aAirn, g0       # "airn    "
    stob    r3, 0x822(g8)
    ld      debug_flag, r15
    bbs     9, r15, loc_12DE8
    lda     0x10006E8, g9
    call    print_mes
loc_12DE8:                              # CODE XREF: decide_command+344↑j
    ld      0x1A4(g8), r15
    clrbit  0x15, r15, r15
    st      r15, 0x1A4(g8)
    ld      0x1A4(g7), r3
    shro    0xF, r3, r3
    ld      0x0(g7), r13
loc_12E00:                              # DATA XREF: sub_4FBDC+C4↓o
    xor     r13, r3, r3
    ld      0x0(g8), r4
    chkbit  6, r3
    alterbit 6, r4, r4
    st      r4, 0x0(g8)
    b       loc_12F80
# ---------------------------------------------------------------------------
loc_12E18:                              # CODE XREF: decide_command:loc_12D60↑j
    cmpobne 0xC, r7, loc_12E30
    cmpobne 0xC, r8, loc_12E40
    ld      game_timer, r15
    bbc     0, r15, loc_12E40
    b       loc_12E34
# ---------------------------------------------------------------------------
loc_12E30:                              # CODE XREF: decide_command:loc_12E18↑j
    cmpobne 0xC, r8, loc_12ECC
loc_12E34:                              # CODE XREF: decide_command+398↑j
    mov     g8, r15
    mov     g7, g8
    mov     r15, g7
loc_12E40:                              # CODE XREF: decide_command+118↑j
    ldos    0x194(g7), g0
    mov     5, g1
    call    calc_mht_adr
    ldos    1(g0), r3
    shlo    0x18, 0xD, r13
    addi    r13, r3, r15
    st      r15, 0x194(g8)
    ldob    3(g0), r3
    lda     aNage, g0       # "nage    "
    stob    r3, 0x822(g8)
    ld      debug_flag, r15
    bbs     9, r15, loc_12E84
    lda     0x10008E8, g9
    call    print_mes
loc_12E84:                              # CODE XREF: decide_command+3E0↑j
    ld      0x1A4(g8), r15
    clrbit  0x15, r15, r15
    st      r15, 0x1A4(g8)
    ld      0x1A4(g7), r3
    shro    0xF, r3, r3
    ld      0x0(g7), r13
    xor     r13, r3, r3
    ld      0x0(g8), r4
    chkbit  6, r3
    alterbit 6, r4, r4
    st      r4, 0x0(g8)
    b       loc_12F80
# ---------------------------------------------------------------------------
loc_12EB4:                              # CODE XREF: decide_command+470↓j
    shlo    0x18, 1, r15
    st      r15, 0x194(g7)
    ld      0x1A4(g7), r15
    clrbit  0, r15, r15
    st      r15, 0x1A4(g7)
    b       loc_12F80
# ---------------------------------------------------------------------------
loc_12ECC:                              # CODE XREF: decide_command:loc_12E30↑j
    addo    0x1F, 5, r13
    cmpobne r13, r7, loc_12EEC
    addo    0x1F, 5, r13
    cmpobne r13, r8, loc_12F00
    ld      game_timer, r15
    bbc     0, r15, loc_12F00
    b       loc_12EF4
# ---------------------------------------------------------------------------
loc_12EEC:                              # CODE XREF: decide_command+43C↑j
    addo    0x1F, 5, r13
    cmpobne r13, r8, loc_12F80
loc_12EF4:                              # CODE XREF: decide_command+454↑j
    mov     g8, r15
    mov     g7, g8
    mov     r15, g7
loc_12F00:                              # CODE XREF: decide_command+444↑j
    ld      0x0(g8), r15
    bbs     5, r15, loc_12EB4
    ldos    0x194(g7), g0
    mov     5, g1
    call    calc_mht_adr
    ldos    1(g0), r3
    lda     0x25000000, r13
    addi    r13, r3, r15
    st      r15, 0x194(g8)
    ldob    3(g0), r3
    lda     aNage, g0       # "nage    "
    stob    r3, 0x822(g8)
    ld      debug_flag, r15
    bbs     9, r15, loc_12F50
    lda     0x10008E8, g9
    call    print_mes
loc_12F50:                              # CODE XREF: decide_command+4AC↑j
    ld      0x1A4(g8), r15
    clrbit  0x15, r15, r15
    st      r15, 0x1A4(g8)
    ld      0x1A4(g7), r3
    shro    0xF, r3, r3
    ld      0x0(g7), r13
    xor     r13, r3, r3
    ld      0x0(g8), r4
    chkbit  6, r3
    alterbit 6, r4, r4
    st      r4, 0x0(g8)
    b       loc_12F80
# ---------------------------------------------------------------------------
loc_12F80:                              # CODE XREF: decide_command+24↑j
    mov     r10, g7
    mov     r11, g8
    mov     0, r3
    st      r3, 0x198(g7)
    st      r3, 0x198(g8)
    ret
# End of function decide_command
# =============== S U B R O U T I N E =======================================
decide_my_command:                      # CODE XREF: decide_command+8↑p
    ld      0x198(g7), r3   # Label from Fighting Vipers source
    cmpobne 0, r3, loc_13030
    ld      0x684(g7), r3
    cmpobe  0, r3, loc_12FB4
    ldos    0x1AA(g7), r13
    ldos    0x62A(g7), r14
    cmpobe  r13, r14, loc_13030
loc_12FB4:                              # CODE XREF: decide_my_command+C↑j
    ldob    0x197(g7), r3
    cmpobne 0x17, r3, loc_12FEC
    ldos    0x194(g7), g0
    mov     0xF, g1
    call    calc_mht_adr
    ldob    1(g0), r4
    ldob    2(g0), r15
    shlo    8, r15, r15
    addo    r15, r4, r4
    subo    1, r4, r4
    stos    r4, 0x62A(g7)
    ld      0x194(g7), r15
    st      r15, 0x684(g7)
    b       loc_13010
# ---------------------------------------------------------------------------
loc_12FEC:                              # CODE XREF: decide_my_command+20↑j
    cmpobne 0x18, r3, loc_13000
    ldos    0x1AA(g7), r3
    addo    3, r3, r3
    stos    r3, 0x1AA(g7)
    b       loc_13010
# ---------------------------------------------------------------------------
loc_13000:                              # CODE XREF: decide_my_command:loc_12FEC↑j
    ld      0x0(g7), r15
    bbc     4, r15, loc_1301C
    cmpobe  9, r3, loc_1301C
    cmpobe  0x1C, r3, loc_1301C
loc_13010:                              # CODE XREF: decide_my_command+50↑j
    mov     0, r15
    st      r15, 0x194(g7)
    ret
# ---------------------------------------------------------------------------
loc_1301C:                              # CODE XREF: decide_my_command+6C↑j
    ld      0x194(g7), r14
    cmpobe  0, r14, loc_1302C
    mov     0, r15
    st      r15, 0x684(g7)
loc_1302C:                              # CODE XREF: decide_my_command+88↑j
    ret
# ---------------------------------------------------------------------------
loc_13030:                              # CODE XREF: decide_my_command+4↑j
    st      r3, 0x194(g7)
    mov     0, r15
    st      r15, 0x684(g7)
    ret
# End of function decide_my_command
# =============== S U B R O U T I N E =======================================
exec_command:                           # CODE XREF: action_init+6BC↑p
    ld      0x194(g7), r11  # Label from official source
    cmpobe  0, r11, loc_13058 # if action = 0 then branch (return)
    ldob    0x197(g7), r3   # r3 = p1_command or p2_command
    ld      SOMETHING_MOVES[r3*8], r4 # r4=(p1_command*8)+SOMETHING_MOVES or (p2_command*8)+SOMETHING_MOVES
    bx      (r4)
# ---------------------------------------------------------------------------
loc_13058:                              # CODE XREF: exec_command+4↑j
    ret                     # return
# End of function exec_command
# =============== S U B R O U T I N E =======================================
sub_1305C:                              # DATA XREF: ROM:0001D12C↓o
    ldob    0x19F(g7), r14
    cmpobe  0x1C, r14, loc_13448
    mov     0, r15
    stib    r15, 0x1B2(g7)
    st      r11, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_13074:                              # DATA XREF: ROM:0001D074↓o
    ldos    (check_word2+2)(g6), g0
    ld      0x0(g7), r15
    bbc     0x1D, r15, loc_130C8
    ldos    check_word3(g6), g0
    b       loc_130C8
# ---------------------------------------------------------------------------
loc_13090:                              # DATA XREF: ROM:0001D0C4↓o
    ldos    0x1AA(g7), r14
    cmpobl  0x16, r14, loc_130A4
    ldob    0x197(g7), r13
    ldob    0x19F(g7), r14
    cmpobe  r13, r14, loc_13134
loc_130A4:                              # CODE XREF: sub_1305C+38↑j
    ldos    (check_word1+2)(g6), g0
    ld      0x5F4(g7), r3
    lda     0x3FE66666, r4
    cmpr    r4, r3
    bg      loc_130C8
    ldos    check_word2(g6), g0
loc_130C8:                              # CODE XREF: sub_1305C+24↑j
    call    set_motion
    st      r11, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
    ldob    0x197(g7), r13
    ldob    0x19F(g7), r14
    cmpobe  r13, r14, loc_13134
    b       loc_13120
# ---------------------------------------------------------------------------
loc_130E4:                              # DATA XREF: ROM:0001D084↓o
    ld      0x1A4(g7), r15
    bbs     0x1A, r15, loc_13134
    b       loc_13120
# ---------------------------------------------------------------------------
selected_player_check:                  # DATA XREF: ROM:0001D05C↓o
    ldob    0x1B1(g7), r14
    cmpobe  5, r14, loc_13134 # If Bark
    ldob    0x1B1(g7), r14
    cmpobe  8, r14, loc_13134 # If Eggman (mechless)
    ldob    0x1B1(g7), r14
    cmpobe  9, r14, loc_13134 # If Big Eggman
    ldob    0x1B1(g7), r14
    cmpobe  11, r14, loc_13134 # If Boss Eggman
    b       loc_13120
# ---------------------------------------------------------------------------
loc_13114:                              # DATA XREF: ROM:0001D0BC↓o
    ldob    0x197(g7), r13
    ldob    0x19F(g7), r14
    cmpobe  r13, r14, loc_13134
loc_13120:                              # CODE XREF: sub_1305C+84↑j
    st      r11, 0x19C(g7)  # store r11 to P1_PARTS+0x19C
    mov     0, r15
    stib    r15, 0x1B2(g7)  # store 0 to P1_PARTS+0x1B2
    mov     0, r15
    stis    r15, 0x1AE(g7)  # P1_PARTS+0x1AE = 0
loc_13134:                              # CODE XREF: sub_1305C+44↑j
    ret
# ---------------------------------------------------------------------------
loc_13138:                              # DATA XREF: ROM:0001D0B4↓o
    ld      0x1A4(g7), r15
    bbc     0xD, r15, loc_13160
    ld      0x70C(g7), r15
    bbs     0x18, r15, loc_13160
    mov     0x13, r15
    st      r15, 0xC6C(g7)
    ld      0xC70(g7), r4
    cmpobe  0, r4, loc_1315C
    subo    1, r4, r4
loc_1315C:                              # CODE XREF: sub_1305C+F8↑j
    st      r4, 0xC70(g7)
loc_13160:                              # CODE XREF: sub_1305C+E0↑j
    st      r11, 0x19C(g7)
    mov     0, r15
    stib    r15, 0x1B2(g7)
    mov     0, r15
    stis    r15, 0x1AE(g7)
    ret
# ---------------------------------------------------------------------------
loc_13178:                              # DATA XREF: ROM:0001D18C↓o
    ldos    0x194(g7), g0   # Loads animation move data
    cmpobe  0, g0, loc_13184
    call    set_motion
loc_13184:                              # CODE XREF: sub_1305C+120↑j
    st      r11, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_1318C:                              # DATA XREF: ROM:0001D184↓o
    ldob    0x19F(g7), r14
    cmpobne 6, r14, loc_131A8
    ldos    0x194(g7), g0
    cmpobe  0, g0, loc_131A8
    call    set_motion
    mov     0xF, r15
    stis    r15, 0x1AA(g7)
loc_131A8:                              # CODE XREF: sub_1305C+134↑j
    st      r11, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_131B0:                              # DATA XREF: ROM:0001D17C↓o
    ldos    0x194(g7), g0
    cmpobe  0, g0, p1_move_thing
    call    set_motion
p1_move_thing:                          # CODE XREF: sub_1305C+158↑j
    ld      0x1F4(g8), r15
    st      r15, 0x600(g7)
    ld      0x1F8(g8), r15
    st      r15, 0x604(g7)
    ld      0x1FC(g8), r15
    st      r15, 0x608(g7)
    st      r11, 0x19C(g7)  # Writes move to P1
    mov     0, r15
    stib    r15, 0x1B2(g7)
    ret
# ---------------------------------------------------------------------------
loc_131E4:                              # DATA XREF: ROM:0001D07C↓o
    addo    0x1F, 0xB, r13
    ldob    0x19F(g7), r14
    cmpobne r13, r14, loc_1320C
    lda     0xFFFFFF, r13
    and     r13, r11, r11
    shlo    0x19, 0x15, r13
    addi    r13, r11, r15
    st      r15, 0x19C(g7)
    ret
# ---------------------------------------------------------------------------
loc_1320C:                              # CODE XREF: sub_1305C+190↑j
    ld      0x1A4(g7), r7
    ld      0x0(g7), r6
    mov     0, r5
    ldob    0x197(g7), r13
    ldob    0x19F(g7), r14
    cmpobne r13, r14, loc_13240
    bbc     0xC, r7, loc_13240
    ldob    0x1B2(g7), r14
    cmpobl  1, r14, loc_133A0
    mov     1, r5
    ld      0x19C(g7), r3
    or      r3, r11, r11
    b       loc_13270
# ---------------------------------------------------------------------------
loc_13240:                              # CODE XREF: sub_1305C+1C4↑j
    mov     0, r15
    stis    r15, 0x1A8(g7)
    mov     0, r15
    stib    r15, 0x1B2(g7)
    lda     0x3F800000, r3
    bbs     0x10, r11, loc_1326C
    lda     0xBF800000, r3
    bbs     0x11, r11, loc_1326C
    mov     0, r3
loc_1326C:                              # CODE XREF: sub_1305C+1FC↑j
    st      r3, 0x5C4(g7)
loc_13270:                              # CODE XREF: sub_1305C+1E0↑j
    ld      0x0(g7), r15
    bbc     0x1D, r15, loc_1328C
    ld      0x190(g7), r3
    ld      0x20(r3), r3
    ldob    1(r3), r3
    stob    r3, 0x5BE(g7)
    b       loc_132B0
# ---------------------------------------------------------------------------
loc_1328C:                              # CODE XREF: sub_1305C+218↑j
    ld      0x190(g7), r3
    ld      0x20(r3), r3
    ldob    0x0(r3), r3
    stob    r3, 0x5BE(g7)
    bbc     0x12, r11, loc_132B0
    ld      0x190(g7), r3
    ld      0x20(r3), r3
    ldob    1(r3), r3
    stob    r3, 0x5BE(g7)
loc_132B0:                              # CODE XREF: sub_1305C+22C↑j
    ldos    (displacement64)(g6), g0
    ld      0x0(g7), r15
    bbs     0x1D, r15, loc_1332C
    ldos    0x194(g7), g0
    cmpobe  0, g0, loc_132F0
    mov     3, g1
    call    calc_mht_adr
    ldob    1(g0), r3
    ldob    2(g0), r15
    shlo    8, r15, r15
    addo    r15, r3, r3
    cmpobe  0, r3, loc_132EC
    ldos    0x194(g7), g0
    b       loc_1332C
# ---------------------------------------------------------------------------
loc_132EC:                              # CODE XREF: sub_1305C+284↑j
    setbit  1, r5, r5
loc_132F0:                              # CODE XREF: sub_1305C+268↑j
    ldos    (displacement56)(g6), g0
    bbs     0x15, r11, loc_1331C
    bbc     0x12, r11, loc_1332C
    ldos    (displacement60)(g6), g0
    ld      0x19C(g7), r15
    bbc     0x11, r15, loc_1332C
    ldos    (displacement62)(g6), g0
    b       loc_1332C
# ---------------------------------------------------------------------------
loc_1331C:                              # CODE XREF: sub_1305C+29C↑j
    ld      0x19C(g7), r15
    bbs     0x11, r15, loc_1332C
    ldos    (displacement58)(g6), g0
loc_1332C:                              # CODE XREF: sub_1305C+260↑j
    ldos    0x1A8(g7), r13
    cmpobe  r13, g0, loc_13370
    ldos    0x1AA(g7), r3
    call    set_motion
    ld      0x1A4(g7), r15
loc_13340:                              # DATA XREF: MAIN_DATA:02820734↓o
    bbs     0xC, r15, loc_1335C
    mov     0, r15
    stis    r15, 0x1AA(g7)
    lda     0x6040000, r13
    andnot  r13, r11, r11
    b       loc_13410
# ---------------------------------------------------------------------------
loc_1335C:                              # CODE XREF: sub_1305C:loc_13340↑j
    bbc     0, r5, loc_13370
    ldos    0x80E(g7), r4
    cmpible r3, r4, loc_1336C
    mov     r4, r3
loc_1336C:                              # CODE XREF: sub_1305C+308↑j
    stos    r3, 0x1AA(g7)
loc_13370:                              # CODE XREF: sub_1305C+2D4↑j
    ld      0x0(g7), r15
    bbs     0x1D, r15, loc_13410
    bbc     0x14, r11, loc_13394
    ld      0x1F4(g8), r15
    st      r15, 0x600(g7)
    ld      0x1F8(g8), r15
    st      r15, 0x604(g7)
    ld      0x1FC(g8), r15
    st      r15, 0x608(g7)
loc_13394:                              # CODE XREF: sub_1305C+31C↑j
    bbs     1, r5, loc_13410
    bbc     0x13, r11, loc_13410
    b       loc_133C8
# ---------------------------------------------------------------------------
loc_133A0:                              # CODE XREF: sub_1305C+1D0↑j
    ld      0xA08(g7), r15
    bbs     9, r15, loc_13414
    ld      0xA08(g7), r15
    bbs     0x19, r15, loc_133F0
    ldos    0x194(g7), g0
    cmpobe  0, g0, loc_13410
    bbs     0x13, r11, loc_133C8
    bbs     0x17, r11, loc_133EC
    call    set_motion
    b       loc_13410
# ---------------------------------------------------------------------------
loc_133C8:                              # CODE XREF: sub_1305C+340↑j
    ldos    0x194(g7), g0
    mov     3, g1
    call    calc_mht_adr
    ldob    5(g0), r3
    ldob    6(g0), r15
    shlo    8, r15, r15
    addo    r15, r3, r3
    stos    r3, 0x5C0(g7)
    b       loc_13410
# ---------------------------------------------------------------------------
loc_133EC:                              # CODE XREF: sub_1305C+360↑j
    b       loc_13410
# ---------------------------------------------------------------------------
loc_133F0:                              # CODE XREF: sub_1305C+350↑j
    ldos    0x194(g7), g0
    cmpobe  0, g0, loc_13410
    bbs     0x16, r11, loc_13408
    bbs     0x17, r11, loc_1340C
    bbs     0x13, r11, loc_133C8
    b       loc_13410
# ---------------------------------------------------------------------------
loc_13408:                              # CODE XREF: sub_1305C+39C↑j
    b       loc_13410
# ---------------------------------------------------------------------------
loc_1340C:                              # CODE XREF: sub_1305C+3A0↑j
    b       loc_13410
# ---------------------------------------------------------------------------
loc_13410:                              # CODE XREF: sub_1305C+2FC↑j
    st      r11, 0x19C(g7)
loc_13414:                              # CODE XREF: sub_1305C+348↑j
    ret
# ---------------------------------------------------------------------------
loc_13418:                              # DATA XREF: ROM:0001D094↓o
    ldob    0x19F(g7), r14
    cmpobne 9, r14, loc_1343C
    ldos    0x194(g7), r13
    ldos    0x5DC(g7), r14
    addi    r13, r14, r15
    stos    r15, 0x5DC(g7)
    ldob    0x196(g7), r14
    cmpobne 1, r14, loc_13444
    b       loc_13448
# ---------------------------------------------------------------------------
loc_1343C:                              # CODE XREF: sub_1305C+3C0↑j
    mov     0, r15
    stib    r15, 0x1B2(g7)
loc_13444:                              # CODE XREF: sub_1305C+3D8↑j
    st      r11, 0x19C(g7)
loc_13448:                              # CODE XREF: sub_1305C+4↑j
    ret
# End of function sub_1305C

        .section exec
# =============== S U B R O U T I N E =======================================
exec_action:                            # CODE XREF: action_init+6C8↑p
    ld      0x19C(g7), r14  # Label from official source
    cmpobe  0, r14, ACT_RC_SHIFT # if move 0 return
    ldob    0x19F(g7), r3   # r3 = P1_PARTS+0x19F
    ld      ACTUAL_MOVES[r3*8], r4 # Sonic Punch is 0x13C18
    bx      (r4)
# ---------------------------------------------------------------------------
ACT_RC_SHIFT:                           # CODE XREF: exec_action+4↑j
    ret                     # Label from official source
# End of function exec_action

        .section action_rob_revise
# =============== S U B R O U T I N E =======================================
rob_revise_yang:                        # CODE XREF: action_init+6D4↑p
    ld      mod_fa_coli, r3 # Label from official source
    ld      0x0(r3), r15
    bbc     0x1F, r15, loc_17F74
    ldis    0x5B6(g7), r9
    ld      0x1A4(g7), r7
    ld      0x1A4(g8), r8
    bbc     8, r7, loc_17CD0
    ldob    0x821(g7), r3
    cmpobne 4, r3, loc_17CD0
    ldos    0x760(g7), r9
    b       loc_17E90
# ---------------------------------------------------------------------------
loc_17CD0:                              # CODE XREF: rob_revise_yang+1C↑j
    ld      0x0(g7), r15
    bbc     9, r15, loc_17CDC
    ldos    0x61A(g7), r9
loc_17CDC:                              # CODE XREF: rob_revise_yang+34↑j
    ld      0x70C(g7), r15
    bbs     2, r15, loc_17EAC
    bbs     0x19, r7, loc_17F74
    ld      0x0(g7), r15
    bbs     0x16, r15, loc_17F74
    bbs     0xD, r7, loc_17E58
    ld      0x860(g7), r15
    bbc     0x14, r15, loc_17D00
    b       loc_17E58
# ---------------------------------------------------------------------------
loc_17D00:                              # CODE XREF: rob_revise_yang+58↑j
    ld      0x860(g7), r15
    bbc     0x13, r15, loc_17D0C
    b       loc_17E58
# ---------------------------------------------------------------------------
loc_17D0C:                              # CODE XREF: rob_revise_yang+64↑j
    bbc     0x1F, r7, loc_17D1C
    ld      0x804(g7), r15
    bbs     8, r15, loc_17E58
    b       loc_17E74
# ---------------------------------------------------------------------------
loc_17D1C:                              # CODE XREF: rob_revise_yang:loc_17D0C↑j
    bbc     0x1F, r8, loc_17D2C
    bbs     2, r8, loc_17D2C
    bbs     8, r8, loc_17D2C
    b       loc_17F74
# ---------------------------------------------------------------------------
loc_17D2C:                              # CODE XREF: rob_revise_yang:loc_17D1C↑j
    ld      0x860(g8), r15
    bbc     0x15, r15, loc_17D38
    b       loc_17E58
# ---------------------------------------------------------------------------
loc_17D38:                              # CODE XREF: rob_revise_yang+90↑j
    ld      0x804(g7), r15
    bbc     0xF, r15, loc_17D44
    b       loc_17E58
# ---------------------------------------------------------------------------
loc_17D44:                              # CODE XREF: rob_revise_yang+9C↑j
    bbs     0xE, r7, loc_17F74
    bbc     0x10, r7, loc_17D58
    bbs     8, r7, loc_17D58
    bbc     8, r8, loc_17D58
    bbs     4, r8, loc_17F74
loc_17D58:                              # CODE XREF: rob_revise_yang+A8↑j
    bbc     0x13, r7, loc_17D60
    b       loc_17F74
# ---------------------------------------------------------------------------
loc_17D60:                              # CODE XREF: rob_revise_yang:loc_17D58↑j
    bbc     0x12, r7, loc_17D6C
    bbs     1, r7, loc_17DD8
    b       loc_17F74
# ---------------------------------------------------------------------------
loc_17D6C:                              # CODE XREF: rob_revise_yang:loc_17D60↑j
    bbs     0x11, r7, loc_17E58
    bbs     0xE, r7, loc_17E58
    bbs     2, r7, loc_17E3C
    bbs     0xA, r7, loc_17DE8
    lda     off_1010, r13
    and     r13, r7, r3
    shlo    0xC, 1, r13
    cmpobe  r13, r3, loc_17DE8
    lda     0x4010, r3
    and     r3, r8, r4
    cmpobe  r3, r4, loc_17E3C
    bbc     1, r7, loc_17DB0
    bbs     0xF, r8, loc_17F74
    bbs     0x1F, r8, loc_17E00
    b       loc_17E58
# ---------------------------------------------------------------------------
loc_17DB0:                              # CODE XREF: rob_revise_yang+100↑j
    bbc     0x1C, r7, loc_17DB8
    b       loc_17E00
# ---------------------------------------------------------------------------
loc_17DB8:                              # CODE XREF: rob_revise_yang:loc_17DB0↑j
    b       loc_17F74
# ---------------------------------------------------------------------------
    ldis    0x26(g7), r13
    subi    r13, r9, r9
    b       loc_17E44
# ---------------------------------------------------------------------------
    ldis    0x26(g7), r13
    subi    r13, r9, r9
    lda     0x38E, r6
    b       loc_17EEC
# ---------------------------------------------------------------------------
loc_17DD8:                              # CODE XREF: rob_revise_yang+C4↑j
    ldis    0x26(g7), r13
    ldis    0x26(g8), r14
    subi    r13, r14, r9
    b       loc_17E44
# ---------------------------------------------------------------------------
loc_17DE8:                              # CODE XREF: rob_revise_yang+D8↑j
    addo    0x1F, 0xE, r6
    ld      0x0(g8), r15
    bbs     9, r15, loc_17DFC
    bbc     0xF, r8, loc_17E3C
    lda     0x5B, r6
loc_17DFC:                              # CODE XREF: rob_revise_yang+150↑j
    b       loc_17E04
# ---------------------------------------------------------------------------
loc_17E00:                              # CODE XREF: rob_revise_yang+108↑j
    lda     0x16C, r6
loc_17E04:                              # CODE XREF: rob_revise_yang:loc_17DFC↑j
    ldis    0x5B4(g7), r13
    subi    r13, r9, r9
    lda     loc_2AA8, r7
    mov     1, r5
    b       loc_17EC8
# ---------------------------------------------------------------------------
    ldis    0x5B4(g7), r13
    subi    r13, r9, r9
    lda     0x3FFC, r7
    ldis    word_1D004, r6
    mov     0, r5
    b       loc_17EC8
# ---------------------------------------------------------------------------
loc_17E3C:                              # CODE XREF: rob_revise_yang+D4↑j
    ldis    0x5B4(g7), r13
    subi    r13, r9, r9
loc_17E44:                              # CODE XREF: rob_revise_yang+124↑j
    lda     0x5FFA, r7
    lda     0x38E, r6
    mov     0, r5
    b       loc_17EC8
# ---------------------------------------------------------------------------
loc_17E58:                              # CODE XREF: rob_revise_yang+50↑j
    ldis    0x5B4(g7), r13
    subi    r13, r9, r9
    lda     0x5FFA, r7
    lda     0x71C, r6
    mov     0, r5
    b       loc_17EC8
# ---------------------------------------------------------------------------
loc_17E74:                              # CODE XREF: rob_revise_yang+78↑j
    ldis    0x5B4(g7), r13
    subi    r13, r9, r9
    lda     loc_BFF4, r7
    lda     0x71C, r6
    mov     0, r5
    b       loc_17EC8
# ---------------------------------------------------------------------------
loc_17E90:                              # CODE XREF: rob_revise_yang+2C↑j
    ldis    0x26(g7), r13
    subi    r13, r9, r9
    lda     loc_BFF4, r7
    lda     0x71C, r6
    mov     0, r5
    b       loc_17EC8
# ---------------------------------------------------------------------------
loc_17EAC:                              # CODE XREF: rob_revise_yang+40↑j
    ldis    0x26(g7), r13
    subi    r13, r9, r9
    lda     loc_7FF8, r7
    lda     0xE38, r6
    mov     0, r5
    b       loc_17EC8
# ---------------------------------------------------------------------------
loc_17EC8:                              # CODE XREF: rob_revise_yang+178↑j
    shlo    0x10, r9, r15
    shri    0x10, r15, r9
    subi    r7, 0, r3
    cmpi    r9, r3
    concmpi r9, r7
    be      loc_17EF4
    cmpobne 0, r5, loc_17F74
    shlo    0xF, 1, r13
    addi    r13, r9, r9
loc_17EEC:                              # CODE XREF: rob_revise_yang+134↑j
    shlo    0x10, r9, r15
    shri    0x10, r15, r9
loc_17EF4:                              # CODE XREF: rob_revise_yang+23C↑j
    subi    r6, 0, r3
    cmpible r3, r9, loc_17F00
    mov     r3, r9
loc_17F00:                              # CODE XREF: rob_revise_yang+258↑j
    cmpibge r6, r9, loc_17F08
    mov     r6, r9
loc_17F08:                              # CODE XREF: rob_revise_yang:loc_17F00↑j
    ld      0x0(g7), r15
    bbc     2, r15, loc_17F18
    ldob    0x83F(g7), r14
    bbs     0, r14, loc_17F68
loc_17F18:                              # CODE XREF: rob_revise_yang+26C↑j
    ld      0x1F4(g7), r13
    ld      0x18(g7), r14
    subr    r13, r14, r3
    ld      0x1FC(g7), r13
    ld      0x20(g7), r14
    subr    r13, r14, r4
    lda     0x2D805B5B, r15
    st      r15, (g11)[g12*1]
    st      r9, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    ld      (g11)[g12*1], r5
    ld      (g11)[g12*1], r6
    ld      0x1F4(g7), r13
    addr    r13, r5, r15
    st      r15, 0x18(g7)
    ld      0x1FC(g7), r13
    addr    r13, r6, r15
    st      r15, 0x20(g7)
loc_17F68:                              # CODE XREF: rob_revise_yang+274↑j
    ldis    0x26(g7), r14
    addi    r9, r14, r15
    stis    r15, 0x26(g7)
loc_17F74:                              # CODE XREF: rob_revise_yang+C↑j
    ret
# End of function rob_revise_yang
# =============== S U B R O U T I N E =======================================
rob_spd_control:                        # CODE XREF: action_init+6D8↑p
    ldt     0x18(g7), r4    # Label from official source
    stt     r4, 0xA4C(g7)
    stt     r4, 0x50E000
    ld      0x50A004, r13
    ld      0x50A000, r14
    mulr    r13, r14, r5
    lda     0x3E800000, r13
    mulr    r13, r5, r5
    ld      0x5D8(g7), r13
    mulr    r13, r5, r5
    lda     0x3C888888, r13
    mulr    r13, r5, r5
    lda     0x3F800000, r13
    ld      0x5D4(g7), r14
    addr    r13, r14, r3
    mulr    r3, r5, r5
    ld      0x50A008, r13
    mulr    r13, r5, r6
    mov     0, r7
    ld      0x1A4(g7), r15
    bbs     4, r15, rsc_fric_end
    lda     0x16802D2D, r15
    st      r15, (g11)[g12*1]
    ld      0x2C(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x34(g7), r15
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    cmpible r3, r5, rsc_stop
    divr    r3, r5, r5
    lda     0x3F800000, r14
    subr    r5, r14, r5
    ld      0x2C(g7), r14
    mulr    r5, r14, r15
    st      r15, 0x2C(g7)
    ld      0x34(g7), r14
    mulr    r5, r14, r15
    st      r15, 0x34(g7)
    mov     1, r7
    b       rsc_fric_end
# ---------------------------------------------------------------------------
rsc_stop:                               # CODE XREF: rob_spd_control+90↑j
    mov     0, r3           # Label from official source
    st      r3, 0x2C(g7)
    st      r3, 0x34(g7)
rsc_fric_end:                           # CODE XREF: rob_spd_control+6C↑j
    lda     0x16802D2D, r15 # Label from official source
    st      r15, (g11)[g12*1]
    ld      0x5C8(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x5D0(g7), r15
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    cmpible r3, r6, rsc_estop
    divr    r3, r6, r6
    lda     0x3F800000, r14
    subr    r6, r14, r6
    ld      0x5C8(g7), r14
    mulr    r6, r14, r15
    st      r15, 0x5C8(g7)
    ld      0x5D0(g7), r14
    mulr    r6, r14, r15
    st      r15, 0x5D0(g7)
    b       rsc_espd_end
# ---------------------------------------------------------------------------
rsc_estop:                              # CODE XREF: rob_spd_control+F0↑j
    mov     0, r3           # Label from official source
    st      r3, 0x5C8(g7)
    st      r3, 0x5D0(g7)
    cmpobne 0, r7, rsc_espd_end
    st      r3, 0x5D4(g7)
rsc_espd_end:                           # CODE XREF: rob_spd_control+11C↑j
    ldos    0xA0E(g7), r3   # Label from official source
    cmpobe  0, r3, rsc_gra_chk
    subo    1, r3, r3
    stos    r3, 0xA0E(g7)
    cmpobne 0, r3, loc_181D4
    ldt     0xA10(g7), r8
    stt     r8, 0x2C(g7)
rsc_gra_chk:                            # CODE XREF: rob_spd_control+138↑j
    ld      0x0(g7), r15    # Label from official source
    bbs     2, r15, rsc_gra_calc
    ldos    0x61C(g7), r14  # P1_PARTS+0x61C or P2_PARTS+0x61C
    cmpobne 0, r14, rsc_no_gra
    ld      0x1F4(g7), r3
    ld      0x1FC(g7), r5
    ld      stage_soko, r4
    mov     1, r6
    ld      stage_x, r14
    clrbit  0x1F, r3, r13
    cmpr    r13, r14
    bge     loc_18114
    clrbit  0x1F, r5, r13
    cmpr    r13, r14
    bge     loc_18114
    mov     0, r4
    mov     0, r6
loc_18114:                              # CODE XREF: rob_spd_control+184↑j
    cmpobe  0, r6, rsc_no_gra
    b       rsc_no_gra
# ---------------------------------------------------------------------------
rsc_gra_calc:                           # CODE XREF: rob_spd_control+154↑j
    ld      0x50A000, r3  # Label from official source
    ld      0x1A4(g7), r15
    bbc     0xE, r15, rsc_normal_gravity
    ld      flt_1D290, r13
    ld      0x50A000, r14
    mulr    r13, r14, r3
rsc_normal_gravity:                     # CODE XREF: rob_spd_control+1B0↑j
    ld      0x30(g7), r14   # Label from official source
    subr    r3, r14, r15
    st      r15, 0x30(g7)
    ld      0x5CC(g7), r13
    ld      0x30(g7), r14
    addr    r13, r14, r15
    st      r15, 0x30(g7)
rsc_no_gra:                             # CODE XREF: rob_spd_control+15C↑j
    ld      0x2C(g7), r13   # Label from official source
    ld      0x18(g7), r14
    addr    r13, r14, r15
    st      r15, 0x18(g7)
    ld      0x30(g7), r13
    ld      0x1C(g7), r14
    addr    r13, r14, r15
    st      r15, 0x1C(g7)
    ld      0x34(g7), r13
    ld      0x20(g7), r14
    addr    r13, r14, r15
    st      r15, 0x20(g7)
    ld      not_scr_bg_move, r15
    ld      0x5C8(g7), r13
    ld      0x18(g7), r14
    addr    r13, r14, r15
    st      r15, 0x18(g7)
    ld      0x5D0(g7), r13
    ld      0x20(g7), r14
    addr    r13, r14, r15
    st      r15, 0x20(g7)
    ldt     0x18(g7), r4
    ldt     0x50E000, r8
    subr    r8, r4, r4
    subr    r9, r5, r5
    subr    r10, r6, r6
    stt     r4, 0x1E00(g7)
loc_181D4:                              # CODE XREF: rob_spd_control+144↑j
    ret
# End of function rob_spd_control

        .section after
# =============== S U B R O U T I N E =======================================
action_after:                           # CODE XREF: action_init+6E8↑p
    ldis    0x26(g7), r4    # Label from official source
    ld      0x1A4(g7), r15
    bbc     6, r15, loc_18418
    ldis    0x812(g7), r13
    addi    r13, r4, r4
loc_18418:                              # CODE XREF: action_after+8↑j
    stis    r4, 0x5B4(g7)
    ld      0x70C(g7), r15
    bbs     2, r15, loc_1843C
    ld      0x1A4(g7), r15
    bbs     0, r15, loc_1843C
    ld      0x0(g7), r15
    bbs     4, r15, loc_1843C
    mov     0, r15
    stib    r15, 0x6F4(g7)
loc_1843C:                              # CODE XREF: action_after+1C↑j
    ret
# End of function action_after

        .section fix_hara_fn
# =============== S U B R O U T I N E =======================================
fix_hara:                               # CODE XREF: decide_command+194↑p
    ld      0x0(g7), r9     # Label from Fighting Vipers source
    bbs     2, r9, loc_197F4
    ld      0x1F8(g7), r15
    st      r15, 0x1C(g7)
    ldob    0x83F(g7), r14
    bbs     0, r14, loc_197F0
    ld      0x1F4(g7), r15
    st      r15, 0x18(g7)
    ld      0x1FC(g7), r15
    st      r15, 0x20(g7)
loc_197F0:                              # CODE XREF: fix_hara+14↑j
    setbit  2, r9, r9
loc_197F4:                              # CODE XREF: fix_hara+4↑j
    or      0xC, r9, r15
    st      r15, 0x0(g7)
    ld      0x1A4(g7), r15
    setbit  4, r15, r15
    st      r15, 0x1A4(g7)
    ret
# End of function fix_hara
        .section calc_mht
# =============== S U B R O U T I N E =======================================
calc_mht_adr:                           # CODE XREF: decide_command+158↑p
    lda     loc_1FFC+3, r13 # Label from Fighting Vipers source
    and     r13, g0, r3
    ld      mot_list[r3*4], g0
    addo    0xD, g0, g0
loc_1BC98:                              # CODE XREF: calc_mht_adr+34↓j
    ldob    (g0), r3
    cmpobe  g1, r3, loc_1BCBC
    cmpobe  0, r3, loc_1BCB8
    cmpobe  8, r3, loc_1BCB8
    ldob    byte_1D006[r3], r4
    addo    r4, g0, g0
    b       loc_1BC98
# ---------------------------------------------------------------------------
loc_1BCB8:                              # CODE XREF: calc_mht_adr+20↑j
    mov     0, g0
loc_1BCBC:                              # CODE XREF: calc_mht_adr+1C↑j
    ret
# End of function calc_mht_adr

    .section control
# =============== S U B R O U T I N E =======================================
search_shift_data_adr:                  # CODE XREF: sub_1344C+8↑p
                ldob    0x83C(g7), r10  # Label from official source
                cmpobe  0, r10, loc_1CCF4
                ld      0x838(g7), r11
loc_1CCD8:                              # CODE XREF: search_shift_data_adr+24↓j
                ldob    1(r11), r3
                cmpobe  r3, g0, loc_1CCF8
                cmpobne 4, g0, loc_1CCE8
                cmpobe  1, r3, loc_1CCF8
loc_1CCE8:                              # CODE XREF: search_shift_data_adr+14↑j
                addo    6, r11, r11
                cmpdeco 1, r10, r10
                bl      loc_1CCD8
loc_1CCF4:                              # CODE XREF: search_shift_data_adr+4↑j
                mov     0, r11
loc_1CCF8:                              # CODE XREF: search_shift_data_adr+10↑j
                mov     r11, g0
                ret
# End of function search_shift_data_adr
# =============== S U B R O U T I N E =======================================
shift_mot_control:                      # CODE XREF: action_init+6CC↑p
                ldob    0x60C(g7), g0   # Label from official source
                cmpobe  0, g0, loc_1CD5C
                cmpobe  0x1F, g0, loc_1CD54
                call    search_shift_data_adr
                cmpobne 0, g0, loc_1CD20
                mov     0, r15
                stib    r15, 0x60C(g7)
                ret
# ---------------------------------------------------------------------------
loc_1CD20:                              # CODE XREF: shift_mot_control+10↑j
                ldob    2(g0), r3
                ldob    3(g0), r15
                shlo    8, r15, r15
                addo    r15, r3, r3
                ldos    0x1AA(g7), r13  # p1_motion_coma or p2_motion_coma
                cmpobl  r13, r3, loc_1CD5C
                ldob    4(g0), r3
                ldob    5(g0), r15
                shlo    8, r15, r15
                addo    r15, r3, r3
                mov     r3, g0
                call    set_motion
                ret
# ---------------------------------------------------------------------------
loc_1CD54:                              # CODE XREF: shift_mot_control+8↑j
                ldos    0x852(g7), g0   # P1_PARTS+0x852
                call    set_motion
loc_1CD5C:                              # CODE XREF: shift_mot_control+4↑j
                ret
# End of function shift_mot_control
# =============== S U B R O U T I N E =======================================
original_combo_control:                 # CODE XREF: action_init+6B4↑p
                ldob    0x1B1(g7), r14  # Label from official source
                cmpobne 16, r14, loc_1CD98 # if player is not Super Sonic branch
                ld      also_continue_count, r14
                cmpobne 0, r14, loc_1CD98 # if player Super Sonic's also_continue_count not equal to 0 branch
                ld      rounds_lost_vs_cpu, r14
                cmpobne 0, r14, loc_1CD98 # if Super Sonic's rounds_lost_vs_cpu not equal to 0 branch
                ld      0x0(g7), r15    # r15 = P1_PARTS
                setbit  18, r15, r15    # set bit 18 of P1_PARTS or P2_PARTS
                st      r15, 0x0(g7)    # store that value back into P1_PARTS or P2_PARTS
                lda     0x18C0, r15     # r15 = 0x18C0
                stis    r15, 0xC7C(g7)  # P1_PARTS+0xC7C or P2_PARTS+0xC7C = 0x18C0
loc_1CD98:                              # CODE XREF: original_combo_control+4↑j
                ldob    gameprogram, r14 # bit 0 clear = Player 1
                cmpobl  1, r14, loc_1CDBC
                ldob    stage_num, r14
                cmpobne 9, r14, loc_1CDBC
                lda     0x18C0, r15
                stis    r15, 0xC7C(g7)  # P1_PARTS+0xC7C
loc_1CDBC:                              # CODE XREF: original_combo_control+40↑j
                ld      0x0(g7), r15
                bbc     18, r15, loc_1CDF0
                ldis    0xC7C(g7), r14
                cmpibge 0, r14, loc_1CDE4
                ldis    0xC7C(g7), r14
                subi    1, r14, r15
                stis    r15, 0xC7C(g7)
                shlo    6, 5, r15
                stis    r15, 0xC7E(g7)
                b       loc_1CDF0
# ---------------------------------------------------------------------------
loc_1CDE4:                              # CODE XREF: original_combo_control+68↑j
                ld      0x0(g7), r15
                clrbit  0x12, r15, r15
                st      r15, 0x0(g7)
loc_1CDF0:                              # CODE XREF: original_combo_control+60↑j
                ldis    0xC7E(g7), r14
                cmpobge 0, r14, loc_1CE04
                ldis    0xC7E(g7), r14
                subi    1, r14, r15
                stis    r15, 0xC7E(g7)
loc_1CE04:                              # CODE XREF: original_combo_control+94↑j
                ret
# End of function original_combo_control
# =============== S U B R O U T I N E =======================================
air_mot_control:                        # CODE XREF: action_init+6B8↑p
                ld      0x0(g7), r3     # Label from official source
                bbs     13, r3, loc_1CE70
                bbc     2, r3, loc_1CE90 # return
                ld      0x30(g7), r15   # p1_yspd or p2_yspd
                bbc     31, r15, loc_1CE28 # if bit 31 of p1_yspd or p2_yspd is clear branch
                ld      0x0(g7), r15
                clrbit  3, r15, r15
                st      r15, 0x0(g7)
loc_1CE28:                              # CODE XREF: air_mot_control+10↑j
                ldos    0x818(g7), r14
                addi    1, r14, r4
                ldos    0x5BC(g7), r13
                subi    r13, r4, r4
                cmpibge 0, r4, loc_1CE4C
                ldos    0x1AA(g7), r3
                cmpo    r3, r4
                be      loc_1CE90       # return
                bl      loc_1CE90       # return
loc_1CE4C:                              # CODE XREF: air_mot_control+30↑j
                ldos    0x1AA(g7), r13
                ldos    0x816(g7), r14
                cmpoble r13, r14, loc_1CE90 # return
                ldos    0x1AA(g7), r14
                subi    1, r14, r15
                stos    r15, 0x1AA(g7)
                b       loc_1CE90       # return
# ---------------------------------------------------------------------------
                stos    r4, 0x1AA(g7)
                b       loc_1CE90       # return
# ---------------------------------------------------------------------------
loc_1CE70:                              # CODE XREF: air_mot_control+4↑j
                ldos    0x818(g7), r3
                cmpobe  0, r3, loc_1CE90 # return
                ldos    0x1AA(g7), r4
                cmpobge r4, r3, loc_1CE90 # return
                ld      0x1A4(g7), r15
                setbit  7, r15, r15
                st      r15, 0x1A4(g7)
                stos    r3, 0x1AA(g7)
loc_1CE90:                              # CODE XREF: air_mot_control+8↑j
                ret                     # return
# End of function air_mot_control
