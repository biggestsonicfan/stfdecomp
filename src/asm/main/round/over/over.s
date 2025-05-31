        .section over
# =============== S U B R O U T I N E =======================================
OVER_INT:                               # DATA XREF: ROM:00007B54↑o
    mov     2, g0           # Label from official source
    call    _Scroll_Initialize
    lda     162, g0
    call    _Scroll_Initialize
loc_F700:                               # DATA XREF: sub_7F894+68↓o
    mov     1, r4
    ld      mod_fa_sampling, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    ld      fa_camera, r3
    lda     displacement, r15
    stib    r15, 0x40(r3)
    ldob    STAGE_ID, r14
    cmpoble 10, r14, loc_F758 # if STAGE_ID less or equal to 10 (all cases in normal gameplay)
loc_F738:                               # CODE XREF: OVER_INT+78↓j
    shlo    6, 3, r15
    st      r15, CTRL_TIMER
    lda     start_ip_add+2, r15
    stib    r15, draw_vs_routine_flag
    b       loc_F7F8
# ---------------------------------------------------------------------------
loc_F758:                               # CODE XREF: OVER_INT+44↑j
    lda     start_ip_add+3, r3
    ldob    stage_num, r14
    cmpobne r3, r14, loc_F738
    shlo    9, 1, r15
    st      r15, CTRL_TIMER
    ld      fa_camera, r3
    ld      0x0(r3), r15
    clrbit  2, r15, r15
    st      r15, 0x0(r3)
    lda     displacement, r15
    stib    r15, draw_vs_routine_flag
    ld      not_scr_bg_move, r15
    clrbit  0x10, r15, r15
    st      r15, not_scr_bg_move
    lda     win_down, g0    # Window down
    call    set_window      # g0 = two shorts
    mov     0, r15
    stis    r15, 0x100A000
    mov     0, r15
    stis    r15, 0x100A008
    lda     0x1000000, g9
    addo    0x1F, 0x1F, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    lda     0x1000584, g9
    lda     74, g0          # GAME OVER TEX
    call    dsp_pattern_new
loc_F7F8:                               # CODE XREF: OVER_INT+64↑j
    lda     0xA00360, g0
    call    sound_request_u
    lda     0xAE1009, g0    # sd_game_bgm_09
    call    check_same_sound
    call    sound_request_u
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r15
    clrbit  0x18, r15, r15
    st      r15, 0x0(r3)
    ld      not_scr_bg_move, r15
    clrbit  0x16, r15, r15
    st      r15, not_scr_bg_move
    ld      0x0(r3), r15
    setbit  0x1E, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    setbit  0x19, r15, r15
    st      r15, 0x0(r3)
    ldib    mode, r15
    lda     1(r15), r15
    stib    r15, mode
    ret
# End of function OVER_INT
# =============== S U B R O U T I N E =======================================
OVER_DSP:                               # DATA XREF: ROM:00007B5C↑o
    ldob    STAGE_ID, r14
    cmpobg  10, r14, loc_F890 # If STAGE_ID < 10 branch (Not possible)
    lda     start_ip_add+3, r3
    ldob    stage_num, r14
    cmpobne r3, r14, loc_F890
    call    load_egg_game_over_environment
loc_F890:                               # CODE XREF: OVER_DSP+8↑j
    ld      CTRL_TIMER, r15
    lda     -1(r15), r15
    st      r15, CTRL_TIMER
    lda     301, r13
    ld      CTRL_TIMER, r14
    cmpobne r13, r14, loc_F8BC
    call    set_over_voice
loc_F8BC:                               # CODE XREF: OVER_DSP+48↑j
    shlo    8, 1, r13
    ld      CTRL_TIMER, r14
    cmpobl  r13, r14, loc_F8F4
    ld      INTERUPT_FLAGS_MOMENTARY, r3
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobe  1, r14, loc_F8E4
    bbs     4, r3, loc_F900 # P1 Start
loc_F8E4:                               # CODE XREF: OVER_DSP+70↑j
    ldob    gameprogram, r14 # bit 0 clear = Player 1
    cmpobe  0, r14, loc_F8F4
    bbs     5, r3, loc_F900 # P2 Start
loc_F8F4:                               # CODE XREF: OVER_DSP+5C↑j
    ld      CTRL_TIMER, r14
    cmpibl  0, r14, loc_F924
loc_F900:                               # CODE XREF: OVER_DSP+74↑j
    mov     1, r4
    ld      fa_camera, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     18, r15
    stib    r15, mode
loc_F924:                               # CODE XREF: OVER_DSP+90↑j
    ret
# End of function OVER_DSP
# =============== S U B R O U T I N E =======================================
set_over_voice:                         # CODE XREF: OVER_DSP+4C↑p
    ldob    STAGE_ID, r14   # Label from Fighting Vipers source
    cmpoble 10, r14, loc_F9A4 # return
    ldob    0x50004E, r14
    cmpobne 1, r14, loc_F954
    ld      fa_rob0, r7
    ld      fa_rob1, r8
    b       loc_F964
# ---------------------------------------------------------------------------
loc_F954:                               # CODE XREF: set_over_voice+14↑j
    ld      fa_rob1, r7
    ld      fa_rob0, r8
loc_F964:                               # CODE XREF: set_over_voice+28↑j
    ldob    0x1B1(r8), r3
    ldob    0x1B1(r7), r4
    cmpobe  r3, r4, loc_F988
    cmpobe  8, r3, loc_F988
    ld      frame_counter, r3
    and     1, r3, r3
    addo    0xF, r3, r3
    b       loc_F98C
# ---------------------------------------------------------------------------
loc_F988:                               # CODE XREF: set_over_voice+44↑j
    mov     0xF, r3
loc_F98C:                               # CODE XREF: set_over_voice+5C↑j
    ld      blank_per_character_audio_array[r3*4], r15
    ld      (r15)[r4*4], r5
    cmpobe  0, r5, loc_F9A4 # return
    mov     r5, g0
    b       loc_F9A4        # return
# ---------------------------------------------------------------------------
loc_F9A4:                               # CODE XREF: set_over_voice+8↑j
    ret                     # return
# End of function set_over_voice
# ---------------------------------------------------------------------------
    .long 0x20015A          # unreachable code
    .long 0x11700A2
    .long 0x9B00FE
    .long 0x9B00FE
    .long 0x9B00FE
    .long 0x9B00FE
    