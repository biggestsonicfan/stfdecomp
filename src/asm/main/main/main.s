        .globl main
        .extern clr_pattern_s
        .extern interrupt_wait
        .extern geo_initialize
        .extern cop_initialize
        .extern geo_func
        .extern chg_pol_color_req
        .extern chg_scr_color_req
        .extern make_lay_col_256_tbl
        .extern check_sram_all
        .section main_sub
# int __cdecl main(int argc, const char **argv, const char **envp)
main:                                   # CODE XREF: start_again_ip+354↑j
    shlo    7, 1, r15       # Label from official source
    stib    r15, RED
    shlo    7, 1, r15       # r15 = 0x80 (128)
    stib    r15, GREEN
    shlo    7, 1, r15       # r15 = 0x80 (128)
    stib    r15, BLUE
    shlo    0xF, 1, r15     # r15 = 0x800 (2048)
    stis    r15, 0x500082
    lda     0x40(sp), sp    # manually allocate a stack frame I think so
    shlo    0x17, 1, g10    # g10 = 0x800000 (8388608)
    shlo    0x13, 0x11, g11 # g11 = 0x880000 (8912896)
    shlo    0xE, 1, g12     # g12 = 0x4000 (16384)
    call    init_sound
    call    init_ram        # return
    call    check_sram_all  # Init backup ram
    ld      add_BACKUP_RAM_TO_RAM, r3
    ldob    0x3359(r3), r3
    stob    r3, TST_RED_ADD
    ld      add_BACKUP_RAM_TO_RAM, r3
    ldob    0x335C(r3), r3
    stob    r3, TST_RED_MUL
    ld      add_BACKUP_RAM_TO_RAM, r3
    ldob    0x335A(r3), r3
    stob    r3, TST_GRN_ADD
    ld      add_BACKUP_RAM_TO_RAM, r3
    ldob    0x335D(r3), r3
    stob    r3, TST_GRN_MUL
    ld      add_BACKUP_RAM_TO_RAM, r3
    ldob    0x335B(r3), r3
    stob    r3, TST_BLUE_ADD
    ld      add_BACKUP_RAM_TO_RAM, r3
    ldob    0x335E(r3), r3
    stob    r3, TST_BLUE_MUL
    ld      add_BACKUP_RAM_TO_RAM, r3
    ldob    0x335F(r3), r3
    stob    r3, TST_B_BRIGHT
    ldib    TST_RED_ADD, r15
    stib    r15, TST_RED
    ldib    TST_GRN_ADD, r15
    stib    r15, TST_GRN
    ldib    TST_BLUE_ADD, r15
    stib    r15, TST_BLUE
    call    make_lay_col_256_tbl
    call    chg_scr_color_req
    call    chg_pol_color_req
    call    init_event
    call    init_pol_color  # Just return for "dark mode"
    call    init_scroll
    call    init_fix
    call    possible_ascii_leftover
    call    geo_func
    call    cop_initialize
    call    geo_initialize
    call    send_tex_default
    call    geometry_stuff
    call    essential_color_handling # just return for disco mode
    call    interrupt_wait  # writes 0 at RAMBASE_START
    call    sub_11E08
    call    interrupt_wait
    mov     0, g0
    call    sub_290FC
    call    sub_11EF8
    call    sub_12090
    call    sub_12138
    call    four_flags
    call    set_viewing_data # Doesn't seem to do anything in StF
    call    window_data_init
    call    setup_not_use_and_free
    call    sub_4D234
    call    game_engine_setup
    call    init_adv_rep_ram
    call    init_data_bd_fifo # return
    call    io_request_chk
    call    sub_7B4         # Stage color related
    lda     num_motions_xtra, r3
    lda     num_motions_ram, r4
    lda     intr_ram, r5
