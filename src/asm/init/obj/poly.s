        .globl set_obj_go
        .extern debug_disp_hex_h
        .extern debug_disp_hex
        .extern debug_disp_int
        .section poly_obj_funcs
poly_data_err:                          # CODE XREF: set_obj+28↓j
    addo    4, sp, sp       # Label from official source
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
    ld      un_poly_data_err_flag, r3
    lda     0x1000BD0, g9
    mov     g0, r4
    ld      max_poly, g0
    balx    debug_disp_int, r14
# ---------------------------------------------------------------------------
aMaxPoly:       .asciz "max poly"
    .fill 3, 1, 0
# ---------------------------------------------------------------------------
    mov     r4, g0
    balx    debug_disp_int, r14
# ---------------------------------------------------------------------------
aErrPoly:       .asciz "err poly"
    .fill 3, 1, 0
# ---------------------------------------------------------------------------
    ld      mae_poly, g0
    balx    debug_disp_int, r14
# ---------------------------------------------------------------------------
aMaePoly:       .asciz "mae poly"
    .fill 3, 1, 0
# ---------------------------------------------------------------------------
    lda     0x1000DD0, g9
    lda     0x1000DD0, g9
    mov     g13, g0
    balx    debug_disp_hex, r14
# ---------------------------------------------------------------------------
aEv:            .asciz "ev      "
    .fill 3, 1, 0
# ---------------------------------------------------------------------------
    lda     0x1000E50, g9
    mov     g2, g0
    balx    debug_disp_hex, r14
# ---------------------------------------------------------------------------
aG2_0:          .asciz "g2      "
    .fill 3, 1, 0
# ---------------------------------------------------------------------------
    lda     0x1000ED0, g9
    ldis    deb_num, g0
    balx    debug_disp_hex_h, r14
# ---------------------------------------------------------------------------
aDebNum:        .asciz "deb_num "
    .fill 3, 1, 0
# ---------------------------------------------------------------------------
    ld      -4(sp), g14
    subo    4, sp, sp
    ld      -4(sp), g13
    subo    4, sp, sp
    ld      -4(sp), g12
    subo    4, sp, sp
loc_4E20:                               # DATA XREF: ADV_REPLAY_PIC+18↓o
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
loc_4E74:                               # CODE XREF: ROM:00004E7C↓j
    ld      INTERUPT_FLAGS_HELD, r8 # What the heck
    bbc     4, r8, loc_4E74
    bbc     13, r8, loc_4E74
    ret
# =============== S U B R O U T I N E =======================================
set_obj:                                # CODE XREF: rob_disp+3B0↓p
    mov     0, g1           # Label from official source
    ld      POLYGON_LIMIT, r4
    ld      POLYGON, r5
    cmpobg  r5, r4, loc_504C
    lda     (g0), r15
    bbs     0xF, r15, loc_4EC4
    ld      max_poly, r14
    cmpobg  r15, r14, poly_data_err
    ld      POLYGON_NUM_OFFSET[r15*16], r14
    cmpobe  0, r14, poly_data_err
    b       loc_4EE0
# ---------------------------------------------------------------------------
loc_4EC4:                               # CODE XREF: set_obj+1C↑j
    clrbit  0xF, r15, r15
    ld      0x647F000, r14
    cmpobg  r15, r14, poly_data_err
    ld      0x647F004[r15*16], r14
    cmpobe  0, r14, poly_data_err
loc_4EE0:                               # CODE XREF: set_obj+38↑j
    lda     0x9801313, r15
    st      r15, (g11)[g12*1] # g11 is 0x880000 or COPROGRAM_START
    st      r15, (g11)[g12*1]
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    st      g0, mae_poly
    ld      0x501010, r4
    addo    1, r4, r4
    st      r4, 0x501010
    bbs     0xF, g0, loc_4F24
    lda     POLYGON_NUM_OFFSET[g0*16], g0
    b       loc_4F30
# ---------------------------------------------------------------------------
loc_4F24:                               # CODE XREF: set_obj+8C↑j
    clrbit  0xF, g0, g0
    lda     0x647F004[g0*16], g0
loc_4F30:                               # CODE XREF: set_obj+98↑j
    ldq     (g0), r8
    lda     0x3C007878, r15
    st      r15, (g11)[g12*1]
    ld      0x2008(g10), r15 # g10 = 0x800000 or GEO_START
    lda     0x48(r15), r14
    st      r14, 0x1008(g10)
    st      r15, (g11)[g12*1]
    st      g1, (g11)[g12*1]
    stq     r8, (g11)[g12*1]
    ld      P2_POLYGON, r15
    st      r15, (g11)[g12*1]
    ld      POLYGON, r15
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    st      r15, P2_POLYGON
    ld      (g11)[g12*1], r15
    st      r15, POLYGON
    ret
