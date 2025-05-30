#   ---
#   --- Check if the warning screen has been displayed on boot
#   --- and if it has then skip initializing the coprocessors
#   ---
        .globl cop_initialize
        .extern _INTR_ram__am1_users2_yasuda_mb_src_init_0
        .extern warn_screen_show_check
        .section copro_init
    call    warn_screen_show_check  
    st      g0, SKIP_WARNING
    cmpobne 0, g0, skip_copro_init
    call    copro_down
    lda     700000, r3
copro_init_wait:                                # CODE XREF: start_ip+128↓j
    cmpdeco 1, r3, r3       # decrement r3 700000 times...
    bl      copro_init_wait
    call    copro_down2
skip_copro_init:                                # CODE XREF: start_ip+114↑j
    call    _INTR_ram__am1_users2_yasuda_mb_src_init_0

        .section copro_down_func
b_crx_copro_down:                       # CODE XREF: b_crx_copro_down:copro_down↓j
    lda     COPRO_CONTROL1_START, r10 # Label from official FV source
    ld      (r10), r8
    lda     31, r7
    setbit  r7, r8, r9
    st      r9, (r10)
    lda     -4, r3
    lda     0x980020, r4    # 0x980020 is not mapped in MAME
    ld      (r4), r5        # r5 = 0
    and     r3, r5, r5
    st      r5, (r4)
    lda     COPRO_SHARC_IOP_START, r3
    lda     _cpres_start, r4 # TGP Code
    lda     4, r5
    lda     0xA100, r6
    st      r6, (r3)
    lda     0, r6
    st      r6, (r3)
    lda     0xC9400, r6
    st      r6, 8(r3)
    ld      (r4), r6
    mov     0, r6
    st      r6, 0x70(r3)
    addo    r5, r4, r4
    ld      (r4), r6
    st      r6, 0x100(r3)
    addo    r5, r4, r4
    ld      (r4), r6
    st      r6, 0x104(r3)
    addo    r5, r4, r4      # r4 = 0xB6318 _cpres_data
    lda     0x741C, r6
    lda     2, r7
    divo    r7, r6, r6      # 29724 / 2 = 14862 or 0x3A0E
    lda     3, r7
    divo    r7, r6, r7
    st      r7, 0x108(r3)
    lda     loc_A110, r7
    st      r7, (r3)
    lda     0xA1, r7
    st      r7, 0x70(r3)
    mov     0, r7
    st      r7, 0x70(r3)
    lda     0x884000, r11
    lda     1, r3
load_cop_loop:                          # CODE XREF: b_crx_copro_down+E8↓j
    ldos    (r4), r7        # r6 = 0x3A0E or 14862
    st      r7, (r11)
    addo    2, r4, r4
    subo    r3, r6, r6
    cmpo    0, r6
    bne     load_cop_loop
    st      r8, (r10)
    ret
# ---------------------------------------------------------------------------
copro_down:                             # CODE XREF: start_ip+118↑p
    b       b_crx_copro_down # Label from Fighting Vipers source
# End of function b_crx_copro_down
# =============== S U B R O U T I N E =======================================
cop_initialize:                         # CODE XREF: ROM:00006A70↓p
    shlo    0x13, 0x13, r4  # Label from Fighting Vipers source
cop_initialize_l1:                      # CODE XREF: cop_initialize+10↓j
    ld      4(r4), r3       # Label from Fighting Vipers source
    bbs     0, r3, cop_initialize_end
    ld      (g11)[g12*1], r3
    b       cop_initialize_l1
# ---------------------------------------------------------------------------
cop_initialize_end:                     # CODE XREF: cop_initialize+8↑j
    lda     0, r15          # Label from Fighting Vipers source
    st      r15, (g11)[g12*1]
    call    cop_initialize_end2
    ret
# End of function cop_initialize
# =============== S U B R O U T I N E =======================================
cop_initialize_end2:                    # CODE XREF: cop_initialize+1C↑p
    lda     0x40808181, r15
    st      r15, (g11)[g12*1]
    lda     0x40000000, r15
    st      r15, 0x50A284
    lda     0x40000000, r15
    st      r15, cb_mul_R   # cb = collission ball
    ld      fa_rob0, g7
    lda     rob_coli_ball_table0, g6
    call    rob_coli_ball_table_all_init
    ld      0x0(g7), r15
    clrbit  0x1F, r15, r15
    st      r15, 0x0(g7)
    ld      fa_rob1, g7
    lda     rob_coli_ball_table1, g6
    call    rob_coli_ball_table_all_init
    ld      0x0(g7), r15
    clrbit  0x1F, r15, r15
    st      r15, 0x0(g7)
    call    set_coli_ball_init
    call    send_coli_ball_R
    call    send_multi_ball_R
    call    send_coli_ball_pntr
    call    send_ball_to_unit
    call    send_zanzou_data # "Afterimage" (zanzou)
    call    send_kage_ball_pntr # "Shadow" (kage)
    ret
