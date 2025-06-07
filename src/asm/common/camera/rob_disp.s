        .section display
# ---------------------------------------------------------------------------
disp_init:                              # Label from Fighting Vipers source
    lda     0x501500, r15
    st      r15, 0x10(g13)
    lda     rob_disp, r15
    st      r15, 0xC(g13)
    ret
# =============== S U B R O U T I N E =======================================
rob_disp:                               # CODE XREF: camera_init+1434↓p
    ld      0x0(g7), r15    # Label from official source
    bbc     7, r15, loc_1A588
    ldob    0x2A(g7), r3
    cmpobne 0, r3, loc_1A58C
    ld      0x190(g7), r3
    ld      debug_flag, r15
    bbs     5, r15, rd_mt_skp
    ld      0xAEC(g7), r14
    addi    1, r14, r15
    st      r15, 0xAEC(g7)
rd_mt_skp:                              # CODE XREF: rob_disp+1C↑j
    ld      0x1A4(g7), r15  # Label from official source
    bbs     4, r15, rd_air_skp
    mov     0, r15
    stis    r15, 0x7FA(g7)
    b       rd_ypos_ck_skp
# ---------------------------------------------------------------------------
rd_air_skp:                             # CODE XREF: rob_disp+30↑j
    ld      0x0(g7), r15    # Label from official source
    bbs     3, r15, rd_ypos_ck_skp
    ld      debug_flag, r15
    bbs     5, r15, rd_ypos_ck_skp
    ldos    0x7FA(g7), r14
    addo    1, r14, r14
    stos    r14, 0x7FA(g7)
rd_ypos_ck_skp:                         # CODE XREF: rob_disp+3C↑j
    mov     0, r8           # Label from official source
    mov     0x10, r9
    ld      0x0(g7), r15
    bbs     0x19, r15, loc_1A450
    lda     0x40(g7), r11
    ld      fa_camera, r3
    ldob    0xFA(r3), r7
    lda     0x2800505, r15
    st      r15, (g11)[g12*1]
    lda     loc_2A40(g7), r15
    ld      (g11)[g12*1], r14
    st      r14, 0x0(r15)
    ld      (g11)[g12*1], r14
    st      r14, 4(r15)
    ld      (g11)[g12*1], r14
    st      r14, 8(r15)
    ld      (g11)[g12*1], r14
    st      r14, 0xC(r15)
    ld      (g11)[g12*1], r14
    st      r14, 0x10(r15)
    ld      (g11)[g12*1], r14
    st      r14, 0x14(r15)
    ld      (g11)[g12*1], r14
    st      r14, 0x18(r15)
    ld      (g11)[g12*1], r14
    st      r14, 0x1C(r15)
    ld      (g11)[g12*1], r14
    st      r14, 0x20(r15)
    ld      (g11)[g12*1], r14
    st      r14, 0x24(r15)
    ld      (g11)[g12*1], r14
    st      r14, 0x28(r15)
    ld      (g11)[g12*1], r14
    st      r14, 0x2C(r15)
rdn_loop:                               # CODE XREF: rob_disp+7C4↓j
    ld      0x124C(g7), r15 # Label from official source
    bbc     r8, r15, rdn_dspgo
    ld      frame_counter, r15
    bbc     0, r15, rdn_ps
rdn_dspgo:                              # CODE XREF: rob_disp+FC↑j
    ldob    0x6B8(g7)[r8], r3 # Label from official source
    bbs     0, r7, loc_19CD0
    cmpobne 0, r3, rdn_ps
    b       loc_19CD4
# ---------------------------------------------------------------------------
loc_19CD0:                              # CODE XREF: rob_disp+114↑j
    cmpobe  0, r3, rdn_ps
loc_19CD4:                              # CODE XREF: rob_disp+11C↑j
    lda     0x800101, r15
    st      r15, (g11)[g12*1]
    lda     0x2758(g7), r4
    ld      0x68(r4), r5
    lda     0x3F800000, r4
    lda     0x3800707, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    lda     0x1B803737, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    mulo    0xC, r8, r15
    st      r15, (g11)[g12*1]
    ld      (r11)[r8*4], r3
    mov     3, g0
    call    set_mmode
    ld      0x2068(g7), r4
    cmpo    1, r4
    bne     sp_atk_dsp_ex
    cmpo    0, r8
    bne     rd_put_poly_end
    ldob    0x1B1(g7), r4
    remo    0x1A, r4, r4
    cmpo    7, r4
    lda     0x2088(g7), g3
    ldt     0x24(g3), g0
    be      sp_atk_dsp_esp
    call    spin_attack_cnt_nml_dsp
    b       rd_put_poly_end
# ---------------------------------------------------------------------------
sp_atk_dsp_esp:                         # CODE XREF: rob_disp+1B4↑j
    call    spin_attack_cnt_esp_dsp # Label from official source
    b       rd_put_poly_end
# ---------------------------------------------------------------------------
sp_atk_dsp_ex:                          # CODE XREF: rob_disp+190↑j
    cmpibe  5, r8, rd_te_espio_check # Label from official source
    cmpibne 8, r8, rd_te_pass
rd_te_espio_check:                      # CODE XREF: rob_disp:sp_atk_dsp_ex↑j
    ldob    0x1B1(g7), r14  # Label from official source
    cmpobe  0xD, r14, rd_te_rob
    ld      0x2A3C(g7), r4
    chkbit  5, r4
    be      rd_te_get_r
    chkbit  8, r4
    bno     rd_te_pass
    addo    4, sp, sp
    st      r7, -4(sp)
    addo    4, sp, sp
    st      r8, -4(sp)
    addo    4, sp, sp
    st      r9, -4(sp)
    ldt     0x254(g7), r8
    b       rd_te_get_r_ex
