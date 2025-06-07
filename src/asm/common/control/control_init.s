        .section init
# =============== S U B R O U T I N E =======================================
# Executes once at start of char sel, once at the start of the vs screen, then once every frame of gameplay once the map is loaded.
control_init:                           # CODE XREF: key_rec_init+F8↓p
    ld      fa_rob0, g7     # Label from Virtua Fighter 2 source
    ld      fa_rob1, g8
    setbit  3, 0, r3
    st      r3, 0x1208(g7)  # P1_PARTS+0x1208 = r3
    st      r3, 0x1208(g8)  # P2_PARTS+0x1208 = r3
    lda     rob_control, r15
    st      r15, 0xC(g13)
rob_control:                            # DATA XREF: control_init+24↑o
    ld      debug_flag, r3  # Label from Virtua Fighter 2 source
    bbs     5, r3, loc_1E1A0 # We will only return if bit 5 of debug_flag is set
    ldob    also_mode, r15
    lda     displacement2, r14
    cmpobe  r14, r15, loc_1D38C
    lda     displacement3, r14
    cmpobe  r14, r15, loc_1D38C
    ld      0x508060, r15
    bbc     28, r15, loc_1D38C # 0x508060 is initalized to 0, so bit 28 will always be clear.
    ret                     # We will never hit return here
# ---------------------------------------------------------------------------
loc_1D38C:                              # CODE XREF: control_init+4C↑j
    ld      fa_rob0, g7     # We branch to this of also_mode is 2 or 3, or bit 28 of 0x508060 is clear
    ld      fa_rob1, g8
    ld      INTERUPT_FLAGS_HELD, r3 # OwO what's this
    ld      0x0(g13), r4    # g13 = mod_fa_control0_add
    bbs     0, r4, loc_1D3D4
    ldob    also_mode, r15
    lda     mode128, r14
    bbc     r15, r14, xor_if_also_mode_is_not_7_p1 # check bit of the value of also_mode and branch if clear
    ld      select0_flag, r15
    bbs     4, r15, loc_1D3E8
    b       loc_1D400
# ---------------------------------------------------------------------------
xor_if_also_mode_is_not_7_p1:           # CODE XREF: control_init+9C↑j
    xor     r3, r3, r3
loc_1D3D4:                              # CODE XREF: control_init+88↑j
    ldob    ROB0_DEBUG_PARAM, r4
    bbc     0, r4, loc_1D3E8
    bbs     2, r4, loc_1D3F4
    b       loc_1D400
# ---------------------------------------------------------------------------
loc_1D3E8:                              # CODE XREF: control_init+A8↑j
    ld      select0_flag, r15
    bbc     2, r15, loc_1D400
loc_1D3F4:                              # CODE XREF: control_init+C0↑j
    shri    8, r3, r3
    stob    r3, 0x1200(g7)  # 0x1D39C - INTERUPT_FLAGS_HELD stored to P1_PARTS+0x1200
loc_1D400:                              # CODE XREF: control_init+AC↑j
    call    sub_1D47C
    mov     g8, r15
    mov     g7, g8
    mov     r15, g7
    ld      INTERUPT_FLAGS_HELD, r3
    ld      0x0(g13), r4
    bbs     1, r4, loc_1D448
    ldob    also_mode, r15
    lda     mode128, r14
    bbc     r15, r14, xor_if_also_mode_is_not_7_p2
    ld      select1_flag, r15
    bbs     4, r15, loc_1D45C
    b       loc_1D474
# ---------------------------------------------------------------------------
xor_if_also_mode_is_not_7_p2:           # CODE XREF: control_init+110↑j
    xor     r3, r3, r3
loc_1D448:                              # CODE XREF: control_init+FC↑j
    ldob    ROB1_DEBUG_PARAM, r4
    bbc     0, r4, loc_1D45C
    bbs     2, r4, loc_1D468
    b       loc_1D474
# ---------------------------------------------------------------------------
loc_1D45C:                              # CODE XREF: control_init+11C↑j
    ld      select1_flag, r15
    bbc     2, r15, loc_1D474
loc_1D468:                              # CODE XREF: control_init+134↑j
    shri    0x10, r3, r3
    stob    r3, 0x1200(g7)
loc_1D474:                              # CODE XREF: control_init+120↑j
    call    sub_1D47C
    ret
# End of function control_init
# =============== S U B R O U T I N E =======================================
sub_1D47C:                              # CODE XREF: control_init:loc_1D400↑p
    ld      0x1208(g7), r15
    bbc     3, r15, loc_1D4EC
    mov     0, r3
    st      r3, 0x1208(g7)
    st      r3, 0x1218(g7)
    stos    r3, 0x120E(g7)
    st      r3, 0x121C(g7)
    stos    r3, 0x1244(g7)
    st      r3, 0x123C(g7)
    ldob    0x1200(g7), r4
    stob    r4, 0x1280(g7)
    stob    r4, 0x1281(g7)
    mov     1, r3
    stob    r3, 0x1202(g7)
    stob    r3, 0x1203(g7)
    b       loc_1E170
# ---------------------------------------------------------------------------
loc_1D4EC:                              # CODE XREF: sub_1D47C+8↑j
    ld      0x1A4(g7), r10
    mov     0, g6
    ld      0x121C(g7), r14
    cmpobe  0, r14, loc_1D528
    ldos    0x1220(g7), r3
    cmpobe  0, r3, loc_1D51C
    subo    1, r3, r3
    stos    r3, 0x1220(g7)
    b       loc_1D528
# ---------------------------------------------------------------------------
loc_1D51C:                              # CODE XREF: sub_1D47C+8C↑j
    mov     0, r15
    st      r15, 0x121C(g7)
loc_1D528:                              # CODE XREF: sub_1D47C+80↑j
    ldos    0x1244(g7), r14
    cmpobe  0, r14, loc_1D54C
    subo    1, 0, r13
    ldos    0x1244(g7), r14
    addi    r13, r14, r15
    stos    r15, 0x1244(g7)
