        .globl geo_initialize
        .globl geo_func
        .section geo_func_start
# =============== S U B R O U T I N E =======================================
geo_func:                               # CODE XREF: ROM:00006A6C↓p
    lda     GEO_START, r4   # Label from official source
    lda     GEO_RELATED, r5
    mov     0, r7
loc_1564:                               # CODE XREF: geo_func+30↓j
    ldos    (r5)[r7*2], r3
    st      r3, 4(r4)
    shro    8, r3, r3
    st      r3, 8(r4)
    addo    0x10, r4, r4
    lda     0x3F, r3
    cmpinco r3, r7, r7
    bg      loc_1564
    ret
# End of function geo_func

        .section geo_init
# =============== S U B R O U T I N E =======================================
geo_initialize:                         # CODE XREF: ROM:00006A74↓p
    lda     COPRO_CONTROL1_START, r4 # Label from Virtua Fighter 2 source
    mov     0, r3
    st      r3, 0xC(r4)
    mov     0, r9
    st      r9, BUFF_MAX
loc_16B8:                               # CODE XREF: geo_initialize+90↓j
    ld      BUFF_RAM_ADDS[r9*4], r8
    st      r8, rob_coli_ball_table1(g10)
    st      g14, mmode
    mov     0, g14
    st      g14, 0x0(g10)
    ld      mmode, g14
    st      g14, mmode
    mov     0, g14
    st      g14, 0x0(g10)
    ld      mmode, g14
    st      g14, mmode
    mov     0, g14
    st      g14, 0x0(g10)
    ld      mmode, g14
    st      g14, mmode
    lda     0xF0F, g14
    st      g14, 0xF0(g10)
    ld      mmode, g14
    addo    1, r9, r9
    cmpobg  3, r9, loc_16B8
    ld      BUFF_RAM_ADDS[r9*4], r8
    st      r8, BUFF_ADD
    st      r8, rob_coli_ball_table1(g10)
    stob    r9, 0x50100C
    call    set_end_mark
    lda     0xFF, r3
    lda     _3D_ZCLIP_START, r4
    stob    r3, (r4)
    ret
# End of function geo_initialize

    .section end_mark
# =============== S U B R O U T I N E =======================================
set_end_mark:                           # CODE XREF: geo_initialize+B4↑p
    ld      BUFF_ADD, r6    # Label from official source
    mov     0, r3
    st      g14, mmode
    lda     0xF0F, g14
    st      g14, 0xF0(g10)
    ld      mmode, g14
    st      r6, 0x3008(g10) # This is where all the stage elements seem to appear on screen
    ld      0x2008(g10), r4
    lda     0x7FFFC, r3
    and     r3, r6, r6
    and     r3, r4, r4
    subo    r6, r4, r4
    ld      BUFF_MAX, r5
    cmpi    r4, r5
    ble     loc_35AC
    st      r4, BUFF_MAX
loc_35AC:                               # CODE XREF: set_end_mark+54↑j
    ldob    0x50100C, r3
    addo    1, r3, r3
    remo    4, r3, r3
    stob    r3, 0x50100C
    ld      BUFF_RAM_ADDS[r3*4], r4
    st      r4, BUFF_ADD
    st      r4, rob_coli_ball_table1(g10)
    ret
# End of function set_end_mark


        .section geo_data
GEO_RELATED:
    .short 0                # DATA XREF: geo_func+8↑o
    .short 4
    .short 0x8808
    .short 6
    .short 0x101
    .short 0x101
    .short 0x201
    .short 1
    .short 1
    .short 2
    .short 3
    .short 0xC
    .short 3
    .short 3
    .short 0x320
    .short 0
    .short 1
    .short 4
    .short 0x8808
    .short 0
    .short 0x101
    .short 0
    .short 1
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 1
    .short 4
    .short 0x8808
    .short 0
    .short 0x101
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 4
    .short 0x8808
    .short 0
    .short 0x101
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
    .short 0
