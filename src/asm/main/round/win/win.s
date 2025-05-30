        .section win
# =============== S U B R O U T I N E =======================================
WIN_CLOSE_INT:                          # DATA XREF: ROM:0000B0A4↑o
    lda     check_word4+3, r15 # Label from official source
    stib    r15, draw_vs_routine_flag
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# End of function WIN_CLOSE_INT
# =============== S U B R O U T I N E =======================================
WIN_CLOSE_DSP:                          # DATA XREF: ROM:0000B0AC↑o
    ldos    0x500468, r14 # Label from official source
    cmpibe  0, r14, WIN_CLOSE_countdown
    b       next_program
# ---------------------------------------------------------------------------
WIN_CLOSE_countdown:                    # CODE XREF: WIN_CLOSE_DSP+8↑j
    b       game_sub_ex     # Subtracts 1 from CTRL_TIMER
# End of function WIN_CLOSE_DSP
