        .section ready
# ---------------------------------------------------------------------------
READY_INT:                              # DATA XREF: ROM:0000B014↑o
    lda     pcrb, r15   # Label from official source
    stib    r15, draw_vs_routine_flag # sub_7B5D0
    addo    0x1F, 0xB, r15
    st      r15, CTRL_TIMER
    ldob    curr_round_num, r3
    cmpo    1, r3
    bne     loc_CEC8
    addo    0x1F, 0xD, g0
    mov     1, g1
    call    sound_queue_input
    shlo    7, 1, r15
    st      r15, CTRL_TIMER
loc_CEC8:                               # CODE XREF: ROUND_DSP+6EC↑j
    ld      fa_camera, r3
    ld      fa_rob0, g7
    ld      0x0(g7), r15
    bbc     7, r15, loc_CEF0
    lda     0x1BC(r3), g5
    ld      fa_rob1, g7
    lda     0x1E4(r3), g5
loc_CEF0:                               # CODE XREF: ROUND_DSP+71C↑j
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
READY_DSP:                              # DATA XREF: ROM:0000B01C↑o
    lda     pcrb+1, r15
    stib    r15, draw_vs_routine_flag # sub_7B650
    ld      CTRL_TIMER, r15
    cmpi    0, r15
    bl      game_sub_ex     # Subtracts 1 from CTRL_TIMER
    mov     1, r4
    ld      mod_fa_sound, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     sound_queue_init, r5
    st      r5, 0xC(r3)
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
