.data

.global ADV_MOVIE_INT_FV
.global ADV_MOVIE_DSP_FV

# ---------------------------------------------------------------------------
ADV_MOVIE_INT_FV:                          # DATA XREF: ROM:00008504↑o
                lda     0xA00001, g0    # Label from official source
                call    check_same_sound
# ---------------------------------------------------------------------------
                call    sound_request_u
# ---------------------------------------------------------------------------
                lda     0xAE1000, g0
                call    check_same_sound
# ---------------------------------------------------------------------------
                call    sound_request_u
# ---------------------------------------------------------------------------
                mov     0, r4
                stob    r4, 0x500055
                st      r4, 0x5003E4
                st      r4, 0x5003EC
                stob    r4, 0x500405
                stob    r4, 0x50040F
                lda     0x4059999A, r4
                st      r4, 0x5003F4
                ld      not_scr_bg_move, r15
                clrbit  0x10, r15, r15
                st      r15, not_scr_bg_move
                ld      not_scr_bg_move, r15
                clrbit  0xE, r15, r15
                st      r15, not_scr_bg_move
                call    fill_haikei_makkuro_1
# ---------------------------------------------------------------------------
                shlo    2, 0x17, g0
                call    _Scroll_Initialize
# ---------------------------------------------------------------------------
                lda     byte_80+0xE, g0
                call    _Scroll_Initialize
# ---------------------------------------------------------------------------
                lda     0x1000000, g9
                addo    0x1F, 0x1F, g0
                addo    0x1F, 0x11, g1
                call    clr_pattern_s
# ---------------------------------------------------------------------------
                ld      mod_fa_game_disp, r3
                ld      (r3), r4
                setbit  0x1E, r4, r4
                setbit  0x17, r4, r4
                clrbit  0x14, r4, r4
                setbit  0x19, r4, r4
                st      r4, (r3)
                ldob    0x50040E, r3
                cmpobne 0, r3, ami_timer_put2
ami_timer_put1:                         # Label from official source
                lda     1800, r15
                st      r15, CTRL_TIMER
                b       ami_timer_set
# ---------------------------------------------------------------------------
ami_timer_put2:                         # CODE XREF: ROM:000091D0↑j
                lda     2740, r15       # Label from official source
                st      r15, CTRL_TIMER
ami_timer_set:                          # CODE XREF: ROM:000091E0↑j
                lda     0x438C0000, r15
                st      r15, focus_dist_x
                lda     0x438C0000, r15
                st      r15, focus_dist_y
                mov     0, r15
                stis    r15, scrB_H_page
                mov     0, r15
                stis    r15, scrB_V_page
                ld      fa_camera, r3   # Label from official source
                ld      (r3), r15
                clrbit  14, r15, r15
                st      r15, (r3)
                ld      (r3), r15
                setbit  1, r15, r15
                st      r15, (r3)
                ld      (r3), r15
                setbit  2, r15, r15
                st      r15, (r3)
                ld      (r3), r15
                clrbit  15, r15, r15
                st      r15, (r3)
                ld      (r3), r15
                clrbit  16, r15, r15
                st      r15, (r3)
                ld      (r3), r15
                clrbit  17, r15, r15
                st      r15, (r3)
                ld      (r3), r15
                clrbit  18, r15, r15
                st      r15, (r3)
                ld      (r3), r15
                clrbit  19, r15, r15
                st      r15, (r3)
                ld      (r3), r15
                clrbit  20, r15, r15
                st      r15, (r3)
                lda     dword_8+3, r15
                stib    r15, 0x40(r3)
                lda     start_ip_add, r15
                stib    r15, 0x40(r3)
                mov     11, r15
                stib    r15, stage_num
                call    change_scene
                ldob    adv_movie_cheat, r4
                cmpobe  0, r4, loc_928C
                lda     fv_intro_cam, r15
                st      r15, 0x210(r3)
                b       loc_9298
# ---------------------------------------------------------------------------
loc_928C:                               # CODE XREF: ROM:00009278↑j
                lda     fv_intro_cam, r15
                st      r15, 0x210(r3)
loc_9298:                               # CODE XREF: ROM:00009288↑j
                ldob    _20K_PLAYS_FLAG, r4
                cmpobe  0, r4, loc_92B0
                lda     fv_intro_cam, r15
                st      r15, 0x210(r3)
