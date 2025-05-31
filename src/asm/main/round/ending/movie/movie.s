
        .section movie
# ---------------------------------------------------------------------------
ENDING_MOVIE_INT:                       # DATA XREF: ROM:ENDING_STATE↑o
    lda     0x1000000, g9
    shlo    6, 1, g0
    shlo    7, 1, g1
    call    clr_pattern_s
loc_FF60:                               # DATA XREF: ROM:0006F0E8↓o
    call    ending_movie_int
    ld      0x506804, r15
    setbit  0, r15, r15
    st      r15, 0x506804
    ld      fa_camera, r3
    ld      0x0(r3), r15
    setbit  0x1F, r15, r15
    st      r15, 0x0(r3)
    shlo    6, 0xF, r15
    stis    r15, game_timer
    mov     1, r15
    stib    r15, _sub_mode
    ret
# ---------------------------------------------------------------------------
ENDING_MOVIE_DSP:                       # DATA XREF: ROM:0000FF14↑o
    ld      busy_signal_flag, r14
    cmpobe  1, r14, loc_FFC8
    ld      not_scr_bg_move, r15
    clrbit  0x10, r15, r15
    st      r15, not_scr_bg_move
loc_FFC8:                               # CODE XREF: ROM:0000FFB0↑j
    ldos    game_timer, r14
    subi    1, r14, r15
    stos    r15, game_timer
    call    ending_movie_cont # does something funny if debug_flag bit 5 is set
    ldis    game_timer, r14
    cmpibg  0, r14, sub_FFF0
    ret
# =============== S U B R O U T I N E =======================================
sub_FFF0:                               # CODE XREF: ROM:0000FFE8↑j
    lda     word_7D3BC, r10
    lda     win_down, r11   # Window down
    ldt     (r10), r4
    stt     r4, (r11)
    ldt     0xC(r10), r4
    stt     r4, 0xC(r11)
    mov     1, r4
    ld      fa_camera, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     0, r15
    st      r15, 0x506804
    lda     0xAE1014, g0    # sd_game_bgm_14
    call    check_same_sound
    call    sound_request_u
    lda     check_word2+2, r15
    stib    r15, draw_vs_routine_flag
    mov     2, r15
    stib    r15, _sub_mode
    ret
# End of function sub_FFF0

        .section movie2
ENDSUB_MOVIE2_INT:                      # DATA XREF: ROM:0000FF34↑o
    lda     0x1004B80, g9
    lda     534, g0         # Space with Earth in upper left corner
    call    dsp_pattern_low
    mov     1, r4
    ld      fa_camera, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    ld      not_scr_bg_move, r15
    clrbit  0x10, r15, r15
    st      r15, not_scr_bg_move
    call    window_data_init
    call    sub_58AA8
    mov     6, r15
    stib    r15, _sub_mode
    ret
# ---------------------------------------------------------------------------
ENDSUB_MOVIE2_DSP:                      # DATA XREF: ROM:0000FF3C↑o
    call    metal_and_eggman_flee
    ret
