        .extern rob_coli_ball_table0
        .section coli_funcs
# =============== S U B R O U T I N E =======================================
rob_coli_ball_table_all_init:           # CODE XREF: cop_initialize_end2+3C↑p
    ldob    0x84C(g7), r8   # Label from official source
    ld      rob_coli_ball_types[r8*4], g5 # Sonic: g5 = 0xC9B40
    cmpobne 3, r8, loc_1040
    shlo    4, 0xD, r13
    addi    r13, g5, g5
loc_1040:                               # CODE XREF: rob_coli_ball_table_all_init+C↑j
    ldob    0x1B0(g7), r7   # r7 = P1_PARTS+0x1B0 or P2_PARTS+0x1B0
    ld      (g5)[r7*4], g5  # Sonic g5 = 0xCC710
    ld      4(g6), r3
    mov     0x1E, r15
    st      r15, (r3)
    ld      8(g6), g0
    ld      0x0(g5), g1
    call    cb_data_init
    ld      0xC(g5), r3
    ld      0xC(g6), r4
    st      r3, (r4)
    ld      0x10(g6), g0
    ld      8(g5), g1
    call    ucb_unit_init
    ld      0x14(g6), g0
    ld      4(g5), g1
    call    coli_bu_rd_init
    ld      0x18(g6), g0
    ld      0x1C(g6), g1
    ld      (g1), g1
    call    coli_ucb_num_init
    ret
# End of function rob_coli_ball_table_all_init
# =============== S U B R O U T I N E =======================================
coli_ucb_num_init:                      # CODE XREF: rob_coli_ball_table_all_init+68↑p
    mov     g1, r10         # Label from official source
    mov     0, r9
loc_10A0:                               # CODE XREF: coli_ucb_num_init+14↓j
    ldob    (r10)[r9], r15
    stob    r15, (g0)[r9]
    addo    1, r9, r9
    cmpobne 0x10, r9, loc_10A0
    ret
# End of function coli_ucb_num_init
# =============== S U B R O U T I N E =======================================
coli_bu_rd_init:                        # CODE XREF: rob_coli_ball_table_all_init+58↑p
    mov     g1, r10         # Label from official source
    mov     0, r9
loc_10BC:                               # CODE XREF: coli_bu_rd_init+18↓j
    ld      (r10)[r9*4], r15
    st      r15, (g0)[r9*4]
    addo    1, r9, r9
    addo    0x1F, 1, r15
    cmpobne r15, r9, loc_10BC
    ret
# End of function coli_bu_rd_init
# =============== S U B R O U T I N E =======================================
ucb_unit_init:                          # CODE XREF: rob_coli_ball_table_all_init+4C↑p
    mov     g1, r10         # Label from official source
    mov     0, r9
loc_10DC:                               # CODE XREF: ucb_unit_init+14↓j
    ldl     (r10)[r9*8], r4
    stl     r4, (g0)[r9*8]
    addo    1, r9, r9
    cmpobne 0x10, r9, loc_10DC
    ret
# End of function ucb_unit_init
# =============== S U B R O U T I N E =======================================
cb_data_init:                           # CODE XREF: rob_coli_ball_table_all_init+34↑p
    mov     g1, r11         # Label from official source
    mov     0, r9
loc_10F8:                               # CODE XREF: cb_data_init:loc_1110↓j
    ldq     0x0(r11)[r9*16], r4
    stq     r4, 0x0(g0)[r9*16]
    addo    1, r9, r9
    addo    0x1F, 1, r15
loc_1110:                               # DATA XREF: ROM:loc_5C9C4↓o
    cmpobne r15, r9, loc_10F8
    ret
# End of function cb_data_init
# =============== S U B R O U T I N E =======================================
send_init_ram_coli_data:                # CODE XREF: action_init+5D0↓p
    ldob    4(g7), r3       # Label from official source
    cmpobe  1, r3, loc_1130
    lda     rob_coli_ball_table0, g6
    call    rob_coli_ball_table_all_init
    b       send_ram_coli_data