loc_6AE4:                               # CODE XREF: ROM:00006AF4↓j
    ldq     (r3), r8
    addo    0x10, r3, r3
    stq     r8, (r4)
    addo    0x10, r4, r4
    cmpobl  r4, r5, loc_6AE4
    call    coin_current_clear
    call    variable_diff_init
    call    set_game_setting
    lda     5000, r15       # Store the maximum count of polygon objects
    st      r15, POLYGON_LIMIT
    shlo    7, 1, r15       # r15 = 0x80 or 128
    st      r15, 0x5013F0
    mov     0, r15
    st      r15, rounds_lost_vs_cpu
    mov     0, r15
    st      r15, continue_count
    mov     0, r15
    st      r15, also_continue_count
    mov     0, r15
    st      r15, debug_flag
    mov     0, r15
    st      r15, CPU_FAIL
    mov     0, r15
    st      r15, 0x500164
    mov     0, r15
    st      r15, select0_flag
    mov     0, r15
    st      r15, select1_flag
    mov     0, r15
    st      r15, 0x500260
    mov     0, r15
    st      r15, 0x508060
    mov     0, r15
    stib    r15, mode
    lda     0x3CCE9ED5, r15
    st      r15, 0x50A000
    lda     0x3F800000, r15
    st      r15, 0x50A004
    lda     0x41200000, r15
    st      r15, 0x50A008
    lda     0x41000000, r15
    st      r15, stage_x
    lda     0xBF000000, r15
    st      r15, stage_soko
    ldis    val_vs_energy_max, r15
    stis    r15, energy_max
    mov     0, r15
    st      r15, frame_counter
    mov     0, r15
    stib    r15, stage_num
    call    change_scene
    mov     0, r15
    stib    r15, sd_nowait_timer
    ld      fa_camera, r3
    mov     0, r15
    stib    r15, 0x5000E9
    mov     0, r15
    st      r15, 0x5000E4
    mov     1, r15
    stib    r15, POLYGON_DISP
    mov     0, r15
    st      r15, 0x500070
    mov     0, r15
    st      r15, 0x500074
    mov     0, r15          # Some kind of ranking display flag
    stib    r15, 0x500081
    mov     0, r15
    stib    r15, ROB0_DEBUG_PARAM
    mov     0, r15
    stib    r15, ROB1_DEBUG_PARAM
    mov     0, r15
    stib    r15, 0x50005B
    mov     0, r15
    stis    r15, 0x500086
    mov     0, r15
    stis    r15, rank_mode
    mov     0, r15
    stib    r15, RANDOM_MODE
    mov     0, r15
    st      r15, 0x5001C0
    mov     0, r15
    stib    r15, 0x508008
    ld      mod_fa_sampling, r3
    mov     1, r15
    stib    r15, 0x0(r3)
    mov     30, r15
    stib    r15, time
    ld      fa_rob0, r3
    mov     0, r15
    st      r15, 0x1230(r3) # P1_PARTS+0x1230
    mov     0, r15
    st      r15, 0x1234(r3) # P1_PARTS+0x1234
    ld      0x0(r3), r15
    clrbit  0x17, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    setbit  0x1A, r15, r15
    st      r15, 0x0(r3)
    ld      fa_rob1, r3
    mov     0, r15
    st      r15, 0x1230(r3) # P2_PARTS+0x1230
    mov     0, r15
    st      r15, 0x1234(r3) # P2_PARTS+0x1234
    ld      0x0(r3), r15
    clrbit  0x17, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    setbit  0x1A, r15, r15
    st      r15, 0x0(r3)
    mov     0, r15
    stib    r15, 0x50008D
    mov     0, r15
    stib    r15, 0x50008E
    mov     0, r4
    mov     r4, r5
    mov     r4, r6
    mov     r4, r7
    stq     r4, 0x504078
    ld      not_scr_bg_move, r14
    lda     0x20800, r15
    notand  r14, r15, r15
    st      r15, not_scr_bg_move
    mov     1, r15
    stib    r15, break_point
    mov     7, r15
    stib    r15, bp_switch_step
    mov     8, r15
    stib    r15, bp_switch_cont
    mov     9, r15
    stib    r15, bp_switches_on_off
    mov     0, r15
    st      r15, bp_switch
    ld      mod_fa_sel_disp, r3
    mov     0, r15
    stib    r15, 0x5C(r3)   # mod_fa_sel_disp_add+0x5C
    mov     1, r15
    stib    r15, 0x78(r3)   # mod_fa_sel_disp_add+0x78
    mov     0, r4
    stob    r4, 0x500148
    stob    r4, 0x500149
    stob    r4, 0x50014A
    stob    r4, 0x50014B
    st      r4, 0x5001E4
    lda     0x40AAAAAB, r15
    st      r15, 0x5010C4
    mov     0, r15
    st      r15, 0x5010D4
    ld      not_scr_bg_move, r15
    clrbit  16, r15, r15
    st      r15, not_scr_bg_move
    ld      not_scr_bg_move, r15
    clrbit  25, r15, r15
    st      r15, not_scr_bg_move
    ld      not_scr_bg_move, r15
    clrbit  23, r15, r15
    st      r15, not_scr_bg_move
    ld      not_scr_bg_move, r15
    clrbit  24, r15, r15
    st      r15, not_scr_bg_move
    ld      fa_camera, r4
    mov     0, r15
    stib    r15, 0x2D4(r4)  # mod_fa_camera_add+0x2D4
    call    init_endsub_vars
    ld      not_scr_bg_move, r15
    setbit  31, r15, r15    # Initializes health bars, colors, lighting, and allows inputs
    st      r15, not_scr_bg_move
    ld      not_scr_bg_move, r15
    clrbit  22, r15, r15
    st      r15, not_scr_bg_move
    mov     0, r15
    stib    r15, material_num
    mov     0, r15
    stib    r15, 0x530001
    lda     0xEF, r15
    stib    r15, 0x530002
    lda     0x3F, r15
    stib    r15, 0x530003
    lda     0x7F, r15
    stib    r15, 0x530004
    lda     0x45480000, r15
    st      r15, 0x530100
    lda     0x3F800000, r15
    st      r15, 0x530104
    mov     0, r15
    st      r15, 0x530108
    mov     0, r15
    stib    r15, 0x53010C
    mov     0, r15
    stis    r15, 0x53011C
    mov     0, r15
    stis    r15, 0x530120
    mov     0, r15
    stis    r15, 0x530124
    lda     displacement, r15
    st      r15, 0x530110
    lda     displacement, r15
    st      r15, 0x530114
    lda     displacement, r15
    st      r15, 0x530118
    lda     0x3FD9999A, r15
    st      r15, 0x50A390
    lda     0x3FD9999A, r15
    st      r15, 0x50A394
    lda     0x3FD9999A, r15
    st      r15, 0x50A398
    lda     0x3F800000, r15
    st      r15, 0x530130
    lda     0x3F800000, r15
    st      r15, 0x530134
    lda     0x3F800000, r15
    st      r15, 0x530138
    mov     0, r15
    st      r15, 0x53014C
    mov     0, r15
    stib    r15, 0x530150
    mov     0, r15
    stib    r15, TRANS_MAP
    lda     0xBEE66666, r15
    st      r15, 0x530140
    lda     0xBF63D70A, r15
    st      r15, 0x530144
    lda     0x3EE66666, r15
    st      r15, 0x530148
    lda     0x40666666, r15
    st      r15, cage_height
    lda     0x3E8A3D71, r15
    st      r15, 0x500280
    ld      fa_rob0, r3
    mov     0, r15
    stib    r15, 0x1B0(r3)  # P1 = Sonic
    mov     0, r15
    stib    r15, 0x1B1(r3)
    ld      fa_rob1, r3
    mov     8, r15
    stib    r15, 0x1B0(r3)  # P2 = Eggman
    mov     8, r15
    stib    r15, 0x1B1(r3)
    mov     0, r15
    stis    r15, 0x5000A2
    mov     1, r15
    stib    r15, STAGE_ID
    mov     1, r15
    stib    r15, start_stage
    mov     1, r15
    stib    r15, current_stage_played_num
    ld      add_BACKUP_RAM_TO_RAM, r15
    ldob    0x3340(r15), r15 # r15 = BACKUP_RAM_TO_RAM+0x3340
    cmpobl  5, r15, init_num_rnd_to_win_1p
    stob    r15, p1_match_count_ingame