loc_92B0:                               # CODE XREF: ROM:000092A0↑j
                call    un_move_camera_a_bit  # This is the meat and potatoes
# ---------------------------------------------------------------------------
                ld      add_BACKUP_RAM_TO_RAM, r15
                ld      0x3320(r15), r15
                bbs     0, r15, loc_92D0
                lda     0x10016DA, g9
loc_92D0:                               # CODE XREF: ROM:000092C4↑j
                ldib    _sub_mode, r15
                lda     1(r15), r15
                stib    r15, _sub_mode
                call    fill_haikei_makkuro
# ---------------------------------------------------------------------------
                ld      not_scr_bg_move, r15
                setbit  0xE, r15, r15
                st      r15, not_scr_bg_move
                mov     0, r15
                stis    r15, 0x100A000
                mov     0, r15
                stis    r15, 0x100A008
                mov     0, r4
                lda     0x1002000, r8
                shlo    0xA, 3, r10
loc_53588:                              # CODE XREF: sub_5354C+48↓j
                stis    r4, (r8)
                addo    2, r8, r8
                cmpdeco 1, r10, r10
                bl      loc_53588
# ---------------------------------------------------------------------------
change_color_table_normal:              # CODE XREF: ROM:000092EC↓p
                ld      0x57100C, r15 # Label from official source
                clrbit  1, r15, r15
                st      r15, 0x57100C
                call    chg_pol_color_req
                mov     1, r4
                ld      mod_fa_effect, r3
                ld      (r3), r5
                setbit  0x1F, r5, r5
                st      r5, (r3)
                lda     efc_init, r5
                st      r5, 0xC(r3)
                call    efc_rob_poly_para_init
# ---------------------------------------------------------------------------
                mov     1, r4
                ld      mod_fa_effect, r3
                ld      (r3), r5
                clrbit  0x1F, r5, r5
                st      r5, (r3)
ADV_MOVIE_DSP_FV:                          # DATA XREF: ROM:0000850C↑o
                call    adv_movie_cont_fv  # Label from official source
                lda     44, g0
                call    _Scroll_Initialize
                call    un_set_someting_idk
                call    un_alters_background_layers
                #call    un_character_name_graphics
# ---------------------------------------------------------------------------
                ld      CTRL_TIMER, r3
                subi    1, r3, r3
                st      r3, CTRL_TIMER
                cmpobne 0x14, r3, loc_934C
loc_934C:                               # CODE XREF: ROM:00009348↑j
                cmpobne 0, r3, loc_93C8
                mov     0, r15
                stib    r15, POLYGON_DISP
                ld      fa_rob0, r3
                ld      (r3), r4
                clrbit  0x17, r4, r4
                clrbit  0x16, r4, r4
                setbit  0x1A, r4, r4
                st      r4, (r3)
                ld      fa_rob1, r3
                ld      (r3), r4
                clrbit  0x17, r4, r4
                clrbit  0x16, r4, r4
                setbit  0x1A, r4, r4
                st      r4, (r3)
                lda     0xA00360, g0
                call    sound_request_u
# ---------------------------------------------------------------------------
                ld      debug_flag, r15
                clrbit  16, r15, r15
                st      r15, debug_flag
                #ldib    _sub_mode, r15
                #lda     1(r15), r15
                #stib    r15, _sub_mode
loc_93C8:                               # CODE XREF: ROM:loc_934C↑j
                addo    31, 7, r3
                ld      CTRL_TIMER, r4
                cmpobne r3, r4, loc_93E0
                lda     44, g0
                call    _Scroll_Initialize
# ---------------------------------------------------------------------------
loc_93E0:                               # CODE XREF: ROM:000093D4↑j
                ld      0x5003E4, r4
                addi    1, r4, r4
                st      r4, 0x5003E4
                ret
# =============== S U B R O U T I N E =======================================
# Attributes: noreturn
efc_init:                               # DATA XREF: ROM:00009308↑o
                                        # ROM:00009AD8↑o ...
                call    efc_ram_init    # Label from official source
                lda     efc_cont, r15
                st      r15, 0xC(g13)
                ret
                