# ---------------------------------------------------------------------------
rd_te_get_r:                            # CODE XREF: rob_disp+1E4↑j
    addo    4, sp, sp       # Label from official source
    st      r7, -4(sp)
    addo    4, sp, sp
    st      r8, -4(sp)
    addo    4, sp, sp
    st      r9, -4(sp)
    ldt     0x230(g7), r8
rd_te_get_r_ex:                         # CODE XREF: rob_disp+218↑j
    ldt     0x20C(g7), r4   # Label from official source
    subr    r4, r8, r8
    subr    r5, r9, r9
    subr    r6, r10, r10
    lda     0x13802727, r15
    st      r15, (g11)[g12*1]
    st      r8, (g11)[g12*1]
    st      r10, (g11)[g12*1]
    ld      (g11)[g12*1], r7
    lda     0x16802D2D, r15
    st      r15, (g11)[g12*1]
    st      r8, (g11)[g12*1]
    st      r10, (g11)[g12*1]
    ld      (g11)[g12*1], r10
    notbit  0x1F, r9, r9
    lda     0x13802727, r15
    st      r15, (g11)[g12*1]
    st      r10, (g11)[g12*1]
    st      r9, (g11)[g12*1]
    ld      (g11)[g12*1], r8
    lda     0x16802D2D, r15
    st      r15, (g11)[g12*1]
    st      r9, (g11)[g12*1]
    st      r10, (g11)[g12*1]
    ld      (g11)[g12*1], r9
    lda     0x3EE66666, r10
    divr    r10, r9, r9
    lda     0x3F800000, r10
    lda     0x800101, r15
    st      r15, (g11)[g12*1]
    lda     0x2000404, r15
    st      r15, (g11)[g12*1]
    lda     loc_2A40(g7), r15
    ld      0x0(r15), r14
    st      r14, (g11)[g12*1]
    ld      4(r15), r14
    st      r14, (g11)[g12*1]
    ld      8(r15), r14
    st      r14, (g11)[g12*1]
    ld      0xC(r15), r14
    st      r14, (g11)[g12*1]
    ld      0x10(r15), r14
    st      r14, (g11)[g12*1]
    ld      0x14(r15), r14
    st      r14, (g11)[g12*1]
    ld      0x18(r15), r14
    st      r14, (g11)[g12*1]
    ld      0x1C(r15), r14
    st      r14, (g11)[g12*1]
    ld      0x20(r15), r14
    st      r14, (g11)[g12*1]
    ld      0x24(r15), r14
    st      r14, (g11)[g12*1]
    ld      0x28(r15), r14
    st      r14, (g11)[g12*1]
    ld      0x2C(r15), r14
    st      r14, (g11)[g12*1]
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    st      r7, (g11)[g12*1]
    lda     0x5000A0A, r15
    st      r15, (g11)[g12*1]
    st      r8, (g11)[g12*1]
    lda     0x3800707, r15
    st      r15, (g11)[g12*1]
    st      r9, (g11)[g12*1]
    st      r10, (g11)[g12*1]
    st      r10, (g11)[g12*1]
    ldob    0x1B0(g7), r4
    addo    0x1F, 2, r13
    cmpobe  r13, r4, rd_te_espio_i
    mov     0, g1
    lda     1189, g0        # Espio Tongue
    call    set_obj
    b       rd_te_espio_i_ex
# ---------------------------------------------------------------------------
rd_te_espio_i:                          # CODE XREF: rob_disp+3A4↑j
    mov     0, g1           # Label from official source
    lda     1484, g0        # Grey Espio Tongue
    call    set_obj
rd_te_espio_i_ex:                       # CODE XREF: rob_disp+3B4↑j
    lda     0x1000202, r15  # Label from official source
    st      r15, (g11)[g12*1]
    ld      -4(sp), r9
    subo    4, sp, sp
    ld      -4(sp), r8
    subo    4, sp, sp
    ld      -4(sp), r7
    subo    4, sp, sp
    b       rd_te_pass
# ---------------------------------------------------------------------------
rd_te_rob:                              # CODE XREF: rob_disp+1D4↑j
    ld      frame_counter, r4 # Label from official source
    ld      0x804(g7), r15
    bbs     8, r15, rd_te_rob_attack
    lda     0x3F, r5
    and     r5, r4, r4
    shlo    0xA, 1, r5
    b       loc_19FD0
# ---------------------------------------------------------------------------
rd_te_rob_attack:                       # CODE XREF: rob_disp+404↑j
    and     0xF, r4, r4     # Label from official source
    shlo    0xC, 1, r5
loc_19FD0:                              # CODE XREF: rob_disp+414↑j
    mulo    r4, r5, r4
    lda     0x4000808, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
rd_te_pass:                             # CODE XREF: rob_disp+1CC↑j
    cmpibne 1, r8, rd_mune_pass # Label from official source
    ldob    0x1B1(g7), r4
    cmpobne 0xC, r4, rd_mune_check
    mov     0, g1
    lda     3354, g0
    call    set_obj
    mov     0, g1
    lda     2848, g0        # UFO Eggman Beam Dish
    call    set_obj
