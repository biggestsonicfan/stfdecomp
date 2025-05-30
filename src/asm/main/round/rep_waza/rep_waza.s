        .section rep_waza
# ---------------------------------------------------------------------------
REP_WAZA_INT:                           # DATA XREF: ROM:0000B094↑o
    lda     0x1002000, g9   # Label from official source
    shlo    6, 1, g0
    mov     0xC, g1
    call    clr_pattern_s
    lda     0x100C000, r11
    shlo    6, 7, r3        # r3 = 304
    lda     0xFFFF, r4
loc_D2DC:                               # CODE XREF: ROUND_DSP+B28↓j
    stos    r4, (r11)       # This code erases the hud
    addo    2, r11, r11
    cmpdeco 1, r3, r3
    bl      loc_D2DC
    ldos    0x500460, r3
    ldob    0x5003A0, r4
    bbc     2, r4, loc_D308
    ldos    0x500462, r3
loc_D308:                               # CODE XREF: ROUND_DSP+B3C↑j
    ld      mod_fa_obj0, r9
    stos    r3, 6(r9)
    ld      fa_rob0, g7
    ld      fa_rob1, g8
    ld      0x0(g7), r15
    clrbit  0x1F, r15, r15
    st      r15, 0x0(g7)
    ld      0x0(g8), r15
    clrbit  0x1F, r15, r15
    st      r15, 0x0(g8)
    ld      mod_fa_coli, r3
    ld      0x0(r3), r15
    clrbit  0x1F, r15, r15
    st      r15, 0x0(r3)
    ld      mod_fa_control0, r3
    ld      0x0(r3), r15
    clrbit  0x1F, r15, r15
    st      r15, 0x0(r3)
    ld      mod_fa_record, r3
    ld      0x0(r3), r15
    clrbit  0x1F, r15, r15
    st      r15, 0x0(r3)
    ld      fa_camera, r3
    ldt     0x18(r3), r4
    stt     r4, 0x318(r3)
    ldt     0x120(r3), r4
    stt     r4, 0x324(r3)
    ldis    0x24(r3), r15
    stis    r15, 0x330(r3)
    ldis    0x26(r3), r15
    stis    r15, 0x332(r3)
    ldis    0x28(r3), r15
    stis    r15, 0x334(r3)
    mov     0, r15
    stis    r15, 0x394(r3)
    lda     displacement, r15
    st      r15, 0x3B0(r3)
    lda     start_ip_add+3, r15
    stib    r15, 0x40(r3)
    addo    4, sp, sp
    st      g0, -4(sp)
loc_D3D4:                               # CODE XREF: ROUND_DSP:loc_D440↓j
    call    rand            # Random value stored to g0
    and     7, g0, g0       # g0 = 0 for the time I saw it in the debugger
    ldob    stage_num, r14
    cmpobe  3, r14, loc_D440
    ldob    stage_num, r14
    cmpobe  6, r14, loc_D440
loc_D3F4:                               # CODE XREF: ROUND_DSP+C84↓j
    st      g0, 0x210(r3)   # store g0 at mod_fa_camera_add+0x210
    ld      -4(sp), g0
    subo    4, sp, sp
    mov     1, r4
    ld      mod_fa_play, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     sub_3900C, r5
    st      r5, 0xC(r3)
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    b       REP_WAZA_DSP    # "REPLAY TECHNIQUE" Display
# ---------------------------------------------------------------------------
loc_D440:                               # CODE XREF: ROUND_DSP+C24↑j
    cmpoble 4, g0, loc_D3D4
    b       loc_D3F4
# ---------------------------------------------------------------------------
REP_WAZA_DSP:                           # CODE XREF: ROUND_DSP+C7C↑j
    ld      mod_fa_play, r3 # Label from official source
    ld      0x0(r3), r15
    bbc     0x1F, r15, loc_D45C # This is set at 0xD414 so this will never branch
    ret
# ---------------------------------------------------------------------------
loc_D45C:                               # CODE XREF: ROUND_DSP+C94↑j
    ldob    0x5003A1, r3
    subo    1, r3, r3
    stob    r3, 0x5003A1
    cmpobe  0, r3, rep_waza_quit
    mov     1, r4
    ld      mod_fa_play, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     sub_3900C, r5
    st      r5, 0xC(r3)
    ld      fa_camera, r3
    lda     check_word1, r15
    stib    r15, 0x40(r3)
    addo    4, sp, sp
    st      g0, -4(sp)
    ld      0x210(r3), g0
    addo    1, g0, g0
    and     7, g0, g0
    st      g0, 0x210(r3)
    ld      -4(sp), g0
    subo    4, sp, sp
    ldos    0x500460, r10
    ldob    0x5003A0, r4
    bbc     2, r4, loc_D4F0
    ldos    0x500462, r10
loc_D4F0:                               # CODE XREF: ROUND_DSP+D24↑j
    ld      mod_fa_obj0, r9
    stos    r10, 6(r9)
    ret
# ---------------------------------------------------------------------------
rep_waza_quit:                          # CODE XREF: ROUND_DSP+CB0↑j
    ld      fa_rob0, r3     # Label from official source
    ld      0x0(r3), r15
    setbit  0x1F, r15, r15
    st      r15, 0x0(r3)
    ld      0x70C(r3), r15
    clrbit  6, r15, r15
    st      r15, 0x70C(r3)
    ld      fa_rob1, r3
    ld      0x0(r3), r15
    setbit  0x1F, r15, r15
    st      r15, 0x0(r3)
    ld      0x70C(r3), r15
    clrbit  6, r15, r15
    st      r15, 0x70C(r3)
    ld      mod_fa_coli, r3
    ld      0x0(r3), r15
    setbit  0x1F, r15, r15
    st      r15, 0x0(r3)
loc_D554:                               # DATA XREF: sub_56DEC+109C↓o
    ld      mod_fa_control0, r3
    ld      0x0(r3), r15
    setbit  0x1F, r15, r15
    st      r15, 0x0(r3)
    ld      mod_fa_record, r3
    ld      0x0(r3), r15
    setbit  0x1F, r15, r15
    st      r15, 0x0(r3)
    ld      fa_camera, r3
    ld      0x0(r3), r15
    clrbit  0x1B, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  0x1C, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  0x1D, r15, r15
    st      r15, 0x0(r3)
    lda     displacement3, r15
    stib    r15, 0x40(r3)
    ldt     0x318(r3), r4
    stt     r4, 0x18(r3)
    ldt     0x324(r3), r4
    stt     r4, 0x120(r3)
    ldis    0x330(r3), r15
    stis    r15, 0x24(r3)
    ldis    0x332(r3), r15
    stis    r15, 0x26(r3)
    ldis    0x334(r3), r15
    stis    r15, 0x28(r3)
    mov     13, r15
    stib    r15, _sub_mode
    lda     0x100C000, r11
    shlo    6, 7, r3
    mov     0, r4
loc_D5F8:                               # CODE XREF: ROUND_DSP+E44↓j
    stos    r4, (r11)
    addo    2, r11, r11
    cmpdeco 1, r3, r3
    bl      loc_D5F8
    ld      fa_camera, r3
    mov     1, r4
    mov     2, r5
    ld      0x0(r3), r15
    setbit  r4, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    setbit  r5, r15, r15
    st      r15, 0x0(r3)
    b       no_start_rep_w1
# ---------------------------------------------------------------------------
    ret
