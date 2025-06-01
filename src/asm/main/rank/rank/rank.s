            .section rank
RANK_INT:                               # DATA XREF: ROM:00007B94↑o
    ldos    rank_mode, r14  # Label from Fighting Vipers source (but it was obvious)
    bbc     9, r14, all_end
    mov     1, r4
    ld      fa_camera, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    call    scroll_all_init
    call    rank_mode_over_check
    ld      not_scr_bg_move, r15
    setbit  0xE, r15, r15
    st      r15, not_scr_bg_move
    mov     0, r15
    stis    r15, scrB_H_page
    mov     0, r15
    stis    r15, scrB_V_page
    addo    0x1F, 0x11, g0
    call    _Scroll_Initialize
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r15
    setbit  0x1E, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    setbit  0x19, r15, r15
    st      r15, 0x0(r3)
    ld      not_scr_bg_move, r15
    setbit  0xE, r15, r15
    st      r15, not_scr_bg_move
    lda     check_word4, r15
    stib    r15, draw_vs_routine_flag
    shlo    7, 5, r15
    st      r15, CTRL_TIMER
    ldib    mode, r15
    lda     1(r15), r15
    stib    r15, mode
    ret
# ---------------------------------------------------------------------------
RANK_DSP:                               # DATA XREF: ROM:00007B9C↑o
    lda     check_word4+1, r15 # Label from Fighting Vipers source (Though it was obvious)
    stib    r15, draw_vs_routine_flag
    ld      CTRL_TIMER, r15
    lda     -1(r15), r15
    st      r15, CTRL_TIMER
    shlo    6, 5, r13
    ld      CTRL_TIMER, r14
    cmpobl  r13, r14, loc_112F8
    ld      INTERUPT_FLAGS_MOMENTARY, r3
    bbs     8, r3, RANK_DSP_audio
    bbs     9, r3, RANK_DSP_audio
    bbs     10, r3, RANK_DSP_audio
    bbs     16, r3, RANK_DSP_audio
    bbs     17, r3, RANK_DSP_audio
    bbs     18, r3, RANK_DSP_audio
loc_112F8:                              # CODE XREF: ROM:000112D4↑j
    ld      CTRL_TIMER, r14
    cmpibl  0, r14, loc_11314
RANK_DSP_audio:                         # CODE XREF: ROM:000112E0↑j
    lda     0xA00360, g0
    call    sound_request_u
    b       all_end
# ---------------------------------------------------------------------------
loc_11314:                              # CODE XREF: ROM:00011300↑j
    ret
