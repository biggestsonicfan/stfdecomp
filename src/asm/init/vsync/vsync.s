        .global VsyncScr
        .global VsyncObj
        .extern read_sw
        .extern write_sw
        .extern sub_201C
        .extern sub_24CC
        .section vsync
# =============== S U B R O U T I N E =======================================
VsyncScr:                               # DATA XREF: ROM:000046B4↓o
    mov     sp, r3          # Label from official source
    st      r3, stack_pointer_ram_add
_profile_isr:               # Label from NINDY source
	/*
	 * Store global registers to avoid corruption.
	 */
    lda     64(sp), sp
    stq     g0, (r3)
    stq     g4, 16(r3)
    stq     g8, 32(r3)
    stq     g12, 48(r3)
    shlo    0x17, 1, g10
    shlo    0x13, 0x11, g11
    shlo    0xE, 1, g12
    lda     0xFFFFF, r15
    st      r15, TIMER_03   # Set TIMER_03 to 0xFFFFF
    ld      not_scr_bg_move, r15
    bbc     31, r15, loc_CA4
    call    read_sw
    call    write_sw
    call    send_tex_col    # Handles colors for almost all polygons
    ld      debug_flag, r15
    bbs     13, r15, loc_CB8 # if bit 13 for debug_flag is set, game will freeze
    call    draw_health_bars
loc_CA4:                                # CODE XREF: VsyncScr+44↑j
    ld      not_scr_bg_move, r15
    bbc     31, r15, loc_CC4
    call    sub_201C
    call    sub_24CC
loc_CB8:                                # CODE XREF: VsyncScr+5C↑j
    call    sub_3FDB4       # Debug related
    call    sub_4D288       # Debug related
    call    debug_sw_check
loc_CC4:                                # CODE XREF: VsyncScr+6C↑j
    ldib    RAMBASE_START, r5
    addi    1, r5, r5
    stib    r5, RAMBASE_START
	/*
	 * Restore global registers.
	 */
    lda     -64(sp), r3
    ldq     48(r3), g12     # Is
    ldq     32(r3), g8      # this
    ldq     16(r3), g4      # a bug?
    ldq     (r3), g0
    mov     r3, sp
    lda     IRQ_REQUEST_START, r4
    subo    2, 0, r5        # r5 = 0xFFFFFFFE
    st      r5, (r4)
    ret
# End of function VsyncScr
# ---------------------------------------------------------------------------
    .long 0
    .long 0
# =============== S U B R O U T I N E =======================================
VsyncObj:                               # DATA XREF: ROM:000046B8↓o
    lda     IRQ_REQUEST_START, r4 # Label from Virtua Fighter 2 source
    subo    5, 0, r5
    st      r5, (r4)
    ret
# End of function VsyncObj
# ---------------------------------------------------------------------------
# We need to align instead of using long 0s
    .long 0
    .long 0
    .long 0

        .section debug_check
# ---------------------------------------------------------------------------
debug_sw_check:                         # CODE XREF: VsyncScr+80↑p
    ld      debug_flag, r9  # Label from Virtua Fighter 2 source
    ld      0x500710, r10
    ld      INTERUPT_FLAGS_MOMENTARY, r8
    ld      INTERUPT_FLAGS_HELD, r7
    ldos    0x100A008, r14
    ldos    0x100A00A, r13
    chkbit  6, r10
    alterbit 15, r14, r14
    alterbit 15, r13, r13
    stos    r14, 0x100A008
    stos    r13, 0x100A00A
    clrbit  9, r9, r9
    bbs     0, r10, loc_11800 # falls through
    setbit  9, r9, r9
    ld      0x500714, r15
    bbc     0, r15, loc_11800 # hits
    lda     0x100045A, g9
    mov     0x12, g0
    mov     0xD, g1
    call    clr_pattern_s
loc_11800:                              # CODE XREF: ROM:000117D8↑j
    chkbit  1, r10
    alterbit 10, r9, r9
    bbc     14, r9, loc_11810
    setbit  10, r9, r9
