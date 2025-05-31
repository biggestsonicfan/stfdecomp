        .section end
all_end:                                # CODE XREF: ROM:000111E0↓j
    call    bookkeep_all_end # Label from official source
    mov     0, r15
    stib    r15, 0x500056
    ldob    time, r3
    shlo    2, 0x19, r13
    mulo    r13, r3, r3
    stos    r3, 0x50006E
    mov     0, r15
    stis    r15, 0x5000A2
    ld      not_scr_bg_move, r15
    clrbit  2, r15, r15
    st      r15, not_scr_bg_move
    ld      not_scr_bg_move, r15
    clrbit  3, r15, r15
    st      r15, not_scr_bg_move
    mov     2, r15
    stib    r15, mode
    mov     0, r15
    st      r15, 0x5001C0
    mov     0, r15
    stis    r15, rank_mode
    ld      select0_flag, r15
    clrbit  2, r15, r15
    st      r15, select0_flag
    ld      select1_flag, r15
    clrbit  2, r15, r15
    st      r15, select1_flag
    call    set_close
    call    interrupt_wait
    ret
    