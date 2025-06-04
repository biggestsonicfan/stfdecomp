        .section motion
# =============== S U B R O U T I N E =======================================
sub_1BCC0:                              # CODE XREF: play_motion+25C↓p
    ldob    0x1B0(g7), r3
    ld      CHAR_PARTS[r3*4], g5
    st      g5, 0x190(g7)
    ld      0xC(g5), g6
    st      g6, 0x1A0(g7)
    ldib    0x1B0(g7), r15
    stib    r15, 0x1B1(g7)
    mov     1, r4
    ld      mod_fa_osage0_1, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     osage_init, r5
    st      r5, 0xC(r3)
    mov     1, r4
    ld      mod_fa_osage0_2, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     osage_init, r5
    st      r5, 0xC(r3)
    ld      0x0(g5), r4
    lda     (r4), r14
    lda     0x40(g7), r13
    mov     0x10, r12
loc_1BD38:                              # CODE XREF: sub_1BCC0+8C↓j
    ld      (r14), r15
    st      r15, (r13)
    addo    4, r14, r14
    addo    4, r13, r13
    cmpdeco 1, r12, r12
    bl      loc_1BD38
    ld      8(g5), r4
    lda     (r4), r14
    lda     0x1B4(g7), r13
    mov     0x10, r12
loc_1BD60:                              # CODE XREF: sub_1BCC0+B4↓j
    ld      (r14), r15
    st      r15, (r13)
    addo    4, r14, r14
    addo    4, r13, r13
    cmpdeco 1, r12, r12
    bl      loc_1BD60
    ld      4(g5), r4
    lda     (r4), r14
    lda     0x8C(g7), r13
    addo    0x1F, 0xE, r12
loc_1BD88:                              # CODE XREF: sub_1BCC0+DC↓j
    ld      (r14), r15
    st      r15, (r13)
    addo    4, r14, r14
    addo    4, r13, r13
    cmpdeco 1, r12, r12
    bl      loc_1BD88
    ret
# End of function sub_1BCC0
# =============== S U B R O U T I N E =======================================
play_motion:                            # CODE XREF: action_init+6D0↑p
    ld      0x0(g7), r15    # Label from official source
    bbc     0x1F, r15, pm_ba_ps
    ldos    0x1A8(g7), r14
    cmpobe  0, r14, loc_1BE00
    ldos    0x1AA(g7), r3
    ldos    0x800(g7), r4
    cmpobe  0, r3, pm_load1
    cmpoble r3, r4, pm_load
    ldos    0x802(g7), g0
    lda     0xFFFF, r13
    cmpobe  r13, g0, loc_1BE20
    ldos    0x86C(g7), r14
    cmpobe  0, r14, loc_1BDF4
    ldos    0xA1C(g7), r13
    ldos    0x86E(g7), r14
    cmpoble r13, r14, loc_1BDF4
    ldis    0x86C(g7), r15
    stis    r15, 0x802(g7)
    ldos    0x802(g7), g0
loc_1BDF4:                              # CODE XREF: play_motion+34↑j
    cmpobne 0, g0, loc_1BE18
    stos    r4, 0x1AA(g7)
    b       pm_load
# ---------------------------------------------------------------------------
loc_1BE00:                              # CODE XREF: play_motion+C↑j
    ldos    displacement(g6), g0
    ld      0x0(g7), r15
    bbc     0x1D, r15, loc_1BE18
    ldos    (displacement2)(g6), g0
loc_1BE18:                              # CODE XREF: play_motion:loc_1BDF4↑j
    call    set_motion
    b       pm_load1
# ---------------------------------------------------------------------------
loc_1BE20:                              # CODE XREF: play_motion+2C↑j
    ld      0x6EC(g7), r15
    st      r15, 0x82C(g7)
    ld      0x1A4(g7), r15
    st      r15, 0xBD4(g7)
    ld      0x70C(g7), r15
    st      r15, 0xC58(g7)
    call    smooth_int
pm_load1:                               # CODE XREF: play_motion+18↑j
    mov     1, r15          # Label from official source
    stis    r15, 0x1AA(g7)
pm_load:                                # CODE XREF: play_motion+1C↑j
    call    calc_rob_angle  # Label from official source
    ldob    0xA00(g7), r3
    ldos    0x1AA(g7), r4
    ld      0x1A4(g7), r5
    cmpibe  0, r3, pm_ba_ps
    cmpibe  1, r3, basic_begin
    cmpibe  2, r3, basic_main
    cmpibe  3, r3, basic_follow1
basic_begin:                            # CODE XREF: play_motion+B4↑j
    ldos    0x808(g7), r3   # Label from official source
    ld      0x804(g7), r15
    bbc     8, r15, bb_no_rise_attack
    bbc     0xF, r15, bb_no_rise_attack
    cmpibl  r4, r3, bb_no_rise_attack
    clrbit  0x10, r5, r5
