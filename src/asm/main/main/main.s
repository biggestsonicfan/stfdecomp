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

        .section init
init_event:                             # CODE XREF: ROM:00006A58↑p
    lda     event_data, g13 # Label from Fighting Vipers source
    lda     event_init_data, r9
    ld      event_count, r8
    lda     0x50C000, r10
    mov     0, r4
    mov     0, r5
    mov     0, r6
    mov     0, r7
loc_11348:                              # CODE XREF: init_event+90↓j
    ld      0x0(r9), r15
    st      r15, 0x0(g13)
    ld      4(r9), r3
    stib    r3, 4(g13)
    ld      8(r9), g0
    st      g0, 8(g13)
    ld      0xC(r9), r15
    st      r15, 0xC(g13)
    ld      0x14(r9), r3
    cmpobe  0, r3, loc_1137C # if 0x14(obj) is zero, jump down
    lda     (r3)[r3*4], r3
    lda     6(r3)[r3*4], r3
loc_1137C:                              # CODE XREF: init_event+54↑j
    st      r3, 0x38(g13)   # (On 11th loop) P1_PARTS+0x38 = r3
    ld      0x10(r9), r3
    st      g13, (r3)
    shlo    6, 1, r13
    addi    r13, r9, r9
    addo    g0, g13, g13
    stq     r4, (r10)
    stq     r4, 0x10(r10)
    addo    0x1F, 1, r13
    addi    r13, r10, r10
    cmpdeco 1, r8, r8
    bl      loc_11348
    ret
# End of function init_event

            .section loop
event_loop:                             # CODE XREF: main_loop+64↑p
    mov     3, g0           # Label from official source
    call    set_mmode
    mov     1, g0
    call    set_mmode
    ld      not_scr_bg_move, r15
    bbs     16, r15, loc_114C4
    lda     event_data, g13
    lda     0x50C000, r10
    ld      debug_flag, r9
    lda     0xFFFFF, r8
    mov     0, r11
actual_event_loop:                      # CODE XREF: event_loop+104↓j
    st      r11, event
    bbs     9, r9, loc_11410 # branch if bit 9 set on debug flag (0x00018800)
    ld      fa_camera, r4
    ldob    0xDE(r4), r4    # load mod_fa_camera_add+0xDE to r4, r4=3
    bbs     2, r4, loc_11410
    call    dsp_exad        # Display executing event
loc_11410:                              # CODE XREF: event_loop+48↑j
    st      r8, TIMER_02
    ld      0x0(g13), r4
    bbc     31, r4, loc_11484
    ld      12(g13), r4
    callx   (r4)            # Execute event
    bbs     5, r9, loc_11498
    ldl     TIMER_02, r14   # r14 == 000FFF9D
    and     r8, r15, r3     # Init:
    subi    r3, r8, r3      # Init:
    st      r3, 0x10(r10)   # r3 == 00000062
    ld      0x38(g13), r15  # g13 = P1_PARTS
    cmpobe  0, r15, loc_11460 # Init:
    cmpobl  r3, r15, loc_11460
    ld      debug_flag, r15
set_bit_3_debug:
    setbit  3, r15, r15
    st      r15, debug_flag
loc_11460:                              # CODE XREF: event_loop+94↑j
    ldq     (r10), r4
    cmpo    1, 0
    addc    r3, r4, r4
    addc    0, r5, r5
    addo    1, r6, r6
    cmpibge r7, r3, loc_1147C
    mov     r3, r7
loc_1147C:                              # CODE XREF: event_loop+C4↑j
    stq     r4, (r10)
    b       loc_11498
# ---------------------------------------------------------------------------
loc_11484:                              # CODE XREF: event_loop+6C↑j
    ldl     TIMER_02, r14
    and     r8, r15, r3
    subi    r3, r8, r3
    st      r3, 0x10(r10)
loc_11498:                              # CODE XREF: event_loop+78↑j
    ld      8(g13), r13
    addi    r13, g13, g13
    addo    0x1F, 1, r13
    addi    r13, r10, r10
    addo    1, r11, r11     # event+1
    ld      event_count, r3
    cmpibl  r11, r3, actual_event_loop
    bbs     9, r9, loc_114C0
    call    del_exad        # "Display Event Loop"
loc_114C0:                              # CODE XREF: event_loop+108↑j
    ret
# ---------------------------------------------------------------------------
loc_114C4:                              # CODE XREF: event_loop+18↑j
    lda     ptr_mod_fa_game_disp, r5
    lda     dsp_exad, r6    # Display executing event
