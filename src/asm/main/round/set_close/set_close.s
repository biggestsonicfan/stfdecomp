    .section close
# =============== S U B R O U T I N E =======================================
set_close:                              # CODE XREF: ROUND_DSP+15A8↑p
    ld      fa_rob0, r7     # Label from Fighting Vipers source
    ld      fa_rob1, r8
    ld      0x0(r7), r15
    clrbit  27, r15, r15
    st      r15, 0x0(r7)
    ld      0x0(r8), r15
    clrbit  27, r15, r15
    st      r15, 0x0(r8)
    ret
# End of function set_close
# =============== S U B R O U T I N E =======================================
# return
close_obj:                              # CODE XREF: INTRUDE_DSP+5C↑p
    ret                     # Label from Fighting Vipers source
# End of function close_obj