rd_mune_check:                          # CODE XREF: rob_disp+43C↑j
    cmpobne 4, r4, rd_mune_pass # Label from official source
    call    efc_fang_mune_init
    call    efc_fang_mune_change # Effect Fang Chest Change
    ld      0x70C(g7), r15
    bbc     0x17, r15, rd_mune_pass
    mov     0, r3
rd_mune_pass:                           # CODE XREF: rob_disp:rd_te_pass↑j
    cmpibne 9, r8, rd_kosi_pass # Label from official source
rd_kosi_pass:                           # CODE XREF: rob_disp:rd_mune_pass↑j
    cmpibne 2, r8, rd_kao_ex # Label from official source
    ldob    0x1B1(g7), r14
    cmpobne 0xD, r14, rd_kao_rob_ex
    ld      frame_counter, r4
    bbs     7, r4, rd_kao_rob_ex
    bbs     6, r4, rd_kao_rob_ex
    shro    4, r4, r5
    and     3, r5, r5
    and     0xF, r4, r6
    ld      egg_robo_anims[r5*4], r5
    bx      (r5)
# ---------------------------------------------------------------------------
rd_kao_rob_tizimi:                      # DATA XREF: ROM:0001D2EC↓o
    subo    r6, 15, r6      # Label from official source
rd_kao_rob_nobi:                        # DATA XREF: ROM:egg_robo_anims↓o
    cmpobge 10, r6, loc_1A064 # Label from official source
    mov     10, r6
loc_1A064:                              # CODE XREF: rob_disp:rd_kao_rob_nobi↑j
    ld      egg_robo_head_anim[r6*4], r3
    b       rd_kao_rob_ex
# ---------------------------------------------------------------------------
rd_kao_rob_gururi:                      # DATA XREF: ROM:0001D2E8↓o
    mov     0xA, r5         # Label from official source
    ld      egg_robo_head_anim[r5*4], r3
    bbs     8, r4, loc_1A088
    shlo    0xC, 1, r5
    b       loc_1A08C
# ---------------------------------------------------------------------------
loc_1A088:                              # CODE XREF: rob_disp+4CC↑j
    shlo    0xC, 0xF, r5
loc_1A08C:                              # CODE XREF: rob_disp+4D4↑j
    mulo    r6, r5, r6
    lda     0x5000A0A, r15
    st      r15, (g11)[g12*1]
    st      r6, (g11)[g12*1]
rd_kao_rob_ex:                          # CODE XREF: rob_disp+47C↑j
    ldob    also_mode, r15  # Label from official source
    lda     start_ip_add+2, r14
    cmpobe  r14, r15, rd_me_name
    lda     start_ip_add+3, r14
    cmpobe  r14, r15, rd_me_name
    b       me_cont
# ---------------------------------------------------------------------------
rd_me_name:                             # CODE XREF: rob_disp+500↑j
    ldob    4(g7), r14      # Label from official source
    cmpobe  0, r14, rd_kao_ex
me_cont:                                # CODE XREF: rob_disp+510↑j
    ldl     0x2050(g7), r4  # Label from official source
    ld      0x0(g7), r15
    bbs     0x14, r15, me_norm
    lda     308, r13
    ldos    0x1A8(g7), r14  # p1_mot_num or p2_mot_num
    cmpobe  r13, r14, me_norm
    ld      0x2058(g7), r12
    lda     (r12), g2
    mov     0, g1
    lda     (r4), g0
    call    set_obj_tpd
    ld      0x205C(g7), r12
    lda     (r12), g2
    mov     0, g1
    lda     (r5), g0
    call    set_obj_tpd
    b       rd_kao_ex
# ---------------------------------------------------------------------------
me_norm:                                # CODE XREF: rob_disp+528↑j
    mov     0, g1           # Label from official source
    lda     (r4), g0
    call    set_obj
    mov     0, g1
    lda     (r5), g0
    call    set_obj
rd_kao_ex:                              # CODE XREF: rob_disp:rd_kosi_pass↑j
    ldob    also_mode, r15  # Label from official source
    lda     start_ip_add+2, r14
    cmpobe  r14, r15, rd_name_put
    lda     start_ip_add+3, r14
    cmpobe  r14, r15, rd_name_put
    b       rd_put
# ---------------------------------------------------------------------------
rd_name_put:                            # CODE XREF: rob_disp+594↑j
    ldob    4(g7), r14      # Label from official source
    cmpobe  1, r14, rd_put
    b       rd_put_poly_end
# ---------------------------------------------------------------------------
rd_put:                                 # CODE XREF: rob_disp+5A4↑j
    ldob    4(g7), g1       # Label from official source
    lda     (r3), g0
    call    set_obj
rd_put_poly_end:                        # CODE XREF: rob_disp+198↑j
    mov     1, g0           # Label from official source
    call    set_mmode
    ld      off_1A184[r8*4], r4
    bx      (r4)
# ---------------------------------------------------------------------------
off_1A184:      
    .long unit_efc_next     # DATA XREF: rob_disp+5C8↑r
    .long unit_efc_mune     # mune = "chest"
    .long unit_efc_kao
    .long unit_efc_next
    .long unit_efc_next
    .long unit_efc_next
    .long unit_efc_next
    .long unit_efc_next
    .long unit_efc_next
    .long unit_efc_kosi
    .long unit_efc_next
    .long unit_efc_next
    .long unit_efc_next
    .long unit_efc_next
    .long unit_efc_next
    .long unit_efc_next