# ---------------------------------------------------------------------------
loc_1130:                               # CODE XREF: send_init_ram_coli_data+4↑j
    lda     rob_coli_ball_table1, g6
    call    rob_coli_ball_table_all_init
send_ram_coli_data:                     # CODE XREF: send_init_ram_coli_data+14↑j
    call    set_coli_ball_init # Label from official source
    call    send_coli_ball_R
    call    send_ball_to_unit
    ret
# End of function send_init_ram_coli_data
# =============== S U B R O U T I N E =======================================
set_coli_ball_init:                     # CODE XREF: cop_initialize_end2+6C↑p
    lda     0x50A204, r10 # Label from official source
    lda     0x506000, r11
    mov     0, r9
loc_1160:                               # CODE XREF: set_coli_ball_init+28↓j
    ld      0xC(r11)[r9*16], r5
    st      r5, (r10)[r9*4]
    addo    1, r9, r9
    addo    0x1F, 1, r15
    cmpobne r15, r9, loc_1160
    lda     cb_r_0, r10
    lda     pos_00_x, r11
    mov     0, r9
loc_118C:                               # CODE XREF: set_coli_ball_init+54↓j
    ld      0xC(r11)[r9*16], r5
    st      r5, (r10)[r9*4]
    addo    1, r9, r9
    addo    0x1F, 1, r15
    cmpobne r15, r9, loc_118C
    ret
# End of function set_coli_ball_init
# =============== S U B R O U T I N E =======================================
send_coli_ball_R:                       # CODE XREF: cop_initialize_end2+70↑p
    lda     0x50A204, r3  # Label from official source
    lda     cb_r_0, r11
    mov     0, r4
    lda     0x30600, r5
    lda     0x30700, r7
loc_11CC:                               # CODE XREF: send_coli_ball_R+7C↓j
    ld      (r3)[r4*4], r6
    ld      (r11)[r4*4], r12
    lda     0x9801313, r15
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r15 # What is this
    lda     0x24804949, r15
    st      r15, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    lda     0x24804949, r15
    st      r15, (g11)[g12*1]
    st      r7, (g11)[g12*1]
    st      r12, (g11)[g12*1]
    addo    1, r4, r4
    addo    1, r5, r5
    addo    1, r7, r7
    addo    0x1F, 1, r15
    cmpobne r15, r4, loc_11CC
    mov     0, r6
    lda     0x30620, r5
loc_1234:                               # DATA XREF: ROM:00076BF4↓o
    lda     0x30720, r7
    lda     0x9801313, r15
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    lda     0x24804949, r15
    st      r15, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r6, (g11)[g12*1]
loc_1268:                               # DATA XREF: ROM:0007A15C↓o
    lda     0x24804949, r15
    st      r15, (g11)[g12*1]
    st      r7, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    addo    1, r5, r5
    addo    1, r7, r7
    mov     0x1F, r4
loc_1288:                               # CODE XREF: send_coli_ball_R+134↓j
    ld      (r3)[r4*4], r6
    ld      (r11)[r4*4], r12
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
    st      r7, (g11)[g12*1]
    st      r12, (g11)[g12*1]
    addo    1, r5, r5
    addo    1, r7, r7
    subo    1, r4, r4
    cmpible 0, r4, loc_1288
    ld      0x50A288, r3
    lda     0x306F1, r5
    lda     0x24804949, r15
    st      r15, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    ld      0x50A310, r3
    lda     0x307F1, r5
    lda     0x24804949, r15
    st      r15, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    ret
# End of function send_coli_ball_R
# =============== S U B R O U T I N E =======================================
send_multi_ball_R:                      # CODE XREF: cop_initialize_end2+74↑p
    ld      0x50A284, r3  # Label from official source
    lda     0x306F0, r5
    lda     0x24804949, r15
    st      r15, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    ld      cb_mul_R, r3    # cb = collission ball
    lda     0x307F0, r5
    lda     0x24804949, r15
    st      r15, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r3, (g11)[g12*1]
    ret
