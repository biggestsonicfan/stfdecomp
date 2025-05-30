        .globl chg_pol_color_req
        .globl chg_scr_color_req
        .section gfx_init
    lda     0x10000000, r4
    lda     0x4004, r5
    stos    r5, (r4)
    lda     STAGE_PALETTE_DATA, r4 # 0x0031E6
    mov     0, r5
loc_2F4:                                # CODE XREF: start_again_ip+234↓j
    mov     0, r6
loc_2F8:                                # CODE XREF: start_again_ip+160↓j
    mulo    r5, r6, r8
    ldob    TST_RED_MUL, r12
    ldob    TST_RED_ADD, r13
    mov     r8, r10
    cmpobe  0, r10, loc_32C
    mulo    r12, r10, r10
    shro    8, r10, r10
    addo    r13, r10, r10
    shlo    8, 1, r15
    cmpobl  r10, r15, loc_32C
    subo    1, 0, r10
loc_32C:                                # CODE XREF: start_again_ip+C0↑j
    stos    r10, 0x10000(r4) # STAGE_PALETTE_DATA+0x10000 or COLORXLAT_START
    ldob    TST_GRN_MUL, r12
    ldob    TST_GRN_ADD, r13
    mov     r8, r10
    cmpobe  0, r10, loc_364
    mulo    r12, r10, r10
    shro    8, r10, r10
    addo    r13, r10, r10
    shlo    8, 1, r15
    cmpobl  r10, r15, loc_364
    subo    1, 0, r10
loc_364:                                # CODE XREF: start_again_ip+F8↑j
    stos    r10, 0x14000(r4)
    ldob    TST_BLUE_MUL, r12
    ldob    TST_BLUE_ADD, r13
    mov     r8, r10
    cmpobe  0, r10, loc_39C
    mulo    r12, r10, r10
    shro    8, r10, r10
    addo    r13, r10, r10
    shlo    8, 1, r15
    cmpobl  r10, r15, loc_39C
    subo    1, 0, r10
loc_39C:                                # CODE XREF: start_again_ip+130↑j
    stos    r10, 0x18000(r4)
    addo    2, r4, r4
    lda     63, r3
    cmpinco r3, r6, r6
    bg      loc_2F8
    ldob    TST_B_BRIGHT, r6
    mulo    r5, r6, r8
    ldob    TST_RED_MUL, r12
    ldob    TST_RED_ADD, r13
    mov     r8, r10
    cmpobe  0, r10, loc_3F0
    mulo    r12, r10, r10
    shro    8, r10, r10
    addo    r13, r10, r10
    shlo    8, 1, r15
    cmpobl  r10, r15, loc_3F0
    subo    1, 0, r10
loc_3F0:                                # CODE XREF: start_again_ip+184↑j
    ldob    TST_GRN_MUL, r12
    ldob    TST_GRN_ADD, r13
    mov     r8, r9
    cmpobe  0, r9, loc_420
    mulo    r12, r9, r9
    shro    8, r9, r9
    addo    r13, r9, r9
    shlo    8, 1, r15
    cmpobl  r9, r15, loc_420
    subo    1, 0, r9
loc_420:                                # CODE XREF: start_again_ip+1B4↑j
    ldob    TST_BLUE_MUL, r12
    ldob    TST_BLUE_ADD, r13
    mov     r8, r3
    cmpobe  0, r3, loc_450
    mulo    r12, r3, r3
    shro    8, r3, r3
    addo    r13, r3, r3
    shlo    8, 1, r15
    cmpobl  r3, r15, loc_450
    subo    1, 0, r3
loc_450:                                # CODE XREF: start_again_ip+1E4↑j
    mov     r3, r8
    shlo    6, 1, r6
loc_458:                                # CODE XREF: start_again_ip+228↓j
    stos    r10, 0x10000(r4)
    stos    r9, 0x14000(r4)
    stos    r8, 0x18000(r4)
    addo    2, r4, r4
    cmpdeco 1, r6, r6
    bl      loc_458
    lda     0x100(r4), r4
    cmpinco 31, r5, r5
    bg      loc_2F4
    lda     LUMA2_START, r4 # luma_ram
    mov     1, r5
    shlo    7, 1, r6
loc_498:                                # CODE XREF: start_again_ip+25C↓j
    shro    1, r5, r7
    stos    r7, (r4)
    addo    2, r4, r4
    addo    1, r5, r5
    cmpdeco 1, r6, r6
    bl      loc_498
    lda     TILE_DATA_START, r4
    lda     0xFFAC, r5
    stos    r5, hsync
    stos    r5, 0x40000(r4) # TILE_DATA_START+0x40000 or HSYNC_START
    lda     0xFFFD, r5
    stos    r5, vsync
    stos    r5, 0x60000(r4) # TILE_DATA_START+0x60000 or VSYNC_START
    mov     0, r5
    lda     set_obj_go, r6
loc_4F4:                                # CODE XREF: start_again_ip+2B0↓j
    stos    r5, (r4)
    addo    2, r4, r4
    cmpdeco 1, r6, r6
    bl      loc_4F4
    lda     0x100C000, r4
    shlo    0xC, 1, r6