bb_no_rise_attack:                      # CODE XREF: play_motion+C8↑j
    cmpibl  r4, r3, pm_ba_ex # Label from official source
    clrbit  1, r5, r5
    ldob    0xA00(g7), r14
    addi    1, r14, r15
    stob    r15, 0xA00(g7)
basic_main:                             # CODE XREF: play_motion+B8↑j
    ldos    0x80A(g7), r14  # Label from official source
    cmpibl  r4, r14, pm_ba_ex
    bbc     8, r5, bm_ri_ps
    clrbit  0xF, r5, r5
bm_ri_ps:                               # CODE XREF: play_motion+F4↑j
    lda     0x4010100, r13  # Label from official source
    andnot  r13, r5, r5
    setbit  2, r5, r5
    mov     0, r15
    stis    r15, 0x1224(g7)
    mov     0, r15
    stis    r15, 0x1248(g7)
    ldob    0xA00(g7), r14
    addi    1, r14, r15
    stob    r15, 0xA00(g7)
basic_follow1:                          # CODE XREF: play_motion+BC↑j
    bbc     0xC, r5, bf1_ju_fo_ps # Label from official source
    bbc     4, r5, bf1_ju_fo_ps
    ldos    0x850(g7), r3
    cmpobe  0, r3, bf1_ju_fo_ps
    cmpibl  r4, r3, bf1_ju_fo_ps
    clrbit  0, r5, r5
bf1_ju_fo_ps:                           # CODE XREF: play_motion:basic_follow1↑j
    ld      0x0(g7), r15    # Label from official source
    bbc     0x12, r15, loc_1BF24
    ld      0x804(g7), r15
    bbc     8, r15, loc_1BF24
    ld      0x1A4(g7), r15
    bbs     4, r15, loc_1BF24
    ld      0x1A4(g7), r15
    bbs     0x12, r15, loc_1BF24
    ld      0x1A4(g7), r15
    bbs     0x13, r15, loc_1BF24
    ldos    0x80A(g7), r3
    addo    4, r3, r3
    cmpibl  r4, r3, pm_ba_ex
    b       loc_1BF2C
# ---------------------------------------------------------------------------
loc_1BF24:                              # CODE XREF: play_motion+14C↑j
    ldos    0x80C(g7), r14
    cmpibl  r4, r14, pm_ba_ex
loc_1BF2C:                              # CODE XREF: play_motion+17C↑j
    lda     0x1001, r13
    andnot  r13, r5, r5
    ldob    0xA00(g7), r14
    addi    1, r14, r15
    stob    r15, 0xA00(g7)
pm_ba_ex:                               # CODE XREF: play_motion:bb_no_rise_attack↑j
    st      r5, 0x1A4(g7)   # Label from official source
    ld      0x70C(g7), r15
    bbc     0x1A, r15, pm_ba_ps
    ldis    0xC7E(g7), r14
    cmpibl  0, r14, pm_ba_ps
    ld      0x0(g7), r15
    bbs     0x12, r15, pm_ba_ps
    ld      add_BACKUP_RAM_TO_RAM, r14
    ldob    0x3353(r14), r14 # r14 = BACKUP_RAM_TO_RAM+0x3353
    bbs     6, r14, pm_ba_ps
    ld      0xC70(g7), r14
    cmpibge 0, r14, pm_ba_ps
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobne 0, r14, pm_game_2P_ss_check
    ldob    p2_wins, r14
    cmpobne 0, r14, not_super_sonic
    ldob    p1_wins, r14
    cmpoble 1, r14, pm_game_2P_ss_check_pass
    b       not_super_sonic
# ---------------------------------------------------------------------------
pm_game_2P_ss_check:                    # CODE XREF: play_motion+1E0↑j
    ldob    p1_wins, r14    # Label from official source
    cmpobne 0, r14, not_super_sonic
    ldob    p2_wins, r14
    cmpoble 1, r14, pm_game_2P_ss_check_pass
    b       not_super_sonic
# ---------------------------------------------------------------------------
pm_game_2P_ss_check_pass:               # CODE XREF: play_motion+1F8↑j
    ld      also_continue_count, r14 # Label from official source
    cmpobne 0, r14, not_super_sonic # branch if any continues have been used
    ld      rounds_lost_vs_cpu, r14
    cmpobne 0, r14, not_super_sonic # branch if any rounds lost to cpu
    ldob    0x1B1(g7), r14
    cmpobne 0, r14, not_super_sonic # branch if player 1 selected isn't Sonic
    ldob    0x1B1(g8), r14
    cmpobe  3, r14, super_sonic
    ldob    0x1B1(g8), r14
    cmpobe  13, r14, super_sonic
    ldob    0x1B1(g8), r14
    cmpobne 11, r14, not_super_sonic
