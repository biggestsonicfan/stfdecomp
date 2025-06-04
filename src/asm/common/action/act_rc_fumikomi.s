        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_FUMIKOMI:                        # DATA XREF: ROM:0001D078↓o
    ldos    0x1AA(g7), r13  # Label from official source
    ldos    0x800(g7), r14
    cmpobl  r13, r14, loc_137E0
    mov     0, r15
    st      r15, 0x19C(g7)
loc_137E0:                              # CODE XREF: ACT_RC_FUMIKOMI+8↑j
    ret
# End of function ACT_RC_FUMIKOMI