loc_510:                                # CODE XREF: start_again_ip+2CC↓j
    stos    r5, (r4)
    addo    2, r4, r4
    cmpdeco 1, r6, r6
    bl      loc_510
    lda     PALETTE_DATA_END_BYTES, r4
    lda     0, r5
    mov     16, r6
loc_530:                                # CODE XREF: start_again_ip+300↓j
    ldos    (r4), r7
    stos    r7, STAGE_PALETTE_DATA(r5) # 0x0031E6
loc_53C:                                # 0x000000
    stos    r7, POLY_PALETTE_DATA(r5)
    addo    2, r4, r4
    addo    2, r5, r5
    cmpdeco 1, r6, r6
    bl      loc_530
    
            .section send_colors
# =============== S U B R O U T I N E =======================================
chg_scr_color_req:                      # CODE XREF: ROM:0000368C↓p
    lda     STAGE_PALETTE_DATA, r4 # Label from Virtua Fighter 2 source
    mov     0, r5
loc_31C8:                               # CODE XREF: chg_scr_color_req+E4↓j
    shlo    7, 1, r3
    addo    r3, r4, r4
    ldob    TST_B_BRIGHT, r6
    mulo    r5, r6, r8
    ldob    TST_RED_MUL, r12
    ldob    TST_RED_ADD, r13
    mov     r8, r10
    cmpobe  0, r10, loc_320C
    mulo    r12, r10, r10
    shro    8, r10, r10
    addo    r13, r10, r10
    shlo    8, 1, r15
    cmpobl  r10, r15, loc_320C
    subo    1, 0, r10
loc_320C:                               # CODE XREF: chg_scr_color_req+34↑j
    ldob    TST_GRN_MUL, r12
    ldob    TST_GRN_ADD, r13
    mov     r8, r9
    cmpobe  0, r9, loc_323C
    mulo    r12, r9, r9
    shro    8, r9, r9
    addo    r13, r9, r9
    shlo    8, 1, r15
    cmpobl  r9, r15, loc_323C
    subo    1, 0, r9
loc_323C:                               # CODE XREF: chg_scr_color_req+64↑j
    ldob    TST_BLUE_MUL, r12
    ldob    TST_BLUE_ADD, r13
    mov     r8, r3
    cmpobe  0, r3, loc_326C
    mulo    r12, r3, r3
    shro    8, r3, r3
    addo    r13, r3, r3
    shlo    8, 1, r15
    cmpobl  r3, r15, loc_326C
    subo    1, 0, r3
loc_326C:                               # CODE XREF: chg_scr_color_req+94↑j
    mov     r3, r8
    shlo    6, 1, r6
loc_3274:                               # CODE XREF: chg_scr_color_req+D8↓j
    stos    r10, 0x10000(r4)
    stos    r9, 0x14000(r4)
    stos    r8, 0x18000(r4)
    addo    2, r4, r4
    cmpdeco 1, r6, r6
    bl      loc_3274
    lda     0x100(r4), r4
    cmpinco 0x1F, r5, r5
    bg      loc_31C8
    ret
# End of function chg_scr_color_req
# =============== S U B R O U T I N E =======================================
chg_pol_color_req:                      # CODE XREF: ROM:00006A54↓p
    lda     0x546008, r4
    mov     0, r8
    mov     0, r9
    mov     0, r10
    mov     0, r11
    stq     r8, (r4)
    stq     r8, 0x10(r4)
loc_32C8:                               # DATA XREF: sub_4B240:loc_4B350↓o
    stq     r8, 0x20(r4)
    stq     r8, 0x30(r4)
    stq     r8, 0x40(r4)
    stq     r8, 0x50(r4)
    stq     r8, 0x60(r4)
    stq     r8, 0x70(r4)
    stq     r8, 0x80(r4)
    stq     r8, 0x90(r4)
    stq     r8, 0xA0(r4)
    stq     r8, 0xB0(r4)
    stq     r8, 0xC0(r4)
    stq     r8, 0xD0(r4)
    stq     r8, 0xE0(r4)
    stq     r8, 0xF0(r4)
    stq     r8, 0x100(r4)
    stq     r8, 0x110(r4)
    lda     0x120(r4), r4
    mov     1, r5
loc_3310:                               # CODE XREF: chg_pol_color_req+188↓j
    mov     0, r3
    st      r3, (r4)
loc_3318:                               # DATA XREF: sub_78270+44↓r
    stos    r3, 4(r4)
loc_331C:                               # DATA XREF: sub_78270+4C↓r
    lda     6(r4), r4
    ldob    TST_RED_MUL, r7
    mulo    r5, r7, r7
    mov     0x1C, r3
    mulo    r3, r7, r7
    mov     0x12, r3
    divo    r3, r7, r7
    mov     0, r8
    ldob    TST_RED_ADD, r9
    ldob    TST_GRN_MUL, r10
    mulo    r5, r10, r10
    mov     0x1C, r3
    mulo    r3, r10, r10
    mov     0x12, r3
    divo    r3, r10, r10
    mov     0, r11
    ldob    TST_GRN_ADD, r12
    ldob    TST_BLUE_MUL, r13
    mulo    r5, r13, r13
    mov     0x1C, r3