# ---------------------------------------------------------------------------
unit_efc_kao:                           # DATA XREF: rob_disp+5DC↑o
    ld      0x2008(g10), r15 # Label from official source
    st      g14, mmode
    mov     0, g14
    st      g14, 0x0(g10)
    ld      mmode, g14
    st      r15, buffer_ptr
    ldob    4(g7), r15
    mulo    8, r15, r15
    lda     0x501804(r15), r15
    ld      4(r15), r14
    ld      0x2008(g10), r13
    cmpobne 0, r14, loc_1A214
    st      r13, 0x0(r15)
    b       loc_1A220
# ---------------------------------------------------------------------------
loc_1A214:                              # CODE XREF: rob_disp+658↑j
    setbit  0x1F, r13, r13
    st      r13, BUFF_RAM_START(r14)
loc_1A220:                              # CODE XREF: rob_disp+660↑j
    ld      buffer_ptr, r15
    st      r15, 0x1008(g10)
    ldob    4(g7), r15
    mulo    8, r15, r15
    lda     0x501804(r15), r15
    ld      0x0(r15), r14
    ld      0x2008(g10), r13
    st      r13, 4(r15)
    setbit  0x1F, r14, r14
    st      r14, 0x0(g10)
    call    efc_asease_cont
    call    efc_mabuta_cont # mabuta = eyelid
    b       unit_efc_next
# ---------------------------------------------------------------------------
unit_efc_mune:                          # DATA XREF: rob_disp+5D8↑o
    call    efc_eggrob_mune_chg         # Label from official source
    ldob    0x1B1(g7), r4               # r4 = P1_PARTS+0x1B1 or P2_PARTS+0x1B1
    cmpobne 4, r4, loc_1A274            # If character is not Fang, branch
    call    efc_fang_gun_disp
loc_1A274:                              # CODE XREF: rob_disp+6BC↑j
    cmpobne 3, r4, loc_1A27C            # If character is not Metal Sonic, branch
    call    efc_metalsonic_disp
loc_1A27C:                              # CODE XREF: rob_disp:loc_1A274↑j
    b       unit_efc_next
# ---------------------------------------------------------------------------
unit_efc_kosi:                          # DATA XREF: rob_disp+5F8↑o
    ld      0x5004C8, r15               # Label from official source
    bbs     5, r15, unit_efc_next
    ldob    0x1B0(g7), r4
    cmpobe  1, r4, loc_1A29C            # if char is Tails
    cmpobe  27, r4, loc_1A2A4           # if char is Tails_I
    b       unit_efc_next
# ---------------------------------------------------------------------------
loc_1A29C:                              # CODE XREF: rob_disp+6E0↑j
    call    tails1_tail_disp
    b       unit_efc_next
# ---------------------------------------------------------------------------
loc_1A2A4:                              # CODE XREF: rob_disp+6E4↑j
    call    tails2_tail_disp
unit_efc_next:                          # CODE XREF: rob_disp+6B0↑j
    call    copy_option_data            # Label from official source
    ldos    0x7A2(g7), r4
    cmpobe  0, r4, loc_1A364
    mov     r8, g0
    call    option_control
    lda     0x788(g7), r6
    ld      0x0(g7), r15
    bbc     0x1B, r15, opt_unit_normal
    lda     0x7A0(g7), r6
opt_unit_normal:                        # CODE XREF: rob_disp+714↑j
    ldos    0x0(r6), r3                 # Label from official source
    cmpobne r8, r3, loc_1A364
    mov     0, r13
    ld      0x0(g7), r15
    bbc     0x1B, r15, opt_u_nm_nop
    ld      0x1A4(g7), r15
    bbs     2, r15, opt_u_nm_nop
    mov     1, r13
opt_u_nm_nop:                           # CODE XREF: rob_disp+72C↑j
    lda     0x800101, r15               # Label from official source
    st      r15, (g11)[g12*1]
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ldt     4(r6), r12
    stt     r12, (g11)[g12*1]
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    ldis    0x12(r6), r15
    st      r15, (g11)[g12*1]
    lda     0x4000808, r15
    st      r15, (g11)[g12*1]
    ldis    0x10(r6), r15
    st      r15, (g11)[g12*1]
    lda     0x5000A0A, r15
    st      r15, (g11)[g12*1]
    ldis    0x14(r6), r15
    st      r15, (g11)[g12*1]
    ldos    2(r6), r12
    ldob    4(g7), g1
    lda     (r12), g0
    call    set_obj
    lda     0x1000202, r15
    st      r15, (g11)[g12*1]
loc_1A364:                              # CODE XREF: rob_disp+700↑j
    lda     0x1000202, r15
    st      r15, (g11)[g12*1]