loc_1D54C:                              # CODE XREF: sub_1D47C+B4↑j
    ld      0x0(g7), r15
    bbc     4, r15, loc_1D580
    mov     0, r15
    st      r15, 0x1218(g7)
    mov     0, r15
    stis    r15, 0x120E(g7)
    mov     0, r15
    stis    r15, 0x1244(g7)
    setbit  0, g6, g6
    b       load_char_moveset_g4
# ---------------------------------------------------------------------------
loc_1D580:                              # CODE XREF: sub_1D47C+D4↑j
    ld      0x1218(g7), g4
    bbc     0, r10, loc_1D594
    setbit  0, g6, g6
    b       loc_1D5C8
# ---------------------------------------------------------------------------
loc_1D594:                              # CODE XREF: sub_1D47C+10C↑j
    cmpobe  0, g4, load_char_moveset_g4
    ldos    0x120E(g7), r14
    cmpobne 0, r14, loc_1D5C8
load_char_moveset_g4:                   # CODE XREF: sub_1D47C+100↑j
    ldob    0x1B1(g7), r15  # r15 = P1_PARTS+0x1B1
    ld      MOVESET_ARRAY[r15*4], g4
    mov     0, r15
    st      r15, 0x1218(g7) # p1_pc_command or p2_pc_command
    mov     0, r15
    stis    r15, 0x1244(g7) # P1_PARTS+0x1244 = 0
loc_1D5C8:                              # CODE XREF: sub_1D47C+114↑j
    ld      0x1208(g7), r3
    chkbit  1, r3
    alterbit 2, r3, r3
    chkbit  0, g6
    alterbit 1, r3, r3
    st      r3, 0x1208(g7)
    lda     0x3F, r12
    ldob    0x1202(g7), r5
    subo    1, r5, r3
    and     r12, r3, r3
    ldob    0x1280(g7)[r3*4], r6
    ldob    0x1281(g7)[r3*4], r7
    ldob    0x1200(g7), r8
    andnot  r6, r8, r9
    stob    r8, 0x1280(g7)[r5*4]
    stob    r9, 0x1282(g7)[r5*4]
    andnot  r8, r6, r4
    stob    r4, 0x1283(g7)[r5*4]
    stob    r4, 0x41(g13)
    mov     r8, r4
    shlo    6, 3, r3
    and     r4, r3, r15
    cmpobne 0, r15, loc_1D650
    and     r7, r3, r15
    or      r4, r15, r4
loc_1D650:                              # CODE XREF: sub_1D47C+1C8↑j
    addo    0x1F, 0x11, r3
    and     r4, r3, r15
    cmpobne 0, r15, loc_1D664
    and     r7, r3, r15
    or      r4, r15, r4
loc_1D664:                              # CODE XREF: sub_1D47C+1DC↑j
    stob    r4, 0x1281(g7)[r5*4]
    addo    1, r5, r5
    and     r12, r5, r5
    stob    r5, 0x1202(g7)
    addo    1, r5, r3
    and     r12, r3, r3
    ldob    0x1204(g7), r14
    cmpobne r5, r14, loc_1D698
    stob    r3, 0x1204(g7)
loc_1D698:                              # CODE XREF: sub_1D47C+210↑j
    ldob    0x1205(g7), r14
    cmpobne r5, r14, loc_1D6AC
    stob    r3, 0x1205(g7)
loc_1D6AC:                              # CODE XREF: sub_1D47C+224↑j
    ldob    0x1206(g7), r14
    cmpobne r5, r14, loc_1D6C0
    stob    r3, 0x1206(g7)
loc_1D6C0:                              # CODE XREF: sub_1D47C+238↑j
    ld      0x0(g7), r15
    bbs     1, r15, loc_1D6D4
    mov     6, r6
    mov     7, r7
    b       loc_1D6DC
# ---------------------------------------------------------------------------
loc_1D6D4:                              # CODE XREF: sub_1D47C+248↑j
    mov     7, r6
    mov     6, r7
loc_1D6DC:                              # CODE XREF: sub_1D47C+254↑j
    bbc     0, r10, loc_1D6FC
    bbs     0x12, r10, loc_1D6E8
    bbc     0x13, r10, loc_1D6FC
loc_1D6E8:                              # CODE XREF: sub_1D47C+264↑j
    cmpobe  0, r9, loc_1D708
    ldos    0xA1C(g7), r14
    addi    1, r14, r15
    stos    r15, 0xA1C(g7)
    b       loc_1D708
# ---------------------------------------------------------------------------
loc_1D6FC:                              # CODE XREF: sub_1D47C:loc_1D6DC↑j
    mov     0, r15
    stis    r15, 0xA1C(g7)
    b       loc_1D708
# ---------------------------------------------------------------------------
loc_1D708:                              # CODE XREF: sub_1D47C:loc_1D6E8↑j
    bbc     0, r10, loc_1D73C
    bbc     0x18, r10, loc_1D73C
    cmpobe  0, r9, loc_1D73C
    bbs     0x13, r10, loc_1D730
    ldos    0x1AA(g7), r13
    ldos    0x80C(g7), r14
    subi    r13, r14, r4
    ldos    0x5DE(g7), r14
    mulo    2, r14, r5
    cmpobg  r5, r4, loc_1D73C
loc_1D730:                              # CODE XREF: sub_1D47C+298↑j
    shlo    0x1B, 3, r15
    st      r15, 0x194(g7)
    b       loc_1E160
# ---------------------------------------------------------------------------
loc_1D73C:                              # CODE XREF: sub_1D47C:loc_1D708↑j
    mov     0, g0           # clears g0 after CPU_MOVE_USE
    bal     sub_1E288
    ld      0x0(g7), r4
    bbc     5, r4, loc_1D774
    bbs     4, r4, loc_1D770
    bbs     0, r10, loc_1D770
    bbs     0xC, r10, loc_1D770
    bbs     4, r10, loc_1D770
    bbs     0xE, r10, loc_1D770
    bbs     0x10, r10, loc_1D770
    bbs     0xF, r10, loc_1D770
    shlo    0x18, 1, r15
    st      r15, 0x194(g7)