loc_3380:                               # DATA XREF: ROM:00002A08↑o
    mulo    r3, r13, r13
    mov     0x12, r3
loc_3388:                               # DATA XREF: ROM:00002A14↑o
    divo    r3, r13, r13
    mov     0, r14
    ldob    TST_BLUE_ADD, r15
    addo    0x1F, 0x10, r6
loc_339C:                               # CODE XREF: chg_pol_color_req:loc_3428↓j
    addo    r7, r8, r8
    shro    8, r8, g1
    addo    r9, g1, g1
    shlo    8, 1, r3
    cmpobl  g1, r3, loc_33B4
    subo    1, 0, g1
loc_33B4:                               # CODE XREF: chg_pol_color_req+104↑j
    ldob    RED, r3
    mulo    r3, g1, g1
    shro    7, g1, g1
    stos    g1, (r4)
    addo    r10, r11, r11
    shro    8, r11, g1
    addo    r12, g1, g1
    shlo    8, 1, r3
    cmpobl  g1, r3, loc_33E0
    subo    1, 0, g1
loc_33E0:                               # CODE XREF: chg_pol_color_req+130↑j
    ldob    GREEN, r3
    mulo    r3, g1, g1
    shro    7, g1, g1
    stos    g1, 2(r4)
    addo    r13, r14, r14
    shro    8, r14, g1
    addo    r15, g1, g1
    shlo    8, 1, r3
    cmpobl  g1, r3, loc_340C
    subo    1, 0, g1
loc_340C:                               # CODE XREF: chg_pol_color_req+15C↑j
    ldob    BLUE, r3
    mulo    r3, g1, g1
    shro    7, g1, g1
    stos    g1, 4(r4)
    lda     6(r4), r4
    cmpdeco 1, r6, r6
loc_3428:                               # DATA XREF: sub_78270+60↓r
    bl      loc_339C
loc_342C:                               # DATA XREF: sub_78270+68↓r
    cmpinco 0x1B, r5, r5
    bg      loc_3310
    mov     0, r15
    st      r15, 0x546004
    mov     1, r15
    st      r15, 0x546000
    mov     0, g1
    ret
# End of function chg_pol_color_req
# =============== S U B R O U T I N E =======================================
chg_pol_color_send:                     # CODE XREF: send_tex_col+30↓p
    ld      0x546000, r3 # Label from official source
    cmpobe  0, r3, loc_3530
    ld      0x546004, r5
    lda     0x546008, r10
    lda     STAGE_PALETTE_DATA, r4 # 0x0031E6
    shlo    5, 9, r6
    mulo    r5, r6, r3
    lda     (r10)[r3], r10
    shlo    9, 1, r6
    mulo    r5, r6, r3
    lda     (r4)[r3], r4
    mov     9, r9
    shlo    4, 0x1B, r11
    shlo    8, 0x1D, r12
    shlo    3, 0x1D, r13
loc_34A0:                               # CODE XREF: chg_pol_color_send+CC↓j
    mov     0, r6
loc_34A4:                               # CODE XREF: chg_pol_color_send+88↓j
    ldos    (r10), r3
    addo    2, r10, r10
    stos    r3, 0x10000(r4)
    ldos    (r10), r3
    addo    2, r10, r10
    stos    r3, 0x14000(r4)
    ldos    (r10), r3
    addo    2, r10, r10
    stos    r3, 0x18000(r4)
    addo    2, r4, r4
    addo    r9, r6, r6
    cmpobl  r6, r11, loc_34A4
    shlo    5, 0xD, r6
    addo    r6, r4, r4
    cmpinco 0x1B, r5, r5
    st      r5, 0x546004
    be      loc_3524
    ldl     TIMER_03, r14
    lda     0xFFFFF, r14
    and     r14, r15, r15
    subi    r15, r14, r15
    subo    0x12, r15, r15
    divo    0x19, r15, r3
    lda     0x62C, r15
    cmpobg  r3, r15, loc_3530
    b       loc_34A0
# ---------------------------------------------------------------------------
loc_3524:                               # CODE XREF: chg_pol_color_send+A0↑j
    mov     0, r15
    st      r15, 0x546000
loc_3530:                               # CODE XREF: chg_pol_color_send+8↑j
    ret
# End of function chg_pol_color_send

        .section palette_data_end
PALETTE_DATA_END_BYTES:
    .short 0         # DATA XREF: start_again_ip+2D0↑o
    .short 0x9090
    .short 0x8200
    .short 0x8210
    .short 0xC000
    .short 0xC010
    .short 0xC200
    .short 0xC210
    .short 0xE318
    .short 0x801F
    .short 0x83E0
    .short 0x831F
    .short 0xFC00
    .short 0xFC1F
    .short 0xF1E7
    .short 0xFFFF
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    