# ---------------------------------------------------------------------------
set_obj_common:                         # CODE XREF: ROM:00005258↓j
    lda     (g0), r15       # Label from official source
    bbs     0xF, r15, loc_4FB8
    ld      max_poly, r14
    cmpobg  r15, r14, poly_data_err
    ld      POLYGON_NUM_OFFSET[r15*16], r14
    cmpobe  0, r14, poly_data_err
    b       loc_4FD4
# ---------------------------------------------------------------------------
loc_4FB8:                               # CODE XREF: set_obj+110↑j
    clrbit  0xF, r15, r15
    ld      0x647F000, r14
    cmpobg  r15, r14, poly_data_err
    ld      0x647F004[r15*16], r14
    cmpobe  0, r14, poly_data_err
loc_4FD4:                               # CODE XREF: set_obj+12C↑j
    ld      0x501010, r4
    addo    1, r4, r4
    st      r4, 0x501010
    bbs     0xF, g0, loc_4FF8
    lda     POLYGON_NUM_OFFSET[g0*16], g0
    b       loc_5004
# ---------------------------------------------------------------------------
loc_4FF8:                               # CODE XREF: set_obj+160↑j
    clrbit  0xF, g0, g0
    lda     0x647F004[g0*16], g0
loc_5004:                               # CODE XREF: set_obj+16C↑j
    ldq     (g0), r8
set_obj_go:                             # CODE XREF: set_obj_tpd+CC↓j
    shro    16, r11, r3     # Label from official source
    lda     0xFFFF, r4
    and     r4, r11, r11
    ld      POLYGON, r4
    addo    r11, r4, r4
    st      r4, POLYGON
    subo    1, 0, r11
    st      g14, mmode
    lda     0x101, g14
    st      g14, 0x10(g10)
    ld      mmode, g14
    stq     r8, (g10)[g12*1]  # g10 = 0x800000 or GEO_START
loc_504C:                               # CODE XREF: set_obj+14↑j
    ret
# End of function set_obj
# =============== S U B R O U T I N E =======================================
set_obj_tpd:                            # CODE XREF: rob_disp+54C↓p
    ld      POLYGON_LIMIT, r4 # Label from official source
    ld      POLYGON, r5
    cmpobg  r5, r4, loc_504C
    st      g14, mmode
    lda     0xB0B, g14
    st      g14, 0xB0(g10)
    ld      mmode, g14
    lda     0x1A003434, r15
    st      r15, (g11)[g12*1]
    ld      0x2008(g10), r15
    lda     0x30(r15), r14
    st      r14, 0x1008(g10)
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    lda     (g0), r15
    bbs     0xF, r15, loc_50C8
    ld      max_poly, r14
    cmpobg  r15, r14, poly_data_err
    ld      POLYGON_NUM_OFFSET[r15*16], r14
    cmpobe  0, r14, poly_data_err
    b       loc_50E4
# ---------------------------------------------------------------------------
loc_50C8:                               # CODE XREF: set_obj_tpd+58↑j
    clrbit  0xF, r15, r15
    ld      0x647F000, r14
    cmpobg  r15, r14, poly_data_err
    ld      0x647F004[r15*16], r14
    cmpobe  0, r14, poly_data_err
loc_50E4:                               # CODE XREF: set_obj_tpd+74↑j
    ld      0x501010, r4
    addo    1, r4, r4
    st      r4, 0x501010
    bbs     0xF, g0, loc_5108
    lda     POLYGON_NUM_OFFSET[g0*16], g0
    b       loc_5114
# ---------------------------------------------------------------------------
loc_5108:                               # CODE XREF: set_obj_tpd+A8↑j
    clrbit  0xF, g0, g0
    lda     0x647F004[g0*16], g0
loc_5114:                               # CODE XREF: set_obj_tpd+B4↑j
    ldq     (g0), r8
    mov     g2, r8
    b       set_obj_go
