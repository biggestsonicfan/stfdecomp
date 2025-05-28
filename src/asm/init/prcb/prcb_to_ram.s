#   ---
#   --- Processor will copy PRCB to ram space, located at prcb_ram
#   ---
                .text
                lda     176, g0             #   load length of prcb
                lda     0, g4               #   initialize offset to 0
                lda     prcb_ptr, g1        #   load source
                lda     prcb_ram, g2        #   load destination
                bal     move_data           #   branch to move routine
