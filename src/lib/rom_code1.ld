/* rom_code1.ld */
/* STARTUP (kx_init.o) */

MEMORY
{
    rom (RX) : ORIGIN = 0x00000000, LENGTH = 1M
    ram  (RWX) : ORIGIN = 0x00500000, LENGTH = 1M
}

SECTIONS
{

    .text :
    {   
        /* Init Stuff */
        src/asm/init/kx/kx_init.o(start_prog)
        src/asm/init/kx/kx_init.o(start_ip_first)
        src/asm/init/kx/kx_init.o(intr_to_ram)
        src/asm/init/kx/kx_init.o(prcb_to_ram)
        src/asm/init/ram/fix_prcb.o(fix_prcb)
        src/asm/init/copro/copro_init.o(copro_init)
        src/asm/init/kx/kx_init.o(reinit)
        src/asm/init/ram/buff_ram.o(buff_ram)
        src/asm/init/kx/kx_init.o(start_again)
        src/asm/init/serial/serial_init.o(serial_init)
        src/asm/init/gfx/gfx_init.o(gfx_init)
        src/asm/init/interrupt/interrupt_init.o(interrupt_init)
        src/asm/init/gfx/colors_init.o(colors_init)
        src/asm/init/gfx/texture_init.o(texture_init)
        src/asm/init/fault/f_handle.o(load_fault_ascii)
        src/asm/init/fault/print_fault.o(init_pfault)
        src/asm/init/serial/serial_init.o(serial_delay)
        src/asm/init/kx/kx_init.o(init_move_data)
        src/asm/init/timer/timer.o(timer_manip)
        src/asm/init/vsync/vsync.o(vsync)
        src/asm/init/timer/timer.o(timer_func)
        src/asm/init/other/other.o(other_func)
        src/asm/init/interrupt/i_halt.o(i_halt_func)
        src/asm/init/copro/copro_init.o(copro_down_func)
        src/asm/init/copro/copro_init.o(copro_init_data)
        src/asm/init/collision/collision.o(coli_data)
        src/asm/init/collision/collision.o(coli_funcs)
        src/asm/init/copro/copro_init.o(afterimage)
        src/asm/init/copro/copro_init.o(shadow)
        src/asm/init/geometry/geo_init.o(geo_func_start)
        src/asm/init/copro/copro_init.o(copro_down2_func)
        src/asm/init/geometry/geo_init.o(geo_init)
        src/asm/init/interrupt/interrupt_init.o(interrupt)
        src/asm/main/main/main.o(main_returns)
        src/asm/init/player/player_entry.o(player)
        src/asm/init/credits/check.o(credit_backup_ram)
        src/asm/init/credits/check.o(check)
        src/asm/init/credits/check.o(credits_required)
        src/asm/init/credits/check.o(coin_interr)
        src/asm/init/credits/check.o(credit_interr_data)
        src/asm/init/credits/check.o(more_credit_code)
        src/asm/init/credits/check.o(more_credit_data)
        src/asm/init/credits/check.o(chute)
        src/asm/init/credits/check.o(cred_required)
        src/asm/init/credits/check.o(even_more_credit_code)
        src/asm/init/gfx/gfx_init.o(send_colors)
        src/asm/init/interrupt/interrupt_init.o(poly_bank_change)
        src/asm/init/geometry/geo_init.o(end_mark)
        src/asm/init/window/window.o(window)
        src/asm/init/ram/sram.o(sram)
        src/asm/init/kx/kx_init.o(prcb_data)
        src/asm/init/kx/kx_init.o(sys_proc)
        src/asm/init/kx/kx_init.o(fault_proc)
        src/asm/init/interrupt/interrupt_init.o(interr_targets)
        src/asm/init/kx/kx_init.o(boot_ftable)
        src/asm/init/kx/kx_init.o(reinit_iac)
        src/asm/init/gfx/gfx_init.o(palette_data_end)
        src/asm/init/fault/f_table.o(ftable)
        src/asm/init/geometry/geo_init.o(geo_data)
        src/asm/init/interrupt/i_table.o(interr_table)
        src/asm/init/ram/buff_ram.o(buff_adds)
        src/asm/init/fault/print_fault.o(fault_ascii)
        src/asm/init/interrupt/i_halt.o(i_halt_ascii)
        src/asm/init/fault/f_handle.o(fault_ascii)
        src/asm/init/collision/collision.o(coli_ball_pntr)
        src/asm/init/event/event.o(mmode_set)
        src/asm/init/obj/poly.o(poly_obj_funcs)
        src/asm/init/window/window.o(window_data)
        src/asm/init/print/print.o(print)
        src/asm/init/math/math.o(math)
        src/asm/init/unused/un_disp_floats.o(float_display)

        /* Main Stuff */
        src/asm/main/main/main.o(main_sub)
        src/asm/main/advertise/init_adv_rep.o(adv_replay_ram_init)
        src/asm/main/buffer/clear_buffer.o(clear_buffer)
        src/asm/main/coprocessor/coproc_error.o(coproc_error)
        src/asm/main/mode/mode_control.o(debug_mode_control)
        src/asm/main/mode/test_enter_exit.o(test_mode)
        src/asm/main/warning/warning.o(warning)
        src/asm/main/advertise/advertise_mode.o(adv_mode_data)
        src/asm/main/advertise/advertise_mode.o(advertise_mode)
        src/asm/main/unused/un_check_credit.o(credit_check)
        src/asm/main/advertise/fbi_pic/fbi_pic.o(fbi_pic)
        src/asm/main/advertise/sega_pic/sega_pic.o(seeeegaaaaaa)
        src/asm/main/advertise/movie/movie.o(movie)
        src/asm/main/advertise/replay/replay.o(replay)
        src/asm/main/advertise/cpu_battle/cpu_battle.o(cpu_battle)
        src/asm/main/advertise/advertise_mode.o(repeat)
        src/asm/main/unused/un_check_credit.o(dec_credit)
        src/asm/main/info/info.o(info)
        src/asm/main/select/select.o(select)
        src/asm/main/round/story/story.o(story)
        src/asm/main/round/round/round.o(states)
        src/asm/main/round/game/game.o(int)
        src/asm/main/round/mask/mask.o(int)
        src/asm/main/round/round/round.o(init)
        src/asm/main/round/mask/mask.o(dsp)
        src/asm/main/round/burni/burni.o(burni)
        src/asm/main/round/round/round.o(int)
        src/asm/main/round/set/set.o(set)
        src/asm/main/round/ready/ready.o(ready)
        src/asm/main/round/fight/fight.o(fight)
        src/asm/main/round/rep_waza/rep_waza.o(rep_waza)
        src/asm/main/round/judge/judge.o(judge)
        src/asm/main/round/replay/replay.o(replay)
        src/asm/main/round/next/next.o(next)
        src/asm/main/round/victory/victory.o(victory)
        src/asm/main/round/win/win.o(win)
        src/asm/main/round/stage_up/stage_up.o(stage_up)
        src/asm/main/round/deathegg/mask.o(mask)
        src/asm/main/round/deathegg/mezase.o(mezase)
        src/asm/main/round/intrude/intrude.o(intrude)
        src/asm/main/round/continue/continue.o(continue)
        src/asm/main/round/set_close/set_close.o(close)
        src/asm/main/round/over/over.o(over)
        src/asm/main/round/ending/ending/ending.o(ending)
        src/asm/main/round/ending/ending/ending.o(ending_states)
        src/asm/main/round/ending/movie/movie.o(movie)
        src/asm/main/round/ending/sub/sub.o(int)
        src/asm/main/round/ending/wait/wait.o(wait1)
        src/asm/main/round/ending/unused/wait1_alt.o(wait)
        src/asm/main/round/ending/sub/sub.o(dsp)
        src/asm/main/round/ending/movie/movie.o(movie2)
        src/asm/main/round/ending/wait/wait.o(wait2)
        src/asm/main/round/ending/ending/ending.o(paint_it_black)
        src/asm/main/round/ending/unused/fv_leftovers.o(leftover1)
        src/asm/main/round/ending/ending/ending.o(tile)
        src/asm/main/round/ending/unused/fv_leftovers.o(leftover2)
        src/asm/main/round/ending/ending/ending.o(texture)
        src/asm/main/round/ending/unused/fv_leftovers.o(leftover3)
        src/asm/main/round/ending/ending/ending.o(tile2)
        src/asm/main/round/ending/unused/fv_leftovers.o(leftover4)
        src/asm/main/round/ending/ending/ending.o(tile3)
        src/asm/main/advertise/sega_pic/sega_pic.o(pitch_black)
        src/asm/main/round/ending/unused/time_dsp.o(dsp)
        src/asm/main/round/ending/ending/ending.o(ending_flags)
        src/asm/main/round/ending/unused/staff.o(staff)
        src/asm/main/name/name/name.o(name)
        src/asm/main/rank/all_end/all_end.o(end)
        src/asm/main/debug/test/test/test.o(test)
        src/asm/main/rank/rank/rank.o(rank)
        src/asm/main/main/main.o(init)
        src/asm/main/main/main.o(loop)
        src/asm/main/main/main.o(wait)
        src/asm/main/main/main.o(check_start)
        src/asm/init/vsync/vsync.o(debug_check)
        src/asm/main/main/main.o(main_funcs1)
        src/asm/main/advertise/sega_pic/sega_pic.o(col_set)

        /* Common Stuff - Actions*/
        src/asm/common/action/action.o(init)
        src/asm/common/action/act_1344C.o(action)
        src/asm/common/action/act_13464.o(action)
        src/asm/common/action/act_1346C.o(action)
        src/asm/common/action/act_134A8.o(action)
        src/asm/common/action/action.o(exec)
        src/asm/common/action/act_rc_motion.o(action)
        src/asm/common/action/act_rc_kaeshi.o(kamae)
        src/asm/common/action/act_rc_syagami.o(action)
        src/asm/common/action/act_rc_walk.o(action)
        src/asm/common/action/act_rc_bwalk.o(action)
        src/asm/common/action/act_rc_fumikomi.o(action)
        src/asm/common/action/act_rc_ta_guard.o(action)
        src/asm/common/action/act_rc_guard.o(action)
        src/asm/common/action/act_rc_yarare.o(action)
        src/asm/common/action/act_rc_down_attack.o(action)
        src/asm/common/action/act_rc_jump.o(action)
        src/asm/common/action/act_rc_ukemi.o(action)
        src/asm/common/action/act_rc_down.o(action)
        src/asm/common/action/act_rc_rise.o(action)
        src/asm/common/action/act_rc_kaeshi.o(action)
        src/asm/common/action/act_rc_kawashi.o(action)
        src/asm/common/action/act_rc_down_nage_touch.o(action)
        src/asm/common/action/act_rc_nage_touch.o(action)
        src/asm/common/action/act_rc_nage.o(action)
        src/asm/common/action/act_rc_nagerare.o(action)
        src/asm/common/action/act_rc_kabe_nage.o(action)
        src/asm/common/action/act_rc_nagerare.o(jump)
        src/asm/common/action/act_1560C.o(action)
        src/asm/common/action/act_156EC.o(action)
        src/asm/common/action/act_159B0.o(action)
        src/asm/common/action/act_15A4C.o(action)
        src/asm/common/action/act_15C48.o(action)
        src/asm/common/action/act_15DFC.o(action)
        src/asm/common/action/act_15EE8.o(action)
        src/asm/common/action/act_16120.o(action)
        src/asm/common/action/act_rc_kabehit.o(action)
        src/asm/common/action/act_163A0.o(action)
        src/asm/common/action/act_164DC.o(action)
        src/asm/common/action/act_16594.o(action)
        src/asm/common/action/act_165D4.o(action)
        src/asm/common/action/act_168DC.o(action)
        src/asm/common/action/act_16A4C.o(action)

        /* Common Stuff */
        src/asm/main/round/common/get_game_info.o(game_info)
        src/asm/util/math/calc_unit_mat.o(calc_unit)
        src/asm/common/action/action.o(action_rob_revise)
        src/asm/main/round/common/get_game_info.o(check_stage)
        src/asm/common/action/action.o(after)
        src/asm/main/round/common/get_game_info.o(new_info)
        src/asm/util/math/damage_calculation.o(calculation)
        src/asm/common/action/action.o(fix_hara_fn)
        src/asm/main/round/common/get_game_info.o(1980C)
        src/asm/common/camera/rob_disp.o(display)
        src/asm/main/round/ending/sub/sub.o(save_mat_param_chg)
        src/asm/common/option/option.o(option)
        src/asm/common/camera/rob_disp.o(kosi_nobi)
        src/asm/common/action/set_motion.o(motion)
        src/asm/common/action/action.o(calc_mht)
        src/asm/common/action/play_motion.o(motion)
        src/asm/common/option/option.o(del_option)
        src/asm/common/action/action.o(control)
        src/asm/common/action/act_rc_kaeshi.o(unknown0)
        src/asm/common/action/act_rc_guard.o(unknown0)
        src/asm/main/round/common/get_game_info.o(get_my_info_new_floats)
        src/asm/common/action/act_rc_guard.o(act_rc_guard_floats)
        src/asm/common/action/act_rc_yarare.o(act_rc_yarare_floats)
        src/asm/main/round/common/get_game_info.o(get_en_info_floats)
        src/asm/common/action/action.o(rob_revise_yang_short)
        src/asm/common/action/action.o(calc_mht_adr_bytes)
        src/asm/common/action/play_motion.o(play_motion_bytes)
        src/asm/common/action/action.o(action_offset_list)
        src/asm/common/action/play_motion.o(uknown_player_action_offsets)
        src/asm/common/action/action.o(decide_command_data)
        src/asm/common/action/act_rc_jump.o(act_rc_jump_float)
        src/asm/common/action/act_rc_ukemi.o(act_rc_ukemi_floats)
        src/asm/common/camera/rob_disp.o(rob_disp_animation_data)
        src/asm/common/control/control_init.o(init)

        
        src/asm/init/warn/check.o(warn_screen_check)
        

    } >rom

    .data :
    {
    } = 0xFFFF >rom


     /* Manual placement of RAM-only fixed-address globals */
    .bss (NOLOAD) : {

        /* Displacement Nonsense */

        cam_mode10 = 10;
        cam_mode11 = 11;
        cam_mode33 = 33;
        cam_mode34 = 34;
        cam_mode9 = 9;
        displacement = 0;
        displacement10 = 10;
        displacement100 = 100;
        displacement128 = 128;
        displacement1 = 1;
        displacement256 = 256;
        displacement2 = 2;
        displacement32 = 32;
        displacement333 = 333;
        displacement34 = 34;
        displacement35 = 35;
        displacement36 = 36;
        displacement38 = 38;
        displacement3 = 3;
        displacement40 = 40;
        displacement42 = 42;
        displacement44 = 44;
        displacement46 = 46;
        displacement48 = 48;
        displacement50 = 50;
        displacement52 = 52;
        displacement54 = 54;
        displacement56 = 56;
        displacement58 = 58;
        displacement60 = 60;
        displacement62 = 62;
        displacement64 = 64;
        displacement66 = 66;
        displacement68 = 68;
        displacement70 = 70;
        displacement72 = 72;
        displacement74 = 74;
        displacement76 = 76;
        displacement78 = 78;
        displacement8 = 8;
        displacement80 = 80;
        displacement82 = 82;
        displacement84 = 84;
        displacement86 = 86;
        displacement88 = 88;
        displacement9 = 9;
        displacement90 = 90;
        displacement92 = 92;
        displacement94 = 94;
        displacement96 = 96;
        displacement98 = 98;
        mode10 = 10;
        mode11 = 11;
        mode128 = 128;
        mode8 = 8;
        mode9 = 9;
        stage8 = 8;
        sub_mode32 = 32;
        sub_mode33 = 33;
        sub_mode9 = 9;
        versus10 = 10;
        versus8 = 8;
        versus9 = 9;

        /* End Displacement Nonsense */

        RAMBASE_START = 0x500000;
        CPU_FAIL = 0x500018;
        frame_counter = 0x500020;
        CTRL_TIMER = 0x500024;
        game_timer = 0x500028;
        mode = 0x50002A;
        also_mode = 0x50002B;
        mode_flag = 0x50002C;
        _sub_mode = 0x500030;
        also_sub_mode = 0x500031;
        event = 0x500038;
        draw_vs_routine_flag = 0x500048;
        ingame_countdown_FFFF = 0x50004A;
        gameprogram = 0x50004C;
        p1_wins = 0x50004F;
        p2_wins = 0x500051;
        num_rounds_to_win = 0x500052;
        STAGE_ID = 0x500054;
        curr_round_num = 0x500055;
        vs_match_count_ingame = 0x500059;
        p1_match_count_ingame = 0x50005A;
        stage_num = 0x500064;
        winner = 0x500065;
        current_stage_played_num = 0x500067;
        not_scr_bg_move = 0x500068;
        CPU_FAIL_flag = 0x50006D;
        name_entry_related =  0x500078;
        rank_mode = 0x500088;
        start_stage = 0x50008F;
        time = 0x500090;
        look_char = 0x500091;
        replay_countdown = 0x500092;
        replay_bank_num = 0x500096;
        random = 0x500098;
        POLYGON_DISP = 0x50009C;
        energy_max = 0x5000A0;
        MENU_SELECT = 0x5000A4;
        MENU_ITEM_SELECT = 0x5000A5;
        TEST_MENU_FLAG = 0x5000A6;
        total_game_time_ram = 0x5000B0;
        RED = 0x5000E0;
        GREEN = 0x5000E1;
        BLUE = 0x5000E2;
        record_stage_xpos = 0x50013C;
        record_stage_ypos = 0x500140;
        record_stage_zpos = 0x500144;
        CPU_POWER = 0x50015C;
        CPU_WORST = 0x500160;
        replay_bank_adr = 0x500168;
        add_BACKUP_RAM_TO_RAM = 0x50016C;
        stage = 0x500170;
        _1P_ROB = 0x500174;
        _2P_ROB = 0x500176;
        _1P_MIRROR = 0x500178;
        _2P_MIRROR = 0x50017A;
        debug_input_code_buffer = 0x5001DC;
        TST_RED_ADD = 0x500234;
        TST_RED_MUL = 0x500235;
        TST_GRN_ADD = 0x500236;
        TST_GRN_MUL = 0x500237;
        TST_BLUE_ADD = 0x500238;
        TST_BLUE_MUL = 0x500239;
        TST_B_BRIGHT = 0x50023A;
        select0_flag = 0x500248;
        select1_flag = 0x50024C;
        texram_0 = 0x500250;
        texram_0_1 = 0x500254;
        texram_1 = 0x500258;
        luma_ram = 0x50025C;
        scroll_stage_num = 0x500264;
        cage_height = 0x50027C;
        adv_fade_cnt = 0x5003E8;
        _20K_PLAYS_FLAG = 0x50040E;
        SKIP_WARNING = 0x500410;
        total_win = 0x500414;
        total_time = 0x500418;
        total_skill = 0x50041C;
        win_points = 0x500420;
        time_points = 0x500424;
        skill_points = 0x500428;
        total_points = 0x50042C;
        start_yang = 0x500433;
        billboard_test_loop_counter = 0x50043C;
        billboard_active_frame_counter = 0x50043E;
        billboard_test_flag = 0x500440;
        billboard_test_flag_0 = 0x500441;
        RANDOM_MODE = 0x500450;
        randomize_story_order = 0x500454;
        health_bar_hud_draw_frame_count = 0x500466;
        p1_barrier_flag = 0x5004B8;
        p2_barrier_flag = 0x5004BC;
        am_cntr = 0x5004C4;
        am_num = 0x5004C6;
        adv_movie_cont_ex = 0x5004CC;
        adv_movie_disp_ex = 0x5004D0;
        movie_flags = 0x5004D4;
        continue_count = 0x5004F0;
        also_continue_count = 0x5004F4;
        rounds_lost_vs_cpu = 0x5004F8;
        adv_stf_logo_0 = 0x50052C;
        adv_stf_logo_400 = 0x500530;
        not_use = 0x500600;
        not_free = 0x500604;
        free = 0x500608;
        INTERUPT_FLAGS_HELD = 0x500700;
        INTERUPT_FLAGS_MOMENTARY = 0x500704;
        INTERUPT_FLAGS_MOMEN_ON_REL = 0x500708;
        INTERUPT_FLAGS_HELD_PREV_FRAME = 0x50070C;
        COIN_INTERUPT_FLAGS = 0x500718;
        analog_to_digital_ram = 0x50071C;
        fa_rob0 = 0x500804;
        fa_rob1 = 0x500808;
        fa_camera = 0x500814;
        mod_fa_control0 = 0x50081C;
        mod_fa_game_info = 0x500824;
        mod_fa_coli = 0x500828;
        mod_fa_user = 0x500830;
        mod_fa_game_disp = 0x500834;
        mod_fa_sel_disp = 0x500838;
        mod_fa_enemy0 = 0x50083C;
        mod_fa_enemy1 = 0x500840;
        mod_fa_effect = 0x500844;
        mod_fa_sampling = 0x500848;
        mod_fa_key_record = 0x50084C;
        mod_fa_key_play = 0x500850;
        mod_fa_record = 0x500854;
        mod_fa_play = 0x500858;
        mod_fa_sound = 0x50085C;
        mod_fa_osage0_1 = 0x500860;
        mod_fa_osage0_2 = 0x500864;
        mod_fa_kill_osage = 0x500868;
        mod_fa_pol_test = 0x50086C;
        mod_fa_obj0 = 0x500870;
        mod_fa_win0 = 0x50087C;
        mod_fa_win1 = 0x500880;
        mod_fa_unused = 0x500884;
        mod_fa_pol_string = 0x500888;
        mod_fa_stage_efc = 0x500898;
        mod_fa_nameentry = 0x5008A0;
        mod_fa_tobi = 0x5008A4;
        mod_fa_burni = 0x5008AC;
        BUFF_ADD = 0x501004;
        BUFF_MAX = 0x501008;
        POLYGON_LIMIT = 0x501018;
        POLYGON = 0x50101C;
        VECTER_X = 0x501020;
        VECTER_Y = 0x501022;
        focus_dist_x = 0x501084;
        focus_dist_y = 0x501088;
        BRIGHT = 0x501098;
        ROB0 = 0x50109C;
        ROB1 = 0x5010A0;
        ROB_LENG = 0x5010A4;
        ROB_LIMIT = 0x5010A8;
        P2_POLYGON = 0x5010D0;
        ROB_LIMIT2 = 0x5010E4;
        ROB0_ZANG = 0x5010E8;
        ROB1_ZANG = 0x5010EA;
        ROB_ZANG = 0x5010ED;
        win_down = 0x501400;
        win_left = 0x501402;
        win_up = 0x501404;
        win_right = 0x501406;
        win_eye0_y = 0x501408;
        win_eye0_x = 0x50140A;
        win_eye1_y = 0x50140C;
        win_eye1_x = 0x50140E;
        win_eye2_y = 0x501410;
        win_eye2_x = 0x501412;
        win_eye3_y = 0x501414;
        win_eye3_x = 0x501416;
        buffer_ptr = 0x501800;
        un_poly_data_err_flag = 0x501998;
        hsync = 0x50300C;
        vsync = 0x50300E;
        health_bar_flag = 0x503014;
        TEXTURE_BUFFER =  0x503200;
        AUDIO_1 = 0x504010;
        AUDIO_2 = 0x504020;
        sd_nowait_timer = 0x50406B;
        sd_wait_timer = 0x504070;
        sd_flag = 0x504074;
        stage_size = 0x5048C0;
        floor_stage_size_0 = 0x5048D0;
        pos_00_x = 0x506200;
        pos_00_y = 0x506204;
        pos_00_z = 0x506208;
        pos_01_x = 0x506210;
        pos_01_y = 0x506214;
        pos_01_z = 0x506218;
        rvb_flag = 0x507000;
        debug_flag = 0x508000;
        motion_set_mot_val = 0x508020;
        mem_poly_test_No = 0x508078;
        mem_poly_test_No_disp = 0x50807A;
        mem_poly_test_xpos = 0x50807C;
        mem_poly_test_ypos = 0x508080;
        mem_poly_test_zpos = 0x508084;
        mem_poly_test_xang = 0x508089;
        mem_poly_test_yang = 0x50808B;
        mem_poly_test_zang = 0x50808D;
        db_parts_xpos = 0x508090;
        db_parts_ypos = 0x508094;
        db_parts_zpos = 0x508098;
        db_parts_xang = 0x50809D;
        db_parts_yang = 0x50809F;
        db_parts_zang = 0x5080A1;
        db_parts_Weight = 0x5080B0;
        db_parts_yofs = 0x5080B4;
        break_point = 0x5080BC;
        bp_switch_step = 0x5080BD;
        bp_switch_cont = 0x5080BE;
        bp_switches_on_off = 0x5080BF;
        bp_switch = 0x5080C0;
        debug_fx = 0x509034;
        debug_fy = 0x509038;
        debug_fz = 0x50903C;
        debug_fx2 = 0x509040;
        debug_fy2 = 0x509044;
        debug_fz2 = 0x509048;
        debug_fx3 = 0x50904C;
        debug_fy3 = 0x509050;
        debug_fz3 = 0x509054;
        debug_mx = 0x509058;
        debug_my = 0x50905C;
        debug_mz = 0x509060;
        debug_mx2 = 0x509064;
        debug_my2 = 0x509068;
        debug_mz2 = 0x50906C;
        debug_mx3 = 0x509070;
        debug_my3 = 0x509074;
        debug_mz3 = 0x509078;
        debug_fxang = 0x50907D;
        debug_fyang = 0x509081;
        debug_fzang = 0x509085;
        debug_fxang2 = 0x509089;
        debug_fyang2 = 0x50908D;
        debug_fzang2 = 0x509091;
        debug_mxang = 0x5090A1;
        debug_myang = 0x5090A5;
        debug_mzang = 0x5090A9;
        debug_mxang2 = 0x5090AD;
        debug_myang2 = 0x5090B1;
        debug_mzang2 = 0x5090B5;
        debug_mxang3 = 0x5090B9;
        debug_myang3 = 0x5090BD;
        debug_mzang3 = 0x5090C1;
        debug_fxang3 = 0x509361;
        debug_fyang3 = 0x509365;
        debug_fzang3 = 0x509369;
        FUCKING_PI = 0x50950C;
        PI_X2 = 0x509510;
        player_model_y_scale = 0x509518;
        player_model_horiz_scale = 0x50951C;
        float_10 = 0x509524;
        float_100 = 0x509528;
        float_1000 = 0x50952C;
        float_10000 = 0x509530;
        stage_x = 0x50A00C;
        stage_soko = 0x50A010;
        stage_xpos = 0x50A014;
        stage_ypos = 0x50A018;
        stage_zpos = 0x50A01C;
        stage_xang = 0x50A021;
        stage_yang = 0x50A023;
        stage_zang = 0x50A025;
        en_ang_dist = 0x50A028;
        lau_mul_J = 0x50A0A8;
        lau_add_xang = 0x50A0B0;
        limit_xang = 0x50A0B4;
        nagerenai_timer = 0x50A0B6;
        attack_base = 0x50A0B7;
        ROB0_DEBUG_PARAM = 0x50A0B8;
        ROB1_DEBUG_PARAM = 0x50A0B9;
        rise_base = 0x50A0BA;
        precede_inp_time = 0x50A0BB;
        gyang_yvec = 0x50A0BC;
        gyang_asi_d = 0x50A0C0;
        gyang_ha_d = 0x50A0C4;
        gyang_am_ang = 0x50A0C9;
        gyang_asi_h = 0x50A0CC;
        stage_xmin = 0x50A0D0;
        stage_xmax = 0x50A0D4;
        stage_vxmin = 0x50A0D8;
        stage_vxmax = 0x50A0DC;
        rob_light_sonic = 0x50A0E0;
        rob_light_tails = 0x50A0E4;
        rob_light_amy = 0x50A0E8;
        rob_light_metal = 0x50A0EC;
        rob_light_fang = 0x50A0F0;
        rob_light_kuma = 0x50A0F4;
        rob_light_knuckle = 0x50A0F8;
        rob_light_espio = 0x50A0FC;
        rob_light_eggman = 0x50A100;
        rob_light_bean = 0x50A108;
        rob_light_sonic_i = 0x50A148;
        rob_light_tails_i = 0x50A14C;
        rob_light_amy_i = 0x50A150;
        rob_light_metal_i = 0x50A154;
        rob_light_fang_i = 0x50A158;
        rob_light_kuma_i = 0x50A15C;
        rob_light_knuckle_i = 0x50A160;
        rob_light_espio_i = 0x50A164;
        rob_light_eggman_i = 0x50A168;
        rob_light_bean_i = 0x50A170;
        stage_low_judge = 0x50A1B0;
        guard_limit = 0x50A1B4;
        pole_shift = 0x50A1B5;
        combo_sub = 0x50A1B6;
        cage_ypos = 0x50A1C8;
        combo_start = 0x50A1D6;
        combo_limit = 0x50A1D8;
        no_coli_low = 0x50A1DC;
        no_coli_height = 0x50A1E0;
        TST_RED = 0x50A1F0;
        TST_GRN = 0x50A1F1;
        TST_BLUE = 0x50A1F2;
        array_of_floats = 0x50A208;
        cb_r_0 = 0x50A28C;
        cb_r_1 = 0x50A290;
        cb_r_2 = 0x50A294;
        cb_r_3 = 0x50A298;
        cb_r_4 = 0x50A29C;
        cb_r_5 = 0x50A2A0;
        cb_r_6 = 0x50A2A4;
        cb_r_7 = 0x50A2A8;
        cb_r_8 = 0x50A2AC;
        cb_r_9 = 0x50A2B0;
        cb_r_10 = 0x50A2B4;
        cb_r_11 = 0x50A2B8;
        cb_r_12 = 0x50A2BC;
        cb_r_13 = 0x50A2C0;
        cb_r_14 = 0x50A2C4;
        cb_r_15 = 0x50A2C8;
        cb_r_16 = 0x50A2CC;
        cb_r_17 = 0x50A2D0;
        cb_r_18 = 0x50A2D4;
        cb_r_19 = 0x50A2D8;
        cb_r_20 = 0x50A2DC;
        cb_r_21 = 0x50A2E0;
        cb_r_22 = 0x50A2E4;
        cb_r_23 = 0x50A2E8;
        cb_r_24 = 0x50A2EC;
        cb_r_25 = 0x50A2F0;
        cb_r_26 = 0x50A2F4;
        cb_r_27 = 0x50A2F8;
        cb_r_28 = 0x50A2FC;
        cb_r_29 = 0x50A300;
        cb_r_30 = 0x50A304;
        cb_r_31 = 0x50A308;
        cb_mul_R = 0x50A30C;
        copro_adr = 0x50A320;
        ofs_0 = 0x50A324;
        ofs_1 = 0x50A328;
        ofs_2 = 0x50A32C;
        ofs_3 = 0x50A330;
        ofs_4 = 0x50A334;
        ofs_5 = 0x50A338;
        ofs_6 = 0x50A33C;
        ofs_7 = 0x50A340;
        ofs_8 = 0x50A344;
        ofs_9 = 0x50A348;
        ofs_a = 0x50A34C;
        ofs_b = 0x50A350;
        ofs_c = 0x50A354;
        ofs_d = 0x50A358;
        ofs_e = 0x50A35C;
        ofs_f = 0x50A360;
        draw_particle = 0x50A414;
        zanzou_ma = 0x50A418;
        zanzou_inc = 0x50A41C;
        zanzou_pat1 = 0x50A41E;
        zanzou_pat2 = 0x50A420;
        zanzou_num = 0x50A422;
        barrier_default_num = 0x50A424;
        float_2 = 0x50A428;
        float_5_0_ram = 0x50A700;
        float_5_1_ram = 0x50A704;
        val_vs_energy_max = 0x50A708;
        val_1p_energy_max = 0x50A70A;
        list_90_floats_RAM = 0x50A800;
        working_rate = 0x50D004;
        var_diff = 0x50D005;
        vd_measure = 0x50D006;
        use_working = 0x50D007;
        AUDIO_3 = 0x50EFB0;
        mmode = 0x50EFFC;
        ptr_BACKUP_RAM_TO_RAM = 0x50F300;
        deb_num = 0x50F380;
        stack_pointer_ram_add = 0x50F3FC;
        enemy_command_offset = 0x50F608;
        ec_en_flag = 0x50F610;
        ec_en_flag0 = 0x50F611;
        ec_flag = 0x50F612;
        ec_flag0 = 0x50F613;
        ec_mot_kind = 0x50F614;
        ec_mot_kind0 = 0x50F615;
        ec_en_mot_kind = 0x50F616;
        ec_en_mot_kind0 = 0x50F617;
        ec_en_nage_flag = 0x50F618;
        ec_en_nage_flag0 = 0x50F619;
        ec_sankaku_flag = 0x50F61A;
        ec_sankaku_flag0 = 0x50F61B;
        ec_mot2_kind = 0x50F61C;
        ec_mot2_kind0 = 0x50F61D;
        ec_my_status = 0x50F61E;
        ec_my_status0 = 0x50F61F;
        ec_end = 0x50F620;
        ec_push = 0x50F621;
        ec_bu_guard = 0x50F622;
        ec_en_status = 0x50F623;
        ec_en_status0 = 0x50F624;
        ec_le_stagenum = 0x50F625;
        ec_ge_stagenum = 0x50F626;
        ec_eq_stagenum = 0x50F627;
        ec_le_roundnum = 0x50F628;
        ec_ge_roundnum = 0x50F629;
        ec_eq_roundnum = 0x50F62A;
        ec_gacha = 0x50F62B;
        ec_run = 0x50F62C;
        ec_k_jump = 0x50F62D;
        ec_back_waza = 0x50F62E;
        ec_furimuki = 0x50F62F;
        ec_f_dash = 0x50F630;
        ec_b_dash = 0x50F631;
        ec_attack = 0x50F632;
        ec_reset = 0x50F633;
        ec_ifb_emode = 0x50F634;
        ec_le_energy = 0x50F635;
        ec_ge_energy = 0x50F636;
        ec_eq_energy = 0x50F637;
        ec_le_en_energy = 0x50F638;
        ec_ge_en_energy = 0x50F639;
        ec_eq_en_energy = 0x50F63A;
        ec_le_game_timer = 0x50F63B;
        ec_ge_game_timer = 0x50F63C;
        ec_eq_game_timer = 0x50F63D;
        ec_le_lastcoma = 0x50F63E;
        ec_ge_lastcoma = 0x50F63F;
        ec_eq_lastcoma = 0x50F640;
        ec_motd_kind = 0x50F641;
        ec_motd_kind0 = 0x50F642;
        ec_mode_set = 0x50F643;
        ec_ifb_emode_old = 0x50F644;
        ec_eq_oldenergy = 0x50F645;
        ec_eq_en_oldenergy = 0x50F646;
        ec_nage = 0x50F647;
        ec_aite_flag = 0x50F648;
        ec_aite_flag0 = 0x50F649;
        ec_en_mot2_kind = 0x50F64A;
        ec_en_mot2_kind0 = 0x50F64B;
        ec_fast_attack = 0x50F64C;
        ec_far_attack = 0x50F64D;
        ec_down_attack = 0x50F64E;
        ec_le_barrier = 0x50F64F;
        ec_ge_barrier = 0x50F650;
        ec_eq_barrier = 0x50F651;
        ec_le_en_barrier = 0x50F652;
        ec_ge_en_barrier = 0x50F653;
        ec_eq_en_barrier = 0x50F654;
        ec_eq_en_rob = 0x50F655;
        ec_ne_en_rob = 0x50F656;
        ec_nage_sake = 0x50F657;
        ec_k0_jump = 0x50F658;
        ec_k_jumpm = 0x50F659;
        ec_k0_jumpm = 0x50F65A;
        ec_le_en_dist = 0x50F65B;
        ec_ge_en_dist = 0x50F65C;
        ec_tobi_yoke = 0x50F65D;
        ec_le_mem_ob = 0x50F65E;
        ec_ge_mem_ob = 0x50F65F;
        ec_eq_mem_ob = 0x50F660;
        ec_ne_mem_ob = 0x50F661;
        ec_le_mem_os = 0x50F662;
        ec_ge_mem_os = 0x50F663;
        ec_eq_mem_os = 0x50F664;
        ec_ne_mem_os = 0x50F665;
        ec_run_stop = 0x50F666;
        ec_run_waza = 0x50F667;
        ec_en_mode = 0x50F668;
        ec_en_mode0 = 0x50F669;
        ec_jump = 0x50F66A;
        ec_res_enmodekeep = 0x50F66B;
        ec_back_waza2 = 0x50F66C;
        ec_tmrand_jump = 0x50F66D;
        ec_how_to_mode_send = 0x50F66E;
        ec_yoke = 0x50F66F;
        ec_run_end = 0x50F670;
        ec_aite_en_flag = 0x50F671;
        ec_aite_en_flag0 = 0x50F672;
        ec_reset_next = 0x50F673;
        ec_set_waza = 0x50F674;
        ec_set_level = 0x50F675;
        ec_reset_stick_next = 0x50F676;
        ec_mem_set_ob = 0x50F677;
        ec_mem_set_os = 0x50F678;
        ec_mem_mem_ob = 0x50F679;
        ec_mem_mem_os = 0x50F67A;
        ec_how_to_d = 0x50F67B;
        ec_how_to_d0 = 0x50F67C;
        ec_en_how_to_d = 0x50F67D;
        ec_en_how_to_d0 = 0x50F67E;
        ec_how_to_guard_send = 0x50F67F;
        ec_air_combo_chk = 0x50F680;
        ec_le_tedc = 0x50F681;
        ec_ge_tedc = 0x50F682;
        ec_le_land_time = 0x50F683;
        ec_ge_land_time = 0x50F684;
        ec_le_en_land_time = 0x50F685;
        ec_ge_en_land_time = 0x50F686;
        ec_taikuu_waza = 0x50F687;
        ec_rand_set = 0x50F688;
        ec_front_walk = 0x50F689;
        ec_le_en_lastmain = 0x50F68A;
        ec_ge_en_lastmain = 0x50F68B;
        ec_en_motd_kind = 0x50F68C;
        ec_en_motd_kind0 = 0x50F68D;
        ec_ura = 0x50F68E;
        ec_le_eachang = 0x50F68F;
        mae_poly = 0x50FFFC;
        event_data = 0x510000;
        mod_fa_sel_disp_add = 0x510280;
        mod_fa_key_play_add = 0x510380;
        mod_fa_play_add = 0x510400;
        mod_fa_win0_add = 0x510500;
        move_xpos = 0x510518;
        move_ypos = 0x51051C;
        rep_ram = 0x51056C;
        mod_fa_win1_add = 0x510600;
        move_xpos_1 = 0x510618;
        move_ypos_1 = 0x51061C;
        mod_fa_enemy0_add = 0x510700;
        mod_fa_enemy0_enemy_status = 0x510740;
        mod_fa_enemy0_nage_yame_time = 0x51074C;
        mod_fa_enemy0_attack = 0x510754;
        mod_fa_enemy0_sya_attack = 0x510755;
        mod_fa_enemy0_up_attack = 0x510756;
        mod_fa_enemy0_defence = 0x510757;
        mod_fa_enemy0_yoke = 0x510758;
        mod_fa_enemy0_chance = 0x510759;
        mod_fa_enemy0_kaesi = 0x51075A;
        mod_fa_enemy0_down_attack = 0x51075B;
        mod_fa_enemy0_okiagari = 0x51075C;
        mod_fa_enemy0_fukkatsu = 0x51075D;
        mod_fa_enemy0_nage = 0x51075E;
        mod_fa_enemy0_tekagen = 0x51075F;
        mod_fa_enemy0_attack1 = 0x510760;
        mod_fa_enemy0_sya_attack1 = 0x510761;
        mod_fa_enemy0_up_attack1 = 0x510762;
        mod_fa_enemy0_defence1 = 0x510763;
        mod_fa_enemy0_yoke1 = 0x510764;
        mod_fa_enemy0_chance1 = 0x510765;
        mod_fa_enemy0_kaesi1 = 0x510766;
        mod_fa_enemy0_down_attack1 = 0x510767;
        mod_fa_enemy0_okiagari1 = 0x510768;
        mod_fa_enemy0_fukkatsu1 = 0x510769;
        mod_fa_enemy0_nage1 = 0x51076A;
        mod_fa_enemy0_enemy_mode = 0x51076C;
        mod_fa_enemy0_waza_num = 0x5107BA;
        mod_fa_enemy0_waza_cntr = 0x5107C5;
        mod_fa_enemy0_waza_check = 0x5107D1;
        mod_fa_enemy0_waza_number = 0x5107D2;
        mod_fa_enemy1_add = 0x510980;
        mod_fa_enemy1_enemy_status = 0x5109C0;
        mod_fa_enemy1_nage_yame_time = 0x5109CC;
        mod_fa_enemy1_attack = 0x5109D4;
        mod_fa_enemy1_sya_attack = 0x5109D5;
        mod_fa_enemy1_up_attack = 0x5109D6;
        mod_fa_enemy1_defence = 0x5109D7;
        mod_fa_enemy1_yoke = 0x5109D8;
        mod_fa_enemy1_chance = 0x5109D9;
        mod_fa_enemy1_kaesi = 0x5109DA;
        mod_fa_enemy1_down_attack = 0x5109DB;
        mod_fa_enemy1_okiagari = 0x5109DC;
        mod_fa_enemy1_fukkatsu = 0x5109DD;
        mod_fa_enemy1_nage = 0x5109DE;
        mod_fa_enemy1_tekagen = 0x5109DF;
        mod_fa_enemy1_attack1 = 0x5109E0;
        mod_fa_enemy1_sya_attack1 = 0x5109E1;
        mod_fa_enemy1_up_attack1 = 0x5109E2;
        mod_fa_enemy1_defence1 = 0x5109E3;
        mod_fa_enemy1_yoke1 = 0x5109E4;
        mod_fa_enemy1_chance1 = 0x5109E5;
        mod_fa_enemy1_kaesi1 = 0x5109E6;
        mod_fa_enemy1_down_attack1 = 0x5109E7;
        mod_fa_enemy1_okiagari1 = 0x5109E8;
        mod_fa_enemy1_fukkatsu1 = 0x5109E9;
        mod_fa_enemy1_nage1 = 0x5109EA;
        mod_fa_enemy1_enemy_mode = 0x5109EC;
        mod_fa_enemy1_waza_num = 0x510A3A;
        mod_fa_enemy1_waza_cntr = 0x510A45;
        mod_fa_enemy1_waza_check = 0x510A51;
        mod_fa_enemy1_waza_number = 0x510A52;
        mod_fa_control0_add = 0x510C00;
        mod_fa_record_add = 0x510C80;
        P1_PARTS = 0x510D00;
        P1_ME_MUKEN = 0x510D02;
        p1_idnm = 0x510D07;
        p1_xpos = 0x510D18;
        p1_ypos = 0x510D1C;
        p1_zpos = 0x510D20;
        p1_yang_0 = 0x510D26;
        p1_yang = 0x510D27;
        p1_xspd = 0x510D2C;
        p1_yspd = 0x510D30;
        P1_BODY_OBJ = 0x510D44;
        P1_HEAD_OBJ = 0x510D48;
        P1_RSHOLD_OBJ = 0x510D4C;
        P1_RARM_OBJ = 0x510D50;
        P1_RHAND_OBJ = 0x510D54;
        P1_LSHOLD_OBJ = 0x510D58;
        P1_LARM_OBJ = 0x510D5C;
        P1_LHAND_OBJ = 0x510D60;
        P1_LBODY_OBJ = 0x510D64;
        P1_RTHIGH_OBJ = 0x510D68;
        P1_RANKLE_OBJ = 0x510D6C;
        P1_RFOOT_OBJ = 0x510D70;
        P1_LTHIGH_OBJ = 0x510D74;
        P1_LANKLE_OBJ = 0x510D78;
        P1_LFOOT_OBJ = 0x510D7C;
        p1_hara_xpos = 0x510D80;
        p1_hara_ypos = 0x510D84;
        p1_hara_zpos = 0x510D88;
        P1_BODY_FLOAT = 0x510D94;
        P1_HEAD_FLOAT = 0x510D98;
        P1_CHAR_PARTS = 0x510E90;
        p1_command = 0x510E94;
        p1_action = 0x510E9C;
        p1_action_num = 0x510E9F;
        P1_ANIMATIONS = 0x510EA0;
        p1_mot_kind = 0x510EA4;
        p1_motion_num = 0x510EA8;
        p1_motion_coma = 0x510EAA;
        p1_energy = 0x510EAC;
        P1_CHAR_VALUE = 0x510EB0;
        P1_SELECTED = 0x510EB1;
        p1_step = 0x510EB2;
        p1_gxpos = 0x510EF4;
        p1_gypos = 0x510EF8;
        p1_gzpos = 0x510EFC;
        p1_act_yang = 0x5112B4;
        p1_en_dir_yang = 0x5112B6;
        p1_en_flag = 0x5112B8;
        p1_land_time = 0x5112BC;
        p1_jp_next_lacoma = 0x5112C0;
        p1_rob_weight = 0x5112D8;
        p1_down_counter = 0x5112DE;
        p1_en_dist = 0x5112F4;
        p1_front_out = 0x5112F8;
        p1_back_out = 0x5112FC;
        p1_stage_on = 0x511314;
        p1_gyang = 0x511316;
        p1_support = 0x511318;
        p1_out_on = 0x511324;
        p1_tag_en_coma = 0x511326;
        p1_sleep_time = 0x51132A;
        p1_sleep_command = 0x511384;
        p1_hara_yang_ave = 0x511388;
        p1_hara_yang_mat = 0x51138A;
        p1_min_out = 0x5113A8;
        p1_kage_in_flag = 0x5113B0;
        p1_kage_ot_flag = 0x5113B4;
        EGG_PTN_1P = 0x5113CC;
        p1_attack_count = 0x5113D0;
        p1_defence = 0x5113D4;
        p1_gu_atk_count = 0x5113D8;
        p1_kaeshi_no = 0x5113DA;
        P1_HIT_COMBO = 0x5113F4;
        p1_no_coli = 0x5113F8;
        p1_mot_kind2 = 0x51140C;
        p1_en_nage_flag = 0x511420;
        p1_parts_weight = 0x5114D8;
        p1_huamn_weight = 0x5114DC;
        p1_hit_unit = 0x5114E0;
        p1_hit_ratio = 0x5114E4;
        p1_parts_unit = 0x5114E8;
        p1_org_parts_unit = 0x5114EA;
        p1_parts_flag_old = 0x5114EC;
        p1_parts_flag = 0x5114F0;
        p1_motd_leng = 0x511500;
        p1_motd_next = 0x511502;
        p1_motd_kind = 0x511504;
        p1_info = 0x511508;
        p1_follow1 = 0x51150A;
        p1_follow2 = 0x51150C;
        p1_motd_jump_coma = 0x51150E;
        p1_mov_yang = 0x511512;
        p1_motd_stop_coma = 0x511516;
        p1_motd_land_coma = 0x511518;
        p1_motd_ap = 0x511521;
        p1_motd_damage = 0x511522;
        p1_jump_h = 0x511544;
        p1_skeleton_type = 0x51154C;
        p1_guard_stop = 0x51155C;
        p1_yarare_stop = 0x51155D;
        p1_counter_stop = 0x51155E;
        p1_motd_ng_para = 0x51155F;
        p1_motd_kind2 = 0x511560;
        p1_motd_uk_type = 0x511564;
        p1_motd_uk_coma = 0x511568;
        p1_motd_down_coma = 0x511572;
        p1_motd_atk_ang = 0x511576;
        p1_smooth_r_coma = 0x5115E0;
        p1_mot_basic_step = 0x511700;
        p1_brk_up_damage = 0x5117F0;
        p1_brk_dn_damage = 0x5117F4;
        p1_smooth_type = 0x5118DD;
        p1_smooth_f_coma = 0x5118DE;
        p1_smooth_timer = 0x5118E2;
        p1_smoth_sw = 0x5118E4;
        p1_smooth_flag = 0x5118E5;
        p1_old_motd_kind = 0x511930;
        p1_old_mot_coma = 0x51194E;
        p1_old_motd_kind2 = 0x51195C;
        p1_write_pnt = 0x511F02;
        p1_read_pnt = 0x511F03;
        p1_not_rp = 0x511F04;
        p1_not_dir_rp = 0x511F05;
        p1_not_yoke_rp = 0x511F06;
        p1_wait_coma = 0x511F0E;
        p1_pc_command = 0x511F18;
        p1_pc_spe_adr = 0x511F1C;
        p1_pc_spe_time = 0x511F20;
        p1_withhold_time = 0x511F3C;
        p1_withhold_time1 = 0x511F3D;
        p1_withhold_trig = 0x511F3E;
        p1_withhold_trig1 = 0x511F3F;
        p1_wiithhold_pnt = 0x511F40;
        p1_wiithhold_pnt1 = 0x511F41;
        p1_withhold_pnt_c = 0x511F42;
        p1_db_unit_flags = 0x511F4C;
        p1_my_status = 0x511F50;
        p1_mov_speed_xpos = 0x512B00;
        p1_mov_speed_ypos = 0x512B04;
        p1_mov_speed_zpos = 0x512B08;
        p1_old_gxpos = 0x512B0C;
        p1_old_gypos = 0x512B10;
        p1_old_gzpos = 0x512B14;
        p1_old_mot_kind = 0x512B18;
        p1_old_motion_num = 0x512B1C;
        p1_old_mot_kind2 = 0x512B24;
        p1_dmg_hara = 0x512C00;
        p1_dmg_mune = 0x512C02;
        p1_dmg_kao = 0x512C04;
        p1_dmg_katar = 0x512C06;
        p1_dmg_uder = 0x512C08;
        p1_dmg_te_r = 0x512C0A;
        p1_dmg_katal = 0x512C0C;
        p1_dmg_ude_l = 0x512C0E;
        p1_dmg_te_l = 0x512C10;
        p1_dmg_kosi = 0x512C12;
        p1_dmg_momor = 0x512C14;
        p1_dmg_hizar = 0x512C16;
        p1_dmg_asi_ = 0x512C18;
        p1_dmg_momol = 0x512C1A;
        p1_dmg_hizal = 0x512C1C;
        p1_dmg_asil = 0x512C1E;
        p1_arm_hara = 0x512C20;
        p1_arm_mune = 0x512C22;
        p1_arm_kao = 0x512C24;
        p1_arm_katar = 0x512C26;
        p1_arm_uder = 0x512C28;
        p1_arm_te_r = 0x512C2A;
        p1_arm_katal = 0x512C2C;
        p1_arm_ude_l = 0x512C2E;
        p1_arm_te_l = 0x512C30;
        p1_arm_kosi = 0x512C32;
        p1_arm_momor = 0x512C34;
        p1_arm_hizar = 0x512C36;
        p1_arm_asi_ = 0x512C38;
        p1_arm_momol = 0x512C3A;
        p1_arm_hizal = 0x512C3C;
        p1_arm_asil = 0x512C3E;
        p1_pnum_hara = 0x512C4C;
        p1_pnum_mune = 0x512C4D;
        p1_pnum_kao = 0x512C4E;
        p1_pnum_katar = 0x512C4F;
        p1_pnum_uder = 0x512C50;
        p1_pnum_te_r = 0x512C51;
        p1_pnum_katal = 0x512C52;
        p1_pnum_ude_l = 0x512C53;
        p1_pnum_te_l = 0x512C54;
        p1_pnum_kosi = 0x512C55;
        p1_pnum_momor = 0x512C56;
        p1_pnum_hizar = 0x512C57;
        p1_pnum_asi_ = 0x512C58;
        p1_pnum_momol = 0x512C59;
        p1_pnum_hizal = 0x512C5A;
        p1_pnum_asil = 0x512C5B;
        p1_up_damage = 0x512C74;
        p1_down_damage = 0x512C78;
        p1_old_up_damage = 0x512C7C;
        p1_old_down_damag = 0x512C80;
        P1_SIZE_SCALE = 0x5134BC;
        P1_uk_HEAD_THING = 0x513770;
        P1_uk_HEAD_THING_1 = 0x513774;
        P2_PARTS = 0x514100;
        p2_idnm = 0x514107;
        p2_xpos = 0x514118;
        p2_ypos = 0x51411C;
        p2_zpos = 0x514120;
        p2_yang_0 = 0x514126;
        p2_yang = 0x514127;
        p2_xspd = 0x51412C;
        p2_yspd = 0x514130;
        p2_hara_xpos = 0x514180;
        p2_hara_ypos = 0x514184;
        p2_hara_zpos = 0x514188;
        P2_CHAR_PARTS = 0x514290;
        p2_command = 0x514294;
        p2_action = 0x51429C;
        P2_ANIMATIONS = 0x5142A0;
        p2_mot_kind = 0x5142A4;
        p2_motion_num = 0x5142A8;
        p2_motion_coma = 0x5142AA;
        p2_energy = 0x5142AC;
        P2_CHAR_VALUE = 0x5142B0;
        p1_selected = 0x5142B1;
        p2_step = 0x5142B2;
        p2_gxpos = 0x5142F4;
        p2_gypos = 0x5142F8;
        p2_gzpos = 0x5142FC;
        p2_act_yang = 0x5146B4;
        p2_en_dir_yang = 0x5146B6;
        p2_en_flag = 0x5146B8;
        p2_land_time = 0x5146BC;
        p2_jp_next_lacoma = 0x5146C0;
        p2_rob_weight = 0x5146D8;
        p2_down_counter = 0x5146DE;
        p2_en_dist = 0x5146F4;
        p2_front_out = 0x5146F8;
        p2_back_out = 0x5146FC;
        p2_stage_on = 0x514714;
        p2_gyang = 0x514716;
        p2_support = 0x514718;
        p2_out_on = 0x514724;
        p2_tag_en_coma = 0x514726;
        p2_sleep_time = 0x51472A;
        p2_sleep_command = 0x514784;
        p2_hara_yang_ave = 0x514788;
        p2_hara_yang_mat = 0x51478A;
        p2_min_out = 0x5147A8;
        p2_kage_in_flag = 0x5147B0;
        p2_kage_ot_flag = 0x5147B4;
        EGG_PTN_2P = 0x5147CC;
        p2_attack_count = 0x5147D0;
        p2_defence = 0x5147D4;
        p2_gu_atk_count = 0x5147D8;
        p2_kaeshi_no = 0x5147DA;
        p2_no_coli = 0x5147F8;
        p2_mot_kind2 = 0x51480C;
        p2_en_nage_flag = 0x514820;
        p2_parts_weight = 0x5148D8;
        p2_huamn_weight = 0x5148DC;
        p2_hit_unit = 0x5148E0;
        p2_hit_ratio = 0x5148E4;
        p2_parts_unit = 0x5148E8;
        p2_org_parts_unit = 0x5148EA;
        p2_parts_flag_old = 0x5148EC;
        p2_parts_flag = 0x5148F0;
        p2_motd_leng = 0x514900;
        p2_motd_next = 0x514902;
        p2_motd_kind = 0x514904;
        p2_info = 0x514908;
        p2_follow1 = 0x51490A;
        p2_follow2 = 0x51490C;
        p2_motd_jump_coma = 0x51490E;
        p2_mov_yang = 0x514912;
        p2_motd_stop_coma = 0x514916;
        p2_motd_land_coma = 0x514918;
        p2_motd_ap = 0x514921;
        p2_motd_damage = 0x514922;
        p2_jump_h = 0x514944;
        p2_skeleton_type = 0x51494C;
        p2_guard_stop = 0x51495C;
        p2_yarare_stop = 0x51495D;
        p2_counter_stop = 0x51495E;
        p2_motd_ng_para = 0x51495F;
        p2_motd_kind2 = 0x514960;
        p2_motd_uk_type = 0x514964;
        p2_motd_uk_coma = 0x514968;
        p2_motd_down_coma = 0x514972;
        p2_motd_atk_ang = 0x514976;
        p2_smooth_r_coma = 0x5149E0;
        p2_mot_basic_step = 0x514B00;
        p2_brk_up_damage = 0x514BF0;
        p2_brk_dn_damage = 0x514BF4;
        p2_smooth_type = 0x514CDD;
        p2_smooth_f_coma = 0x514CDE;
        p2_smooth_timer = 0x514CE2;
        p2_smooth_sw = 0x514CE4;
        p2_smooth_flag = 0x514CE5;
        p2_old_motd_kind = 0x514D30;
        p2_old_mot_coma = 0x514D4E;
        p2_old_motd_kind2 = 0x514D5C;
        p2_write_pnt = 0x515302;
        p2_read_pnt = 0x515303;
        p2_not_rp = 0x515304;
        p2_not_dir_rp = 0x515305;
        p2_not_yoke_rp = 0x515306;
        p2_wait_coma = 0x51530E;
        p2_pc_command = 0x515318;
        p2_pc_spe_adr = 0x51531C;
        p2_pc_spe_time = 0x515320;
        p2_withhold_time = 0x51533C;
        p2_withhold_time1 = 0x51533D;
        p2_withhold_trig = 0x51533E;
        p2_withhold_trig1 = 0x51533F;
        p2_withhold_pnt = 0x515340;
        p2_wiithhold_pnt1 = 0x515341;
        p2_withhold_pnt_c = 0x515342;
        p2_db_unit_flags = 0x51534C;
        p2_my_status = 0x515350;
        p2_mov_spd_xpos = 0x515F00;
        p2_mov_spd_ypos = 0x515F04;
        p2_mov_spd_zpos = 0x515F08;
        p2_old_gxpos = 0x515F0C;
        p2_old_gypos = 0x515F10;
        p2_old_gzpos = 0x515F14;
        p2_old_mot_kind = 0x515F18;
        p2_old_motion_num = 0x515F1C;
        p2_old_mot_kind2 = 0x515F24;
        p2_dmg_hara = 0x516000;
        p2_dmg_mune = 0x516002;
        p2_dmg_kao = 0x516004;
        p2_dmg_katar = 0x516006;
        p2_dmg_uder = 0x516008;
        p2_dmg_te_r = 0x51600A;
        p2_dmg_katal = 0x51600C;
        p2_dmg_ude_l = 0x51600E;
        p2_dmg_te_l = 0x516010;
        p2_dmg_kosi = 0x516012;
        p2_dmg_momor = 0x516014;
        p2_dmg_hizar = 0x516016;
        p2_dmg_asi_ = 0x516018;
        p2_dmg_momol = 0x51601A;
        p2_dmg_hizal = 0x51601C;
        p2_dmg_asil = 0x51601E;
        p2_arm_hara = 0x516020;
        p2_arm_mune = 0x516022;
        p2_arm_kao = 0x516024;
        p2_arm_katar = 0x516026;
        p2_arm_uder = 0x516028;
        p2_arm_te_r = 0x51602A;
        p2_arm_katal = 0x51602C;
        p2_arm_ude_l = 0x51602E;
        p2_arm_te_l = 0x516030;
        p2_arm_kosi = 0x516032;
        p2_arm_momor = 0x516034;
        p2_arm_hizar = 0x516036;
        p2_arm_asi_ = 0x516038;
        p2_arm_momol = 0x51603A;
        p2_arm_hizal = 0x51603C;
        p2_arm_asil = 0x51603E;
        p2_pnum_hara = 0x51604C;
        p2_pnum_mune = 0x51604D;
        p2_pnum_kao = 0x51604E;
        p2_pnum_katar = 0x51604F;
        p2_pnum_uder = 0x516050;
        p2_pnum_te_r = 0x516051;
        p2_pnum_katal = 0x516052;
        p2_pnum_ude_l = 0x516053;
        p2_pnum_te_l = 0x516054;
        p2_pnum_kosi = 0x516055;
        p2_pnum_momor = 0x516056;
        p2_pnum_hizar = 0x516057;
        p2_pnum_asi_ = 0x516058;
        p2_pnum_momol = 0x516059;
        p2_pnum_hizal = 0x51605A;
        p2_pnum_asil = 0x51605B;
        p2_up_damage = 0x516074;
        p2_down_damage = 0x516078;
        p2_old_up_damage = 0x51607C;
        p2_old_down_damag = 0x516080;
        P2_uk_HEAD_THING = 0x516B70;
        mod_fa_tobi_add = 0x517500;
        mod_fa_coli_add = 0x519500;
        mod_fa_key_record_add = 0x519900;
        mod_fa_sampling_add = 0x519980;
        mod_fa_game_info_add = 0x519D80;
        mod_fa_obj0_add = 0x519E00;
        obj_center = 0x519E06;
        mod_fa_camera_add = 0x519E80;
        mod_fa_camera_xpos = 0x519E98;
        mod_fa_camera_ypos = 0x519E9C;
        mod_fa_camera_zpos = 0x519EA0;
        mod_fa_camera_xang = 0x519EA4;
        mod_fa_camera_yangle = 0x519EA6;
        mod_fa_camera_yang = 0x519EA7;
        mod_fa_camera_zang = 0x519EA9;
        cam_mode = 0x519EC0;
        mod_fa_camera_thunder = 0x519F5F;
        mod_fa_camera_no_label = 0x519F78;
        mod_fa_camera_game_xang = 0x519F79;
        mod_fa_camera_interxpos = 0x519FA0;
        mod_fa_camera_interypos = 0x519FA4;
        mod_fa_camera_interzpos = 0x519FA8;
        mod_fa_camera_ypos_bias = 0x51A15C;
        mod_fa_camera_dir_bias = 0x51A160;
        cam_dist = 0x51A168;
        mod_fa_camera_center = 0x51A16C;
        mod_fa_camera_zure = 0x51A170;
        mod_fa_camera_yang_spd = 0x51A184;
        mod_fa_camera_yang_kirikae = 0x51A186;
        mod_fa_camera_next_yang = 0x51A189;
        cam_dist_ratio = 0x51A18C;
        mod_fa_user_add = 0x51A300;
        mod_fa_game_disp_add = 0x51A580;
        CREDITS = 0x51A5C0;
        mod_fa_effect_add = 0x51A680;
        mod_fa_sound_add = 0x51B300;
        SOUND_NUM = 0x51B380;
        mod_fa_pol_string_add = 0x51B400;
        mod_fa_stage_efc_add = 0x51B680;
        mod_fa_burni_add = 0x51B900;
        mod_fa_kill_osage_add = 0x51BB80;
        mod_fa_osage0_1_add = 0x51BC00;
        mod_fa_osage0_2_add = 0x51BE80;
        mod_fa_pol_test_add = 0x51C100;
        material_num = 0x530000;
        material_num_floats = 0x530080;
        TRANS_MAP = 0x53013C;
        REPLAY_BANK_ADR_value = 0x531000;
        fa_object0_ram = 0x543100;
        rep_ram = 0x535000;
        ARRAY_NUM_RED = 0x544000;
        ARRAY_NUM_GREEN = 0x544200;
        ARRAY_NUM_BLUE = 0x544400;
        TST_RED_ADD_RAM = 0x544600;
        TST_RED_MUL_RAM = 0x544601;
        TST_GRN_ADD_RAM = 0x544602;
        TST_GRN_MUL_RAM = 0x544603;
        TST_BLUE_ADD_RAM = 0x544604;
        TST_BLUE_MUL_RAM = 0x544605;
        RED_RAM = 0x544606;
        GREEN_RAM = 0x544607;
        BLUE_RAM = 0x544608;
        busy_signal_flag = 0x550000;
        NOT_USE_VAL = 0x560000;
        CELL_NO = 0x5603E4;
        CG_NO = 0x5603E6;
        p1_rob_weight_ram = 0x5720A8;
        finish_wall_flag = 0x574004;
        finish_coli_num = 0x574014;
        BACKUP_RAM_TO_RAM = 0x599000;
        save_working = 0x59C000;
        backup_ram_check_0x12 = 0x59C306;
        aInosehtchgifRe = 0x59C308;
        total_game_time = 0x59C318;
        credits_required_bk_ram = 0x59C324;
        p1_match_count = 0x59C340;
        vs_match_count = 0x59C341;
        match_enemy_rank = 0x59C342;
        max_energy_1p = 0x59C343;
        max_energy_vs = 0x59C344;
        unused_unknown0 = 0x59C345;
        unused_enemy_r1_diff = 0x59C346;
        unused_enemy_r2_diff = 0x59C347;
        unused_enemy_r3_diff = 0x59C348;
        unused_enemy_r4_diff = 0x59C349;
        unused_enemy_r5_diff = 0x59C34A;
        unused_enemy_r6_diff = 0x59C34B;
        unused_enemy_r7_diff = 0x59C34C;
        unused_enemy_r8_diff = 0x59C34D;
        unused_enemy_r9_diff = 0x59C34E;
        unused_enemy_r10_diff = 0x59C34F;
        unused_enemy_r11_diff = 0x59C350;
        time_var_array_num = 0x59C351;
        country_val = 0x59C352;
        game_assign_byte_flag = 0x59C353;
        max_energy_vs_ram = 0x59C354;
        un_stage_width = 0x59C356;
        barrier_count = 0x59C358;
        TST_RED_ADD_bk_ram = 0x59C359;
        TST_GRN_ADD_bk_ram = 0x59C35A;
        TST_BLUE_ADD_bk_ram = 0x59C35B;
        TST_RED_MUL_bk_ram = 0x59C35C;
        TST_GRN_MUL_bk_ram = 0x59C35D;
        TST_BLUE_MUL_bk_ram = 0x59C35E;
        TST_B_BRIGHT_bk_ram = 0x59C35F;
        CREDIT_01 = 0x59C388;
        CREDIT_02 = 0x59C38C;
        chute_2 = 0x59C390;
        chute_1 = 0x59C394;
        coin_credits = 0x59C398;
        service_credits = 0x59C39C;
        play_time = 0x59C3A8;
        _1P_COUNT_A = 0x59C3B0;
        VS_COUNT_A = 0x59C3B4;
        game_time_1p = 0x59C3B8;
        wait_game_time = 0x59C3C8;
        min_time_1p = 0x59C400;
        max_time_1p = 0x59C404;
        continue_count_1p = 0x59C408;
        set_count = 0x59C40C;
        draw_count = 0x59C410;
        win_by_ko_count = 0x59C414;
        win_by_judge_count = 0x59C41C;
        min_vs_time_ram = 0x59C600;
        max_vs_time_ram = 0x59C604;
        continue_count_vs = 0x59C608;
        set_count_vs = 0x59C60C;
        draw_count_vs = 0x59C610;
        win_by_ko_count_vs = 0x59C614;
        win_by_judge_count_vs = 0x59C61C;
        warn_screen_check_str = 0x59CFE0;
        test_int = 0x59E040;
        test_float = 0x59E044;
        cvt_ir = 0x59E048;
        loop = 0x59E04C;
        instruction_buffer = 0x59F270;
        debug_menu_related = 0x59F274;
        num_motions_ram = 0x5A0000;
        list_motions_ram = 0x5A0004;
        intr_ram = 0x5FF000;
        prcb_ram = 0x5FF410;
        _intr_stack = 0x5FF500;
        stack_pointer_ram = 0x5FF640;
        _trap_stack = 0x5FF800;
        GEO_START = 0x800000;
        GEO_PROGRAM_START = 0x804000;
        COPRO_SHARC_IOP_START = 0x8C0000;
        BUFF_RAM_START = 0x900000;
        BUFF_RAM_01 = 0x908000;
        BUFF_RAM_02 = 0x910000;
        BUFF_RAM_03 = 0x918000;
        COPRO_CONTROL1_START = 0x980000;
        GEO_CTL1_START = 0x980008;
        COPRO_STATUS_START = 0x980014;
        MIDI_START = 0x9C0000;
        CPU_CONTROL_START = 0xE00000;
        IRQ_REQUEST_START = 0xE80000;
        IRQ_ENABLE_START = 0xE80004;
        TIMERS_START = 0xF00000;
        TIMER_02 = 0xF00004;
        TIMER_03 = 0xF00008;
        TIMER_04 = 0xF0000C;
        TILE_DATA_START = 0x1000000;
        CG_DATA_START = 0x1004000;
        scrB_H_page = 0x100A004;
        scrB_V_page = 0x100A00C;
        HSYNC_START = 0x1040000;
        VSYNC_START = 0x1060000;
        TMAPGFXBASE_START = 0x1080000;
        STAGE_PALETTE_DATA = 0x1800000;
        POLY_PALETTE_DATA = 0x1802000;
        COLORXLAT_START = 0x1810000;
        _3D_ZCLIP_START = 0x181C000;
        IO_PORTS = 0x1C00000;
        IO_BILLBOARD = 0x1C00008;
        analog_to_digital = 0x1C0001E;
        SERIAL_START = 0x1C80000;
        BACKUP_RAM_START = 0x1D00000;
        save_working_bk = 0x1D03000;
        RANKING_DATA = 0x1D03100;
        aKat_0 = 0x1D03104;
        aIta_0 = 0x1D03114;
        aDK_0 = 0x1D03124;
        aMor_0 = 0x1D03134;
        aOgu_0 = 0x1D03144;
        aIku_0 = 0x1D03154;
        aSug_0 = 0x1D03164;
        aYas_0 = 0x1D03174;
        aOh_0 = 0x1D03184;
        aTak_0 = 0x1D03194;
        aIwa_0 = 0x1D031A4;
        aWat_0 = 0x1D031B4;
        aMas_0 = 0x1D031C4;
        BEST_TIME_EACH_CHAR = 0x1D03280;
        aIku_1 = 0x1D03284;
        aSug_1 = 0x1D0328C;
        aYas_1 = 0x1D03294;
        aKat_1 = 0x1D0329C;
        aIta_1 = 0x1D032A4;
        aDK_1 = 0x1D032AC;
        aMor_1 = 0x1D032B4;
        aOgu_1 = 0x1D032BC;
        crc_value_bk = 0x1D03302;
        play_time_bak = 0x1D03304;
        short_0x12 = 0x1D03306;
        aInosehtchgifRe_0 = 0x1D03308;
        total_game_time_bk = 0x1D03318;
        CREDITS_REQUIRED = 0x1D03324;
        p1_match_count_bk = 0x1D03340;
        vs_match_count_bk = 0x1D03341;
        match_enemy_rank_bk = 0x1D03342;
        max_energy_1p_bk = 0x1D03343;
        max_energy_vs_bk = 0x1D03344;
        unused_unknown0_bk = 0x1D03345;
        unused_enemy_r1_diff_bak = 0x1D03346;
        unused_enemy_r2_diff_bak = 0x1D03347;
        unused_enemy_r3_diff_bak = 0x1D03348;
        unused_enemy_r4_diff_bak = 0x1D03349;
        unused_enemy_r5_diff_bak = 0x1D0334A;
        unused_enemy_r6_diff_bak = 0x1D0334B;
        unused_enemy_r7_diff_bak = 0x1D0334C;
        unused_enemy_r8_diff_bak = 0x1D0334D;
        unused_enemy_r9_diff_bak = 0x1D0334E;
        unused_enemy_r10_diff_bak = 0x1D0334F;
        unused_enemy_r11_diff_bak = 0x1D03350;
        time_var_array_num_bk = 0x1D03351;
        country_val_bk = 0x1D03352;
        game_assign_byte_flag_bk = 0x1D03353;
        max_energy_vs_array_bak = 0x1D03354;
        un_stage_width_bk = 0x1D03356;
        barrier_count_bk = 0x1D03358;
        TST_RED_ADD_bk = 0x1D03359;
        TST_GRN_ADD_bk = 0x1D0335A;
        TST_BLUE_ADD_bk = 0x1D0335B;
        TST_RED_MUL_bk = 0x1D0335C;
        TST_GRN_MUL_bk = 0x1D0335D;
        TST_BLUE_MUL_bk = 0x1D0335E;
        TST_B_BRIGHT_bk = 0x1D0335F;
        CREDIT_01_bk = 0x1D03388;
        CREDIT_02_bk = 0x1D0338C;
        bk_chute_2 = 0x1D03390;
        bk_chute_1 = 0x1D03394;
        bk_coin_credits = 0x1D03398;
        bk_service_credits = 0x1D0339C;
        play_time_bk = 0x1D033A8;
        bk_1P_COUNT_A = 0x1D033B0;
        VS_COUNT_A_bk = 0x1D033B4;
        game_time_1p_bk = 0x1D033B8;
        bk_vs_game_time = 0x1D033C0;
        wait_game_time_bk = 0x1D033C8;
        bk_1P_COUNT_B = 0x1D033F0;
        bk_VS_COUNT_B = 0x1D033F4;
        bk_P1_CONTI_B = 0x1D033F8;
        bk_VS_CONTI_B = 0x1D033FC;
        min_time_1p_bk = 0x1D03400;
        max_time_1p_bk = 0x1D03404;
        continue_count_1p_bk = 0x1D03408;
        set_count_bk = 0x1D0340C;
        draw_count_bk = 0x1D03410;
        win_by_ko_count_bk = 0x1D03414;
        win_by_judge_count_bk = 0x1D0341C;
        min_vs_time_bk = 0x1D03600;
        max_vs_time_bk = 0x1D03604;
        continue_count_vs_bk = 0x1D03608;
        set_count_vs_bk = 0x1D0360C;
        draw_count_vs_bk = 0x1D03610;
        win_by_ko_count_vs_bk = 0x1D03614;
        win_by_judge_count_vs_bk = 0x1D0361C;
        add_TILE_DATA_START = 0x20D000C;
        POLYGON_LIST_COUNT = 0x20E0000;
        max_poly = 0x20E0000;
        POLYGON_NUM_OFFSET = 0x20E0004;
        POLY_PALETTE_DATA_ROM = 0x2100000;
        texture_check_data = 0x2300000;
        offset_list_motions = 0x6400004;
        list_motions = 0x6400820;
        cg_offsets = 0x6480000;
        texture_palette_offsets = 0x6480300;
        num_motions_xtra = 0x6C00000;
        TEXRAM0_START = 0x11000000;
        textureram0 = 0x11100000;
        TEXRAM1_START = 0x11200000;
        textureram1 = 0x11300000;
        LUMA_START = 0x11400000;
        LUMA2_START = 0x12800000;
    } > ram
}

cs1 = -(system_address_table + prcb_ptr + start_ip);

/*
#*rom    1048576 32
#*move    $0
#*mkfill $0 $1.bin 0xff
#*split   $1.bin 1048576 32 524288 16 $1.bin
#*sh    python tools/data_extract.py --csum
*/