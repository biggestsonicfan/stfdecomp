
        .section mask
# =============== S U B R O U T I N E =======================================
# mezase = "go toward"
MEZASE_DEATHEGG_MASK_INT:               # DATA XREF: ROM:0000B0D4↑o
    lda     start_ip_add+3, r15 # Label from official source
    stib    r15, stage_num
    ld      not_scr_bg_move, r15
    clrbit  0xF, r15, r15
    st      r15, not_scr_bg_move
    call    change_scene
    lda     0x1000000, g9
    shlo    6, 1, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    mov     10, g0
    call    _Scroll_Initialize
    mov     0, r15
    stis    r15, 0x100A000
    mov     0, r15
    stis    r15, 0x100A008
    mov     0, r15
    stis    r15, scrB_H_page
    mov     0, r15
    stis    r15, scrB_V_page
    call    am_upper7_black
    call    draw_bottom_black_mask
    lda     0x1004380, g9
    lda     353, g0         # Picture with all the chaos emeralds on it
    call    dsp_pattern_new
    ld      add_BACKUP_RAM_TO_RAM, r4
    ldob    0x3352(r4), r4  # r4 = BACKUP_RAM_START+0x3352
    cmpobne 0, r4, loc_EC70 # branch if country_val not equal to 0
    lda     0x100148A, g9
    lda     372, g0         # YOU GOT 8 EMERALDS texture jp
    call    dsp_pattern_new
loc_EC70:                               # CODE XREF: MEZASE_DEATHEGG_MASK_INT+9C↑j
    lda     0x1000B08, g9
    lda     354, g0         # YOU GOT 8 EMERALDS texture
    call    dsp_pattern_new
    call    efc_ram_init
    mov     1, r4
    ld      mod_fa_sound, r3
    ld      0x0(r3), r5
    setbit  31, r5, r5
    st      r5, 0x0(r3)
    lda     sound_queue_init, r5
    st      r5, 0xC(r3)
    lda     0xA00001, g0
    call    check_same_sound
    call    sound_request_u
    ld      not_scr_bg_move, r15
    setbit  16, r15, r15
    st      r15, not_scr_bg_move
    mov     0, r15
    stib    r15, p1_wins
    mov     0, r15
    stib    r15, p2_wins
    call    clear_win_lamp_cntr
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r15
    setbit  30, r15, r15
    st      r15, 0x0(r3)
    ld      fa_camera, r3
    ldob    winner, r14
    cmpobe  1, r14, loc_ED3C
    ld      0x0(r3), r15
    clrbit  2, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    setbit  0x1C, r15, r15
    st      r15, 0x0(r3)
    ld      fa_rob0, r3
    shlo    0xE, 1, r15
    stis    r15, 0x24(r3)
    b       loc_ED64
# ---------------------------------------------------------------------------
loc_ED3C:                               # CODE XREF: MEZASE_DEATHEGG_MASK_INT+14C↑j
    ld      0x0(r3), r15
    clrbit  1, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    setbit  0x1D, r15, r15
    st      r15, 0x0(r3)
    ld      fa_rob1, r3
    shlo    0xE, 1, r15
    stis    r15, 0x24(r3)
loc_ED64:                               # CODE XREF: MEZASE_DEATHEGG_MASK_INT+178↑j
    lda     0xAE100A, g0    # sd_game_bgm_0a
    call    check_same_sound
    call    sound_request_u
    call    efc_rob_poly_para_init
    shlo    8, 1, r15
    st      r15, CTRL_TIMER
    ldib    _sub_mode, r15
    lda     1(r15), r15     # Add 1 to _sub_mode
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# End of function MEZASE_DEATHEGG_MASK_INT
# =============== S U B R O U T I N E =======================================
# mezase = "go toward"
MEZASE_DEATHEGG_MASK_DSP:               # DATA XREF: ROM:0000B0DC↑o
    ld      busy_signal_flag, r14 # Label from official source
    cmpobe  1, r14, loc_EDBC
    ld      not_scr_bg_move, r15
    clrbit  16, r15, r15
    st      r15, not_scr_bg_move
loc_EDBC:                               # CODE XREF: MEZASE_DEATHEGG_MASK_DSP+8↑j
    ld      CTRL_TIMER, r3
    shlo    7, 1, r4
    cmpobne r4, r3, loc_EDF0
    lda     0x1000B08, g9
    addo    31, 23, g0      # g0 = 54 or 0x36
    mov     4, g1
    call    clr_pattern_s
    lda     0x1000A08, g9
    lda     355, g0         # YOU CAN NOW CHALLENGE THE DEATH EGG II
    call    dsp_pattern_new
loc_EDF0:                               # CODE XREF: MEZASE_DEATHEGG_MASK_DSP+2C↑j
    cmpibl  0, r3, loc_EE1C
    lda     0x1000000, g9
    shlo    6, 1, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
loc_EE1C:                               # CODE XREF: MEZASE_DEATHEGG_MASK_DSP:loc_EDF0↑j
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# End of function MEZASE_DEATHEGG_MASK_DSP