super_sonic:                            # CODE XREF: play_motion+240↑j
    mov     16, r15         # Label from official source
    stib    r15, 0x1B0(g7)  # set Super Sonic to P1_PARTS+0x1B0 or P2_PARTS+0x1B0
    call    sub_1BCC0
    call    sub_81038
    call    sub_7F0E8       # Inits player bodies
    call    scale_something
    call    char_nameplate_dsp
    lda     0xAE1013, g0    # load sd_game_bgm_13 Super Sonic music
    call    check_same_sound
    call    sound_request_u
    ldos    energy_max, r15
    stos    r15, 0x1AC(g7)  # P1_PARTS+0x1AC or P2_PARTS+0x1AC
not_super_sonic:                        # CODE XREF: play_motion+1EC↑j
    shlo    6, 3, r15       # Label from official source
    stis    r15, 0xC7C(g7)  # P1_PARTS+0xC7C or P2_PARTS+0xC7C
    ld      0x0(g7), r15
    setbit  0x12, r15, r15
    st      r15, 0x0(g7)
    ld      0x500034, r12
    lda     check_word1, r13
    lda     displacement32(r13), r13
    lda     (displacement64)(r13), r13
    lda     displacement128(r13), r13
    and     r13, r12, r13
    cmpobne 0, r13, pm_ba_ps
    mov     0x13, r15
    st      r15, 0xC6C(g7)  # P1_PARTS+0xC6C
    ld      0xC70(g7), r14  # p1_barriers or p2_barriers
    subi    1, r14, r15
    st      r15, 0xC70(g7)
pm_ba_ps:                               # CODE XREF: play_motion+4↑j
    ld      0x82C(g7), g4   # Label from official source
    cmpobe  0, g4, loc_1CA10
loc_1C090:                              # CODE XREF: play_motion+328↓j
    ldob    (g4), r7        # g4 = 0xD84B6
    clrbit  7, r7, r3
    cmpobe  0, r3, loc_1CA10
    ldob    1(g4), r4
    ldob    2(g4), r15
    shlo    8, r15, r15
    addo    r15, r4, r4
    ldos    0x1AA(g7), r6   # P1_PARTS+0x1AA
    cmpobl  r6, r4, loc_1CA10
    ld      0x0(g7), r15
    bbs     31, r15, _uk_player_action_loader # Always seems to hit
    bbs     7, r7, _uk_player_action_loader
    ldob    byte_1D01F(r3), r7
    addo    r7, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
_uk_player_action_loader:               # CODE XREF: play_motion+314↑j
    ld      _uk_player_actions[r3*4], r5
    bx      (r5)
# ---------------------------------------------------------------------------
loc_1C0DC:                              # DATA XREF: ROM:0001D1B0↓o
    ld      0x1A4(g7), r15
    notbit  0x15, r15, r15
    st      r15, 0x1A4(g7)
    addo    3, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C0F0:                              # DATA XREF: ROM:0001D1B4↓o
    shlo    0x18, 9, r15
    st      r15, 0x198(g7)
    mov     0, r15
    stis    r15, 0x5DE(g7)
    addo    3, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C108:                              # DATA XREF: ROM:0001D1B8↓o
    ldob    3(g4), r3
    ldob    4(g4), r15
    shlo    8, r15, r15
    addo    r15, r3, r3
    ld      0x0(g7), r15
    bbc     6, r15, loc_1C124
    subi    r3, 0, r3