loc_1D770:                              # CODE XREF: sub_1D47C+2D0↑j
    ret
# ---------------------------------------------------------------------------
loc_1D774:                              # CODE XREF: sub_1D47C+2CC↑j
    ld      0x0(g7), r15
    clrbit  0xF, r15, r15
    st      r15, 0x0(g7)
    ldob    0x19F(g7), r14
    cmpobne 9, r14, loc_1D890
    ld      0x1218(g7), r14
    cmpobne 0, r14, loc_1D890
    ld      0x804(g7), r15
    bbs     0xF, r15, loc_1D864
    mov     0, r5
    cmpobe  0, r9, loc_1D7A8
    mov     1, r5
loc_1D7A8:                              # CODE XREF: sub_1D47C+324↑j
    addo    0x1F, 0x11, r3
    and     r8, r3, r3
    cmpobe  0, r3, loc_1D804
    shro    4, r3, r3
    ldis    word_1EF8C[r3*2], r4
    ld      fa_camera, r15
    ldis    0x26(r15), r12
    ldis    0x5B4(g7), r13
    subi    r12, r13, r13
    subi    r13, r4, r4
    bbs     0xF, r4, loc_1D7F0
    lda     0x9090000, r14
    addi    r5, r14, r15
    st      r15, 0x194(g7)
    b       loc_1E160
# ---------------------------------------------------------------------------
loc_1D7F0:                              # CODE XREF: sub_1D47C+35C↑j
    lda     0x90A0000, r14
    addi    r5, r14, r15
    st      r15, 0x194(g7)
    b       loc_1E160
# ---------------------------------------------------------------------------
loc_1D804:                              # CODE XREF: sub_1D47C+334↑j
    mov     r8, r4
    ldob    0x19E(g7), r14
    cmpobe  0, r14, loc_1D814
    mov     r9, r4
loc_1D814:                              # CODE XREF: sub_1D47C+390↑j
    bbs     4, r4, loc_1D848
    bbc     r7, r4, loc_1D830
    lda     0x9050000, r14
    addi    r5, r14, r15
    st      r15, 0x194(g7)
    b       loc_1E160
# ---------------------------------------------------------------------------
loc_1D830:                              # CODE XREF: sub_1D47C+39C↑j
    bbc     r6, r4, loc_1D848
    lda     0x9060000, r14
    addi    r5, r14, r15
    st      r15, 0x194(g7)
    b       loc_1E160
# ---------------------------------------------------------------------------
loc_1D848:                              # CODE XREF: sub_1D47C:loc_1D814↑j
    ld      0x19C(g7), r15
    lda     0xFFFF0000, r14
    and     r14, r15, r15
    addo    r5, r15, r15
    st      r15, 0x194(g7)
    b       loc_1E160
# ---------------------------------------------------------------------------
loc_1D864:                              # CODE XREF: sub_1D47C+31C↑j
    ldos    0x80A(g7), r3
    ldos    0x1AA(g7), r4
    subi    r4, r3, r3
    ldos    0x87A(g7), r13
    cmpibl  r13, r3, loc_1D890
    mov     3, r3
    and     r8, r3, r3
    cmpobe  0, r3, loc_1D890
    ld      0x0(g7), r15
    setbit  0xF, r15, r15
    st      r15, 0x0(g7)
loc_1D890:                              # CODE XREF: sub_1D47C+308↑j
    bbc     2, r9, loc_1D97C
    and     3, r9, r3
    cmpobe  0, r3, loc_1D8B4
    ld      0x1208(g7), r15
    setbit  0, r15, r15
    st      r15, 0x1208(g7)
    b       loc_1DBE4
# ---------------------------------------------------------------------------
loc_1D8B4:                              # CODE XREF: sub_1D47C+41C↑j
    ld      0x1208(g7), r15
    clrbit  0, r15, r15
    st      r15, 0x1208(g7)
    ldob    0x1202(g7), r3
    stob    r3, 0x1203(g7)
    ld      0x1218(g7), r14
    cmpobe  0, r14, loc_1D8F4
    ldos    0x120E(g7), r14
    cmpobne 0, r14, loc_1D908
    b       loc_1D900
# ---------------------------------------------------------------------------
loc_1D8F4:                              # CODE XREF: sub_1D47C+464↑j
    bbs     0, g6, loc_1D908
    ld      0x1A4(g7), r15
    bbs     4, r15, loc_1D908
loc_1D900:                              # CODE XREF: sub_1D47C+474↑j
    mov     4, g0
    bal     sub_1E398
loc_1D908:                              # CODE XREF: sub_1D47C+470↑j
    ldob    0x1240(g7), r3
    stob    r3, 0x1204(g7)
    stob    r3, 0x1205(g7)
    mov     0, r15
    st      r15, 0x1218(g7)
    mov     0, r15
    stis    r15, 0x120E(g7)
    mov     0, r15
    stis    r15, 0x1244(g7)
    ldos    0x1A8(g7), r14
    cmpobe  0, r14, loc_1D970
    ldib    0x842(g7), r13
    ldis    0x1AA(g7), r14
    cmpibg  r13, r14, loc_1D970
    ldib    0x840(g7), r13
    ldis    0x1AA(g7), r14
    cmpibl  r13, r14, loc_1D970
    shlo    0x1A, 5, r15
    st      r15, 0x194(g7)
    b       loc_1E1A0
# ---------------------------------------------------------------------------
loc_1D970:                              # CODE XREF: sub_1D47C+4CC↑j
    bbs     0, g6, loc_1E1A0
    bal     sub_1D984
    b       loc_1E1A0
# ---------------------------------------------------------------------------
loc_1D97C:                              # CODE XREF: sub_1D47C:loc_1D890↑j
    lda     loc_1DBE4, g14