loc_114D4:                              # CODE XREF: event_loop+144↓j
    cmpobe  r5, r6, loc_114F8 # return
    ld      (r5), r3        # r3 = mod_fa_game_disp
    ld      (r3), g13       # g13 = mod_fa_game_disp_add
    ld      0x0(g13), r4
    bbc     31, r4, loc_114F0 # Check if bit 31 of mod_fa_game_disp_add is clear, if so branch
    ld      0xC(g13), r4    # mod_fa_game_disp_add+0xC
    callx   (r4)            # For Sonic, r4 = 0x79444
loc_114F0:                              # CODE XREF: event_loop+134↑j
    addo    4, r5, r5
    b       loc_114D4
# ---------------------------------------------------------------------------
loc_114F8:                              # CODE XREF: event_loop:loc_114D4↑j
    ret                     # return
# End of function event_loop
# ---------------------------------------------------------------------------
ptr_mod_fa_game_disp:
    .long mod_fa_game_disp
    .long mod_fa_unused
# =============== S U B R O U T I N E =======================================
# Display executing event
dsp_exad:                               # CODE XREF: event_loop+5C↑p
                ld      event, r3       # Label from Virtua Fighter 2 source
                shlo    6, 1, r4
                mulo    r3, r4, r3
                ldt     event_names(r3), r4 # 0 = fa_nameentry
                shlo    8, r6, r6
                shro    8, r6, r6
                lda     0x50E000, g0
                stt     r4, (g0)
                addo    3, g0, g0
                lda     0x100045C, g9
                call    print_mes
                ret
# End of function dsp_exad
# =============== S U B R O U T I N E =======================================
# "Display Event Loop"
del_exad:                               # CODE XREF: event_loop+10C↑p
                addo    4, sp, sp       # Label from Virtua Fighter 2 source
                st      g0, -4(sp)
                lda     0x100045C, g9
                balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
aExad:          .asciz "           EXAD"
# ---------------------------------------------------------------------------
                ld      -4(sp), g0
                subo    4, sp, sp
                ret
# End of function del_exad

        .section wait
interrupt_wait_b:                       # CODE XREF: main_loop+88↑p
    ldl     TIMER_03, r14   # Label from official source
    lda     0xFFFFF, r14
    and     r14, r15, r15
    subi    r15, r14, r15
    subo    0x12, r15, r15
    divo    0x19, r15, r3
    ldob    RAMBASE_START, r6
    cmpobne 0, r6, loc_115BC
    lda     0x43DB, r4
    subi    r3, r4, r5
    b       loc_115C0
# ---------------------------------------------------------------------------
loc_115BC:                              # CODE XREF: interrupt_wait_b+28↑j
    subi    r3, 0, r5
loc_115C0:                              # CODE XREF: interrupt_wait_b+38↑j
    st      r5, CPU_POWER
    ld      frame_counter, r3
    and     0x1F, r3, r3
    cmpobe  0, r3, loc_115E4
    ld      CPU_WORST, r3
    cmpibl  r3, r5, loc_115EC
loc_115E4:                              # CODE XREF: interrupt_wait_b+54↑j
    st      r5, CPU_WORST
loc_115EC:                              # CODE XREF: interrupt_wait_b+60↑j
    ldob    CPU_FAIL_flag, g0
    cmpobe  1, g0, cpu_fail_check
    cmpobe  2, g0, loc_11608
    ldob    RAMBASE_START, g0
    cmpobe  1, g0, loc_1163C
loc_11608:                              # CODE XREF: interrupt_wait_b+78↑j
    ldob    RAMBASE_START, g0
_idle:                                  # CODE XREF: interrupt_wait_b+98↓j
    ldob    RAMBASE_START, r3
    cmpibe  r3, g0, _idle
cpu_fail_check:                         # CODE XREF: interrupt_wait_b+74↑j
    ldob    RAMBASE_START, r4
    cmpobg  2, r4, loc_1163C
    ld      CPU_FAIL, r3
    addo    1, r3, r3
    st      r3, CPU_FAIL
loc_1163C:                              # CODE XREF: interrupt_wait_b+84↑j
    mov     0, r3
    stob    r3, RAMBASE_START
    ld      COPRO_STATUS_START, r3
    and     2, r3, r3
    cmpobe  0, r3, iwb_tgp_ok