loc_1C124:                              # CODE XREF: play_motion+378↑j
    ldis    0x26(g7), r13
    addi    r13, r3, r3
    subi    r3, 0, r12
    lda     0x10802121, r15
    st      r15, (g11)[g12*1]
    st      r12, (g11)[g12*1]
    ld      (g11)[g12*1], r4
    lda     0x11002222, r15
    st      r15, (g11)[g12*1]
    st      r12, (g11)[g12*1]
    ld      (g11)[g12*1], r5
    ldob    5(g4), r3
    ldob    6(g4), r15
    shlo    8, r15, r15
    addo    r15, r3, r3
    ldob    7(g4), r15
    shlo    0x10, r15, r15
    addo    r15, r3, r3
    ldob    8(g4), r15
    shlo    0x18, r15, r15
    addo    r15, r3, r3
    ldob    9(g4), r6
    ldob    0xA(g4), r15
    shlo    8, r15, r15
    addo    r15, r6, r6
    ldob    0xB(g4), r15
    shlo    0x10, r15, r15
    addo    r15, r6, r6
    ldob    0xC(g4), r15
    shlo    0x18, r15, r15
    addo    r15, r6, r6
    mulr    r3, r4, r15
    st      r15, 0x2C(g7)
    lda     0xA801515, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    st      r15, 0x34(g7)
    lda     0xA801515, r15
    st      r15, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    ld      0x50A000, r15
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    st      r3, 0x30(g7)
    call    fix_hara
    addo    0xD, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C1FC:                              # DATA XREF: ROM:0001D1BC↓o
    cmpobne r6, r4, loc_1C294
    ld      mode_flag, r3
    lda     mode128, r4
    cmpobe  r3, r4, loc_1C294
    ldob    3(g4), r3
    ldob    4(g4), r15
    shlo    8, r15, r15
    addo    r15, r3, r3
    ldob    5(g4), r15
    shlo    0x10, r15, r15
    addo    r15, r3, r3
    ldob    6(g4), r15
    shlo    0x18, r15, r15
    addo    r15, r3, r3
    lda     0xAE1133, r4    # sd_fence_1
    cmpobe  r3, r4, loc_1C27C
    lda     0xAE1147, r4    # sd_gum_2c
    cmpobne r3, r4, loc_1C264
    call    sub_32948
    mov     0, g0
    call    stage_contact_sound
    b       loc_1C294
# ---------------------------------------------------------------------------
loc_1C264:                              # CODE XREF: play_motion+4AC↑j
    lda     displacement, r4
    cmpobne r3, r4, loc_1C288
    mov     1, g0
    call    stage_contact_sound
    b       loc_1C294
# ---------------------------------------------------------------------------
loc_1C27C:                              # CODE XREF: play_motion+4A0↑j
    mov     3, g0
    call    sound_chainlink_hit
    b       loc_1C294
# ---------------------------------------------------------------------------
loc_1C288:                              # CODE XREF: play_motion+4C8↑j
    mov     r3, g0
    call    check_same_sound
    call    sound_request_u
loc_1C294:                              # CODE XREF: play_motion:loc_1C1FC↑j
    addo    7, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C29C:                              # DATA XREF: ROM:0001D1C0↓o
    ldob    3(g4), r3
    ld      0x1A4(g7), r15
    setbit  r3, r15, r15
    st      r15, 0x1A4(g7)
    addo    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C2B4:                              # DATA XREF: ROM:0001D1C4↓o
    ldob    3(g4), r3
    ld      0x1A4(g7), r15
    clrbit  r3, r15, r15
    st      r15, 0x1A4(g7)
    addo    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C2CC:                              # DATA XREF: ROM:0001D1C8↓o
    ldob    3(g4), r3
    ld      0x1A4(g7), r15
    notbit  r3, r15, r15
    st      r15, 0x1A4(g7)
    addo    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C2E4:                              # DATA XREF: ROM:0001D1CC↓o
    ldis    game_timer, r14
    cmpibge 0, r14, loc_1C340
    ldib    3(g4), r3
    ldis    0x1AC(g7), r4
    ldob    0xA28(g7), r5
    bbs     0, r5, loc_1C308
    stos    r3, 0x5DE(g7)
    b       loc_1C314
# ---------------------------------------------------------------------------
loc_1C308:                              # CODE XREF: play_motion+558↑j
    ldos    0x5DE(g7), r5
    addo    r3, r5, r5
    stos    r5, 0x5DE(g7)
loc_1C314:                              # CODE XREF: play_motion+560↑j
    mov     1, r15
    stib    r15, 0xA28(g7)
    subi    r3, r4, r4
    stos    r3, 0x1F70(g8)
    cmpibl  0, r4, loc_1C33C
    ld      0x0(g7), r15
    setbit  5, r15, r15
    st      r15, 0x0(g7)
    mov     0, r4
loc_1C33C:                              # CODE XREF: play_motion+584↑j
    stis    r4, 0x1AC(g7)
loc_1C340:                              # CODE XREF: play_motion+548↑j
    addo    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C348:                              # DATA XREF: ROM:0001D1D0↓o
    cmpobne r6, r4, loc_1C3AC
    ld      mode_flag, r3
    lda     mode128, r4
    cmpobe  r3, r4, loc_1C3AC
    ldob    3(g4), r3
    ldob    0x1B1(g7), r4   # P1_PARTS+0x1B1 or P2_PARTS+0x1B1
    cmpobe  9, r3, play_audio_per_character
    ldos    sd_wait_timer, r14
    cmpobl  0, r14, loc_1C3AC # if 0 is less than sd_wait_timer then branch
