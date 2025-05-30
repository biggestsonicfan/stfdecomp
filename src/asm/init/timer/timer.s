        .section timer_manip
# =============== S U B R O U T I N E =======================================
timer_manipulation:                     # CODE XREF: check_timer_4+24↓p
    lda     0xFFFFF, r3
    st      r3, TIMER_04
    ldl     TIMER_03, r4
    and     r3, r5, r5
    mulo    0x19, g0, r4
    subo    r4, r3, r4
    subi    r4, r5, r5
    cmpibl  0, r5, loc_C28
    mov     1, g0
    stob    g0, 0x50008C
    ret
# ---------------------------------------------------------------------------
loc_C28:                                # CODE XREF: timer_manipulation+28↑j
    mov     0, g0
    stob    g0, 0x50008C
    st      r5, TIMER_04
    ret
# End of function timer_manipulation
        .section timer_func
# =============== S U B R O U T I N E =======================================
        .globl Timer
Timer:                                  # DATA XREF: ROM:000046BC↓o
    lda     IRQ_REQUEST_START, r4 # Label from Virtua Fighter 2 source
loc_D38:                                # CODE XREF: Timer+80↓j
    ld      (r4), r5
    mov     2, r6
loc_D40:                                # CODE XREF: Timer+18↓j
    bbs     r6, r5, loc_D60
    cmpinco 5, r6, r6
    bg      loc_D40
loc_D4C:                                # CODE XREF: Timer+24↓j
    bbs     r6, r5, loc_DC4
    cmpinco 8, r6, r6
    bg      loc_D4C
    bbs     r6, r5, loc_DD4
    b       IntrHalt
# ---------------------------------------------------------------------------
loc_D60:                                # CODE XREF: Timer:loc_D40↑j
    lda     0x421, r7
    clrbit  r6, r7, r8
    st      r8, 4(r4)
    lda     TIMERS_START, r9
    mov     0, r10
    st      r10, -8(r9)[r6*4]
    st      r7, 4(r4)
    lda     0xFFFFF, r10
    st      r10, -8(r9)[r6*4]
    subo    1, 0, r3
    clrbit  r6, r3, r3
    clrbit  r6, r5, r5
    st      r3, (r4)
    addo    0x1F, 0x1D, r7
    and     r5, r7, r7
    cmpo    0, r7
    bne     loc_D38
    mov     1, r3
    stob    r3, 0x50008C
    ret
# ---------------------------------------------------------------------------
loc_DC4:                                # CODE XREF: Timer:loc_D4C↑j
    subo    1, 0, r5
    clrbit  r6, r5, r5
    st      r5, (r4)
    b       IntrHalt
# ---------------------------------------------------------------------------
loc_DD4:                                # CODE XREF: Timer+28↑j
    subo    1, 0, r5
    clrbit  r6, r5, r5
    st      r5, (r4)
    b       IntrHalt
# ---------------------------------------------------------------------------
    .long 0
    .long 0
    .long 0
    