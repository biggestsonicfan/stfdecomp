    .global BUFF_RAM_ADDS
    .global _INTR_ram__am1_users2_yasuda_mb_src_init_0
                .text
_INTR_ram__am1_users2_yasuda_mb_src_init_0:
                lda     BUFF_RAM_START, r14 # Label from Motor Raid source
                mov     0, r15
                shlo    0xF, 1, r13     # Initialize count: r13 = 0x8000
buff_ram_clear_loop:                    # CODE XREF: _INTR_ram__am1_users2_yasuda_mb_src_init_0+1C↓j
                st      r15, (r14)      # write 0
                lda     4(r14), r14     # increment r14 by 4
                cmpdeco 1, r13, r13     # decrement r13 by 1
                bl      buff_ram_clear_loop # loop until r13=0
                lda     0x7800F0F, r5
                lda     BUFF_RAM_ADDS, r3
                ld      (r3), r4        # load BUFF_RAM_START to r4
                st      r5, (r4)        # write 0x7800F0F to BUFF_RAM_START
                ld      4(r3), r4       # load BUFF_RAM_START+0x04 to r4
                st      r5, (r4)        # write 0x7800F0F to BUFF_RAM_START+0x04
                ld      8(r3), r4       # load BUFF_RAM_START+0x08 to r4
                st      r5, (r4)        # write 0x7800F0F to BUFF_RAM_START+0x08
                ld      0xC(r3), r4     # load BUFF_RAM_START+0x0C to r4
                st      r5, (r4)        # write 0x7800F0F to BUFF_RAM_START+0x0C
                ret                     # Return to 0x1E4