play_audio_per_character:               # CODE XREF: play_motion+5C4↑j
    ld      blank_per_character_audio_array[r3*4], r15 # Loads some kind of audio
    ld      (r15)[r4*4], r5
    cmpobe  0, r5, loc_1C3AC # Will always branch, r5 will always be 0
    mov     r5, g0
    call    check_same_sound
    call    sound_request_u
    ld      dword_DB2A8[r3*4], r15
    cmpobe  0, r15, loc_1C3AC
    ldos    (r15)[r4*2], r6
    cmpobe  0, r6, loc_1C3AC
    stos    r6, 0x7D0(g7)   # P1_PARTS+0x7D0 or P2_PARTS+0x7D0
loc_1C3AC:                              # CODE XREF: play_motion:loc_1C348↑j
    addo    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C3B4:                              # DATA XREF: ROM:0001D1D4↓o
    ldob    3(g4), r3
    ldob    4(g4), r15
    shlo    8, r15, r15
    addo    r15, r3, r3
    ldob    7(g4), r6
    ldob    8(g4), r10
    cmpobne 1, r6, loc_1C3DC
    ldos    0x1AC(g7), r14
    cmpibl  0, r14, loc_1C43C
    b       loc_1C444
# ---------------------------------------------------------------------------
loc_1C3DC:                              # CODE XREF: play_motion+628↑j
    lda     0x1282(g7), r7
    lda     0xF7, r13
    cmpobne r13, r6, loc_1C3F4
    lda     0x1280(g7), r7
loc_1C3F4:                              # CODE XREF: play_motion+644↑j
    mov     r3, g0
    call    check_front_back
    mov     g0, r3
    ldob    0x1202(g7), r5
loc_1C408:                              # CODE XREF: play_motion+694↓j
    subi    1, r5, r5
    lda     0x3F, r13
    and     r13, r5, r5
    ldob    (r7)[r5*4], r4
    cmpobe  0, r10, loc_1C428
    ldob    0x1280(g7)[r5*4], r11
    bbc     4, r11, loc_1C430
loc_1C428:                              # CODE XREF: play_motion+674↑j
    and     r6, r4, r4
    cmpobe  r3, r4, loc_1C444
loc_1C430:                              # CODE XREF: play_motion+680↑j
    ldob    0x1204(g7), r14
    cmpobne r5, r14, loc_1C408
loc_1C43C:                              # CODE XREF: play_motion+630↑j
    addo    9, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C444:                              # CODE XREF: play_motion+634↑j
    mov     0x1F, r15
    stib    r15, 0x60C(g7)
    ldib    5(g4), r15
    stib    r15, 0x852(g7)
    ldib    6(g4), r15
    stib    r15, 0x853(g7)
    b       loc_1CAF0
# ---------------------------------------------------------------------------
loc_1C460:                              # DATA XREF: ROM:0001D1D8↓o
    ldob    3(g4), r3
    ldob    4(g4), r15
    shlo    8, r15, r15
    addo    r15, r3, r3
    cmpobe  0, r3, loc_1C484
    call    rand            # Random value stored to g0
    cmpobl  g0, r3, loc_1C484
    addo    7, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C484:                              # CODE XREF: play_motion:loc_1C470↑j
    mov     0x1F, r15
    stib    r15, 0x60C(g7)
    ldib    5(g4), r15
    stib    r15, 0x852(g7)
    ldib    6(g4), r15
    stib    r15, 0x853(g7)
    b       loc_1CAF0
# ---------------------------------------------------------------------------
loc_1C4A0:                              # DATA XREF: ROM:0001D1DC↓o
    ldob    3(g4), r3
    ld      0x1A4(g8), r15
    clrbit  r3, r15, r15
    st      r15, 0x1A4(g8)
    addo    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C4B8:                              # DATA XREF: ROM:0001D1E0↓o
    ld      0x1A4(g7), r4
    ldob    3(g4), r3
    setbit  0x19, r4, r4
    cmpobe  0, r3, loc_1C4CC
    clrbit  0x19, r4, r4
loc_1C4CC:                              # CODE XREF: play_motion+720↑j
    st      r4, 0x1A4(g7)
    addo    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C4D8:                              # DATA XREF: ROM:0001D1E4↓o
    cmpobne r6, r4, loc_1C504
    ld      fa_camera, r3
    ldib    3(g4), r15
    stib    r15, 0xFC(r3)
    ldib    4(g4), r15
    stib    r15, 0xFD(r3)
    ldib    5(g4), r15
    stib    r15, 0xFE(r3)
    ldib    6(g4), r15
    stib    r15, 0xFF(r3)
loc_1C504:                              # CODE XREF: play_motion:loc_1C4D8↑j
    addo    7, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C50C:                              # DATA XREF: ROM:0001D1E8↓o
    cmpobne r6, r4, loc_1C524
    ldob    0x6CC(g7), r3
    addo    1, r3, r3
    cmpobge 8, r3, loc_1C520
    mov     8, r3
