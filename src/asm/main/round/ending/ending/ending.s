        .section ending
# ---------------------------------------------------------------------------
ENDING_INT:                             # DATA XREF: ROM:00007B64↑o
    ldib    STAGE_ID, r15   # Label from Fighting Vipers source (obvious tho)
    stib    r15, list_motions_ram+1
    mov     0, r15
    stib    r15, 0x50004D
    lda     win_down_rom, r10 # Window down
    lda     win_down, r11   # Window down
    ldt     (r10), r4
    stt     r4, (r11)
    ldt     0xC(r10), r4
    stt     r4, 0xC(r11)
    call    sub_1051C
    lda     0x8E, g0
    call    _Scroll_Initialize
    shlo    3, 0x15, g0
    call    _Scroll_Initialize
    call    sub_105C0
    lda     start_ip_add+3, r15
    stib    r15, stage_num
    call    change_scene
    mov     1, r4
    ld      mod_fa_win0, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_win1, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_coli, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_sampling, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_obj0, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    ld      fa_camera, r3
    ld      0x0(r3), r4
    setbit  1, r4, r4
    setbit  2, r4, r4
    setbit  0xE, r4, r4
    clrbit  0x1F, r4, r4
    st      r4, 0x0(r3)
    lda     0x43C00000, r3
    mov     0, r15
    stis    r15, 0x100A000
    shlo    0xD, 1, r15
    stis    r15, 0x100A008
    lda     0x1006000, g9
    lda     405, g0         # Earth far away texture
    call    dsp_pattern_low
    mov     0, r15
    stis    r15, scrB_H_page
    shlo    0xD, 1, r15
    stis    r15, scrB_V_page
    ld      not_scr_bg_move, r15
    setbit  0xE, r15, r15
    st      r15, not_scr_bg_move
    lda     0x1004000, g9
    lda     390, g0         # Outer space texture
    call    dsp_pattern_low
    lda     0x1004078, g9
    lda     390, g0         # Outer space texture
    call    dsp_pattern_low
    lda     0x100407C, g9
    lda     390, g0         # Outer space texture
    ld      texture_palette_offsets[g0*4], r12
    ld      0x4C(r12), r4
    ld      0x4E(r12), r5
    shlo    7, 1, r6
    shlo    7, 1, r3
loc_FB60:                               # CODE XREF: ROM:0000FB70↓j
    stos    r4, (g9)
    stos    r5, 2(g9)
    addo    g9, r6, g9
    cmpdeco 1, r3, r3
    bl      loc_FB60
    call    efc_ram_init
    call    efc_rob_poly_para_init
    shlo    8, 0x11, r15
    st      r15, CTRL_TIMER
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r4
    setbit  0x1E, r4, r4
    clrbit  0x17, r4, r4
    clrbit  0x14, r4, r4
    st      r4, 0x0(r3)
    lda     0xA00001, g0
    call    check_same_sound
    call    sound_request_u
    ld      not_scr_bg_move, r15
    clrbit  0xE, r15, r15
    st      r15, not_scr_bg_move
    mov     0, r15
    stib    r15, stage_num
    call    init_endsub_vars
    mov     0, r15
    stis    r15, num_motions_ram
    mov     0, r15
    stib    r15, _sub_mode
    ldib    mode, r15
    lda     1(r15), r15
    stib    r15, mode
    ret
# ---------------------------------------------------------------------------
ENDING_DSP:                             # DATA XREF: ROM:00007B6C↑o
    subo    1, 0, r13       # Label from official source
    ld      CTRL_TIMER, r14
    addi    r13, r14, r15
    st      r15, CTRL_TIMER
    ld      CTRL_TIMER, r14
    cmpibl  0, r14, stuff_conti # if CTRL_TIMER less than 0, branch
    lda     0xA00350, g0    # This audio does not exist in the game
    call    sound_request_u
    mov     1, r4
    ld      mod_fa_coli, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_play, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    ld      not_scr_bg_move, r15
    clrbit  0x19, r15, r15
    st      r15, not_scr_bg_move
    ld      not_scr_bg_move, r15
    clrbit  0x10, r15, r15
    st      r15, not_scr_bg_move
    lda     0x43F00000, r3
    st      r3, focus_dist_x
    st      r3, focus_dist_y
    mov     0, r15
    stis    r15, scrB_H_page
    mov     0, r15
    stis    r15, scrB_V_page
    lda     0x1000000, g9
    shlo    6, 1, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    ld      not_scr_bg_move, r15
    setbit  0xE, r15, r15
    st      r15, not_scr_bg_move
    call    init_endsub_vars
    ldib    list_motions_ram+1, r15
    stib    r15, STAGE_ID
    mov     0, r15
    st      r15, 0x5003A4
    lda     pcrb+3, r15
    stib    r15, _sub_mode
    call    sub_29110
    mov     0, r15
    stis    r15, 0x100A000
    mov     0, r15
    stis    r15, 0x100A008
    lda     0x1008000, r14
    mov     0, r15
    shlo    7, 3, r13
