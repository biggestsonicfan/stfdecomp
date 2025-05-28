#   ---
#   --- copy the interrupt table to RAM
#   ---
                .text
                lda     1028, g0            #   load length of intr table
                lda     0, g4               #   initialize offset to a
                lda     intr_table, g1      #   load source
                lda     intr_ram, g2        #   load addrss of new table
                bal     move_data           #   branch to move routine