# End of function sub_1D47C
# =============== S U B R O U T I N E =======================================
sub_1D984:                              # CODE XREF: sub_1D47C+4F8↑p
    bbc     0xC, r10, loc_1DA80
    bbc     0, g6, loc_1DA80
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
    bal     sub_1E1A4
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
loc_1DA80:                              # CODE XREF: sub_1D984↑j
    bbs     0, g6, loc_1DBE0
    bbc     2, r8, loc_1DB10
    and     3, r8, r3
    cmpobne 0, r3, loc_1DAA4
    ld      0x1208(g7), r15
    clrbit  0, r15, r15
    st      r15, 0x1208(g7)
loc_1DAA4:                              # CODE XREF: sub_1D984+108↑j
    ld      0x1208(g7), r15
    bbs     0, r15, loc_1DBE0
    ldob    0x1202(g7), r4
    subo    1, r4, r5
    lda     0x3F, r13
    and     r13, r5, r5
    ldob    0x1282(g7)[r5*4], r3
    bbc     2, r3, loc_1DAD8
    stob    r4, 0x1203(g7)
loc_1DAD8:                              # CODE XREF: sub_1D984+148↑j
    bbc     0xC, r10, loc_1DAE0
    b       loc_1E1A0
# ---------------------------------------------------------------------------
loc_1DAE0:                              # CODE XREF: sub_1D984:loc_1DAD8↑j
    ld      0x0(g7), r15
    bbs     0x1D, r15, loc_1DB04
    ld      0x5B8(g7), r15
    bbs     0, r15, loc_1E120
    ld      0xC70(g7), r14
    cmpibge 0, r14, loc_1DB04
    shlo    0x18, 7, r15
    st      r15, 0x194(g7)
    b       loc_1DC54
# ---------------------------------------------------------------------------
loc_1DB04:                              # CODE XREF: sub_1D984+160↑j
    shlo    0x18, 1, r15
    st      r15, 0x194(g7)
    b       loc_1DC54
# ---------------------------------------------------------------------------
loc_1DB10:                              # CODE XREF: sub_1D984+100↑j
    bbs     0xC, r10, loc_1DBE0
    lda     0x3F, r14
    ldob    0x1202(g7), r5
    subo    1, r5, r5
    and     r14, r5, r5
    ldob    0x1206(g7), r15
    cmpobe  r5, r15, loc_1DBE0
    subo    1, r5, r5
    and     r14, r5, r5
    ldob    0x1280(g7)[r5*4], r3 # P1_PARTS+0x1280
    bbc     2, r3, loc_1DBE0
    mov     7, r12
    mov     4, r13
    mov     9, r4
loc_1DB54:                              # CODE XREF: sub_1D984+204↓j
    ldob    0x1280(g7)[r5*4], r3
    and     r12, r3, r15
    cmpobne r13, r15, loc_1DBE0
    ldob    0x1282(g7)[r5*4], r3
    bbs     2, r3, loc_1DB90
    ldob    0x1206(g7), r15
    cmpobe  r5, r15, loc_1DBE0
    subo    1, r5, r5
    and     r14, r5, r5
    cmpdeco 1, r4, r4
    bl      loc_1DB54
    b       loc_1DBE0
# ---------------------------------------------------------------------------
loc_1DB90:                              # CODE XREF: sub_1D984+1E8↑j
    ldob    0x1202(g7), r3
    ldob    0x1203(g7), r11
    stob    r3, 0x1203(g7)
    lda     0xFF, g0
    addo    4, sp, sp
    st      g14, -4(sp)
    bal     sub_1E358
    ld      -4(sp), g14
    subo    4, sp, sp
    stob    r11, 0x1203(g7)
    ldob    0x1202(g7), r3
    stob    r3, 0x1206(g7)
loc_1DBE0:                              # CODE XREF: sub_1D984:loc_1DA80↑j
    bx      (g14)
# ---------------------------------------------------------------------------
loc_1DBE4:                              # CODE XREF: sub_1D47C+434↑j
    ld      0x1218(g7), r14
    cmpobe  0, r14, loc_1DC28
    ldos    0x120E(g7), r4
    cmpobe  0, r4, loc_1DC28
    lda     0x7FFF, r13
    cmpobe  r13, r4, loc_1DC20
    ldos    0x1AA(g7), r14
    addi    1, r14, r3
    cmpobl  r3, r4, loc_1E1A0
    mov     0, r15
    stis    r15, 0x120E(g7)
loc_1DC20:                              # CODE XREF: sub_1D984+280↑j
    bal     sub_1E3E4
    b       loc_1E170
# ---------------------------------------------------------------------------
loc_1DC28:                              # CODE XREF: sub_1D984+268↑j
    mov     0, r15
    stib    r15, 0x123D(g7)
    bbc     0, g6, loc_1DC9C
    ld      0x121C(g7), r14
    cmpobne 0, r14, loc_1DCF8
    cmpobne 0, g4, loc_1DCF8
    ld      0x1208(g7), r15
    bbs     4, r15, loc_1E1A0
loc_1DC54:                              # CODE XREF: sub_1D984+17C↑j
    ldob    0x1202(g7), r5
    ldob    0x1203(g7), r3
    subi    r3, r5, r4
    cmpible 0, r4, loc_1DC74
    shlo    6, 1, r13
    addi    r13, r4, r4
loc_1DC74:                              # CODE XREF: sub_1D984+2E4↑j
    ldob    precede_inp_time, r3
    cmpible r4, r3, loc_1DC84
    mov     r3, r4
loc_1DC84:                              # CODE XREF: sub_1D984+2F8↑j
    subo    r4, r5, r5
    lda     0x3F, r13
    and     r13, r5, r5
    stob    r5, 0x1203(g7)
    b       loc_1E1A0
# ---------------------------------------------------------------------------
loc_1DC9C:                              # CODE XREF: sub_1D984+2B0↑j
    ld      0x1208(g7), r15
    bbs     4, r15, loc_1DCF8
    ld      0x1208(g7), r15
    bbc     2, r15, loc_1DCF8
    ldob    0x1202(g7), r5
    ldob    0x1204(g7), r3
    subi    r3, r5, r4
    cmpible 0, r4, loc_1DCD4
    shlo    6, 1, r13
    addi    r13, r4, r4
