#   ---   Processor starts execution at this spot after reset.
#   ---
    .global start_ip
    .text
start_ip:


                lda     CPU_CONTROL_START, g0 # Label from official source
                lda     _wait_data, g1
                subo    1, 0, g3        # g3 = 0xFFFFFFFF or -1
loc_C4:                                 # CODE XREF: start_ip+2C↓j
                ld      (g1), g2        # g2 = 4
                cmpo    g2, g3          # compare g2 and g3
loc_CC:                                 # branch to clear_RAMBASE if g2 = g3
                be      clear_RAMBASE
                st      g2, (g0)
                addo    4, g0, g0
                addo    4, g1, g1
                b       loc_C4
# ---------------------------------------------------------------------------
clear_RAMBASE:                          # CODE XREF: start_ip:loc_CC↑j
                lda     RAMBASE_START, r14
                mov     0, r15
                lda     160760, r13     # loop counter r13 = 160760 loops
loc_F4:                                 # CODE XREF: start_ip:loc_100↓j
                st      r15, (r14)      # store 0 in RAMBASE address at offset r14
                lda     4(r14), r14     # r14 = r14+0x04
                cmpdeco 1, r13, r13     # decrement loop counter
loc_100:                                # DATA XREF: camera_init+96C↓o
                bl      loc_F4          # loop finishes at 0x59CFE0
loc_104:                                # Start new loop at 0x59D000
                lda     0x59D000, r14
                mov     0, r15          # We're storing 0 again
                lda     101376, r13     # init loop counter r13 for 101376 loops
loc_118:                                # CODE XREF: start_ip+74↓j
                st      r15, (r14)      # store 0 in RAMBASE address at offset r14
                lda     4(r14), r14     # r14 = r14+0x04
                cmpdeco 1, r13, r13     # decrement loop counter
                bl      loc_118         # loop finishes at 0x600000
                mov     2, r5
                stob    r5, 0x500F00
                lda     0x10F00000, r15 # MAME says this is 0x11000000
                st      r15, texram_0
                lda     0x11100000, r15
loc_14C:                                # DATA XREF: ROM:0005CA30↓o
                st      r15, texram_0_1
                lda     0x11300000, r15
                st      r15, texram_1
                lda     LUMA_START, r15
                st      r15, luma_ram

#   ---
#   --- copy the interrupt table to RAM
#   ---

                lda     1028, g0            #   load length of into table
                lda     0, g4               #   initialize offset to a
                lda     intr_table, g1      #   load source
                lda     intr_ram, g2        #   load addrss of new table
                bal     move_data           #   branch to move routine

#   ---
#   --- Processor will copy PRCB to ram space, located at prcb_ram
#   ---

                lda     176, g0             #   load length of prcb
                lda     0, g4               #   initialize offset to 0
                lda     prcb_ptr, g1        #   load source
                lda     prcb_ram, g2        #   load destination
                bal     move_data           #   branch to move routine
#   ---                                            
#   --- fix up the PRCB to point to a new interrupt table
#   ---

                lda     intr_ram, g12
                st      g12, 20(g2)
#   --- 
#   --- At this point, the prcb, and interrupt table have
#   --- been moved to RAM. It is time
#   --- 


                call    warn_screen_show_check
                st      g0, SKIP_WARNING
                cmpobne 0, g0, loc_1E0
                call    copro_down
                lda     700000, r3
loc_1D4:                                # CODE XREF: start_ip+128↓j
                cmpdeco 1, r3, r3       # decrement r3 700000 times...
                bl      loc_1D4
                call    copro_down2
loc_1E0:                                # CODE XREF: start_ip+114↑j
                call    _INTR_ram__am1_users2_yasuda_mb_src_init_0
# End of function start_ip
