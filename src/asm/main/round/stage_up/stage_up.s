    .section stage_up
STAGE_UP_INT:                           # DATA XREF: ROM:0000B0B4↑o
    call    ROUND_INIT      # Label from official source
    mov     0, r15
    stis    r15, 0x500432
    shlo    7, 7, r15
    st      r15, CTRL_TIMER
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    call    bossm_init
    ret
# End of function STAGE_UP_INT
# =============== S U B R O U T I N E =======================================
STAGE_UP_DSP:                           # DATA XREF: ROM:0000B0BC↑o
    ld      CTRL_TIMER, r3  # Label from official source
    subo    1, r3, r3
    st      r3, CTRL_TIMER
    cmpibl  0, r3, loc_EBBC
    b       loc_BDE0
# ---------------------------------------------------------------------------
loc_EBBC:                               # CODE XREF: STAGE_UP_DSP+14↑j
    ret
# End of function STAGE_UP_DSP