iwb_tgp_ok:                             # CODE XREF: interrupt_wait_b+D4↑j
    call    change_poly_bank # Label from Fighting Vipers source
    call    sub_2435C
    ld      debug_flag, r15
    bbs     9, r15, loc_11740
    lda     0x10004DA, g9
    ldis    CTRL_TIMER, g0
    balx    debug_disp_int, r14
# ---------------------------------------------------------------------------
aCtrlTimer:     .asciz "CTRL_TIMER"
    .byte 0
# ---------------------------------------------------------------------------
    ldis    game_timer, g0
    balx    debug_disp_int, r14
# ---------------------------------------------------------------------------
aGameTimer:     .asciz "GAME_TIMER"
    .byte 0
# ---------------------------------------------------------------------------
    ldis    CPU_POWER, g0
    balx    debug_disp_int, r14
# ---------------------------------------------------------------------------
aCpuPower:      .asciz "CPU_POWER"
    .short 0
# ---------------------------------------------------------------------------
    ldis    CPU_WORST, g0
    balx    debug_disp_int, r14
# ---------------------------------------------------------------------------
aCpuWorst:      .asciz "CPU_WORST"
    .short 0
# ---------------------------------------------------------------------------
    ldis    CPU_FAIL, g0
    balx    debug_disp_int, r14
# ---------------------------------------------------------------------------
aCpuFail:       .asciz "CPU_FAIL"
    .short 0
    .byte 0
# ---------------------------------------------------------------------------
    lda     0x1000956, g9
    ldis    POLYGON, g0
    balx    debug_disp_int, r14
# ---------------------------------------------------------------------------
aPolygon_0:     .asciz "POLYGON"
# ---------------------------------------------------------------------------
    ldib    working_rate, g0
    balx    debug_disp_int, r14
# ---------------------------------------------------------------------------
aWorkingRate:   .asciz "working_rate"
    .fill 3, 1, 0
# ---------------------------------------------------------------------------
loc_11740:                              # CODE XREF: interrupt_wait_b+E8↑j
    ret
# End of function interrupt_wait_b

        .section check_start
# =============== S U B R O U T I N E =======================================
# Useless. If check passes or fails, it will always ret.
start_check:                            # CODE XREF: main_loop+54↑p
    ld      debug_flag, r15 # Label from official source
    bbs     1, r15, loc_11784 # falls through
    ld      fa_rob0, g7
    ld      fa_rob1, g8
    ld      0x0(g7), r15
    bbs     5, r15, loc_11770 # falls through
    ld      0x0(g8), r15
    bbc     5, r15, loc_11784 # falls through if p2 is mirror
loc_11770:                              # CODE XREF: start_check+20↑j
    addo    0x1F, 0x11, r3  # r3 = 0x30
    ld      INTERUPT_FLAGS_MOMENTARY, r8 # P1 Start + P2 Start
    and     r8, r3, r3
    cmpibe  0, r3, loc_11784 # if r3 is 0, branch, and it does
loc_11784:                              # CODE XREF: start_check+8↑j
    ret
# End of function start_check

            .section main_funcs1
# =============== S U B R O U T I N E =======================================
variable_diff_init:                     # CODE XREF: ROM:00006AFC↑p
    mov     0, r3           # Label from Fighitng Vipers source
    st      r3, 0x50D000
    stob    r3, working_rate
    stob    r3, var_diff    # vairable diff
    ld      add_BACKUP_RAM_TO_RAM, r4
    ldob    0x3000(r4), r4  # save_working
    ldob    vd_measure, r3  # vairable diff measure
    shlo    r3, 1, r3
    mulo    r4, r3, r4
    shro    8, r4, r4
    shlo    0x10, r4, r3
    or      r4, r3, r4
    mov     r4, r5
    mov     r4, r6
    mov     r4, r7
    addo    0x1F, 1, r8
    lda     0x50D0F0, r9
loc_119F8:                              # CODE XREF: variable_diff_init+68↓j
    stq     r4, (r9)[r8*16]
    cmpdeco 1, r8, r8
    bl      loc_119F8
variable_diff_calc:                     # CODE XREF: main_loop+90↑p
    ld      mode_flag, r4   # Label from official source
    shlo    0x10, 1, r3
    lda     0x20000(r3), r3
    and     r4, r3, r3
    cmpobne 0, r3, loc_11B44 # return
    lda     0xFF, r8
    lda     0x50D100, r9
    ld      0x50D000, r6
    addo    1, r6, r3
    st      r3, 0x50D000
    ldob    vd_measure, r5  # vairable diff measure
    shro    r5, r6, r7
    and     r8, r7, r7
    shlo    r5, 1, r3
    subo    1, r3, r3
    and     r6, r3, r3
    cmpobne 0, r3, loc_11AE0
    mov     0, g0
    mov     r8, r10
