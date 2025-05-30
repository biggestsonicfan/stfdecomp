            .section clear_buffer
# =============== S U B R O U T I N E =======================================
clear_buffer_ptr:                       # CODE XREF: main_loop+5C↑p
    lda     buffer_ptr, r14 # Label from official source
    mov     0, r15
    addo    0x1F, 0xC, r13  # r13 = 0x2B or 43
loc_74D0:                               # CODE XREF: clear_buffer_ptr+1C↓j
    st      r15, (r14)
    lda     4(r14), r14
    cmpdeco 1, r13, r13
    bl      loc_74D0
    ret
# End of function clear_buffer_ptr
