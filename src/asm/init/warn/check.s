        .globl warn_screen_show_check
        .section warn_screen_check
warn_screen_show_check:                 # CODE XREF: start_ip+108↑p
                ldq     warn_screen_check_str, r4
                lda     0x52455320, r8
                lda     0x4E4C2053, r9
                lda     0x4E204544, r10
                lda     0x20514555, r11
                cmpobne r4, r8, warn_screen_show_check_fails
                cmpobne r5, r9, warn_screen_show_check_fails
                cmpobne r6, r10, warn_screen_show_check_fails
                cmpobne r7, r11, warn_screen_show_check_fails
                subo    1, 0, g0
                b       blank_warn_screen_check_str
# ---------------------------------------------------------------------------
warn_screen_show_check_fails:           # CODE XREF: warn_screen_show_check+28↑j
                mov     0, g0
blank_warn_screen_check_str:            # CODE XREF: warn_screen_show_check+3C↑j
                mov     0, r4
                mov     r4, r5
                mov     r5, r6
                mov     r6, r7
                stq     r4, warn_screen_check_str
                ret

