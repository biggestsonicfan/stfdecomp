#   ---
#   --- Check if the warning screen has been displayed on boot
#   --- and if it has then skip initializing the coprocessors
#   ---
    .global _INTR_ram__am1_users2_yasuda_mb_src_init_0
                .text
                call    warn_screen_show_check  
                st      g0, SKIP_WARNING
                cmpobne 0, g0, skip_copro_init
                call    copro_down
                lda     700000, r3
copro_init_wait:                                # CODE XREF: start_ip+128↓j
                cmpdeco 1, r3, r3       # decrement r3 700000 times...
                bl      copro_init_wait
                call    copro_down2
skip_copro_init:                                # CODE XREF: start_ip+114↑j
                call    _INTR_ram__am1_users2_yasuda_mb_src_init_0
# End of function start_ip