loc_11810:                              # CODE XREF: ROM:00011808↑j
    shlo    4, 13, r13
    andnot  r13, r9, r9
    bbs     12, r9, potential_bars2
    bbs     2, r9, debug_clr_3_set_5
    bbs     3, r9, loc_11854
    bbc     9, r9, loc_1182C
    bbc     10, r9, loc_1183C
loc_1182C:                              # CODE XREF: ROM:00011824↑j
    bbs     24, r8, loc_11854
    bbs     24, r8, freezes_game
    bbc     18, r7, loc_1183C # P2 Barrier
    bbs     5, r8, loc_11854
loc_1183C:                              # CODE XREF: ROM:00011828↑j
    bbc     1, r9, r9_to_debug
    addo    0x1F, 0x11, r3  # r3 = 0x30
    and     r7, r3, r3
    cmpibne 0, r3, r9_to_debug
    clrbit  1, r9, r9
    b       r9_to_debug
# ---------------------------------------------------------------------------
loc_11854:                              # CODE XREF: ROM:00011820↑j
    ldos    0x100A008, r14
    ldos    0x100A00A, r13
    chkbit  6, r10
    alterbit 0xF, r14, r14
    alterbit 0xF, r13, r13
    clrbit  0xE, r14, r14
    clrbit  0xE, r13, r13
    clrbit  0xD, r14, r14
    clrbit  0xD, r13, r13
    stos    r14, 0x100A008
    stos    r13, 0x100A00A
    mov     0, r15
    stis    r15, 0x100A000
    mov     0, r15
    stis    r15, 0x100A002
    lda     0xA6, r13
    or      r13, r9, r9
    ld      debug_flag, r15
    bbs     9, r15, loc_118F0
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x1000000, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
aDebugMode:     .asciz "debug_mode"
    .byte 0
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
loc_118F0:                              # CODE XREF: ROM:000118B8↑j
    b       r9_to_debug
# ---------------------------------------------------------------------------
debug_clr_3_set_5:                      # CODE XREF: ROM:0001181C↑j
    clrbit  3, r9, r9
    setbit  5, r9, r9
    bbs     8, r9, debug_flag_manip
    bbs     0x18, r8, debug_flag_manip
    bbc     5, r7, loc_1190C
    b       r9_to_debug
# ---------------------------------------------------------------------------
loc_1190C:                              # CODE XREF: ROM:00011904↑j
    ld      0x59E008, r15
    bbs     3, r15, r9_to_debug
    bbs     0x19, r8, loc_11920
    bbc     4, r8, r9_to_debug
loc_11920:                              # CODE XREF: ROM:00011918↑j
    clrbit  5, r9, r9
    setbit  6, r9, r9
    b       r9_to_debug
# ---------------------------------------------------------------------------
debug_flag_manip:                       # CODE XREF: ROM:000118FC↑j
    clrbit  8, r9, r9
    clrbit  2, r9, r9
    setbit  4, r9, r9
    clrbit  5, r9, r9
    setbit  6, r9, r9
    ld      debug_flag, r15
    bbs     9, r15, r9_to_debug
    lda     0x1000000, g9
    mov     0xA, g0
    mov     1, g1
    call    clr_pattern_s
    b       r9_to_debug
# ---------------------------------------------------------------------------
freezes_game:                           # CODE XREF: ROM:00011830↑j
    setbit  12, r9, r9
    setbit  13, r9, r9
    b       r9_to_debug
# ---------------------------------------------------------------------------
potential_bars2:                        # CODE XREF: ROM:00011818↑j
    setbit  13, r9, r9
    bbs     0x18, r8, loc_11984
    bbc     0x19, r8, r9_to_debug
    clrbit  0xD, r9, r9
    b       r9_to_debug
# ---------------------------------------------------------------------------
loc_11984:                              # CODE XREF: ROM:00011974↑j
    clrbit  0xC, r9, r9
    clrbit  0xD, r9, r9
r9_to_debug:                            # CODE XREF: ROM:loc_1183C↑j
    st      r9, debug_flag
    ret
    