# End of function cop_initialize_end2
 
        .section afterimage
# "Afterimage" (zanzou)
send_zanzou_data:                       # CODE XREF: cop_initialize_end2+80↑p
    lda     0x3DCCCCCD, r15 # Label from official source
    st      r15, zanzou_ma
    subo    4, 0, r15
    stis    r15, zanzou_inc
    mov     0x13, r15
    stis    r15, zanzou_pat1
    addo    0x1F, 9, r15
    stis    r15, zanzou_pat2
    lda     0x32182, r5
    mov     3, r7
    lda     0x24804949, r15
    st      r15, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r7, (g11)[g12*1]
    ret
# End of function send_zanzou_data

        .section shadow
# =============== S U B R O U T I N E =======================================
# "Shadow" (kage)
send_kage_ball_pntr:                    # CODE XREF: cop_initialize_end2+84↑p
    mov     0x10, r4        # Label from official source
    lda     0x306E0, r5
    lda     0x307E0, r9
    lda     0x4C84, r7
loc_14EC:                               # CODE XREF: send_kage_ball_pntr+70↓j
    ldob    (r7), r6
    lda     0x9801313, r15
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    lda     0x24804949, r15
    st      r15, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    lda     0x24804949, r15
    st      r15, (g11)[g12*1]
    st      r9, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    addo    1, r5, r5
    addo    1, r9, r9
    addo    1, r7, r7
    cmpdeco 1, r4, r4
    bl      loc_14EC
    ret
# End of function send_kage_ball_pntr
# ---------------------------------------------------------------------------
    .long 0
    .long 0

        .section copro_down2_func
# =============== S U B R O U T I N E =======================================
copro_down2:                            # CODE XREF: start_ip+12C↑p
    lda     0, r5
    lda     0x803008, r4 # called again at 0x1688
    st      r5, (r4)
    lda     GEO_CTL1_START, r10
    ld      (r10), r8
    lda     0x1F, r7
    setbit  r7, r8, r9
    st      r9, (r10)
    lda     -4, r3
    lda     0x980020, r4    # Is this a map
    ld      (r4), r5
    and     r3, r5, r5
    st      r5, (r4)
    lda     0x840000, r3    # Is this a map!
    lda     _cpres_start2, r4
    lda     4, r5
    lda     0x3100, r6
    st      r6, (r3)
    lda     0, r6
    st      r6, (r3)
    lda     0xC400, r6
    st      r6, 8(r3)
    ld      (r4), r6
    mov     0, r6
    st      r6, 0x70(r3)
    addo    r5, r4, r4
    ld      (r4), r6
    st      r6, 0x100(r3)
    addo    r5, r4, r4
    ld      (r4), r6
    st      r6, 0x104(r3)
    addo    r5, r4, r4      # r4 = 0xBD748
    lda     0x490E, r6
    lda     2, r7
    divo    r7, r6, r6
    lda     3, r7
    divo    r7, r6, r7
    st      r7, 0x108(r3)
    lda     loc_3110, r7
    st      r7, (r3)
    lda     0xA1, r7
    st      r7, 0x70(r3)
    mov     0, r7
    st      r7, 0x70(r3)
    lda     GEO_PROGRAM_START, r11
    lda     1, r3
loc_166C:                               # CODE XREF: copro_down2+F8↓j
    ldos    (r4), r7
    st      r7, (r11)
    addo    2, r4, r4
    subo    r3, r6, r6
    cmpo    0, r6
    bne     loc_166C
    st      r8, (r10)
    lda     0x803008, r4 # Map
    ld      (r4), r5
    st      r5, (r4)
    ret
# End of function copro_down2
        .globl rob_coli_ball_table0
        .section copro_init_data
# ---------------------------------------------------------------------------
rob_coli_ball_table0:        .long 0x50A284        # DATA XREF: cop_initialize_end2+34↑o
    .long 0x50A288
    .long 0x506000
    .long 0x506400
    .long 0x506480
    .long 0x506580
    .long 0x5066C0
    .long 0x506400