rdn_ps:                                 # CODE XREF: rob_disp+108↑j
    addi    1, r8, r8                   # Label from official source
    cmpobl  r8, r9, rdn_loop
    mov     3, g0
    call    set_mmode
    call    kosi_nobi_put
    mov     1, g0
    call    set_mmode
    ld      0x0(g7), r15
    bbc     0x18, r15, rd_gy_ps
    lda     0x800101, r15
    st      r15, (g11)[g12*1]
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    ld      0x1F4(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x3DCCCCCD, r15
    st      r15, (g11)[g12*1]
    ld      0x1FC(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    ldis    0x616(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x3800707, r15
    st      r15, (g11)[g12*1]
    lda     0x3F800000, r15
    st      r15, (g11)[g12*1]
    lda     0x3F800000, r15
    st      r15, (g11)[g12*1]
    lda     0x40400000, r15
    st      r15, (g11)[g12*1]
    shlo    0xE, 1, r3
    lda     0x4000808, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    mov     0, g1
    lda     6, g0                       # Weird rod
    call    set_obj
    lda     0x1000202, r15
    st      r15, (g11)[g12*1]
rd_gy_ps:                               # CODE XREF: rob_disp+7E0↑j
    ld      0x124C(g7), r14             # Label from official source
    cmpobe  0, r14, loc_1A588
    ld      frame_counter, r15
    bbs     0, r15, loc_1A588
loc_1A450:                              # CODE XREF: rob_disp+6C↑j
    ld      mod_fa_coli, r12
    mov     0x10, r8
    lda     rob_coli_ball_rgb_obj, r9
loc_1A464:                              # CODE XREF: rob_disp+9D4↓j
    ld      0x0(g7), r15
    bbs     0x19, r15, loc_1A478
    ld      0x124C(g7), r14
    bbc     r8, r14, loc_1A578
loc_1A478:                              # CODE XREF: rob_disp+8B8↑j
    ldob    4(g7), r15
    cmpobe  1, r15, loc_1A490
    ld      0x90F600[r8*4], r13
    cmpobne 0, r13, loc_1A4C0
    b       loc_1A4A8
# ---------------------------------------------------------------------------
loc_1A490:                              # CODE XREF: rob_disp+8CC↑j
    mov     0xF, r4
loc_1A494:                              # CODE XREF: rob_disp+8F4↓j
    ld      0x90F600[r4*4], r5
    bbs     r8, r5, loc_1A4C0
    cmpdeci 1, r4, r4
    ble     loc_1A494
loc_1A4A8:                              # CODE XREF: rob_disp+8DC↑j
    ld      0x158(r12), r4
    cmpobe  r8, r4, loc_1A4B8
    ld      4(r9), r13
    b       loc_1A4C4
# ---------------------------------------------------------------------------
loc_1A4B8:                              # CODE XREF: rob_disp+8FC↑j
    ld      8(r9), r13
    b       loc_1A4C4
# ---------------------------------------------------------------------------
loc_1A4C0:                              # CODE XREF: rob_disp+8D8↑j
    ld      (r9), r13
loc_1A4C4:                              # CODE XREF: rob_disp+904↑j
    lda     0x3F800000, g6
    ld      0xAC8(g7), r3
    bbc     r8, r3, loc_1A4F0
    ldob    0x821(g7), r14
    cmpobe  4, r14, loc_1A4F0
    ldob    0x821(g7), r14
    cmpobe  8, r14, loc_1A4F0
    ld      0x1D04(g7), g6
    ld      (g6), g6
loc_1A4F0:                              # CODE XREF: rob_disp+920↑j
    ld      0x1D14(g7), r10
    lda     (r10)[r8*8], r10
    ld      0x1D20(g7), r11
    ldob    (r11)[r8], r11
loc_1A508:                              # CODE XREF: rob_disp+9C4↓j
    cmpdeci 0, r11, r11
    be      loc_1A578
    ldob    (r10)[r11], r15
    ldq     0xD00(g7)[r15*4], r4
    mulr    g6, r7, r7
    lda     0x800101, r15
    st      r15, (g11)[g12*1]
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    lda     0x3800707, r15
    st      r15, (g11)[g12*1]
    st      r7, (g11)[g12*1]
    st      r7, (g11)[g12*1]
    st      r7, (g11)[g12*1]
    mov     0, g1
    lda     (r13), g0
    call    set_obj
    lda     0x1000202, r15
    st      r15, (g11)[g12*1]
    b       loc_1A508
# ---------------------------------------------------------------------------
loc_1A578:                              # CODE XREF: rob_disp+8C4↑j
    mov     r8, g0
    call    option_control
    cmpdeco 1, r8, r8
    bl      loc_1A464
loc_1A588:                              # CODE XREF: rob_disp+4↑j
    ret
# ---------------------------------------------------------------------------
loc_1A58C:                              # CODE XREF: rob_disp+C↑j
    ld      fa_camera, r3
    ldob    0xFA(r3), r7
    bbs     0, r7, loc_1A6BC
    lda     0x800101, r15
    st      r15, (g11)[g12*1]
    mov     0, r3
    lda     0x1B803737, r15
    st      r15, (g11)[g12*1]
    ldob    4(g7), r15
    st      r15, (g11)[g12*1]
    mulo    0xC, r3, r15
    st      r15, (g11)[g12*1]
    ldob    0x50B00C, r3
    shlo    5, r3, r3
    lda     0x50B100[r3], r10
    ld      8(r10), r4
# ---------------------------------------------------------------------------
    .long 0x78210E96        # subr    +1.0,r4,r4
# ---------------------------------------------------------------------------
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    lda     displacement, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    lda     displacement, r15
    st      r15, (g11)[g12*1]
    ld      0x18(r10), r3
    mov     0, g1
    lda     (r3), g0
    call    set_obj
    ld      0x2008(g10), r15
    st      g14, mmode
    mov     0, g14
    st      g14, 0x0(g10)
    ld      mmode, g14
    st      r15, buffer_ptr
    ldob    4(g7), r15
    mulo    8, r15, r15
    lda     0x501804(r15), r15
    ld      4(r15), r14
    ld      0x2008(g10), r13
    cmpobne 0, r14, loc_1A66C
    st      r13, 0x0(r15)
    b       loc_1A678
# ---------------------------------------------------------------------------
loc_1A66C:                              # CODE XREF: rob_disp+AB0↑j
    setbit  0x1F, r13, r13
    st      r13, BUFF_RAM_START(r14)
loc_1A678:                              # CODE XREF: rob_disp+AB8↑j
    ld      buffer_ptr, r15
    st      r15, 0x1008(g10)
    ldob    4(g7), r15
    mulo    8, r15, r15
    lda     0x501804(r15), r15
    ld      0x0(r15), r14
    ld      0x2008(g10), r13
    st      r13, 4(r15)
    setbit  0x1F, r14, r14
    st      r14, 0x0(g10)
    lda     0x1000202, r15
    st      r15, (g11)[g12*1]
loc_1A6BC:                              # CODE XREF: rob_disp+9E8↑j
    ret
# End of function rob_disp

    .section kosi_nobi
# =============== S U B R O U T I N E =======================================
kosi_nobi_put:                          # CODE XREF: rob_disp+7D0↑p
    ld      0x70C(g7), r15  # Label from official source
    bbc     0x17, r15, loc_1A9E8
    lda     0x800101, r15
    st      r15, (g11)[g12*1]
    ldt     0x26C(g7), r4
    ldt     0x290(g7), r8
    addr    r4, r8, r4
    addr    r5, r9, r5
    addr    r6, r10, r6
    lda     0x3F000000, r3
    mulr    r3, r4, r4
    mulr    r3, r5, r5
    mulr    r3, r6, r6
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    ldt     0x20C(g7), r8
    lda     0x15802B2B, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r8, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    st      r10, (g11)[g12*1]
    ld      (g11)[g12*1], r11
    lda     0x16002C2C, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r8, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r9, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    st      r10, (g11)[g12*1]
    ld      (g11)[g12*1], r7
    subr    r4, r8, r4
    subr    r5, r9, r5
    subr    r6, r10, r6
    lda     0x13802727, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    ld      (g11)[g12*1], r3
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    lda     0x13802727, r15
    st      r15, (g11)[g12*1]
    st      r11, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    ld      (g11)[g12*1], r4
    subi    r4, 0, r4
    lda     0x5000A0A, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    shlo    0xF, 1, r3
    lda     0x4000808, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    lda     0x3F800000, r3
    ldob    0x1B1(g7), r4   # r3 = P1_PARTS+0x1B1 or P2_PARTS+0x1B1
    ld      flt_1AA54[r4*4], r4
    mulr    r4, r7, r7
    lda     0x3800707, r15
    st      r15, (g11)[g12*1]
    st      r7, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    ldob    0x1B1(g7), r3   # r3 = P1_PARTS+0x1B1 or P2_PARTS+0x1B1
    ld      flt_1A9EC[r3*4], r3
    mov     0, r4
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    ld      0x44(g7), r3
    mov     0, g1
    lda     (r3), g0
    call    set_obj
    lda     0x1000202, r15
    st      r15, (g11)[g12*1]
loc_1A9E8:                              # CODE XREF: kosi_nobi_put+4↑j
    ret
# End of function kosi_nobi_put
# ---------------------------------------------------------------------------
flt_1A9EC:      .float 0.3398           # DATA XREF: kosi_nobi_put+148↑r
    .float 0.30000001       # Tails
    .float 0.36660001       # Metal Sonic
    .float 0.3531           # Amy
    .float 0.33899999       # Fang
    .float 0.33919999       # Bark
    .float 0.33899999       # Knuckles
    .float 0.46520001       # Espio
    .float 0.1989           # Eggman
    .float 0.0              # EggmanB
    .float 0.33899999       # Bean
    .float 0.0              # Eggman Boss
    .float 0.0              # Egg Ufo
    .float 0.0              # Robo Egg
    .float 0.0              # Rocket Metal
    .float 0.0              # Honey
    .float 0.0              # Super Sonic
    .float 0.0              # DUM9
    .float 0.0              # DUM10
    .float 0.0              # DUM11
    .float 0.0              # DUM12
    .float 0.0              # DUM13
    .float 0.0              # DUM14
    .float 0.0              # DUM15
    .float 0.0              # DUM16
    .float 0.0              # DUM17
flt_1AA54:      .float 1.446            # DATA XREF: kosi_nobi_put+120↑r
    .float 1.651            # Tails
    .float 1.599            # Metal Sonic
    .float 1.444            # Amy
    .float 1.5420001        # Fang
    .float 0.70899999       # Bark
    .float 1.387            # Knuckles
    .float 1.205            # Espio
    .float 0.63099998       # Eggman
    .float 1.51             # EggmanB
    .float 1.434            # Bean
    .float 0.72000003       # Eggman Boss
    .float 1.51             # Egg Ufo
    .float 1.51             # Robo Egg
    .float 1.51             # Rocket Metal
    .float 1.51             # Honey
    .float 1.51             # Super Sonic
    .float 1.51             # DUM9
    .float 1.51             # DUM10
    .float 1.51             # DUM11
    .float 1.51             # DUM12
    .float 1.51             # DUM13
    .float 1.51             # DUM14
    .float 1.51             # DUM15
    .float 1.51             # DUM16
    .float 1.51             # DUM17
# =============== S U B R O U T I N E =======================================
efc_metalsonic_disp:                    # CODE XREF: rob_disp+6C8↑p
    ld      0x0(g7), r3     # Label from official source
    bbs     29, r3, loc_1AB20 # return
    mov     1, r3
    ldos    0x40(g7)[r3*4], r3
    lda     0x18D, r5
    cmpobe  r5, r3, loc_1AB20 # return
    lda     0x7E4, r5
    cmpobe  r5, r3, loc_1AB20 # return
    ld      frame_counter, r3
    shro    1, r3, r5
    and     3, r5, r5
    bbs     0, r3, loc_1AB0C
    ldos    yellow_cone_exhaust[r5*2], r4
    mov     0, g1
    lda     (r4), g0
    call    set_obj
    b       loc_1AB20       # return
# ---------------------------------------------------------------------------
loc_1AB0C:                              # CODE XREF: efc_metalsonic_disp+34↑j
    ldos    yellow_burst_exhaust[r5*2], r4
    mov     0, g1
    lda     (r4), g0
    call    set_obj
loc_1AB20:                              # CODE XREF: efc_metalsonic_disp+4↑j
    ret                     # return
# End of function efc_metalsonic_disp
# ---------------------------------------------------------------------------
yellow_cone_exhaust:.short 2453         # DATA XREF: efc_metalsonic_disp+38↑r
    .short 2454
    .short 2455
    .short 2456
yellow_burst_exhaust:.short 2534        # DATA XREF: efc_metalsonic_disp:loc_1AB0C↑r
    .short 2535
    .short 2536
    .short 2537
# =============== S U B R O U T I N E =======================================
tails1_tail_disp:                       # CODE XREF: rob_disp:loc_1A29C↑p
    lda     tails_tail_anim, r11 # Label from official source
    lda     tails_spinning_tails_anim, r10
    b       tails_tail_disp
# End of function tails1_tail_disp
# =============== S U B R O U T I N E =======================================
tails2_tail_disp:                       # CODE XREF: rob_disp:loc_1A2A4↑p
    lda     tails_tail_frames_grey, r11 # Label from official source
    lda     tails_spinning_tails_anim_grey, r10
tails_tail_disp:                        # CODE XREF: tails1_tail_disp+10↑j
    ldob    0x84C(g7), r14  # Label from official source
    cmpobe  3, r14, loc_1AC34
    ldos    0x2198(g7), r3
    addo    1, r3, r5
    lda     0x3F, r4
    cmpoble r5, r4, loc_1AB78
    mov     0, r5
loc_1AB78:                              # CODE XREF: tails2_tail_disp+28↑j
    stos    r5, 0x2198(g7)
    ld      0x7F0(g7), r15
    bbs     0x10, r15, tails_shippo_func_exec
    addo    8, r3, r5
    shlo    6, 1, r4
    cmpobl  r5, r4, loc_1AB98
    subo    r4, r5, r5
loc_1AB98:                              # CODE XREF: tails2_tail_disp+48↑j
    ldos    (r11)[r3*2], r4
    ldos    (r11)[r5*2], r6
    lda     0x3DCCCCCD, r8
    lda     0xBE800000, r9
    lda     displacement, r10
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    st      r8, (g11)[g12*1]
    st      r9, (g11)[g12*1]
    st      r10, (g11)[g12*1]
    shlo    0xE, 3, r3
    ld      0x1A4(g7), r15
    bbc     0x10, r15, loc_1ABE0
    shlo    0xF, 1, r3
loc_1ABE0:                              # CODE XREF: tails2_tail_disp+90↑j
    lda     0x5000A0A, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    shlo    0xC, 1, r3
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
loc_1AC00:                              # DATA XREF: RAM2BASE:002A2F20↓o
    st      r3, (g11)[g12*1]
    mov     0, g1
    lda     (r4), g0
    call    set_obj
    lda     0xFFFFE000, r3
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    mov     0, g1
    lda     (r6), g0
    call    set_obj
loc_1AC34:                              # CODE XREF: tails2_tail_disp+14↑j
    ret
# ---------------------------------------------------------------------------
tails_shippo_func_exec:                 # CODE XREF: tails2_tail_disp+3C↑j
    ldob    0x7F4(g7), r12  # Label from official source
    subo    1, r12, r12
    and     1, r12, r12
    ld      off_1AC50[r12*4], r13
    bx      (r13)
# End of function tails2_tail_disp
# ---------------------------------------------------------------------------
off_1AC50:      .long tails_heli_disp   # DATA XREF: tails2_tail_disp+FC↑r
    .long tails_screw_disp
# =============== S U B R O U T I N E =======================================
tails_heli_disp:                        # DATA XREF: ROM:off_1AC50↑o
    lda     0x800101, r15 # Label from official source
    st      r15, (g11)[g12*1]
    lda     0x2000404, r15
    st      r15, (g11)[g12*1]
    lda     0x5010F8, r15
    ld      0x0(r15), r14
    st      r14, (g11)[g12*1]
    ld      4(r15), r14
    st      r14, (g11)[g12*1]
    ld      8(r15), r14
    st      r14, (g11)[g12*1]
    ld      0xC(r15), r14
    st      r14, (g11)[g12*1]
    ld      0x10(r15), r14
    st      r14, (g11)[g12*1]
    ld      0x14(r15), r14
    st      r14, (g11)[g12*1]
    ld      0x18(r15), r14
    st      r14, (g11)[g12*1]
    ld      0x1C(r15), r14
    st      r14, (g11)[g12*1]
    ld      0x20(r15), r14
    st      r14, (g11)[g12*1]
    ld      0x24(r15), r14
    st      r14, (g11)[g12*1]
    ld      0x28(r15), r14
    st      r14, (g11)[g12*1]
    ld      0x2C(r15), r14
    st      r14, (g11)[g12*1]
    ldt     0x1F4(g7), r4
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    ldis    0x26(g7), r15
    st      r15, (g11)[g12*1]
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    lda     0x3E0F5C29, r15
    st      r15, (g11)[g12*1]
    lda     0x3E3851EC, r15
    st      r15, (g11)[g12*1]
    lda     0xBE2E147B, r15
    st      r15, (g11)[g12*1]
    ld      frame_counter, r3
    shlo    7, 0x1B, r13
    mulo    r13, r3, r7
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    st      r7, (g11)[g12*1]
    bbs     0, r3, loc_1AD64
    ldos    (r10), r3
    b       loc_1AD68
# ---------------------------------------------------------------------------
loc_1AD64:                              # CODE XREF: tails_heli_disp+100↑j
    ldos    2(r10), r3
loc_1AD68:                              # CODE XREF: tails_heli_disp+108↑j
    mov     0, g1
    lda     (r3), g0
    call    set_obj
    lda     0x1000202, r15
    st      r15, (g11)[g12*1]
    ret
# End of function tails_heli_disp
# =============== S U B R O U T I N E =======================================
tails_screw_disp:                       # DATA XREF: ROM:0001AC54↑o
    lda     0x800101, r15 # Label from official source
    st      r15, (g11)[g12*1]
    ld      frame_counter, r3
    shlo    7, 0x1B, r13
    mulo    r13, r3, r7
    lda     0x3000606, r15
    st      r15, (g11)[g12*1]
    lda     0x3E19999A, r15
    st      r15, (g11)[g12*1]
    lda     0xBE4CCCCD, r15
    st      r15, (g11)[g12*1]
    lda     0xBE19999A, r15
    st      r15, (g11)[g12*1]
    shlo    0xC, 0xF, r12
    lda     0x5000A0A, r15
    st      r15, (g11)[g12*1]
    st      r12, (g11)[g12*1]
    shlo    0xF, 1, r12
    lda     0x4000808, r15
    st      r15, (g11)[g12*1]
    st      r12, (g11)[g12*1]
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    st      r7, (g11)[g12*1]
    bbs     0, r3, loc_1AE14
    ldos    (r10), r3
    b       loc_1AE18
# ---------------------------------------------------------------------------
loc_1AE14:                              # CODE XREF: tails_screw_disp+84↑j
    ldos    2(r10), r3
loc_1AE18:                              # CODE XREF: tails_screw_disp+8C↑j
    mov     0, g1
    lda     (r3), g0
    call    set_obj
    lda     0x1000202, r15
    st      r15, (g11)[g12*1]
    ret
# End of function tails_screw_disp
# ---------------------------------------------------------------------------
tails_tail_anim:.short 108              # DATA XREF: tails1_tail_disp↑o
    .short 109
    .short 110
    .short 111
    .short 112
    .short 113
    .short 114
    .short 115
    .short 116
    .short 117
    .short 118
    .short 119
    .short 120
    .short 121
    .short 122
    .short 123
    .short 124
    .short 125
    .short 126
    .short 127
    .short 128
    .short 129
    .short 130
    .short 131
    .short 132
    .short 133
    .short 134
    .short 135
    .short 136
    .short 137
    .short 138
    .short 139
    .short 140
    .short 141
    .short 142
    .short 143
    .short 144
    .short 145
    .short 146
    .short 147
    .short 148
    .short 149
    .short 150
    .short 151
    .short 152
    .short 153
    .short 154
    .short 155
    .short 156
    .short 157
    .short 158
    .short 159
    .short 160
    .short 161
    .short 162
    .short 163
    .short 164
    .short 165
    .short 166
    .short 167
    .short 168
    .short 169
    .short 170
    .short 171
tails_tail_frames_grey:.short 1396      # DATA XREF: tails2_tail_disp↑o
    .short 1407
    .short 1418
    .short 1429
    .short 1440
    .short 1451
    .short 1457
    .short 1458
    .short 1459
    .short 1397
    .short 1398
    .short 1399
    .short 1400
    .short 1401
    .short 1402
    .short 1403
    .short 1404
    .short 1405
    .short 1406
    .short 1408
    .short 1409
    .short 1410
    .short 1411
    .short 1412
    .short 1413
    .short 1414
    .short 1415
    .short 1416
    .short 1417
    .short 1419
    .short 1420
    .short 1421
    .short 1422
    .short 1423
    .short 1424
    .short 1425
    .short 1426
    .short 1427
    .short 1428
    .short 1430
    .short 1431
    .short 1432
    .short 1433
    .short 1434
    .short 1435
    .short 1436
    .short 1437
    .short 1438
    .short 1439
    .short 1441
    .short 1442
    .short 1443
    .short 1444
    .short 1445
    .short 1446
    .short 1447
    .short 1448
    .short 1449
    .short 1450
    .short 1452
    .short 1453
    .short 1454
    .short 1455
    .short 1456
tails_spinning_tails_anim:.short 1221   # DATA XREF: tails1_tail_disp+8↑o
    .short 1222
tails_spinning_tails_anim_grey:.short 1460
    .short 1461

        .section rob_disp_animation_data
egg_robo_anims: .long rd_kao_rob_nobi   # DATA XREF: rob_disp+49C↑r
                .long rd_kao_rob_gururi
                .long rd_kao_rob_tizimi
                .long rd_kao_rob_ex
egg_robo_head_anim:.long 2981           # DATA XREF: rob_disp:loc_1A064↑r
                .long 2982
                .long 2983
                .long 2984
                .long 2985
                .long 2986
                .long 2987
                .long 2988
                .long 2989
                .long 2990
                .long 2991
