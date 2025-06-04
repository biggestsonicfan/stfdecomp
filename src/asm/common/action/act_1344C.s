        .section action
# =============== S U B R O U T I N E =======================================
ACT_1344C:                              # DATA XREF: ROM:0001D0CC↓o
    ldos    0x194(g7), r3
    mov     r3, g0
    call    search_shift_data_adr
    cmpobe  0, g0, loc_13460
    stob    r3, 0x60C(g7)
loc_13460:                              # CODE XREF: ACT_1344C+C↑j
    ret
# End of function ACT_1344C