loc_11A68:                              # CODE XREF: variable_diff_init+DC↓j
    ldos    (r9)[r10*2], r3
    addo    g0, r3, g0
    cmpdeci 0, r10, r10
    bl      loc_11A68
    addo    5, r5, r3
    shro    r3, g0, r4
    mov     7, r3
    cmpible r4, r3, loc_11A8C
    mov     r3, r4
loc_11A8C:                              # CODE XREF: variable_diff_init+EC↑j
    stob    r4, working_rate
    addo    0, r5, r3
    shro    r3, g0, g0
    lda     0xFF, r3
    cmpible g0, r3, loc_11AA8
    mov     r3, g0
loc_11AA8:                              # CODE XREF: variable_diff_init+108↑j
    stob    g0, save_working_bk
    stob    g0, save_working
    ld      add_BACKUP_RAM_TO_RAM, r3
    ldob    0x3342(r3), r3  # r3 = BACKUP_RAM_TO_RAM+0x3342
    ldob    byte_11BD4(r4)[r3*8], r3
    stob    r3, var_diff    # vairable diff
    mov     0, r15
    stis    r15, (r9)[r7*2]
loc_11AE0:                              # CODE XREF: variable_diff_init+C4↑j
    ld      mode_flag, r4
    shlo    6, 1, r3
    lda     0x80(r3), r3
    lda     0x100(r3), r3
    lda     0x200(r3), r3
    lda     0x400(r3), r3
    lda     0x800(r3), r3
    lda     0x1000(r3), r3
    lda     0x2000(r3), r3
    lda     0x4000(r3), r3
    lda     0x8000(r3), r3
    lda     loc_40000(r3), r3
    lda     loc_80000(r3), r3
    and     r4, r3, r3
    cmpobe  0, r3, loc_11B44 # return
    ldos    (r9)[r7*2], r14
    addi    1, r14, r15
    stos    r15, (r9)[r7*2]
loc_11B44:                              # CODE XREF: variable_diff_init+84↑j
    ret                     # return
# End of function variable_diff_init
# =============== S U B R O U T I N E =======================================
set_game_setting:                       # CODE XREF: ROM:00006B00↑p
    ldob    var_diff, r4    # Label from Fighting Vipers source
    ld      add_BACKUP_RAM_TO_RAM, r5
    ldob    0x3342(r5), r5  # r5 = BACKUP_RAM_TO_RAM+0x3342
    ldib    working_rate, r15
    stib    r15, use_working
    ld      float_5_0[r4*4], r8 # Always float 5.0
    ld      float_5_1[r4*4], r9 # Always float 5.0
    ld      add_BACKUP_RAM_TO_RAM, r10
    ldob    0x3344(r10), r10 # r10 = BACKUP_RAM_TO_RAM+0x3344
    ld      add_BACKUP_RAM_TO_RAM, r11
    ldob    0x3343(r11), r11 # r11 = BACKUP_RAM_TO_RAM+0x3343
    ldos    max_energy_vs_list[r10*2], r10 # r10 = 1; then r10 = 140
    ldos    max_energy_1p_list[r11*2], r11
    st      r8, float_5_0_ram # These 5.0 floats are never ref'd anywhere
    st      r9, float_5_1_ram
    stos    r10, val_vs_energy_max
    stos    r11, val_1p_energy_max
    ret
# End of function set_game_setting
# ---------------------------------------------------------------------------
byte_11BD4:     .byte 0, 0, 0, 0, 0, 0, 0, 0
    .byte 0, 0, 0, 0, 1, 1, 1, 1
    .byte 0, 0, 1, 1, 2, 2, 2, 2
    .byte 0, 0, 1, 2, 3, 3, 3, 3
float_5_0:      .float 5.0              # DATA XREF: set_game_setting+28↑r
    .float 5.0
    .float 5.0
    .float 5.0
float_5_1:      .float 5.0              # DATA XREF: set_game_setting+30↑r
    .float 5.0
    .float 5.0
    .float 5.0
max_energy_vs_list:.short 160           # DATA XREF: set_game_setting+58↑r
    .short 140
    .short 130
    .short 120
max_energy_1p_list:.short 160           # DATA XREF: set_game_setting+60↑r
    .short 140
    .short 130
    .short 120