loc_1DCD4:                              # CODE XREF: sub_1D984+344↑j
    ldob    precede_inp_time, r3
    cmpible r4, r3, loc_1DCE4
    mov     r3, r4
loc_1DCE4:                              # CODE XREF: sub_1D984+358↑j
    subo    r4, r5, r5
    lda     0x3F, r13
    and     r13, r5, r5
    stob    r5, 0x1203(g7)
loc_1DCF8:                              # CODE XREF: sub_1D984+2BC↑j
    ldob    0x1202(g7), r5
    ldob    0x1203(g7), r3
    addo    1, r3, r3
    lda     0x3F, r13
    and     r13, r3, r3
    cmpobe  r3, r5, loc_1DD58
loc_1DD18:                              # CODE XREF: sub_1D984+6E8↓j
    ldob    0x1203(g7), r5  # r5 = P1_PARTS+0x1203
    ldob    0x1280(g7)[r5*4], r8
    ldob    0x1282(g7)[r5*4], r9
    ldob    0x1283(g7)[r5*4], r3
    stob    r3, 0x41(g13)
    mov     1, g0
    bal     sub_1E288
    ldob    0x1203(g7), r5
    addi    1, r5, r5
    lda     0x3F, r13
    and     r13, r5, r5
loc_1DD58:                              # CODE XREF: sub_1D984+390↑j
    stob    r5, 0x1203(g7)
    ldob    0x1202(g7), r3
    subi    r5, r3, r4
    cmpible 0, r4, loc_1DD74
    subi    r4, 0, r4
loc_1DD74:                              # CODE XREF: sub_1D984+3E8↑j
    cmpible 0, r4, loc_1DD80
    shlo    6, 1, r13
    addi    r13, r4, r4
loc_1DD80:                              # CODE XREF: sub_1D984:loc_1DD74↑j
    ldob    precede_inp_time, r5
    subo    1, r5, r5
    cmpibg  r4, r5, loc_1DDA4
    ld      0x1208(g7), r15
    clrbit  4, r15, r15
    st      r15, 0x1208(g7)
loc_1DDA4:                              # CODE XREF: sub_1D984+408↑j
    mov     0, g0
    chkbit  0, r9
    alterbit 0, g0, g0
    chkbit  1, r9
    alterbit 1, g0, g0
    cmpobe  0, g0, loc_1DDCC
    chkbit  2, r9
    alterbit 2, g0, g0
    chkbit  8, r9
    alterbit 5, g0, g0
loc_1DDCC:                              # CODE XREF: sub_1D984+434↑j
    bbc     4, r10, loc_1DDD8
    ld      0x70C(g7), r15
    bbs     2, r15, loc_1DE98
loc_1DDD8:                              # CODE XREF: sub_1D984:loc_1DDCC↑j
    bbc     0xC, r10, loc_1DDE8
    ld      0x19C(g7), r15
    bbc     0x12, r15, loc_1DF4C
    bbc     0, r10, loc_1DF4C
loc_1DDE8:                              # CODE XREF: sub_1D984:loc_1DDD8↑j
    mov     0, r15
    st      r15, 0xA08(g7)
    bbs     0, g6, loc_1DEF0
    ld      0x1208(g7), r15
    bbs     4, r15, loc_1DEF0
    bbs     2, r9, loc_1DEF0
    bbs     2, r8, loc_1DEF0
    bbs     5, r9, loc_1DE10
    bbc     5, r8, loc_1DEF0
loc_1DE10:                              # CODE XREF: sub_1D984+484↑j
    bbc     r6, r8, loc_1DE2C
    lda     0x6010000, r15
    st      r15, 0x194(g7)
    shlo    0x10, 0x11, r15
    st      r15, 0xA08(g7)
    b       loc_1DE58
# ---------------------------------------------------------------------------
loc_1DE2C:                              # CODE XREF: sub_1D984:loc_1DE10↑j
    bbc     r7, r8, loc_1DE48
    lda     0x6020000, r15
    st      r15, 0x194(g7)
    shlo    0x11, 0x11, r15
    st      r15, 0xA08(g7)
    b       loc_1DE58
# ---------------------------------------------------------------------------
loc_1DE48:                              # CODE XREF: sub_1D984:loc_1DE2C↑j
    shlo    0x19, 3, r15
    st      r15, 0x194(g7)
    mov     0, r15
    st      r15, 0xA08(g7)
loc_1DE58:                              # CODE XREF: sub_1D984+4A4↑j
    mov     0, r4
    shlo    0x19, 3, r5
    ld      0x1E18(g7), r3
    bbc     0x1B, r3, loc_1DFB0
    ld      0x194(g7), r3
    setbit  0x15, r3, r3
    setbit  0x15, r5, r5
    ld      0x19C(g7), r15
    setbit  0x15, r15, r15
    st      r15, 0x19C(g7)
    st      r3, 0x194(g7)
    ld      0xA08(g7), r15
    setbit  0x12, r15, r15
    st      r15, 0xA08(g7)
    b       loc_1DFB0
# ---------------------------------------------------------------------------
loc_1DE98:                              # CODE XREF: sub_1D984+450↑j
    ld      0x1E24(g7), r15
    bbs     2, r15, loc_1DEC8
    mov     0, r15
    st      r15, 0xA08(g7)
    bbc     r6, r8, loc_1DEBC
    shlo    0x14, 1, r15
    st      r15, 0xA08(g7)
    b       loc_1DEC8
# ---------------------------------------------------------------------------
loc_1DEBC:                              # CODE XREF: sub_1D984+528↑j
    bbc     r7, r8, loc_1DEC8
    shlo    0x15, 1, r15
    st      r15, 0xA08(g7)
