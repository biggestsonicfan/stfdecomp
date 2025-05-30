        .section credit_check
check_credit_start:                     # Label from official source
    mov     0, g0
    ld      debug_flag, r15
    bbs     1, r15, loc_84F4
    ld      INTERUPT_FLAGS_MOMENTARY, g0
    xor     r3, r3, r3
    ld      INTERUPT_FLAGS_MOMENTARY, r15
    bbc     4, r15, loc_84E0
    setbit  4, r3, r3
loc_84E0:                               # CODE XREF: ROM:000084D8↑j
    ld      INTERUPT_FLAGS_MOMENTARY, r15
    bbc     5, r15, loc_84F0
    setbit  5, r3, r3
loc_84F0:                               # CODE XREF: ROM:000084E8↑j
    and     r3, g0, g0
loc_84F4:                               # CODE XREF: ROM:000084C0↑j
    ret

        .section dec_credit
dec_credit_start:                       # Label from Fighting Vipers source
    ret
