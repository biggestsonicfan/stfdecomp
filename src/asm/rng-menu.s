# Segment type: Pure code
# ================ INSTRUCTIONS =============================================
# replace `bl      mothead_check` with `call    CHECK_MOD_INT` in `mothead_error_disp`
# replace `call    user_always` with `call    start_check` in `main_loop`
# insert `.include     "rng-menu/rng-menu.asm"` at the end of out-mod.asm but before `byte_F2234:     .fill 0xDDCC, 1, 0xFF`
# !--REMEMBER--! `.ascii` values must end in a multiple of 4, including the tailing <0>.
# If strings do not end in a multiple of 4, pad the code with `.byte 0` until it becomes a multiple of 4.
#HOTDO values writing to serial:
#IRQ_REQUEST: 0x00000439 IRQ_ENABLE: 0x00000019
.data
        .extern write_sw
        .extern change_bg_color
        .extern bg_col_set
        .extern clr_pattern_s
        .extern _Scroll_Initialize
        .extern dsp_pattern_new
        .extern dsp_mes_2x3
        .extern print_mes
        .extern print_hex_w
        .extern byte_80

        .global write_sw_alt
        .global CHECK_MOD_INT
        
# ---------------------------------------------------------------------------
write_sw_alt:  call    write_sw
               call    some_io_thing
               ret
# ---------------------------------------------------------------------------
               lda     0x1C00000, r11
               stob    g0, 0x14(r11)
               mov     0, r3
               stob    r3, 0x12(r11)
               call    inner_io_thing
               ldob    0x16(r11), r3
               ldob    0x18(r11), r3
               lda     byte_80+0x7, r3
               stob    r3, 0x12(r11)
               call    inner_io_thing
               ldob    0x16(r11), r3
               ldob    0x18(r11), r7
               stob    g1, 0x14(r11)
               mov     0, r3
               stob    r3, 0x12(r11)
               call    inner_io_thing
               ldob    0x16(r11), r3
               ldob    0x18(r11), r3
               lda     byte_80+0x7, r3
               stob    r3, 0x12(r11)
               call    inner_io_thing
               ldob    0x16(r11), r3
               ldob    0x18(r11), r8
               mov     3, r9
               and     r9, r8, r8
               shlo    8, r8, r8
               or      r8, r7, g0
               ret
# =============== S U B R O U T I N E =======================================
inner_io_thing:                              # CODE XREF: ROM:000F2254↑p
                                         # ROM:000F226C↑p ...
                lda     IO_PORTS, r10
                mov     0xC, r4
                ldob    0x1A(r10), r6
                and     r4, r6, r6
                cmpi    r4, r6
                be      inner_io_exit

inner_io_exit:                              # CODE XREF: sub_F22BC+18↑j
                ret
# End of function sub_F22BC
# =============== S U B R O U T I N E =======================================
some_io_thing:                              # CODE XREF: ROM:000F2238↑p
                lda     IO_PORTS, r11
                ld      INTERUPT_FLAGS_HELD, g0
                shro    8, g0, g0
                stob    g0, 0x14(r11)
                stob    g0, 0x12(r11)
                call    inner_io_thing
                ldob    0x16(r11), r3
                ldob    0x18(r11), r7
                call    inner_io_thing
                lda     random, r3
                stob    r7, (r3)
                ret
# End of function sub_F22DC
# ---------------------------------------------------------------------------
 CHECK_MOD_INT:   ld      INTERUPT_FLAGS_HELD, r8
                bbc     0xD, r8, BSF_MOD_START
                bbs     0xD, r8, BSF_LOOP_EXIT
                ret
# ---------------------------------------------------------------------------
BSF_MOD_START:                              # CODE XREF: ROM:000F2320↑j
                mov     0, g0
                shlo    0xF, 1, g1
                lda     0x1004000, g2
                call    change_bg_color
                call    bg_col_set
                lda     0x1000000, g9
                addo    0x1F, 0x1F, g0
                addo    0x1F, 0x11, g1
                call    clr_pattern_s
                lda     174, g0
                call    _Scroll_Initialize
                lda     0x1000110, g9
                lda     513, g0
                call    dsp_pattern_new
                lda     0x1001226, g9
                lda     aRngSeedMod, g0  # " SERIAL MOD "
                call    dsp_mes_2x3
                lda     0x1001616, g9
                lda     aModExplained, g0 # "EXIT WITH P1 START, REBOOT WITH P2 STAR"...
                call    print_mes
BSF_LOOP:                              # CODE XREF: ROM:000F23AC↓j
                ld      INTERUPT_FLAGS_MOMENTARY, r8
                call    sub_F23B8
                chkbit  5, r8
                bo      start_ip
                bbc     4, r8, BSF_LOOP
BSF_LOOP_EXIT:                              # CODE XREF: ROM:000F2324↑j
                mov     0, r11
                ret
# =============== S U B R O U T I N E =======================================
sub_F23B8:                              # CODE XREF: ROM:000F23A0↑p
                ld      INTERUPT_FLAGS_MOMENTARY, r7
                call    sub_F2400
                call    sub_F23D0
                bbs     9, r7, loc_F2468
                ret
# End of function sub_F23B8
# =============== S U B R O U T I N E =======================================
sub_F23D0:                              # CODE XREF: sub_F23B8+C↑p
                lda     0x1000002, g9
                ld      INTERUPT_FLAGS_HELD, g0
                shro    8, g0, g0
                call    print_hex_w
                ld      item_input_rec, r15
                ld      (r15), g9
                addo    4, r15, g0
                call    print_mes
                ret
# End of function sub_F23D0
# =============== S U B R O U T I N E =======================================
sub_F2400:                              # CODE XREF: sub_F23B8+8↑p
                lda     0x1000102, g9
                ld      random, g0
                mov     g0, g3
                call    print_hex_w
                ld      item_rec_serial, r15
                ld      (r15), g9
                addo    4, r15, g0
                call    print_mes
                ret
# End of function sub_F2400
# ---------------------------------------------------------------------------
                lda     0x1C00000, r11
                ldob    0x18(r11), g3
                cmpobe  0, g3, loc_F2464
                mov     g3, g0
                lda     0x1000102, g9
                call    print_hex_w
                ld      item_rec_serial, r15
                ld      (r15), g9
                addo    4, r15, g0
                call    print_mes
loc_F2464:                              # CODE XREF: ROM:000F243C↑j
                ret
# ---------------------------------------------------------------------------
loc_F2468:                              # CODE XREF: sub_F23B8+10↑j
                ret
# ---------------------------------------------------------------------------
item_rng_seed:	        .long l_rng_seed
item_rec_serial:        .long l_rec_serial       # DATA XREF: sub_F2400+18↑r
                                        # ROM:000F2450↑r
item_input_rec:         .long l_input_rec       # DATA XREF: sub_F23D0+18↑r
l_rng_seed:             .long 0x1000012         # DATA XREF: ROM:000F246C↑o
aRngSeed:               .asciz " = RNG SEED"
l_rec_serial:           .long 0x1000112         # DATA XREF: ROM:off_F2470↑o
rec_serial:             .asciz " RECIEVED FROM SERIAL  "
l_input_rec:            .long 0x1000012         # DATA XREF: ROM:off_F2474↑o
aInputFlag:             .asciz " = INPUT FLAG  "
aRngSeedMod:            .asciz " SERIAL MOD "
aModExplained:.asciz "EXIT WITH P1 START, REBOOT WITH P2 START"