loc_1DEC8:                              # CODE XREF: sub_1D984+51C↑j
    ld      0xA08(g7), r15
    setbit  0x1C, r15, r15
    st      r15, 0xA08(g7)
    bal     sub_1E1A4
    shlo    8, 3, r13
    addi    r13, g0, g0
    bal     sub_1E398
    ld      0x194(g7), r14
    cmpobne 0, r14, loc_1E170
    b       loc_1E05C
# ---------------------------------------------------------------------------
loc_1DEF0:                              # CODE XREF: sub_1D984+46C↑j
    cmpobe  0, g0, loc_1DF24
    ld      0x0(g7), r15
    bbc     4, r15, loc_1DF18
    ld      0x0(g7), r15
    bbc     0xE, r15, loc_1DF10
    shlo    9, 3, r13
    addi    r13, g0, g0
    b       loc_1DF18
# ---------------------------------------------------------------------------
loc_1DF10:                              # CODE XREF: sub_1D984+57C↑j
    shlo    8, 5, r13
    addi    r13, g0, g0
loc_1DF18:                              # CODE XREF: sub_1D984+574↑j
    bal     sub_1E398
    bbs     0x1F, g1, loc_1DF24
    ret
# ---------------------------------------------------------------------------
loc_1DF24:                              # CODE XREF: sub_1D984:loc_1DEF0↑j
    bbs     0, g6, loc_1E05C
    ld      0x1208(g7), r15
    bbs     4, r15, loc_1E05C
    ldob    0x41(g13), r3
    or      r9, r3, r3
    cmpobe  0, r3, loc_1E05C
    mov     0, g0
    bal     sub_1E378
    b       loc_1E05C
# ---------------------------------------------------------------------------
loc_1DF4C:                              # CODE XREF: sub_1D984+45C↑j
    ld      0x19C(g7), r5
    lda     0xFFFF0000, r13
    and     r13, r5, r5
    ldob    0x120C(g7), r4
    ldob    0x1B2(g7), r3
    cmpobe  2, r3, loc_1DFEC
    bbs     6, r4, loc_1E04C
    ldos    0x1AA(g7), r3
    addo    1, r3, r3
    ldos    0x80E(g7), r14
    cmpobl  r3, r14, loc_1DF84
    setbit  7, r4, r4
loc_1DF84:                              # CODE XREF: sub_1D984+5F8↑j
    bbs     5, r8, loc_1DFB0
    ld      0x19C(g7), r15
    bbs     0x12, r15, loc_1DFB0
    lda     0x6040000, r5
    ld      0x19C(g7), r15
    bbc     0x15, r15, loc_1DFA8
    lda     0x6240000, r5
loc_1DFA8:                              # CODE XREF: sub_1D984+618↑j
    st      r5, 0x194(g7)
    setbit  7, r4, r4
loc_1DFB0:                              # CODE XREF: sub_1D984+4E4↑j
    and     7, r4, r3
    cmpobne 0, r3, loc_1DFBC
    or      g0, r4, r4
loc_1DFBC:                              # CODE XREF: sub_1D984+630↑j
    bbc     7, r4, loc_1E04C
    and     7, r4, r3
    cmpobe  0, r3, loc_1E04C
    bbs     0x12, r5, loc_1DFD4
    lda     0x100(r3), g0
    b       loc_1DFD8
# ---------------------------------------------------------------------------
loc_1DFD4:                              # CODE XREF: sub_1D984+644↑j
    lda     0x200(r3), g0
loc_1DFD8:                              # CODE XREF: sub_1D984+64C↑j
    setbit  6, r4, r4
    stob    r4, 0x120C(g7)
    bal     sub_1E398
    b       loc_1E170
# ---------------------------------------------------------------------------
loc_1DFEC:                              # CODE XREF: sub_1D984+5E4↑j
    bal     sub_1E1A4
    ld      0xA08(g7), r15
    bbs     0x1B, r15, loc_1E170
    cmpobe  0, g0, loc_1E010
    bbs     0x12, r5, loc_1E008
    lda     0x300(g0), g0
    b       loc_1E044
# ---------------------------------------------------------------------------
loc_1E008:                              # CODE XREF: sub_1D984+678↑j
    lda     0x400(g0), g0
    b       loc_1E044
# ---------------------------------------------------------------------------
loc_1E010:                              # CODE XREF: sub_1D984+674↑j
    bbs     0x12, r5, loc_1E04C
    stob    r4, 0x120C(g7)
    ld      0x194(g7), r14
    cmpobne 0, r14, loc_1E170
    lda     0x300(g0), g0
    ld      0xA08(g7), r15
    setbit  0x1C, r15, r15
    st      r15, 0xA08(g7)
    bal     sub_1E398
    ld      0x194(g7), r14
    cmpobne 0, r14, loc_1E170
    b       loc_1E05C
# ---------------------------------------------------------------------------
loc_1E044:                              # CODE XREF: sub_1D984+680↑j
    bal     sub_1E398
    b       loc_1E170
# ---------------------------------------------------------------------------
loc_1E04C:                              # CODE XREF: sub_1D984+5E8↑j
    stob    r4, 0x120C(g7)
    ld      0x194(g7), r14
    cmpobne 0, r14, loc_1E170
loc_1E05C:                              # CODE XREF: sub_1D984+568↑j
    ldob    0x1203(g7), r13
    ldob    0x1202(g7), r14
    cmpobne r13, r14, loc_1DD18
    ldob    0x123D(g7), r14
    cmpobe  0, r14, loc_1E08C
    ldib    0x1241(g7), r15
    stib    r15, 0x1203(g7)
loc_1E08C:                              # CODE XREF: sub_1D984+6F4↑j
    bbs     0, g6, loc_1E1A0
    bbs     0xC, r10, loc_1E15C
    shlo    4, 0xF, r15
    and     r8, r15, r15
    cmpobe  0, r15, loc_1E0A0