loc_1C520:                              # CODE XREF: play_motion+774↑j
    stob    r3, 0x6CC(g7)
loc_1C524:                              # CODE XREF: play_motion:loc_1C50C↑j
    addo    3, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
_uk_player_action_related:              # DATA XREF: ROM:0001D1EC↓o
    call    load_action_from_list
    addo    5, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C538:                              # DATA XREF: ROM:0001D1F0↓o
    cmpobne r6, r4, loc_1C564
    ld      0x0(g7), r4
    ldob    3(g4), r3
    cmpobne 0, r3, loc_1C558
    bbc     0x1B, r4, loc_1C564
    call    delete_option
    addo    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C558:                              # CODE XREF: play_motion+7A0↑j
    bbs     0x1B, r4, loc_1C564
    st      r3, 0xAFC(g7)
    call    sub_1CB58
loc_1C564:                              # CODE XREF: play_motion:loc_1C538↑j
    addo    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C56C:                              # DATA XREF: ROM:0001D1F4↓o
    ldob    3(g4), r3
    ldob    4(g4), r15
    shlo    8, r15, r15
    addo    r15, r3, r3
    stos    r3, 0x5DE(g7)
    addo    5, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C588:                              # DATA XREF: ROM:0001D1F8↓o
    cmpobne r6, r4, loc_1C58C
loc_1C58C:                              # CODE XREF: play_motion:loc_1C588↑j
    addo    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C594:                              # DATA XREF: ROM:0001D1FC↓o
    cmpobne r6, r4, loc_1C5A0
    ldib    3(g4), r15
    stib    r15, 0x6CE(g7)
loc_1C5A0:                              # CODE XREF: play_motion:loc_1C594↑j
    addo    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C5A8:                              # DATA XREF: ROM:0001D200↓o
    ldob    3(g4), r3
    ldob    4(g4), r15
    shlo    8, r15, r15
    addo    r15, r3, r3
    stos    r3, 0x812(g7)
    ld      0x1A4(g7), r15
    setbit  6, r15, r15
    st      r15, 0x1A4(g7)
    addo    5, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C5D0:                              # DATA XREF: ROM:0001D204↓o
    ldob    3(g4), r3
    ld      0x5B8(g7), r4
    cmpobe  0, r3, loc_1C5E4
    bbs     0, r4, loc_1C5F0
    b       loc_1C5E8
# ---------------------------------------------------------------------------
loc_1C5E4:                              # CODE XREF: play_motion+834↑j
    bbc     0, r4, loc_1C5F0
loc_1C5E8:                              # CODE XREF: play_motion+83C↑j
    addo    6, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C5F0:                              # CODE XREF: play_motion+838↑j
    mov     0x1F, r15
    stib    r15, 0x60C(g7)
    ldib    4(g4), r15
    stib    r15, 0x852(g7)
    ldib    5(g4), r15
    stib    r15, 0x853(g7)
    b       loc_1CAF0
# ---------------------------------------------------------------------------
loc_1C60C:                              # DATA XREF: ROM:0001D208↓o
    ld      0x70C(g7), r4
    ldob    3(g4), r3
    setbit  0, r4, r4
    cmpobe  1, r3, loc_1C620
    clrbit  0, r4, r4
loc_1C620:                              # CODE XREF: play_motion+874↑j
    st      r4, 0x70C(g7)
    ldib    4(g4), r15
    stib    r15, 0xA02(g7)
    ldib    5(g4), r15
    stib    r15, 0xA03(g7)
    ldib    6(g4), r15
    stib    r15, 0xA04(g7)
    ldib    7(g4), r15
    stib    r15, 0xA05(g7)
    ldib    8(g4), r15
    stib    r15, 0xACC(g7)
    ldib    9(g4), r15
    stib    r15, 0xACD(g7)
    ldib    0xA(g4), r15
    stib    r15, 0xACE(g7)
    ldib    0xB(g4), r15
    stib    r15, 0xACF(g7)
    addo    0xC, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C66C:                              # DATA XREF: ROM:0001D20C↓o
    ldob    3(g4), r3
    ld      0x70C(g7), r15
    setbit  r3, r15, r15
    st      r15, 0x70C(g7)
    addo    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C684:                              # DATA XREF: ROM:0001D210↓o
    ldob    3(g4), r3
    ld      0x70C(g7), r15
    clrbit  r3, r15, r15
    st      r15, 0x70C(g7)
    addo    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C69C:                              # DATA XREF: ROM:0001D214↓o
    ld      0x70C(g7), r4
    ldob    3(g4), r3
    setbit  3, r4, r4
    cmpobe  1, r3, loc_1C6BC
    clrbit  3, r4, r4
    st      r4, 0x70C(g7)
    addo    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C6BC:                              # CODE XREF: play_motion+904↑j
    st      r4, 0x70C(g7)
    addo    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C6C8:                              # DATA XREF: ROM:0001D218↓o
    ldob    3(g4), r3
    ldob    4(g4), r4
    shlo    4, r4, r4
    or      r3, r4, r4
    stob    r4, 0xA25(g7)
    ldib    5(g4), r15
    stib    r15, 0xA24(g7)
    addo    6, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C6EC:                              # DATA XREF: ROM:0001D21C↓o
    ldob    also_mode, r3
    ldob    also_sub_mode, r4
    lda     mode9, r5
    cmpobne r5, r3, loc_1C714
    lda     check_word1+1, r5
    cmpobe  r5, r4, loc_1C730