# =============== S U B R O U T I N E =======================================
init_pol_color:                         # CODE XREF: ROM:00006A5C↑p
    lda     POLY_PALETTE_DATA_ROM, r5 # Label from Fighting Vipers source
    lda     POLY_PALETTE_DATA, r6 # 0x000000
    shlo    0xA, 1, r4      # 1024
loc_11C38:                              # CODE XREF: init_pol_color+28↓j
    ldos    (r5), r3
    stos    r3, (r6)
    addo    2, r5, r5
    addo    2, r6, r6
    cmpdeco 1, r4, r4
    bl      loc_11C38
    ret
# End of function init_pol_color
# ---------------------------------------------------------------------------
    xor     r14, r14, g0    # unreachable code in StF, FV, and VF2!
    ldob    0, r5
    ld      ptr_texture_check_data[r5*4], g5
    call    sub_11C84
    ret
# ---------------------------------------------------------------------------
    xor     r14, r14, r14   # unreachable code in StF, FV, and VF2!
    not     r14, g0
    lda     0x2600000, g5
    call    sub_11C84
    ret
# =============== S U B R O U T I N E =======================================
sub_11C84:                              # CODE XREF: ROM:00011C64↑p
    ld      texram_0_1, r7  # unreachable code
    ld      texram_1, r8
    mov     g0, r13
    shlo    0x11, 3, r9
    cmpibne 0, r13, loc_11CAC
    ld      texram_0_1, r5
    b       loc_11CD8
# ---------------------------------------------------------------------------
loc_11CAC:                              # CODE XREF: sub_11C84+18↑j
    ld      texram_1, r5
loc_11CB4:                              # CODE XREF: sub_11C84+4C↓j
    ldos    (g5), r3
    stos    r3, (r5)
    addo    2, g5, g5
    addo    2, r5, r5
    addo    2, r7, r7
    addo    2, r8, r8
    cmpdeco 1, r9, r9
    bl      loc_11CB4
    b       loc_11CF8
# ---------------------------------------------------------------------------
loc_11CD8:                              # CODE XREF: sub_11C84+24↑j
    ldos    (g5), r3
    stos    r3, (r5)
    addo    2, g5, g5
    addo    2, r5, r5
    addo    2, r7, r7
    addo    2, r8, r8
    cmpdeco 1, r9, r9
    bl      loc_11CD8
loc_11CF8:                              # CODE XREF: sub_11C84+50↑j
    not     g0, g0
    mov     0, r9
    shlo    7, 1, r4
    mov     r4, r6
loc_11D08:                              # CODE XREF: sub_11C84+EC↓j
    shlo    9, 1, r12
    mov     1, r10
    mov     g0, r13
    ld      dword_11D90[r10*4], r11 # Always 256
loc_11D1C:                              # CODE XREF: sub_11C84+E4↓j
    ldos    (g5), r3
    cmpibne 0, r13, loc_11D2C
    stos    r3, (r7)
    b       loc_11D30
# ---------------------------------------------------------------------------
loc_11D2C:                              # CODE XREF: sub_11C84+9C↑j
    stos    r3, (r8)
loc_11D30:                              # CODE XREF: sub_11C84+A4↑j
    addo    2, g5, g5
    addo    2, r7, r7
    addo    2, r8, r8
    cmpibe  0, r9, loc_11D64
    cmpdeco 1, r11, r11
    bl      loc_11D64
    addo    1, r10, r10
    ld      dword_11D90[r10*4], r11
    cmpo    r10, r9
    ble     loc_11D60
    shlo    1, r11, r11
loc_11D60:                              # CODE XREF: sub_11C84+D4↑j
    not     r13, r13
loc_11D64:                              # CODE XREF: sub_11C84+B8↑j
    cmpdeco 1, r12, r12
    bl      loc_11D1C
    cmpdeco 1, r6, r6
    bl      loc_11D08
    cmpi    1, r4
    be      loc_11D80
    shro    1, r4, r4
loc_11D80:                              # CODE XREF: sub_11C84+F4↑j
    mov     r4, r6
    cmpinco 8, r9, r9
    bg      loc_11D08
    ret
# End of function sub_11C84
# ---------------------------------------------------------------------------
dword_11D90:    .long 512               # DATA XREF: sub_11C84+90↑r
    .long 256
    .long 128
    .long 64
    .long 32
    .long 16
    .long 8
    .long 4
    .long 2
    .long 1
ptr_texture_check_data:.long texture_check_data
    .long texture_check_data
    .long texture_check_data
    .long texture_check_data