# End of function set_obj_tpd
# =============== S U B R O U T I N E =======================================
set_obj_thd:                            # CODE XREF: ground_disp+1A8↓p
    ld      POLYGON_LIMIT, r4 # Label from official source
    ld      POLYGON, r5
    cmpobg  r5, r4, loc_504C
    st      g14, mmode
    lda     0xB0B, g14
    st      g14, 0xB0(g10)
    ld      mmode, g14
    lda     0x1A003434, r15
    st      r15, (g11)[g12*1]
    ld      0x2008(g10), r15
    lda     0x30(r15), r14
    st      r14, 0x1008(g10)
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    lda     (g0), r15
    bbs     0xF, r15, loc_5198
    ld      max_poly, r14
    cmpobg  r15, r14, poly_data_err
    ld      POLYGON_NUM_OFFSET[r15*16], r14
    cmpobe  0, r14, poly_data_err
    b       set_obj_thd_common
# ---------------------------------------------------------------------------
loc_5198:                               # CODE XREF: set_obj_thd+58↑j
    clrbit  0xF, r15, r15
    ld      0x647F000, r14
    cmpobg  r15, r14, poly_data_err
    ld      0x647F004[r15*16], r14
    cmpobe  0, r14, poly_data_err
set_obj_thd_common:                     # CODE XREF: set_obj_thd+74↑j
    ld      0x501010, r4 # Label from official source
    addo    1, r4, r4
    st      r4, 0x501010
    bbs     0xF, g0, loc_51D8
    lda     POLYGON_NUM_OFFSET[g0*16], g0
    b       loc_51E4
# ---------------------------------------------------------------------------
loc_51D8:                               # CODE XREF: set_obj_thd+A8↑j
    clrbit  0xF, g0, g0
    lda     0x647F004[g0*16], g0
loc_51E4:                               # CODE XREF: set_obj_thd+B4↑j
    ldq     (g0), r8
    mov     g2, r9
    b       set_obj_go
# ---------------------------------------------------------------------------
set_obj_save:                           # Label from official source
    ld      POLYGON_LIMIT, r4
    ld      POLYGON, r5
    cmpobg  r5, r4, loc_504C
    st      g14, mmode
    lda     0xB0B, g14
    st      g14, 0xB0(g10)
    ld      mmode, g14
    lda     0x2800505, r15
    st      r15, (g11)[g12*1]
    ldq     (g11)[g12*1], r12
    stq     r12, (g10)[g12*1]
    stq     r12, (g2)
    addo    0x10, g2, g2
    ldq     (g11)[g12*1], r12
    stq     r12, (g10)[g12*1]
    stq     r12, (g2)
    addo    0x10, g2, g2
    ldq     (g11)[g12*1], r12
    stq     r12, (g10)[g12*1]
    stq     r12, (g2)
    addo    0x10, g2, g2
    b       set_obj_common
# ---------------------------------------------------------------------------
set_obj_load:                           # Label from official source
    ld      POLYGON_LIMIT, r4
    ld      POLYGON, r5
    cmpobg  r5, r4, loc_504C
    st      g14, mmode
    lda     0xB0B, g14
    st      g14, 0xB0(g10)
    ld      mmode, g14
    ldq     (g2), r12
    addo    0x10, g2, g2
    stq     r12, (g10)[g12*1]
    ldq     (g2), r12
    addo    0x10, g2, g2
    stq     r12, (g10)[g12*1]
    ldq     (g2), r12
    addo    0x10, g2, g2
    stq     r12, (g10)[g12*1]
    b       set_obj_common
# ---------------------------------------------------------------------------
set_obj_same:                           # Label from official source
    ld      POLYGON_LIMIT, r4
    ld      POLYGON, r5
    cmpobl  r5, r4, set_obj_common
    ret
# ---------------------------------------------------------------------------
set_obj_fifo:                           # CODE XREF: os_set_osage_after+54↓p
    ldq     (g11)[g12*1], r4  # Label from official source
    ldq     (g11)[g12*1], r8
    ldq     (g11)[g12*1], r12
    cmpobe  1, g2, loc_53CC
    ld      POLYGON_LIMIT, g2
    ld      POLYGON, r3
    cmpobg  r3, g2, loc_53CC
    lda     0x3F800000, r3
    clrbit  0x1F, r4, g4
    cmpo    r3, g4
    bl      loc_53CC