loc_1C714:                              # CODE XREF: play_motion+960↑j
    ldob    4(g7), r13
    shlo    7, r13, r13
    setbit  0, r13, r13
    st      r13, 0x50A378
    ldob    0x822(g7), g0
    call    kabe_parts_damage
loc_1C730:                              # CODE XREF: play_motion+96C↑j
    addo    3, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C738:                              # DATA XREF: ROM:0001D220↓o
    ldob    3(g4), r3
    stos    r3, 0xC56(g7)
    addo    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C748:                              # DATA XREF: ROM:0001D228↓o
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
    call    sub_7F760
    ldob    0x84C(g7), r14
    cmpobne 2, r14, loc_1C7DC
    ld      0x0(g7), r15
    setbit  0x1D, r15, r15
    st      r15, 0x0(g7)
    call    set_kamae_ram   # Set Stance Ram
loc_1C7DC:                              # CODE XREF: play_motion+A24↑j
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
    addo    0x14, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C85C:                              # DATA XREF: ROM:0001D224↓o
    addo    4, sp, sp
    st      g4, -4(sp)
    call    sub_7F46C
    ld      -4(sp), g4
    subo    4, sp, sp
    addo    4, sp, sp
    st      g4, -4(sp)
    call    sub_7F508
    ld      -4(sp), g4
    subo    4, sp, sp
    addo    0x11, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C89C:                              # DATA XREF: ROM:0001D22C↓o
    addo    4, sp, sp
    st      g4, -4(sp)
    call    sub_81A48
    ld      -4(sp), g4
    subo    4, sp, sp
    addo    0x15, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C8C0:                              # DATA XREF: ROM:0001D230↓o
    call    sub_7F5F4
    addo    0x1D, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C8CC:                              # DATA XREF: ROM:0001D234↓o
    call    sub_7F5BC
    addo    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
call_projectile_routine:                # DATA XREF: ROM:0001D238↓o
    call    projectile_main_routine
    addi    0x1C, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C8E4:                              # DATA XREF: ROM:0001D23C↓o
    call    sub_33378
    addo    7, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C8F0:                              # DATA XREF: ROM:0001D240↓o
    call    sub_32984
    addo    0x1F, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C8FC:                              # DATA XREF: ROM:0001D244↓o
    ldob    3(g4), r4
    ldob    4(g4), r15
    shlo    8, r15, r15
    addo    r15, r4, r4
    stos    r4, 0xC60(g7)
    ldob    5(g4), r4
    ldob    6(g4), r15
    shlo    8, r15, r15
    addo    r15, r4, r4
    stos    r4, 0xC62(g7)
    ldob    7(g4), r4
    ldob    8(g4), r15
    shlo    8, r15, r15
    addo    r15, r4, r4
    stos    r4, 0xA1E(g7)
    ldob    9(g4), r4
    ldob    0xA(g4), r15
    shlo    8, r15, r15
    addo    r15, r4, r4
    ldob    0xB(g4), r15
    shlo    0x10, r15, r15
    addo    r15, r4, r4
    ldob    0xC(g4), r15
    shlo    0x18, r15, r15
    addo    r15, r4, r4
    st      r4, zanzou_ma
    addi    0xD, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C970:                              # DATA XREF: ROM:0001D248↓o
    ld      0x7F0(g7), r15
    setbit  0x10, r15, r15
    st      r15, 0x7F0(g7)
    ldib    3(g4), r15
    stib    r15, 0x7F4(g7)
    addi    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C98C:                              # DATA XREF: ROM:0001D24C↓o
    ld      0x7F0(g7), r15
    clrbit  0x10, r15, r15
    st      r15, 0x7F0(g7)
    mov     0, r15
    stib    r15, 0x7F4(g7)
    addi    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C9A8:                              # DATA XREF: ROM:0001D250↓o
    ld      0x7F0(g7), r15
    setbit  0xA, r15, r15
    st      r15, 0x7F0(g7)
    mov     0, r15
    stis    r15, 0x2A88(g7)
    ldob    3(g4), r3
    stos    r3, 0x2A8A(g7)
    addi    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C9D4:                              # DATA XREF: ROM:0001D254↓o
    ld      0x7F0(g7), r15
    setbit  0xB, r15, r15
    st      r15, 0x7F0(g7)
    ld      0x7F0(g7), r15
    clrbit  0xA, r15, r15
    st      r15, 0x7F0(g7)
    addi    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1C9F4:                              # DATA XREF: ROM:0001D258↓o
    ldob    0x2A92(g7), r3
    setbit  1, r3, r3
    stob    r3, 0x2A92(g7)
    addi    4, g4, g4
    b       loc_1C090