# =============== S U B R O U T I N E =======================================
# just return for disco mode
essential_color_handling:               # CODE XREF: ROM:00006A80↑p
    ld      luma_ram, g0
    lda     add_TILE_DATA_START, g1
    ld      0x20D0008, g2
loc_11DE0:                              # CODE XREF: essential_color_handling+38↓j
    shlo    7, 1, g3
loc_11DE4:                              # CODE XREF: essential_color_handling+30↓j
    ldob    (g1), r3
    stos    r3, (g0)
    addo    1, g1, g1
    addo    2, g0, g0
    cmpdeco 1, g3, g3
    bl      loc_11DE4
    cmpdeco 1, g2, g2
    bl      loc_11DE0
    ret
# End of function essential_color_handling
# =============== S U B R O U T I N E =======================================
sub_11E08:                              # CODE XREF: ROM:00006A88↑p
    lda     dword_8EBD4, g1
    lda     0xB1, g2
    mov     0, g3
    ld      (g1), g4
    addo    4, g1, g1
    lda     0x5A, g5
    mov     0x10, g6
    mov     0, r6
    mov     4, r9
loc_11E30:                              # CODE XREF: sub_11E08+98↓j
    shlo    2, r6, r7
    shlo    0xB, 1, r8
    addo    r8, r6, r6
    mov     0, r3
    st      g14, mmode
    lda     loc_1414, g14
    st      g14, 0x140(g10)
    ld      mmode, g14
    st      r7, (g10)[g12*1]
    st      r8, (g10)[g12*1]
loc_11E64:                              # CODE XREF: sub_11E08+64↓j
    call    sub_11EA8
    cmpdeco 1, r8, r8
    bl      loc_11E64
    mov     0, r3
    st      g14, mmode
    lda     off_1010, g14
    st      g14, 0x100(g10)
    ld      mmode, g14
    st      r3, (g10)[g12*1]
    call    set_end_mark
    call    interrupt_wait
    cmpdeco 1, r9, r9
    bl      loc_11E30
    ret
# End of function sub_11E08
# =============== S U B R O U T I N E =======================================
sub_11EA8:                              # CODE XREF: sub_11E08:loc_11E64↑p
    mov     0, r14
    mov     4, r11
loc_11EB0:                              # CODE XREF: sub_11EA8+44↓j
    cmpdeco 1, g5, g5
    bl      loc_11EE0
    and     3, g4, r13
    addo    r13, g2, g2
    mov     g2, g5
    addo    1, g3, g3
    shro    2, g4, g4
    cmpdeco 1, g6, g6
    bl      loc_11EE0
    mov     0x10, g6
    ld      (g1), g4
    addo    4, g1, g1
loc_11EE0:                              # CODE XREF: sub_11EA8+C↑j
    or      g3, r14, r14
    rotate  0x18, r14, r14
    cmpdeco 1, r11, r11
    bl      loc_11EB0
    st      r14, (g10)[g12*1]
    ret
# End of function sub_11EA8
# =============== S U B R O U T I N E =======================================
sub_11EF8:                              # CODE XREF: ROM:00006A98↑p
    lda     0x6468000, g1
    lda     0, g2
    mov     0x10, g4
loc_11F08:                              # CODE XREF: sub_11EF8+7C↓j
    lda     0x800, g5
    st      g14, mmode
    lda     0x505, g14
    st      g14, 0x50(g10)
    ld      mmode, g14
    st      g2, (g10)[g12*1]
    st      g5, (g10)[g12*1]
    addo    g5, g2, g2
loc_11F30:                              # CODE XREF: sub_11EF8+48↓j
    ld      (g1), r3
    st      r3, (g10)[g12*1]
    addo    4, g1, g1
    cmpdeco 1, g5, g5
    bl      loc_11F30
    mov     0, r3
    st      g14, mmode
    lda     off_1010, g14
    st      g14, 0x100(g10)
    ld      mmode, g14
    st      r3, (g10)[g12*1]
    call    set_end_mark
    call    interrupt_wait
    cmpdeco 1, g4, g4
    bl      loc_11F08
    ret
# End of function sub_11EF8
# =============== S U B R O U T I N E =======================================
geometry_stuff:                         # CODE XREF: ROM:00006A7C↑p
    lda     word_12068, g0
    lda     GEO_START, g1
    call    sub_11FE4
    lda     word_12070, g0
    lda     0x801000, g1
    call    sub_11FE4
    lda     word_12078, g0
    lda     0x802000, g1
    call    sub_11FE4
    lda     word_12080, g0
    lda     0x803000, g1
    call    sub_11FE4
    lda     word_12088, g0
    lda     GEO_PROGRAM_START, g1
    call    sub_11FE4
    ret
