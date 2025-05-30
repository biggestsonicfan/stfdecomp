        .extern clr_pattern_s
        .section test_mode
# =============== S U B R O U T I N E =======================================
test_sw_chk:                            # CODE XREF: main_loop+6C↑p
        ld      INTERUPT_FLAGS_MOMENTARY, r8 # Label from official source
        bbs     26, r8, init_test
        bbs     2, r8, init_test
        b       loc_7C5C        # return
# ---------------------------------------------------------------------------
init_test:                              # CODE XREF: test_sw_chk+8↑j
        ldob    mode, r14
        cmpobe  17, r14, exit_test # if mode is 17, exit test menu
        mov     16, r15
        stib    r15, mode       # Set mode to 16
        b       loc_7C5C        # return
# ---------------------------------------------------------------------------
exit_test:                              # CODE XREF: test_sw_chk+1C↑j
        ldob    TEST_MENU_FLAG, r3
        cmpobne 0, r3, loc_7C5C # return
        lda     0x1000000, g9
        shlo    6, 1, g0
        addo    0x1F, 0x11, g1
        call    clr_pattern_s
        ld      mod_fa_control0, r3
        ld      0x0(r3), r15
        clrbit  0, r15, r15
        st      r15, 0x0(r3)
        ld      0x0(r3), r15
        clrbit  1, r15, r15
        st      r15, 0x0(r3)
        mov     0, r15
        st      r15, INTERUPT_FLAGS_MOMEN_ON_REL
        mov     0, r15
        st      r15, INTERUPT_FLAGS_MOMENTARY
        mov     0, r15
        st      r15, INTERUPT_FLAGS_HELD
        mov     0, r15
        st      r15, INTERUPT_FLAGS_HELD_PREV_FRAME
        lda     IRQ_ENABLE_START, r3
        mov     0, r4
        st      r4, (r3)
        call    warn_screen_no_show_write
        b       start_ip
# ---------------------------------------------------------------------------
loc_7C5C:                               # CODE XREF: test_sw_chk+10↑j
        ret                     # return
# End of function test_sw_chk