loc_1E0A0:                              # CODE XREF: sub_1D984+718↑j
    ldob    0x1B1(g7), r14
    cmpobe  5, r14, loc_1E0E4
    ldob    0x1B1(g7), r14
    cmpobe  8, r14, loc_1E0E4
    ldob    0x1B1(g7), r14
    cmpobe  9, r14, loc_1E0E4
    ldob    0x1B1(g7), r14
    cmpobe  0xB, r14, loc_1E0E4
    ld      0x0(g7), r15
    bbs     0x1D, r15, loc_1E0E4
    bbc     4, r8, loc_1E0E4
    bbc     r7, r8, loc_1E0D8
    ld      0x5B8(g7), r15
    bbc     0, r15, loc_1E0D8
loc_1E0D8:                              # CODE XREF: sub_1D984+748↑j
    shlo    0x19, 1, r15
    st      r15, 0x194(g7)
    b       loc_1E1A0
# ---------------------------------------------------------------------------
loc_1E0E4:                              # CODE XREF: sub_1D984+720↑j
    bbc     r6, r8, loc_1E100
    ldob    0x19F(g7), r3
    cmpobe  0x16, r3, loc_1E1A0
    cmpobe  0xE, r3, loc_1E1A0
    shlo    0x18, 3, r15
    st      r15, 0x194(g7)
    b       loc_1E1A0
# ---------------------------------------------------------------------------
loc_1E100:                              # CODE XREF: sub_1D984:loc_1E0E4↑j
    bbc     r7, r8, write_move_manip_r15
    ld      0x5B8(g7), r15
    bbs     0, r15, loc_1E120
    ldob    0x19F(g7), r3
    cmpobe  0xF, r3, loc_1E1A0
    shlo    0x1A, 1, r15
    st      r15, 0x194(g7)
    b       loc_1E1A0
# ---------------------------------------------------------------------------
loc_1E120:                              # CODE XREF: sub_1D984+168↑j
    shlo    0x18, 5, r15
    st      r15, 0x194(g7)
    b       loc_1E180
# ---------------------------------------------------------------------------
write_move_manip_r15:                   # CODE XREF: sub_1D984:loc_1E100↑j
    ldob    0x19F(g7), r3
    cmpobe  0xE, r3, loc_1E1A0
    cmpobe  0xF, r3, loc_1E1A0
    cmpobne 0x16, r3, loc_1E150
    ldob    0x1B2(g7), r3
    cmpibl  1, r3, loc_1E150
    shlo    0x19, 7, r15
    st      r15, 0x194(g7)
    b       loc_1E1A0
# ---------------------------------------------------------------------------
loc_1E150:                              # CODE XREF: sub_1D984+7B4↑j
    shlo    0x18, 1, r15
    st      r15, 0x194(g7)
    b       loc_1E1A0
# ---------------------------------------------------------------------------
loc_1E15C:                              # CODE XREF: sub_1D984+70C↑j
    ret
# ---------------------------------------------------------------------------
loc_1E160:                              # CODE XREF: sub_1D47C+2BC↑j
    ldob    0x1202(g7), r3
    stob    r3, 0x1203(g7)
loc_1E170:                              # CODE XREF: sub_1D47C+6C↑j
    ldib    0x1203(g7), r15
    stib    r15, 0x1204(g7)
loc_1E180:                              # CODE XREF: sub_1D984+7A4↑j
    ldib    0x1203(g7), r15
    stib    r15, 0x1205(g7)
    ldib    0x1203(g7), r15
    stib    r15, 0x1206(g7)
loc_1E1A0:                              # CODE XREF: control_init+38↑j
    ret
# End of function sub_1D984
# =============== S U B R O U T I N E =======================================
sub_1E1A4:                              # CODE XREF: sub_1D984+80↑p
    ld      0xA08(g7), r15
    bbc     0x14, r15, loc_1E1C0
    bbs     r6, r8, loc_1E1D0
    ld      0xA08(g7), r15
    clrbit  0x14, r15, r15
    st      r15, 0xA08(g7)
    b       loc_1E1D0
# ---------------------------------------------------------------------------
loc_1E1C0:                              # CODE XREF: sub_1E1A4+4↑j
    bbs     r7, r8, loc_1E1D0
    ld      0xA08(g7), r15
    clrbit  0x15, r15, r15
    st      r15, 0xA08(g7)
loc_1E1D0:                              # CODE XREF: sub_1E1A4+8↑j
    bbs     0, r9, loc_1E1D8
    bbc     1, r9, loc_1E1E4
loc_1E1D8:                              # CODE XREF: sub_1E1A4:loc_1E1D0↑j
    ld      0xA08(g7), r15
    setbit  0x13, r15, r15
    st      r15, 0xA08(g7)
loc_1E1E4:                              # CODE XREF: sub_1E1A4+30↑j
    lda     0xFFFFFF00, r13
    ld      0xA08(g7), r14
    and     r13, r14, r15
    st      r15, 0xA08(g7)
    lda     0x1282(g7), r3
    ldob    0x1202(g7), r13
    mov     1, r14
    mov     0xA, r12
loc_1E210:                              # CODE XREF: sub_1E1A4+88↓j
    subi    1, r13, r13
    lda     0x3F, r15
    and     r15, r13, r13
    ldob    (r3)[r13*4], r15
    and     r14, r15, r15
    cmpobe  r14, r15, loc_1E234
    subo    1, r12, r12
    cmpobne 0, r12, loc_1E210
    b       loc_1E240
# ---------------------------------------------------------------------------
loc_1E234:                              # CODE XREF: sub_1E1A4+80↑j
    ld      0xA08(g7), r15
    setbit  4, r15, r15
    st      r15, 0xA08(g7)
loc_1E240:                              # CODE XREF: sub_1E1A4+8C↑j
    ld      0x5B8(g7), r12
    ld      0xA08(g7), r15
    bbc     r6, r8, loc_1E25C
    bbc     0, r12, loc_1E258
    setbit  1, r15, r15
    b       loc_1E25C
# ---------------------------------------------------------------------------
loc_1E258:                              # CODE XREF: sub_1E1A4+A8↑j
    setbit  0, r15, r15
loc_1E25C:                              # CODE XREF: sub_1E1A4+A4↑j
    bbc     r7, r8, loc_1E270
    bbc     0, r12, loc_1E26C
    setbit  0, r15, r15
    b       loc_1E270