loc_5300:                               # DATA XREF: ROM:000212B8↓o
    lda     0x3E4CCCCD, r3
    clrbit  0x1F, r15, g4
    cmpo    r3, g4
    bg      loc_53CC
    st      g14, mmode
    lda     0xB0B, g14
    st      g14, 0xB0(g10)
    ld      mmode, g14
    stq     r4, (g10)[g12*1]
    stq     r8, (g10)[g12*1]
    stq     r12, (g10)[g12*1]
    stq     r4, (g3)
    addo    0x10, g3, g3
    stq     r8, (g3)
    addo    0x10, g3, g3
    stq     r12, (g3)
    addo    0x10, g3, g3
    lda     (g0), r15
    bbs     0xF, r15, loc_5374
    ld      max_poly, r14
    cmpobg  r15, r14, poly_data_err_fifo
    ld      POLYGON_NUM_OFFSET[r15*16], r14
    cmpobe  0, r14, poly_data_err_fifo
    b       loc_5390
# ---------------------------------------------------------------------------
loc_5374:                               # CODE XREF: ROM:00005354↑j
    clrbit  0xF, r15, r15
    ld      0x647F000, r14
    cmpobg  r15, r14, poly_data_err_fifo
    ld      0x647F004[r15*16], r14
    cmpobe  0, r14, poly_data_err_fifo
loc_5390:                               # CODE XREF: ROM:00005370↑j
    ld      0x1A4(g7), r15
    bbc     0x1A, r15, loc_53A8
    ldos    0x1AA(g7), r15
    cmpobl  4, r15, loc_53A8
    shlo    0x17, 1, g2
    b       set_obj_thd_common
# ---------------------------------------------------------------------------
loc_53A8:                               # CODE XREF: ROM:00005394↑j
    ld      0x70C(g7), r15
    bbc     2, r15, loc_53C8
    ldos    0x1AA(g7), r15
    cmpobl  4, r15, loc_53C8
    bbc     0, r15, loc_53C8
    lda     0x802000, g2
    b       set_obj_thd_common
# ---------------------------------------------------------------------------
loc_53C8:                               # CODE XREF: ROM:000053AC↑j
    b       set_obj_common
# ---------------------------------------------------------------------------
loc_53CC:                               # CODE XREF: ROM:000052D4↑j
    ret
# ---------------------------------------------------------------------------
poly_data_err_fifo:                     # CODE XREF: ROM:00005360↑j
    lda     -0x30(g3), g3   # Label from official source
    b       poly_data_err
# ---------------------------------------------------------------------------
set_obj_mir:                            # Label from official source
    lda     (g0), r15
    bbs     0xF, r15, loc_5400
    ld      max_poly, r14
    cmpobg  r15, r14, poly_data_err
    ld      POLYGON_NUM_OFFSET[r15*16], r14
    cmpobe  0, r14, poly_data_err
    b       loc_541C
# ---------------------------------------------------------------------------
loc_5400:                               # CODE XREF: ROM:000053E0↑j
    clrbit  0xF, r15, r15
    ld      0x647F000, r14
    cmpobg  r15, r14, poly_data_err
    ld      0x647F004[r15*16], r14
    cmpobe  0, r14, poly_data_err
loc_541C:                               # CODE XREF: ROM:000053FC↑j
    ld      POLYGON_LIMIT, r4
    ld      POLYGON, r5
    cmpobg  r5, r4, loc_54EC
    ld      0x501010, r4
    addo    1, r4, r4
    st      r4, 0x501010
    bbs     0xF, g0, loc_5454
    lda     POLYGON_NUM_OFFSET[g0*16], g0
    b       loc_5460
# ---------------------------------------------------------------------------
loc_5454:                               # CODE XREF: ROM:00005444↑j
    clrbit  0xF, g0, g0
    lda     0x647F004[g0*16], g0
loc_5460:                               # CODE XREF: ROM:00005450↑j
    ldq     (g0), r8
    shro    0x10, r11, r3
    lda     0xFFFF, r4
    and     r4, r11, r11
    ld      POLYGON, r4
    addo    r11, r4, r4
    st      r4, POLYGON
    st      g14, mmode
    lda     0xB0B, g14
    st      g14, 0xB0(g10)
    ld      mmode, g14
    lda     0x1A003434, r15
    st      r15, (g11)[g12*1]
    ld      0x2008(g10), r15
    lda     0x30(r15), r14
    st      r14, 0x1008(g10)
    st      r15, (g11)[g12*1]
    ld      (g11)[g12*1], r15
    subo    1, 0, r11
    st      g14, mmode
    lda     0x1111, g14
    st      g14, 0x110(g10)
    ld      mmode, g14
    stq     r8, (g10)[g12*1]
loc_54EC:                               # CODE XREF: ROM:0000542C↑j
    ret