# End of function geometry_stuff
# =============== S U B R O U T I N E =======================================
sub_11FE4:                              # CODE XREF: geometry_stuff+10↑p
    mov     g0, r9
    shlo    0xC, 1, r10
    st      g14, mmode
    lda     0x404, g14
    st      g14, 0x40(g10)
    ld      mmode, g14
    mov     g1, r12
    st      r12, (g10)[g12*1]
    st      r10, (g10)[g12*1]
    shro    2, r10, r10
loc_12014:                              # CODE XREF: sub_11FE4+54↓j
    ldos    0x0(r9), r3
    ldos    2(r9), r4
    ldos    4(r9), r5
    ldos    6(r9), r6
    st      r3, (g10)[g12*1]
    st      r4, (g10)[g12*1]
    st      r5, (g10)[g12*1]
    st      r6, (g10)[g12*1]
    cmpdeco 1, r10, r10
    bl      loc_12014
    st      g14, mmode
    lda     off_1010, g14
    st      g14, 0x100(g10)
    ld      mmode, g14
    st      r3, (g10)[g12*1]
    call    set_end_mark
    call    interrupt_wait
    ret
# End of function sub_11FE4
# ---------------------------------------------------------------------------
word_12068:     .short 0x4000           # DATA XREF: geometry_stuff↑o
    .short 0
    .short 0x1A00
    .short 0x400
word_12070:     .short 0x4000           # DATA XREF: geometry_stuff+14↑o
    .short 0
    .short 0x1A00
    .short 0x2940
word_12078:     .short 0x4000           # DATA XREF: geometry_stuff+28↑o
    .short 0
    .short 0x1A00
    .short 0x3E00
word_12080:     .short 0x4000           # DATA XREF: geometry_stuff+3C↑o
    .short 0
    .short 0x1A00
    .short 0x26C0
word_12088:     .short 0x4000           # DATA XREF: geometry_stuff+50↑o
    .short 0
    .short 0x1A00
    .short 0xB140
# =============== S U B R O U T I N E =======================================
sub_12090:                              # CODE XREF: ROM:00006A9C↑p
    lda     0x6460000, g1
    lda     0x808000, g2
    mov     8, g4
loc_120A4:                              # CODE XREF: sub_12090+A0↓j
    mov     0, r3
    shlo    0xB, 1, g5
    st      g14, mmode
    lda     0x404, g14
    st      g14, 0x40(g10)
    ld      mmode, g14
    st      g2, (g10)[g12*1]
    st      g5, (g10)[g12*1]
    addo    g5, g2, g2
    shro    2, g5, g5
loc_120D4:                              # CODE XREF: sub_12090+6C↓j
    ldos    0x0(g1), r3
    ldos    2(g1), r4
    ldos    4(g1), r5
    ldos    6(g1), r6
    st      r3, (g10)[g12*1]
    st      r4, (g10)[g12*1]
    st      r5, (g10)[g12*1]
    st      r6, (g10)[g12*1]
    addo    8, g1, g1
    cmpdeco 1, g5, g5
    bl      loc_120D4
    mov     0, r3
    st      g14, mmode
    lda     off_1010, g14
    st      g14, 0x100(g10)
    ld      mmode, g14
    st      r3, (g10)[g12*1]
    call    set_end_mark
    call    interrupt_wait
    cmpdeco 1, g4, g4
    bl      loc_120A4
    ret
# End of function sub_12090
# =============== S U B R O U T I N E =======================================
sub_12138:                              # CODE XREF: ROM:00006AA0↑p
    lda     0x6464000, g1
    lda     0x80C000, g2
    mov     8, g4
loc_1214C:                              # CODE XREF: sub_12138+90↓j
    mov     0, r3
    shlo    0xB, 1, g5
    st      g14, mmode
    lda     0x404, g14
    st      g14, 0x40(g10)
    ld      mmode, g14
    st      g2, (g10)[g12*1]
    st      g5, (g10)[g12*1]
    addo    g5, g2, g2
    shro    1, g5, g5