# ---------------------------------------------------------------------------
loc_1CA10:                              # CODE XREF: play_motion+2E8↑j
    call    sub_337BC
    call    player_head_change_2 # Used in Honey Kiss Move
    st      g4, 0x82C(g7)   # Fang shoot is 0xD1885
    ld      0x0(g7), r15
    bbc     0x1F, r15, loc_1CAF0
    ld      0x1A4(g7), r15
    bbc     0x14, r15, loc_1CA74
    ld      0x1A4(g7), r15
    clrbit  0x14, r15, r15
    st      r15, 0x1A4(g7)
    ldos    0x870(g7), r14
    cmpobe  0, r14, loc_1CA5C
    ldos    0x26(g7), r15
    ldos    0x870(g7), r14
    ldos    0x616(g7), r13
    subo    r15, r13, r12
    stos    r13, 0x26(g7)
    stos    r13, 0x61A(g7)
    b       loc_1CA74
# ---------------------------------------------------------------------------
loc_1CA5C:                              # CODE XREF: play_motion+C98↑j
    ldos    0x26(g7), r14
    notbit  0xF, r14, r15
    stos    r15, 0x26(g7)
    ldos    0x61A(g7), r14
    notbit  0xF, r14, r15
    stos    r15, 0x61A(g7)
loc_1CA74:                              # CODE XREF: play_motion+C84↑j
    ld      0x1A4(g7), r8
    ld      0x804(g7), r15
    bbc     7, r15, pm_md_trans_ex
    setbit  5, r8, r8
pm_md_trans_ex:                         # CODE XREF: play_motion+CD8↑j
    bbc     7, r8, pm_trans_ex # Label from official source
    clrbit  7, r8, r8
    lda     0x2D805B5B, r15
    st      r15, (g11)[g12*1]
    ldis    0x26(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x80(g7), r15
    st      r15, (g11)[g12*1]
    ld      0x88(g7), r15
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r6
    ld      (g11)[g12*1], r7
    ld      0x1F4(g7), r14
    subr    r6, r14, r15
    st      r15, 0x18(g7)
    ld      0x1FC(g7), r14
    subr    r7, r14, r15
    st      r15, 0x20(g7)
pm_trans_ex:                            # CODE XREF: play_motion:pm_md_trans_ex↑j
    st      r8, 0x1A4(g7)   # Label from official source
    ld      0x0(g7), r3
    bbc     0xC, r3, loc_1CAF0
    clrbit  0xC, r3, r3
    st      r3, 0x0(g7)
    ld      0x1A4(g7), r15
    setbit  0, r15, r15
    st      r15, 0x1A4(g7)
loc_1CAF0:                              # CODE XREF: play_motion+6B8↑j
    ret
# End of function play_motion
# =============== S U B R O U T I N E =======================================
check_front_back:                       # CODE XREF: play_motion+654↑p
    ld      0x0(g7), r15    # Label from official source
    bbs     1, r15, loc_1CB1C
    bbc     8, g0, loc_1CB0C
    shlo    6, 5, r13
    xor     r13, g0, g0
    b       loc_1CB38
# ---------------------------------------------------------------------------
loc_1CB0C:                              # CODE XREF: check_front_back+8↑j
    bbc     9, g0, loc_1CB38
    shlo    7, 5, r13
    xor     r13, g0, g0
    b       loc_1CB38
# ---------------------------------------------------------------------------
loc_1CB1C:                              # CODE XREF: check_front_back+4↑j
    bbc     8, g0, loc_1CB2C
    shlo    7, 3, r13
    xor     r13, g0, g0
    b       loc_1CB38
# ---------------------------------------------------------------------------
loc_1CB2C:                              # CODE XREF: check_front_back:loc_1CB1C↑j
    bbc     9, g0, loc_1CB38
    shlo    6, 9, r13
    xor     r13, g0, g0
loc_1CB38:                              # CODE XREF: check_front_back+14↑j
    ret
# End of function check_front_back
