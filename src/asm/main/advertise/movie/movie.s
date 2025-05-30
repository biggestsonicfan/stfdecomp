        .section movie
# =============== S U B R O U T I N E =======================================
ADV_MOVIE_INT:                          # DATA XREF: ROM:00007F40↑o
    lda     0xA00001, g0    # Label from official source
    call    check_same_sound
    call    sound_request_u
    lda     0xAE1010, g0    # sd_game_bgm_10
    call    check_same_sound
    call    sound_request_u
    call    sub_81038
    call    sub_81AFC
    call    ring_tobitiri_init # Ring Scatter
    mov     0, r4
    stob    r4, curr_round_num
    ld      not_scr_bg_move, r15
    clrbit  16, r15, r15
    st      r15, not_scr_bg_move
    ld      not_scr_bg_move, r15
    clrbit  14, r15, r15
    st      r15, not_scr_bg_move
    call    scr_bg_int
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r4     # r4 = mod_fa_game_disp_add
    setbit  30, r4, r4      # Clears the healthbar hud
    setbit  23, r4, r4
    clrbit  20, r4, r4
    setbit  25, r4, r4
    st      r4, 0x0(r3)
    lda     2240, r15
    st      r15, CTRL_TIMER
    ld      fa_camera, r3
    ld      0x0(r3), r15
    clrbit  14, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  1, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  2, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  15, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  16, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    setbit  17, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  18, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  19, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  20, r15, r15
    st      r15, 0x0(r3)
    lda     displacement, r15
    stib    r15, 0x40(r3)   # cam_mode = 0
    mov     0, r15
    stis    r15, scrB_H_page
    mov     0, r15
    stis    r15, scrB_V_page
    ld      add_BACKUP_RAM_TO_RAM, r15
    ld      0x3320(r15), r15 # r15 = BACKUP_RAM_TO_RAM+0x3320
    bbs     0, r15, loc_8D4C
    lda     0x10016DA, g9
loc_8D4C:                               # CODE XREF: ADV_MOVIE_INT+138↑j
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    mov     1, r4
    ld      mod_fa_obj0, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     object_init, r5
    st      r5, 0xC(r3)
    mov     1, r4
    ld      mod_fa_effect, r3
    ld      0x0(r3), r5
    setbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    lda     fa_effect, r5
    st      r5, 0xC(r3)
    call    efc_rob_poly_para_init
    mov     1, r4
    ld      mod_fa_effect, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    call    prep_adv_movie  # Sub this with un_move_camera_a_bit
ADV_MOVIE_DSP:                          # DATA XREF: ROM:00007F48↑o
    call    adv_movie_cont  # Label from official source
    call    adv_movie_draw_text
    ld      CTRL_TIMER, r3
    subi    1, r3, r3
    st      r3, CTRL_TIMER
    cmpobne 0, r3, loc_8E8C # return
    ld      0x5004C8, r15
    clrbit  0x1F, r15, r15
    st      r15, 0x5004C8
    mov     0, r15
    stis    r15, 0x100A000
    mov     0, r15
    stis    r15, 0x100A008
    mov     0, r15
    stib    r15, POLYGON_DISP
    ld      fa_rob0, r3
    ld      0x0(r3), r4
    clrbit  0x17, r4, r4
    clrbit  0x16, r4, r4
    setbit  0x1A, r4, r4
    st      r4, 0x0(r3)
    ld      fa_rob1, r3
    ld      0x0(r3), r4
    clrbit  0x17, r4, r4
    clrbit  0x16, r4, r4
    setbit  0x1A, r4, r4
    st      r4, 0x0(r3)
    ld      fa_camera, r3
    ld      0x0(r3), r15
    clrbit  17, r15, r15
    st      r15, 0x0(r3)
    ld      debug_flag, r15
    clrbit  16, r15, r15    # clear bit 16 debug
    st      r15, debug_flag
    mov     6, r15
    stib    r15, _sub_mode
loc_8E8C:                               # CODE XREF: ADV_MOVIE_INT+1DC↑j
    ret                     # return
# End of function ADV_MOVIE_INT