loc_FD44:                               # CODE XREF: ROM:0000FD50↓j
    stis    r15, (r14)
    addo    2, r14, r14
    cmpdeco 1, r13, r13
    bl      loc_FD44
    lda     0x1008800, r14
    mov     0, r15
    shlo    7, 3, r13
loc_FD64:                               # CODE XREF: ROM:0000FD70↓j
    stis    r15, (r14)
    addo    2, r14, r14
    cmpdeco 1, r13, r13
    bl      loc_FD64
    call    fill_haikei_makkuro # fill background(haikei) pitch black(makkuro)
    call    sub_105C0
    call    sub_1059C
    mov     2, g0           # Load CG 1
    call    _Scroll_Initialize
    lda     162, g0         # Load CG 81
    call    _Scroll_Initialize
    ldib    mode, r15
    lda     1(r15), r15
    stib    r15, mode
    ld      fa_rob0, r3
    ld      fa_rob1, r4
    ldib    movie_flags, r15
    stib    r15, 0x1B1(r3)
    ldib    movie_flags, r15
    stib    r15, 0x1B0(r3)
    ldib    0x5004D8, r15
    stib    r15, 0x1B1(r4)
    ldib    0x5004D8, r15
    stib    r15, 0x1B0(r4)
    mov     1, r4
    ld      fa_camera, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    ret
# ---------------------------------------------------------------------------
stuff_conti:                            # CODE XREF: ROM:0000FC28↑j
    ld      fa_rob0, g7     # Label from official source
    ld      0x1064(g7), r7
    addo    1, r7, r4
    and     7, r4, r4
    st      r4, 0x1064(g7)
    mulo    0xC, r7, r3
    lda     0x1004(g7), r4
    addo    r3, r4, r4
    ldt     0x1F4(g7), r8
    stt     r8, (r4)
    ld      fa_rob1, g7
    ld      0x1064(g7), r7
    addo    1, r7, r4
    and     7, r4, r4
    st      r4, 0x1064(g7)
    mulo    0xC, r7, r3
    lda     0x1004(g7), r4
    addo    r3, r4, r4
    ldt     0x1F4(g7), r8
    stt     r8, (r4)
    ldib    _sub_mode, r15
    stib    r15, also_sub_mode
    ldob    _sub_mode, r3
    shlo    r3, 1, r4
    st      r4, 0x500034
    ld      ENDING_STATE[r3*8], r5
    callx   (r5)
    ld      debug_flag, r15
    bbs     9, r15, loc_FF04
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x1001604, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
asc_FEC8:       .asciz "                        "
    .fill 3, 1, 0
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
    lda     0x1001604, g9
    ld      ENDING_STATE_NAMES[r3*8], g0
loc_FF00:                               # DATA XREF: sub_22B2C+18↓o
    call    print_mes
loc_FF04:                               # CODE XREF: ROM:0000FEA8↑j
    call    sub_3176C
    ret
# ---------------------------------------------------------------------------
        .section paint_it_black
# =============== S U B R O U T I N E =======================================
# fill background(haikei) pitch black(makkuro)
fill_haikei_makkuro:                    # CODE XREF: ROM:0000FD74↑p
    ld      not_scr_bg_move, r15 # Label from Fighting Vipers source
    setbit  14, r15, r15
    st      r15, not_scr_bg_move
    mov     0, r15
    stis    r15, scrB_H_page
    mov     0, r15
    stis    r15, scrB_V_page
    lda     1, r3
    ld      texture_palette_offsets[r3*4], r3
    ldos    0xC(r3), r4
    lda     CG_DATA_START, r8
    shlo    0xA, 3, r10
