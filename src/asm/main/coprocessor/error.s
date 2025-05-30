        .section coproc_error
# ---------------------------------------------------------------------------
CoProcessorErr:                         # CODE XREF: ROM:000071E0↑p
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x1000A14, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
aCoProcessorErr:.asciz "CO-PROCESSOR ERROR!!"
    .fill 3, 1, 0
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x1000A94, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
aSorryBut:      .asciz "Sorry but.."
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x1000B14, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
aPleasePowerOff:.asciz "Please power off and wait for a while !!"
    .fill 3, 1, 0
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x1000B94, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
aDengenWoKitteS:.asciz "Dengen wo kitte, sibaraku omachi kudasai.."
    .byte 0
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
    lda     0x50E000, r14
    mov     0, r15
    shlo    8, 5, r13
loc_7610:                               # CODE XREF: ROM:0000761C↓j
    st      r15, (r14)
    lda     4(r14), r14
    cmpdeco 1, r13, r13
    bl      loc_7610
    lda     0x50E800, r14
    mov     0xA, r15
    shlo    8, 5, r13
loc_7630:                               # CODE XREF: ROM:0000763C↓j
    st      r15, (r14)
    lda     4(r14), r14
    cmpdeco 1, r13, r13
    bl      loc_7630
    lda     0x50E000, g5
    call    sub_7800
    lda     0x50E800, g5
    call    sub_7800
    lda     0x50E000, r5
    lda     0x50E800, r6
loc_7668:                               # CODE XREF: ROM:0000767C↓j
    ld      (r5), r3
    ld      (r6), r4
    cmpobne r3, r4, loc_77D4
    addo    4, r5, r5
    addo    4, r6, r6
    cmpobne r6, g5, loc_7668
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x1000A14, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
    .asciz "                                           "
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x1000A94, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
asc_76F0:       .asciz "                                           "
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x1000B14, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
asc_7744:       .asciz "                                           "
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x1000B94, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
    .asciz "                                           "
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
    ret                     # Exit co-processor error
# ---------------------------------------------------------------------------
loc_77D4:                               # CODE XREF: ROM:00007670↑j
    lda     0x1000C14, g9
    mov     r5, g0
    balx    debug_disp_hex, r14
# ---------------------------------------------------------------------------
aErrorStatus:   .asciz " = error status"
# ---------------------------------------------------------------------------
co_processor_error_hang:                # CODE XREF: ROM:co_processor_error_hang↓j
    b       co_processor_error_hang
# ---------------------------------------------------------------------------
loc_77FC:                               # return
    ret
# =============== S U B R O U T I N E =======================================
sub_7800:                               # CODE XREF: ROM:00007648↑p
                lda     0x3039, r3
                lda     0x3F9E0419, r4
                lda     0x3F800000, r5
                lda     0x800101, r15
                st      r15, (g11)[g12*1]
                lda     0x800101, r15
                st      r15, (g11)[g12*1]
                lda     0x800101, r15
                st      r15, (g11)[g12*1]
                lda     0x1800303, r15 # 0x000000
                st      r15, (g11)[g12*1]
                lda     0x4000808, r15
                st      r15, (g11)[g12*1]
                st      r3, (g11)[g12*1]
                lda     0x4800909, r15
                st      r15, (g11)[g12*1]
                st      r3, (g11)[g12*1]
                lda     0x5000A0A, r15
                st      r15, (g11)[g12*1]
                st      r3, (g11)[g12*1]
                lda     0x3000606, r15
                st      r15, (g11)[g12*1]
                st      r4, (g11)[g12*1]
                st      r4, (g11)[g12*1]
                st      r4, (g11)[g12*1]
                lda     0x3800707, r15
                st      r15, (g11)[g12*1]
                st      r4, (g11)[g12*1]
                st      r4, (g11)[g12*1]
                st      r4, (g11)[g12*1]
                lda     0x6000C0C, r15
                st      r15, (g11)[g12*1]
                lda     0x9801313, r15
                st      r15, (g11)[g12*1]
                st      r15, (g11)[g12*1]
                st      r15, (g11)[g12*1]
                ld      (g11)[g12*1], r15
                lda     0x2800505, r15
                st      r15, (g11)[g12*1]
                lda     (g5), r15
                ld      (g11)[g12*1], r14
                st      r14, 0x0(r15)
                ld      (g11)[g12*1], r14
                st      r14, 4(r15)
                ld      (g11)[g12*1], r14
                st      r14, 8(r15)
                ld      (g11)[g12*1], r14
                st      r14, 0xC(r15)
                ld      (g11)[g12*1], r14
                st      r14, 0x10(r15)
                ld      (g11)[g12*1], r14
                st      r14, 0x14(r15)
                ld      (g11)[g12*1], r14
                st      r14, 0x18(r15)
                ld      (g11)[g12*1], r14
                st      r14, 0x1C(r15)
                ld      (g11)[g12*1], r14
                st      r14, 0x20(r15)
                ld      (g11)[g12*1], r14
                st      r14, 0x24(r15)
                ld      (g11)[g12*1], r14
                st      r14, 0x28(r15)
                ld      (g11)[g12*1], r14
                st      r14, 0x2C(r15)
                lda     0x30(g5), g5
                lda     0x1000202, r15
                st      r15, (g11)[g12*1]
                lda     0x1000202, r15
                st      r15, (g11)[g12*1]
                lda     0x1000202, r15
                st      r15, (g11)[g12*1]
                lda     0x9801313, r15
                st      r15, (g11)[g12*1]
                st      r4, (g11)[g12*1]
                st      r5, (g11)[g12*1]
                ld      (g11)[g12*1], r6
                st      r6, (g5)
                addo    4, g5, g5
                lda     0xA001414, r15
                st      r15, (g11)[g12*1]
                st      r5, (g11)[g12*1]
                st      r4, (g11)[g12*1]
                ld      (g11)[g12*1], r6
                st      r6, (g5)
                addo    4, g5, g5
                lda     0xA801515, r15
                st      r15, (g11)[g12*1]
                st      r4, (g11)[g12*1]
                st      r5, (g11)[g12*1]
                ld      (g11)[g12*1], r6
                st      r6, (g5)
                addo    4, g5, g5
                lda     0xB001616, r15
                st      r15, (g11)[g12*1]
                st      r5, (g11)[g12*1]
                st      r4, (g11)[g12*1]
                ld      (g11)[g12*1], r6
                st      r6, (g5)
                addo    4, g5, g5
                lda     0x16802D2D, r15
                st      r15, (g11)[g12*1]
                st      r4, (g11)[g12*1]
                st      r5, (g11)[g12*1]
                ld      (g11)[g12*1], r6
                st      r6, (g5)
loc_7A00:                               # DATA XREF: osage_init+20↓o
                addo    4, g5, g5
                lda     0x10802121, r15
                st      r15, (g11)[g12*1]
                st      r3, (g11)[g12*1]
                ld      (g11)[g12*1], r6
                st      r6, (g5)
                addo    4, g5, g5
                lda     0x11002222, r15
                st      r15, (g11)[g12*1]
                st      r3, (g11)[g12*1]
                ld      (g11)[g12*1], r6
                st      r6, (g5)
                addo    4, g5, g5
                lda     0x13802727, r15
                st      r15, (g11)[g12*1]
                st      r4, (g11)[g12*1]
                st      r5, (g11)[g12*1]
                ld      (g11)[g12*1], r6
                shlo    0x10, r6, r6
                shro    0x10, r6, r6
                st      r6, (g5)
                addo    4, g5, g5
                ret
# End of function sub_7800
