        .section int
# ---------------------------------------------------------------------------
ROUND_MASK_INT:                         # DATA XREF: ROM:ROUND_STATE↑o
    call    efc_ram_init    # Label from official source
    mov     1, r4
    ld      mod_fa_sound, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     sound_queue_init, r5
    st      r5, 0xC(r3)     # store fa_sound at mod_fa_sound_add+0xC
    lda     0xA00001, g0
    call    check_same_sound
    call    sound_request_u
    mov     0, r15
    stis    r15, 0x500468
    mov     0, r15
    stis    r15, 0x50046A
    mov     0, r15
    stis    r15, 0x50046C
    ld      not_scr_bg_move, r15
    bbs     0x17, r15, loc_B8AC
    ld      not_scr_bg_move, r15
    setbit  0x10, r15, r15
    st      r15, not_scr_bg_move
    lda     check_word3, r15
    stib    r15, draw_vs_routine_flag # prep_vs_screen_bg
loc_B8AC:                               # CODE XREF: ROM:0000B884↑j
    call    ROUND_INIT
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    ld      not_scr_bg_move, r15
    bbs     0x17, r15, load_CTRL_TIMER_sub_1
    shlo    6, 1, r15
    st      r15, CTRL_TIMER
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
load_CTRL_TIMER_sub_1:                  # CODE XREF: ROM:0000B8CC↑j
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# =============== S U B R O U T I N E =======================================

        .section dsp
# =============== S U B R O U T I N E =======================================
ROUND_MASK_DSP:                         # DATA XREF: ROM:0000AFEC↑o
    mov     0, r15          # Label from official source
    stis    r15, 0x100A000
    mov     0, r15
    stis    r15, 0x100A008
    ld      not_scr_bg_move, r15
    bbs     23, r15, loc_BDF4
    lda     check_word3+1, r15
    stib    r15, draw_vs_routine_flag # draw_vs_screen
    ld      busy_signal_flag, r14
    cmpobe  1, r14, adjusts_graphics_per_timer_tick
    ld      CTRL_TIMER, r14
    cmpibne 0xA, r14, loc_BDD4
loc_BDD4:                               # CODE XREF: ROUND_MASK_DSP+48↑j
    ld      CTRL_TIMER, r14 # HITS HERE AT EXACT MIDDLE OF THE DISPLAY.
    cmpibl  0, r14, adjusts_graphics_per_timer_tick
loc_BDE0:                               # CODE XREF: STAGE_UP_DSP+18↓j
    ld      not_scr_bg_move, r15 # Splashes shown before this point!
    clrbit  16, r15, r15
    st      r15, not_scr_bg_move
loc_BDF4:                               # CODE XREF: ROUND_MASK_DSP+20↑j
    mov     2, r15
    stib    r15, _sub_mode
    call    shifts_graphics_somehow # Splashes shown before this point!
    lda     0x100A00C, r3
    ldos    (r3), r4
    clrbit  0xF, r4, r4
    stos    r4, (r3)
    ldos    2(r3), r4
    clrbit  0xF, r4, r4
    stos    r4, 2(r3)
    lda     0x1000000, g9
    shlo    6, 1, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s   # Hits after character splash screen
    mov     0, r15
    st      r15, 0x5004C0
    ld      fa_rob0, r3
    ld      fa_rob1, r4
    ldob    0x1B1(r3), r5
    ldob    0x1B1(r4), r6
    cmpobne r5, r6, adjusts_graphics_per_timer_tick
    mov     0x1C, r15
    stib    r15, _sub_mode
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
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
adjusts_graphics_per_timer_tick:        # CODE XREF: ROUND_MASK_DSP+3C↑j
    call    shifts_graphics_somehow
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# End of function ROUND_MASK_DSP
