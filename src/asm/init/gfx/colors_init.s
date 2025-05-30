        .global make_lay_col_256_tbl
        .section colors_init
# =============== S U B R O U T I N E =======================================
make_lay_col_256_tbl_demon:             # CODE XREF: main_loop+48↓p
    ldob    TST_RED_ADD, r13 # Label from official source
    ldob    TST_RED_ADD_RAM, r14
    cmpobne r13, r14, make_lay_col_256_tbl
    ldob    TST_RED_MUL, r13
    ldob    TST_RED_MUL_RAM, r14
    cmpobne r13, r14, make_lay_col_256_tbl
    ldob    TST_GRN_ADD, r13
    ldob    TST_GRN_ADD_RAM, r14
    cmpobne r13, r14, make_lay_col_256_tbl
    ldob    TST_GRN_MUL, r13
    ldob    TST_GRN_MUL_RAM, r14
    cmpobne r13, r14, make_lay_col_256_tbl
    ldob    TST_BLUE_ADD, r13
    ldob    TST_BLUE_ADD_RAM, r14
    cmpobne r13, r14, make_lay_col_256_tbl
    ldob    TST_BLUE_MUL, r13
    ldob    TST_BLUE_MUL_RAM, r14
    cmpobne r13, r14, make_lay_col_256_tbl
    ldob    RED, r13
    ldob    RED_RAM, r14
    cmpobne r13, r14, make_lay_col_256_tbl
    ldob    GREEN, r13
    ldob    GREEN_RAM, r14
    cmpobne r13, r14, make_lay_col_256_tbl
    ldob    BLUE, r13
    ldob    BLUE_RAM, r14
    cmpobne r13, r14, make_lay_col_256_tbl
    ret
# End of function make_lay_col_256_tbl_demon
# =============== S U B R O U T I N E =======================================
make_lay_col_256_tbl:                   # CODE XREF: make_lay_col_256_tbl_demon+10↑j
    ldib    TST_RED_ADD, r15 # Label from official source
    stib    r15, TST_RED_ADD_RAM
    ldib    TST_RED_MUL, r15
    stib    r15, TST_RED_MUL_RAM
    ldib    TST_GRN_ADD, r15
    stib    r15, TST_GRN_ADD_RAM
    ldib    TST_GRN_MUL, r15
    stib    r15, TST_GRN_MUL_RAM
    ldib    TST_BLUE_ADD, r15
    stib    r15, TST_BLUE_ADD_RAM
    ldib    TST_BLUE_MUL, r15
    stib    r15, TST_BLUE_MUL_RAM
    ldib    RED, r15
    stib    r15, RED_RAM
    ldib    GREEN, r15
    stib    r15, GREEN_RAM
    ldib    BLUE, r15
    stib    r15, BLUE_RAM
    ldob    TST_RED_MUL, g4
    ldob    TST_RED_ADD, g5
    ldob    RED, g6
    lda     ARRAY_NUM_RED, g7
    call    color_intensity
    ldob    TST_GRN_MUL, g4
    ldob    TST_GRN_ADD, g5
    ldob    GREEN, g6
    lda     ARRAY_NUM_GREEN, g7
    call    color_intensity
    ldob    TST_BLUE_MUL, g4
    ldob    TST_BLUE_ADD, g5
    ldob    BLUE, g6
    lda     ARRAY_NUM_BLUE, g7
    call    color_intensity
    ret
# End of function make_lay_col_256_tbl
# =============== S U B R O U T I N E =======================================
color_intensity:                        # CODE XREF: make_lay_col_256_tbl+B0↑p
    lda     0xFF, r6        # Sets Environmental Texture Brightness
    mov     0, r8
loc_768:                                # CODE XREF: color_intensity+4C↓j
    shlo    2, 0x1D, r15
    subi    r15, r8, r3
    muli    g4, r3, r3
    addo    31, 6, r15
    divi    r15, r3, r3
    addi    g5, r3, r3
    cmpibl  0, r3, loc_78C
    mov     0, r3
    b       loc_7A0
# ---------------------------------------------------------------------------
loc_78C:                                # CODE XREF: color_intensity+20↑j
    shlo    8, 1, r15
    cmpobl  r3, r15, loc_798
    subo    1, 0, r3
loc_798:                                # CODE XREF: color_intensity+30↑j
    mulo    g6, r3, r3
    shro    7, r3, r3
loc_7A0:                                # CODE XREF: color_intensity+28↑j
    stos    r3, (g7)
    addo    2, g7, g7
    cmpinco r6, r8, r8
    bg      loc_768
    ret
# End of function color_intensity
