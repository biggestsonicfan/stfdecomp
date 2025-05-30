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
    .long 0
    .long 0
    .long 0
    