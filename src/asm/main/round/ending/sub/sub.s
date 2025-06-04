        .section int
# =============== S U B R O U T I N E =======================================
ENDSUB_INT:                             # DATA XREF: ROM:0000FF1C↑o
    ldob    byte_106B9, g0
    call    ending_send_next_tex
    mov     1, r4
    ld      fa_camera, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    mov     1, r4
    ld      mod_fa_play, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    ld      not_scr_bg_move, r15
    setbit  0x10, r15, r15
    st      r15, not_scr_bg_move
    call    voice_init      # return
    mov     1, r4
    ld      mod_fa_obj0, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
    shlo    6, 1, r15
    stis    r15, game_timer
    ldos    num_motions_ram, r3
    ldib    byte_106B8[r3*4], r15
    stib    r15, list_motions_ram
    ldib    byte_106B9[r3*4], r15
    stib    r15, STAGE_ID
    ldib    byte_106BA[r3*4], r15
    stib    r15, list_motions_ram+3
    addo    1, r3, r3
    stos    r3, num_motions_ram
    ldob    num_motions_ram, r3
    cmpobl  0xA, r3, loc_101B4
    lda     0xFF, r13
    ldob    list_motions_ram, r14
    cmpobe  r13, r14, loc_101B4
    ldob    STAGE_ID, r3
    cmpobl  0xA, r3, loc_10198
    lda     0xFF, r13
    ldob    list_motions_ram, r14
    cmpobe  r13, r14, loc_10198
    subo    1, r3, r4
    stob    r4, stage_num
    call    change_scene
    lda     0x1DE, r15
    stis    r15, 0x5A0002
    call    loc_1A780
    call    load_ending_rep_data
    call    sub_81038
    mov     1, r4
    ld      fa_camera, r3
    ld      0x0(r3), r5
    clrbit  0x1F, r5, r5
    st      r5, 0x0(r3)
loc_10198:                              # CODE XREF: ENDSUB_INT+E0↑j
    mov     0, r15
    stis    r15, 0x50009E
    mov     3, r15
    stib    r15, _sub_mode
    ret
# ---------------------------------------------------------------------------
loc_101B4:                              # CODE XREF: ENDSUB_INT+C4↑j
    ld      not_scr_bg_move, r15
    clrbit  0x10, r15, r15
    st      r15, not_scr_bg_move
    mov     5, r15
    stib    r15, _sub_mode
    ret
# End of function ENDSUB_INT


/************************************************************************/
/*
/*  First hits the moment the Lunar Fox disappears and the border
/*                    for the replays appear
/*
/*  Input code: P1 Down, P1 Up, P2 Down, P2 Up, P1 Block, P2 Block
/*
/************************************************************************/
        .section dsp
ENDSUB_DSP:                             # DATA XREF: ROM:0000FF2C↑o
    call    chg_save_mat_param                  # Label from Fighting Vipers source (obvious tho)
    subo    1, 0, r13
    ldos    game_timer, r14
    addi    r13, r14, r15
    stos    r15, game_timer
    ld      mod_fa_play, r11
    ld      0x0(r11), r15
    bbs     0x1F, r15, loc_103AC
    lda     0x1004B80, g9
    lda     534, g0         # Space with Earth in the upper left corner
    call    dsp_pattern_new
    mov     2, r15
    stib    r15, _sub_mode
    ret
# ---------------------------------------------------------------------------
loc_103AC:                              # CODE XREF: ROM:00010388↑j
    ldos    0x5A0002, r5
    addo    0x1F, 9, r3
    cmpobne r3, r5, loc_103D8
    ldos    num_motions_ram, r3
    ldob    byte_106B9[r3*4], g0
    lda     255, r13
    cmpobe  r13, g0, loc_103D8
    call    ending_send_next_tex
loc_103D8:                              # CODE XREF: ROM:000103B8↑j
    ldos    0x5A0002, r5
    subo    1, r5, r5
    stos    r5, 0x5A0002
    ret
# ---------------------------------------------------------------------------
        .section save_mat_param_chg
# =============== S U B R O U T I N E =======================================
chg_save_mat_param:                     # CODE XREF: ROM:ENDSUB_DSP↑p
    ld      INTERUPT_FLAGS_MOMENTARY, r9 # Label from official source
    ldob    0x548006, r3 # r3 = 1
    bbc     12, r9, loc_1A6E0 # Hex 0x1000 is P1 Down
    subi    1, r3, r3       # r3 = 0 I guess
    cmpible 1, r3, loc_1A6E0
    mov     1, r3
loc_1A6E0:                              # CODE XREF: chg_save_mat_param+10↑j
    bbc     13, r9, loc_1A6F0 # Hex 0x2000 is P1 up
    addi    1, r3, r3       # r3 = 1
    cmpibge 29, r3, loc_1A6F0
    mov     29, r3
loc_1A6F0:                              # CODE XREF: chg_save_mat_param:loc_1A6E0↑j
    stob    r3, 0x548006
    ldob    0x548007, r3
    bbc     20, r9, loc_1A710 # Hex 0x100000 is P2 Down
    subi    1, r3, r3
    cmpible 1, r3, loc_1A710
    mov     1, r3
loc_1A710:                              # CODE XREF: chg_save_mat_param+40↑j
    bbc     21, r9, loc_1A720 # Hex is 0x200000 is P2 Up
    addi    1, r3, r3
    cmpibge 29, r3, loc_1A720
    mov     29, r3
loc_1A720:                              # CODE XREF: chg_save_mat_param:loc_1A710↑j
    stob    r3, 0x548007
    ldob    0x548008, r3
    bbc     10, r9, loc_1A740 # Hex 0x400 is P1 Block
    subi    1, r3, r3
    cmpible 0, r3, loc_1A740
    mov     0, r3
loc_1A740:                              # CODE XREF: chg_save_mat_param+70↑j
    bbc     18, r9, loc_1A750 # Hex is 0x40000 is P2 Block
    addi    1, r3, r3
    cmpibge 10, r3, loc_1A750
    mov     10, r3
loc_1A750:                              # CODE XREF: chg_save_mat_param:loc_1A740↑j
    stob    r3, 0x548008
    ret
# End of function chg_save_mat_param
# =============== S U B R O U T I N E =======================================
init_endsub_vars:                       # CODE XREF: ROM:00006EB0↑p
    mov     1, r15
    stib    r15, 0x548006
    mov     3, r15
    stib    r15, 0x548007
    mov     4, r15
    stib    r15, 0x548008
loc_1A780:                              # CODE XREF: ENDSUB_INT+110↑p
    mov     0, r15
    stib    r15, 0x548004
    ldib    0x548006, r15
    stib    r15, 0x548005
    lda     0x548010, r3
    lda     0x54F810, r4
    subo    1, 0, r5
loc_1A7B0:                              # CODE XREF: init_endsub_vars+5C↓j
    st      r5, 0x30(r3)
    lda     0x40(r3), r3
    cmpobne r4, r3, loc_1A7B0
    ret
# End of function init_endsub_vars
# ---------------------------------------------------------------------------
    .long 0x501844      # unreachable code
    .long 0x50184C
    .long 0x501854
    .long 0x50185C
    