loc_10498:                              # CODE XREF: fill_haikei_makkuro+54↓j
    stis    r4, (r8)
    addo    2, r8, r8
    cmpdeco 1, r10, r10
    bl      loc_10498
    ret
# End of function fill_haikei_makkuro

        .section tile
# =============== S U B R O U T I N E =======================================
sub_1051C:                              # CODE XREF: ROM:0000F9FC↑p
    mov     0, r15
    stis    r15, 0x100A000
    mov     0, r15
    stis    r15, 0x100A008
    shlo    0x18, 1, r8
    b       loc_1055C


        .section texture
loc_1055C:                              # CODE XREF: ROM:000104E0↑j
        lda     1, r3
        ld      texture_palette_offsets[r3*4], r3
        ldos    0xC(r3), r4
        setbit  0xF, r4, r4
        shlo    0xA, 3, r10
loc_10574:                              # CODE XREF: sub_1051C+64↓j
        stis    r4, (r8)
        addo    2, r8, r8
        cmpdeco 1, r10, r10
        bl      loc_10574
        ret
# End of function sub_1051C

        .section tile2
# =============== S U B R O U T I N E =======================================
sub_1059C:                              # CODE XREF: ROM:loc_FD7C↑p
    lda     0x100D000, r5
    mov     0, r8
    b       loc_105CC
# End of function sub_1059C

        .section tile3
# =============== S U B R O U T I N E =======================================
sub_105C0:                              # CODE XREF: ROM:0000FA10↑p
                lda     0x100C000, r5
                mov     0, r8
loc_105CC:                              # CODE XREF: ROM:00010598↑j
                shlo    9, 3, r9
loc_105D0:                              # CODE XREF: sub_105C0+1C↓j
                stos    r8, (r5)
                addo    2, r5, r5
                cmpdeco 1, r9, r9
                bl      loc_105D0
                ret
# End of function sub_105C0


        .section ending_states
ENDING_STATE:   .long ENDING_MOVIE_INT  # DATA XREF: ROM:0000FE94↑r
ENDING_STATE_NAMES:.long aEndingMovieInt # DATA XREF: ROM:0000FEF8↑r
    .long ENDING_MOVIE_DSP
    .long aEndingMovieDsp   # "ENDING_MOVIE_DSP"
    .long ENDSUB_INT
    .long aEndsubInt        # "ENDSUB_INT"
    .long ENDSUB_WAIT_1
    .long aEndsubWait1      # "ENDSUB_WAIT_1"
    .long ENDSUB_DSP
    .long aEndsubDsp        # "ENDSUB_DSP"
    .long ENDSUB_MOVIE2_INT
    .long aEndsubMovie2In   # "ENDSUB_MOVIE2_INT"
    .long ENDSUB_MOVIE2_DSP
    .long aEndsubMovie2Ds   # "ENDSUB_MOVIE2_DSP"
    .long ENDSUB_WAIT_2
    .long aEndsubWait2      # "ENDSUB_WAIT_2"
    
        .section ending_flags
# ---------------------------------------------------------------------------
byte_106B8:     .byte 1                 # DATA XREF: ENDSUB_INT+80↑r
byte_106B9:     .byte 1                 # DATA XREF: ENDSUB_INT↑r
byte_106BA:     .byte 1                 # DATA XREF: ENDSUB_INT+A0↑r
                .byte 0
                .byte 1
                .byte 2
                .byte 0
                .byte 0
                .byte 0
                .byte 3
                .byte 0x63
                .byte 0
                .byte 0
                .byte 4
                .byte 0x63
                .byte 0
                .byte 0
                .byte 5
                .byte 0x63
                .byte 0
                .byte 1
                .byte 6
                .byte 5
                .byte 0
                .byte 1
                .byte 7
                .byte 6
                .byte 0
                .byte 1
                .byte 8
                .byte 7
                .byte 0
                .byte 1
                .byte 9
                .byte 8
                .byte 0
                .byte 1
                .byte 0xA
                .byte 9
                .byte 0
                .byte 0xFF
                .byte 0xFF
                .byte 0xFF
                .byte 0