loc_1217C:                              # CODE XREF: sub_12138+5C↓j
    ldos    0x0(g1), r3
    ldos    2(g1), r4
    st      r3, (g10)[g12*1]
    st      r4, (g10)[g12*1]
    addo    4, g1, g1
    cmpdeco 1, g5, g5
    bl      loc_1217C
    mov     0, r3
    st      g14, mmode
    lda     off_1010, g14
    st      g14, 0x100(g10)
    ld      mmode, g14
    st      r3, (g10)[g12*1]
    call    set_end_mark
    call    interrupt_wait
    cmpdeco 1, g4, g4
    bl      loc_1214C
    ret
# End of function sub_12138
# =============== S U B R O U T I N E =======================================
init_scroll:                            # CODE XREF: ROM:00003690↑p
    mov     0, g0           # Label from official source
    stob    g0, 0x503001
    lda     0x1008000, g0
    mov     0, g1
    shlo    0xB, 1, g2
loc_121EC:                              # CODE XREF: init_scroll+28↓j
    stis    g1, (g0)
    addi    2, g0, g0
    cmpdeco 1, g2, g2
    bl      loc_121EC
    lda     0x100A000, g0
    mov     0, g1
    mov     8, g2
loc_1220C:                              # CODE XREF: init_scroll+48↓j
    stis    g1, (g0)
    addi    2, g0, g0
    cmpdeco 1, g2, g2
    bl      loc_1220C
    stib    g1, 0x503000
    lda     0x100C000, g0
    mov     0, g1
    shlo    0xC, 1, g2
loc_12234:                              # CODE XREF: init_scroll+70↓j
    stis    g1, (g0)
    addi    2, g0, g0
    cmpdeco 1, g2, g2
    bl      loc_12234
    lda     STAGE_PALETTE_DATA, g0 # 0x0031E6
    lda     0xFC00, g1
    shlo    0xC, 1, g2
loc_12258:                              # CODE XREF: init_scroll+94↓j
    stis    g1, (g0)
    addi    2, g0, g0
    cmpdeco 1, g2, g2
    bl      loc_12258
    lda     scrB_V_page, r4
    xor     r3, r3, r3
    stos    r3, (r4)
    stos    r3, 2(r4)
    ret
# End of function init_scroll
# =============== S U B R O U T I N E =======================================
init_fix:                               # CODE XREF: ROM:00006A64↑p
    call    clr_first_group_cg # Label from official source
    ld      0x2800000, g0
    mov     g0, r7
    ld      (r7), g0        # 0x2801304 to g0
    call    _ScrollCG_Initialize_old
    addi    4, r7, r7
    ld      (r7), g0        # 0x2802998 to g0
    call    _ScrollColor_Initialize_old
    addi    4, r7, r7
    call    set_scroll_color
    mov     6, r3
    st      r3, 0x503004
    mov     9, r3
    st      r3, 0x503008
    mov     15, r3
    ld      0x503002, r4
    setbit  r3, r4, r4
    st      r4, 0x503002
    mov     14, r3
    ld      0x503002, r4
    clrbit  r3, r4, r4
    st      r4, 0x503002
    lda     64770, g0
    call    bg_col_set
    ret
# End of function init_fix
# =============== S U B R O U T I N E =======================================
set_scroll_color:                       # CODE XREF: init_fix+28↑p
    lda     word_8EBA8, r3  # Label from official source
loc_1230C:                              # CODE XREF: set_scroll_color+34↓j
    ld      (r3), r4
    addi    4, r3, r3
    cmpibe  0, r4, loc_1233C
    ld      (r3), r5
    addi    4, r3, r3
loc_12320:                              # CODE XREF: set_scroll_color+30↓j
    ldis    (r3), r6
    stis    r6, (r4)
    addi    2, r3, r3
    addi    2, r4, r4
    cmpdeci 1, r5, r5
    bl      loc_12320
    b       loc_1230C
# ---------------------------------------------------------------------------
loc_1233C:                              # CODE XREF: set_scroll_color+10↑j
    ret
# End of function set_scroll_color
# =============== S U B R O U T I N E =======================================
clr_first_group_cg:                     # CODE XREF: init_fix↑p
    lda     TMAPGFXBASE_START, g0 # Label from official source
    shlo    0xB, 1, g1      # Init counter: 2048 (0x800) to g1
    xor     g2, g2, g2
loc_12350:                              # CODE XREF: clr_first_group_cg+1C↓j
    st      g2, (g0)
    addi    4, g0, g0       # TMAPGFXBASE_START+4, etc..
    cmpdeco 1, g1, g1       # 2048-1, count down
    bl      loc_12350
loc_12360:                              # DATA XREF: ROM:off_48CAC↓o
    ret
# End of function clr_first_group_cg


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
