#   ---                                            
#   --- fix up the PRCB to point to a new interrupt table
#   ---
        .section fix_prcb
    lda     intr_ram, g12
    st      g12, 20(g2)
                