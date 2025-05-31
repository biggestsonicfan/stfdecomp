        .section wait1
# =============== S U B R O U T I N E =======================================
ENDSUB_WAIT_1:                          # DATA XREF: ROM:0000FF24↑o
    subo    1, 0, r13       # Label from official source
    ldos    game_timer, r14
    addi    r13, r14, r15
    stos    r15, game_timer
    ldos    0x50009E, g1
    addo    1, g1, g1
    stos    g1, 0x50009E
    ldis    game_timer, r14
    cmpible 0, r14, loc_102FC
    ld      busy_signal_flag, r14
    cmpobe  1, r14, loc_102FC
    ld      not_scr_bg_move, r15
    clrbit  0xE, r15, r15
    st      r15, not_scr_bg_move
    ldob    stage_num, r3
    and     0xF, r3, r3
    shlo    8, r3, r4
    ldos    stage_bg_color(r4), r3 # Color 0x0031E6
    stos    r3, 0x1800720 # 0x0031E6
    stos    r3, 0x18007A0 # 0x0031E6
    lda     0x1004B80, g9
    lda     516, g0         # Draw credits round replay border
    call    dsp_pattern_new
    ld      fa_camera, r3
    lda     cam_mode34, r15
    stib    r15, 0x40(r3)
    ld      not_scr_bg_move, r15
    clrbit  0x10, r15, r15
    st      r15, not_scr_bg_move
    mov     1, r4
    ld      mod_fa_play, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     play_init, r5
    st      r5, 0xC(r3)
    mov     1, r4
    ld      fa_camera, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_obj0, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     object_init, r5
    st      r5, 0xC(r3)
    mov     4, r15
    stib    r15, _sub_mode
loc_102FC:                              # CODE XREF: ENDSUB_WAIT_1+34↑j
    ret
# End of function ENDSUB_WAIT_1

        .section wait2
# ---------------------------------------------------------------------------
ENDSUB_WAIT_2:                          # DATA XREF: ROM:0000FF44↑o
    ret                     # Label from Fighting Vipers source (obvious tho)
    