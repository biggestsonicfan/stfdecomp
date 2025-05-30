        .section burni
# =============== S U B R O U T I N E =======================================
# This is the UFO EGGMAN clone cutscene
BUNRI_INT:                              # DATA XREF: ROM:0000B0C4↑o
    lda     0x438C0000, r15 # Label from official source
    st      r15, focus_dist_x
    lda     0x438C0000, r15
    st      r15, focus_dist_y
    call    window_data_init
    lda     0x1000000, g9
    addo    0x1F, 0x1F, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    mov     0, r15
    stis    r15, 0x100A000
    mov     0, r15
    stis    r15, 0x100A008
    call    sub_C738
    ld      fa_camera, r3
    lda     check_word4+2, r15
    stib    r15, 0x40(r3)
    ld      0x5004C0, r15
    setbit  0, r15, r15
    st      r15, 0x5004C0
    ld      fa_rob0, r3
    ld      fa_rob1, r4
    ldob    0x1B0(r3), r5
    ldob    0x1B0(r4), r6
    ld      0x0(r3), r15
    clrbit  0x11, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r4), r15
    clrbit  0x11, r15, r15
    st      r15, 0x0(r4)
    ld      0x0(r3), r15
    setbit  0x13, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r4), r15
    setbit  0x13, r15, r15
    st      r15, 0x0(r4)
    ld      fa_camera, r7
    cmpobl  r5, r6, loc_C07C
    ld      0x0(r7), r15
    clrbit  1, r15, r15
    st      r15, 0x0(r7)
    ld      fa_rob1, r3
    ld      fa_rob0, r7
    lda     displacement, r4
    xor     r5, r5, r5
    mov     r4, r6
    stt     r4, 0x18(r3)
    notbit  0x1F, r4, r4
    notbit  0x1F, r6, r6
    stt     r4, 0x18(r7)
    ld      mod_fa_burni, r3 # Cloning cutscene
    shlo    0xD, 1, r6
    lda     0x800101, r15
    st      r15, (g11)[g12*1]
    lda     0x1800303, r15 # 0x000000
    st      r15, (g11)[g12*1]
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    lda     0x2800505, r15
    st      r15, (g11)[g12*1]
loc_BFF4:                               # DATA XREF: rob_revise_yang+1DC↓o
    lda     0x15C(r3), r15
    ld      (g11)[g12*1], r14
    st      r14, 0x0(r15)
loc_C000:                               # DATA XREF: ROM:loc_46A74↓r
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
    lda     0x1000202, r15
    st      r15, (g11)[g12*1]
    ld      0x5004C0, r15
    setbit  1, r15, r15
    st      r15, 0x5004C0
    b       loc_C190
# ---------------------------------------------------------------------------
loc_C07C:                               # CODE XREF: BUNRI_INT+CC↑j
    ld      0x0(r7), r15
    clrbit  2, r15, r15
    st      r15, 0x0(r7)
    ld      fa_rob0, r3
    ld      fa_rob1, r7
    lda     displacement, r4
    xor     r5, r5, r5
    mov     r4, r6
    stt     r4, 0x18(r3)
    notbit  0x1F, r4, r4
    notbit  0x1F, r6, r6
    stt     r4, 0x18(r7)
    ld      mod_fa_burni, r3 # Cloning cutscene
    lda     0xBF800000, r4
    lda     0x3F800000, r5
    shlo    0xD, 1, r6
    lda     0x800101, r15
    st      r15, (g11)[g12*1]
    lda     0x1800303, r15 # 0x000000
    st      r15, (g11)[g12*1]
    lda     0x4800909, r15
    st      r15, (g11)[g12*1]
    st      r6, (g11)[g12*1]
    lda     0x3800707, r15
    st      r15, (g11)[g12*1]
    st      r4, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    st      r5, (g11)[g12*1]
    lda     0x2800505, r15
    st      r15, (g11)[g12*1]
    lda     0x15C(r3), r15
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
    lda     0x1000202, r15
    st      r15, (g11)[g12*1]
