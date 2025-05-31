        .section mezase
# =============== S U B R O U T I N E =======================================
# mezase = "go toward"
MEZASE_DEATHEGG_INT:                    # DATA XREF: ROM:0000B0E4↑o
# FUNCTION CHUNK AT 0000E374 SIZE 00000378 BYTES
    shlo    7, 5, r15       # Label from official source
    st      r15, CTRL_TIMER
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    call    sub_56DA0
MEZASE_DEATHEGG_DSP:                    # DATA XREF: ROM:0000B0EC↑o
    call    sub_56DEC       # Label from official source
    ld      CTRL_TIMER, r14
    cmpobe  0, r14, loc_EE58
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# ---------------------------------------------------------------------------
loc_EE58:                               # CODE XREF: MEZASE_DEATHEGG_INT+30↑j
    ld      fa_camera, r3
    ld      0x0(r3), r15
    setbit  1, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    setbit  2, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  28, r15, r15
    st      r15, 0x0(r3)
    ld      0x0(r3), r15
    clrbit  29, r15, r15
    st      r15, 0x0(r3)
    ld      0x5004C8, r15
    clrbit  31, r15, r15
    st      r15, 0x5004C8
    b       next_program
# End of function MEZASE_DEATHEGG_INT