# End of function send_multi_ball_R
# =============== S U B R O U T I N E =======================================
send_coli_ball_pntr:                    # CODE XREF: cop_initialize_end2+78↑p
    lda     0x30641, r5     # Label from official source
    lda     0x30741, r9
    lda     66, r7          # Loop counter 66
    lda     dword_4B7C, r8
loc_1394:                               # CODE XREF: send_coli_ball_pntr+70↓j
    ld      (r8), r6
    lda     0x9801313, r15  # What (g11 = 0x880000)
    st      r15, (g11)[g12*1] # In (g12 = 0x4000)
    st      r15, (g11)[g12*1] # Tarnation
    st      r15, (g11)[g12*1] #  Store r15 at 0x884000
    ld      (g11)[g12*1], r15 # ! that is COPROGRAM address space...
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
    addo    4, r8, r8
    cmpdeco 1, r7, r7
    bl      loc_1394
    ret
# End of function send_coli_ball_pntr
# =============== S U B R O U T I N E =======================================
send_ball_to_unit:                      # CODE XREF: cop_initialize_end2+7C↑p
    addo    0x1F, 1, r4     # Label from official source
    lda     0x306A0, r5
    lda     0x307A0, r9
    lda     0x506580, r7
    lda     0x506600, r8
loc_1414:                               # CODE XREF: send_ball_to_unit+80↓j
    ld      (r7), r6
    ld      (r8), r10
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
    st      r10, (g11)[g12*1]
    addo    1, r5, r5
    addo    1, r9, r9
    addo    4, r7, r7
    addo    4, r8, r8
    cmpdeco 1, r4, r4
    bl      loc_1414
    ret
# End of function send_ball_to_unit
# =============== S U B R O U T I N E =======================================
            .section coli_data
rob_coli_ball_table1:
        .long cb_mul_R          # DATA XREF: cop_initialize_end2+54↑o
        .long 0x50A310
off_1010:
        .long pos_00_x          # DATA XREF: sub_11E08+74↓o
        .long 0x506440
off_1018:
        .long 0x506500      # DATA XREF: get_en_info+588↓o
        .long 0x506600
        .long 0x5066D0
        .long 0x506440


        .section coli_ball_pntr
dword_4B7C:
    .long 0x60              # DATA XREF: send_coli_ball_pntr+14↑o
    .long 0x5D
    .long 0x5A
    .long 0x57
    .long 0x54
    .long 0x51
    .long 0x4E
    .long 0x4B
    .long 0x48
    .long 0x45
    .long 0x42
    .long 0x3F
    .long 0x3C
    .long 0x39
    .long 0x36
    .long 0x33
    .long 0x30
    .long 0x2D
    .long 0x2A
    .long 0x27
    .long 0x24
    .long 0x21
    .long 0x1E
    .long 0x1B
    .long 0x18
    .long 0x15
    .long 0x12
    .long 0xF
    .long 0xC
    .long 9
    .long 6
    .long 3
    .long 0
    .long 0x303A0
    .long 0x3039D
    .long 0x3039A
    .long 0x30397
    .long 0x30394
    .long 0x30391
    .long 0x3038E
    .long 0x3038B
    .long 0x30388
    .long 0x30385
    .long 0x30382
    .long 0x3037F
    .long 0x3037C
    .long 0x30379
    .long 0x30376
    .long 0x30373
    .long 0x30370
    .long 0x3036D
    .long 0x3036A
    .long 0x30367
    .long 0x30364
    .long 0x30361
    .long 0x3035E
    .long 0x3035B
    .long 0x30358
    .long 0x30355
    .long 0x30352
    .long 0x3034F
    .long 0x3034C
    .long 0x30349
    .long 0x30346
    .long 0x30343
    .long 0x30340
    .long 0x3020009
    .long 0x7060504
    .long 0xB0A0908
    .long 0x100F0E0C
    