loc_C190:                               # CODE XREF: BUNRI_INT+1D0↑j
    mov     1, r4
    ld      mod_fa_coli, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_burni, r3 # Cloning cutscene
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     fa_burni, r5    # Cloning cutscene
    st      r5, 0xC(r3)
    mov     1, r4
    ld      mod_fa_obj0, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     object_init, r5
    st      r5, 0xC(r3)
    ld      mod_fa_obj0, r3
    mov     0, r15
    stis    r15, 6(r3)
    shlo    6, 5, r15
    st      r15, CTRL_TIMER
    mov     0x1D, r15
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# End of function BUNRI_INT


# =============== S U B R O U T I N E =======================================
sub_C738:                               # CODE XREF: BUNRI_INT+50↑p
    call    scr_bg_int
    call    sub_81038
    call    sub_7F0E8       # Inits player bodies
    call    scale_something
    movt    0, g0
    movt    0, g4
    ld      fa_rob0, r3
    ld      fa_rob1, r7
    lda     0x1F88(r3), g3
    call    sub_7F408
    lda     0x1F88(r7), g3
    call    sub_7F408
    lda     0x1FEC(r3), g3
    call    sub_7F408
    lda     0x1FEC(r7), g3
    call    sub_7F408
    mov     0, r4
    st      r4, 0x219C(r3)
    st      r4, 0x219C(r7)
    lda     0x2758(r3), g3
    call    write_scale
    lda     0x2758(r7), g3
    call    write_scale
    ret
# End of function sub_C738

# =============== S U B R O U T I N E =======================================
BUNRI_DSP:                              # DATA XREF: ROM:0000B0CC↑o
    ld      INTERUPT_FLAGS_MOMENTARY, r3 # Label from official source
    bbc     4, r3, loc_C234 # P1 Start
    ld      select0_flag, r15
    bbs     2, r15, loc_C260 # Check if not CPU
loc_C234:                               # CODE XREF: BUNRI_DSP+8↑j
    bbc     5, r3, loc_C244 # P2 Start
    ld      select1_flag, r15
    bbs     2, r15, loc_C260 # Check if not CPU
loc_C244:                               # CODE XREF: BUNRI_DSP:loc_C234↑j
    ld      CTRL_TIMER, r14
    cmpibl  0, r14, loc_C25C # If 0 less than CTRL_TIMER branch
    mov     2, r15
    stib    r15, _sub_mode
loc_C25C:                               # CODE XREF: BUNRI_DSP+30↑j
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
loc_C260:                               # CODE XREF: BUNRI_DSP+14↑j
    ld      mod_fa_burni, r3 # Cloning cutscene
    ld      0x0(r3), r15
    clrbit  0x1F, r15, r15
    st      r15, 0x0(r3)
    ld      fa_camera, r3
    lda     0x407CCCCD, r4
    lda     0x40733333, r5
    setbit  0x1F, r4, r6
    stt     r4, 0x18(r3)
    lda     0xF600, r15
    stis    r15, 0x24(r3)
    shlo    0xD, 1, r15
    stis    r15, 0x26(r3)
    lda     displacement, r15
    stib    r15, 0x40(r3)
    ld      fa_rob0, r3
    ld      fa_rob1, r7
    lda     0xBFF9999A, r4
    xor     r5, r5, r5
    mov     r4, r6
    stt     r4, 0x18(r3)
    clrbit  0x1F, r4, r4
    clrbit  0x1F, r6, r6
    stt     r4, 0x18(r7)
    ld      0x1A0(r3), r4
    ldos    displacement(r4), g0
    mov     r3, g7
    call    set_motion
    ld      0x1A0(r7), r4
    ldos    displacement(r4), g0
    mov     r7, g7
    call    set_motion
    ld      0x0(r3), r15
    clrbit  0x11, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r7), r15
    clrbit  0x11, r15, r15
    st      r15, 0x0(r7)
    ld      0x0(r3), r15
    clrbit  0x13, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r7), r15
    clrbit  0x13, r15, r15
    st      r15, 0x0(r7)
    mov     2, r15
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# End of function BUNRI_DSP
