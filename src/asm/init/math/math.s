        .globl rand
        .globl make_crc
        .section math
# =============== S U B R O U T I N E =======================================
# crc value stored to g0
make_crc:                               # CODE XREF: ROM:00003718↑p
    mov     0, r3           # Label from official source
    lda     0xFF00, r10
    lda     0xFF, r11
    subo    1, g2, r9
loc_6674:                               # CODE XREF: make_crc+44↓j
    shlo    8, r3, r5
    and     r10, r5, r5
    shro    8, r3, r3
    ldob    (g0), r6
    addo    1, g0, g0
    addo    g1, g0, g0
    xor     r6, r3, r3
    and     r11, r3, r3
    ldos    crc_variables[r3*2], r3
    xor     r5, r3, r3
    cmpdeci 0, r9, r9
    bl      loc_6674
    mov     r3, g0
    ret
# End of function make_crc
# =============== S U B R O U T I N E =======================================
# Random value stored to g0
rand:                                   # CODE XREF: ADV_CPU_BATTLE_INT+3C↓p
    ld      random, r15     # Label from official source
    shlo    0x14, 0xF, r14  # r14 = 0xF00000
    ld      (r14), r13      # Value of TIMERS_START to r13
    shlo    4, r13, r13
    addi    r13, r15, r15
    ld      4(r14), r13     # Value of TIMER_02 to r13
    shlo    8, r13, r13
    addi    r13, r15, r15
    ld      8(r14), r13     # Value of TIMER_03 to r13
    shlo    0xC, r13, r13
    addi    r13, r15, r15
    ld      0xC(r14), r13   # Value of TIMER_04 to r13
    shlo    0x10, r13, r13
    addi    r13, r15, r15
    st      r15, random
    shro    4, r15, g0
    lda     0xFFFF, r15
    and     r15, g0, g0
    ret
# End of function rand