loc_70F4:                               # CODE XREF: ROM:00007120↓j
    ld      add_BACKUP_RAM_TO_RAM, r15
    ldob    0x3341(r15), r15
    cmpobl  5, r15, init_num_rnd_to_win_vs
    stob    r15, vs_match_count_ingame
    b       loc_7130
# ---------------------------------------------------------------------------
init_num_rnd_to_win_1p:                 # CODE XREF: ROM:000070E8↑j
    mov     2, r15
    stib    r15, p1_match_count_ingame
    b       loc_70F4
# ---------------------------------------------------------------------------
init_num_rnd_to_win_vs:                 # CODE XREF: ROM:00007104↑j
    mov     2, r15
    stib    r15, vs_match_count_ingame
loc_7130:                               # CODE XREF: ROM:00007110↑j
    ldib    p1_match_count_ingame, r15
    stib    r15, num_rounds_to_win
    mov     0, r15
    stib    r15, p1_wins
    mov     0, r15
    stib    r15, p2_wins
    call    clear_win_lamp_cntr
    mov     0, r15
    stib    r15, 0x500056
    ld      not_scr_bg_move, r15
    clrbit  2, r15, r15
    st      r15, not_scr_bg_move
    ld      not_scr_bg_move, r15
    clrbit  3, r15, r15
    st      r15, not_scr_bg_move
    mov     0, r15
    stib    r15, 0x5000E8
    ld      debug_flag, r15
    setbit  9, r15, r15     # set bit 9 debug
    st      r15, debug_flag
    ld      debug_flag, r3
    setbit  11, r3, r3      # set bit 11 debug
    setbit  15, r3, r3      # set bit 15 debug
    st      r3, debug_flag
    mov     0, r15
    st      r15, 0x500230
    mov     0, r15
    st      r15, 0x50023C
    call    CoProcessorErr  # For some reason this is always called
    call    ring_tobitiri_init # Ring Scatter
    ld      add_BACKUP_RAM_TO_RAM, r3
    ldob    0x3351(r3), r3  # loads BACKUP_RAM_START+0x3351
    ldob    time_vars[r3], r3
    stob    r3, time
    call    init_floats
    call    sub_7F0E8       # Inits player bodies
    call    scale_something
    call    init_health_bar_flag
    call    sub_81AFC
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x1000CA8, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
aSoundInitializ:.asciz "Sound Initialize ..."
    .fill 3, 1, 0
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
    lda     700000, r3