# ---------------------------------------------------------------------------
loc_1E26C:                              # CODE XREF: sub_1E1A4+BC↑j
    setbit  1, r15, r15
loc_1E270:                              # CODE XREF: sub_1E1A4:loc_1E25C↑j
    bbc     5, r8, loc_1E278
    setbit  2, r15, r15
loc_1E278:                              # CODE XREF: sub_1E1A4:loc_1E270↑j
    bbc     4, r8, loc_1E280
    setbit  3, r15, r15
loc_1E280:                              # CODE XREF: sub_1E1A4:loc_1E278↑j
    st      r15, 0xA08(g7)
    bx      (g14)
# End of function sub_1E1A4
# =============== S U B R O U T I N E =======================================
sub_1E288:                              # CODE XREF: sub_1D47C+2C4↑p
    mov     7, r4
    and     r4, r9, r5
    ldob    0x123C(g7)[g0], r3
    cmpobne 0, r3, loc_1E2D8
    cmpobe  0, r5, loc_1E2BC
    cmpobe  r4, r5, loc_1E2BC
    mov     1, r15
    stib    r15, 0x123C(g7)[g0]
    stob    r5, 0x123E(g7)[g0]
    andnot  r4, r9, r9
loc_1E2BC:                              # CODE XREF: sub_1E288+14↑j
    ldob    0x1203(g7), r3
    stob    r3, 0x1240(g7)[g0]
    stob    r3, 0x1242(g7)
    b       loc_1E354
# ---------------------------------------------------------------------------
loc_1E2D8:                              # CODE XREF: sub_1E288+10↑j
    ldob    0x123E(g7)[g0], r12
    bbs     0, g6, loc_1E30C
    cmpobne 4, r12, loc_1E30C
    bbs     2, r8, loc_1E30C
    cmpobne 1, r5, loc_1E30C
    ldob    0x1203(g7), r3
    stob    r3, 0x1240(g7)[g0]
    stob    r3, 0x1242(g7)
    b       loc_1E344
# ---------------------------------------------------------------------------
loc_1E30C:                              # CODE XREF: sub_1E288+58↑j
    cmpobne 6, r12, loc_1E31C
    and     r4, r8, r13
    cmpobne 2, r13, loc_1E31C
    setbit  8, r9, r9
loc_1E31C:                              # CODE XREF: sub_1E288:loc_1E30C↑j
    or      r12, r5, r5
    cmpobe  r4, r5, loc_1E344
    subo    1, r3, r3
    cmpobe  0, r3, loc_1E344
    stob    r3, 0x123C(g7)[g0]
    stob    r5, 0x123E(g7)[g0]
    andnot  r4, r9, r9
    b       loc_1E354
# ---------------------------------------------------------------------------
loc_1E344:                              # CODE XREF: sub_1E288+80↑j
    mov     0, r15
    stib    r15, 0x123C(g7)[g0]
    or      r5, r9, r9
loc_1E354:                              # CODE XREF: sub_1E288+4C↑j
    bx      (g14)
# End of function sub_1E288
# =============== S U B R O U T I N E =======================================
sub_1E358:                              # CODE XREF: sub_1D984+234↑p
    ldib    0x1206(g7), r15
    stib    r15, 0x40(g13)
    shlo    4, 0xF, r15
    stib    r15, 0x42(g13)
    lda     0xF3, r15
    stib    r15, 0x43(g13)
    b       loc_1E3FC
# End of function sub_1E358
# =============== S U B R O U T I N E =======================================
sub_1E378:                              # CODE XREF: sub_1D984+5C0↑p
    ldib    0x1205(g7), r15
    stib    r15, 0x40(g13)
    lda     0xF4, r15
    stib    r15, 0x42(g13)
    lda     0xFF, r15
    stib    r15, 0x43(g13)
    b       loc_1E3FC
# End of function sub_1E378
# =============== S U B R O U T I N E =======================================
sub_1E398:                              # CODE XREF: sub_1D47C+488↑p
    lda     0xF4, r15
    stib    r15, 0x42(g13)
    lda     0xFF, r15
    stib    r15, 0x43(g13)
    ld      0x121C(g7), r3
    cmpobe  0, r3, sub_1E3E4
    mov     sp, r15
    addo    8, sp, sp
    st      g4, (r15)
    st      g14, 4(r15)
    mov     r3, g4
    bal     sub_1E3E4
    subo    8, sp, r15
    ld      4(r15), g14
    ld      (r15), g4
    mov     r15, sp
    cmpobne 0, g4, sub_1E3E4
    bx      (g14)
# End of function sub_1E398
# =============== S U B R O U T I N E =======================================
sub_1E3E4:                              # CODE XREF: sub_1D984:loc_1DC20↑p
    mov     0, r15
    st      r15, 0x1218(g7)
    ldib    0x1204(g7), r15
    stib    r15, 0x40(g13)
loc_1E3FC:                              # CODE XREF: sub_1E358+1C↑j
    mov     sp, r15
    addo    0x18, sp, sp
    stq     r8, (r15)
    st      g4, 0x10(r15)
    st      g0, 0x14(r15)
    st      sp, 0x1214(g13)
    ldob    0x1203(g7), r11
    subi    1, r11, r11
    lda     0x3F, r13
    and     r13, r11, r11
    shlo    4, 0xF, r3
    and     r3, r8, r8
    and     r3, r9, r9
    ldob    0x1242(g7), r13
    subi    r13, r11, r3
    lda     0x3F, r13
    and     r13, r3, g5
    mov     0, r10
loc_1E450:                              # CODE XREF: sub_1E468+2C↓j
    mov     0, g3
    mov     0, g2
_uk_execute_move:                       # CODE XREF: sub_1E468+DC↓j
    ldob    (g4), r3        # g4 = 0x820D8
    ld      COMMANDS_BEGIN[r3*4], r4 # Reads movesets
    bx      (r4)
# End of function sub_1E3E4