_700000_loop:                           # CODE XREF: ROM:0000726C↓j
    divr    r3, r3, r5      # Assume this is a timing thing to allow the sound driver to work
    cmpdeco 1, r3, r3
    bl      _700000_loop
    lda     0x1000000, g9
    shlo    6, 1, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x1000014, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
aNameFl2MotdLen:.asciz "NAME                           FL2 MOTD_LENG"
    .fill 3, 1, 0
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
    lda     518, r3         # Motion to check
    ld      fa_rob0, g7
    ld      offset_list_motions, r10
    mov     0, r11
    lda     0x1000094, g9
mothead_check:                          # CODE XREF: ROM:00007358↓j
    mov     g9, r12
    mov     r3, g0
    call    set_mot_dat
    ldos    0x800(g7), r4   # g7 = P1_PARTS; r4 = P1_PARTS+0x800 (Value is 0x6E)
    ldos    0x80C(g7), r5   # g7 = P1_PARTS; r5 = P1_PARTS+0x80C (Value is 0x6E)
    lda     0xFFFF, r13
    cmpobe  r13, r5, mothead_error_disp
    cmpobge r4, r5, mothead_error_disp # This conditional exits the "aNameFl2MotdLen"
    ld      (r10)[r3*4], g0 # r10 = 0x6400820; r3 = 0x206
    call    print_mes       # g0 = 0x64012FB
    mov     r5, g0
    addo    0x1F, 9, r13
    addi    r13, g9, g9
    call    print_dec       # Print g0 as decimal
    mov     r4, g0
    addo    0x10, g9, g9
    call    print_dec       # Print g0 as decimal
    mov     r12, g9
    shlo    7, 1, r15
    addo    r15, g9, g9
    mov     1, r11
mothead_error_disp:                     # CODE XREF: ROM:00007318↑j
    cmpdeco 1, r3, r3
    bl      mothead_check   # Insert Modscreen Here
    cmpobe  0, r11, main_loop
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x1001428, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
aMotheadErrorCa:.asciz "mothead error!  call D.K."
    .short 0
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
mothead_error_hang:                     # CODE XREF: ROM:mothead_error_hang↓j
    b       mothead_error_hang
# =============== S U B R O U T I N E =======================================
# int __cdecl main_loop(int argc, const char **argv, const char **envp)
main_loop:                              # CODE XREF: ROM:0000735C↑j
    mov     0, r3           # Label from official source
    st      r3, POLYGON
    st      r3, P2_POLYGON
    st      r3, 0x501010
    st      r3, 0x501014
    st      r3, un_poly_data_err_flag
    lda     0xFFFFF, r15
    st      r15, TIMERS_START
    ld      debug_flag, r15
    bbs     13, r15, skip_frame # Always falls through, needs to be 0x0000AA00
    call    make_lay_col_256_tbl_demon
    call    tpd_move_init
    call    user_always     # return
    call    start_check     # Useless. If check passes or fails, it will always ret.
    call    set_window_data
    call    clear_buffer_ptr # Camera stuff
    call    mode_control
    call    event_loop      # called after SEL_INT
    call    set_end_mark
    call    test_sw_chk
    ld      frame_counter, r14
    addi    1, r14, r15
    st      r15, frame_counter
skip_frame:                            # CODE XREF: main_loop+44↑j
    call    unp_send_tex_para # Handles colors and advances game mode
    call    interrupt_wait_b # Sets 3rd timer
    call    bookkeep_all_clock
    call    variable_diff_calc
    b       main_loop
# End of function main_loop
# =============== S U B R O U T I N E =======================================
# return
init_ram:                               # CODE XREF: ROM:0000696C↑p
                ret                     # Label from official source
# End of function init_ram

    .section main_returns
# =============== S U B R O U T I N E =======================================
# return
init_data_bd_fifo:                      # CODE XREF: ROM:00006AC0↓p
                ret                     # Label from Virtua Fighter 2 source
# End of function init_data_bd_fifo
# ---------------------------------------------------------------------------
read_data_bd_fifo:                      # Label from Virtua Fighter 2 source
                ret
# ---------------------------------------------------------------------------
write_data_bd_fifo:                     # Label from Virtua Fighter 2 source
                ret
