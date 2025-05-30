        .section texture_init
# ============== S U B R O U T I N E =======================================
sub_7B4:                                # CODE XREF: ROM:00006AC8↓p
    mov     0, g1
    mov     5, g0
    mov     1, g2
    ld      0x2101014, g3
    call    send_tex_col_loop
    mov     0, g1
    mov     12, g0
    mov     1, g2
    ld      0x2101018, g3
    call    send_tex_col_loop
    ret
# End of function sub_7B4
# =============== S U B R O U T I N E =======================================
send_tex_col_stage:                     # CODE XREF: ROM:00046778↓p
    mov     14, g0          # Label from Fighting Vipers source
    mov     13, g2
    ld      0x2101010, g3
    call    send_tex_col_loop_stage2 # Stage color related
    ret
# End of function send_tex_col_stage
# =============== S U B R O U T I N E =======================================
send_tex_col_part:                      # CODE XREF: ROM:000467B4↓p
    ld      fa_rob0, g2     # Label from Fighting Vipers source
    cmpobe  0, g0, loc_818
    ld      fa_rob1, g2
    mov     7, g0
loc_818:                                # CODE XREF: send_tex_col_part+8↑j
    ld      0x2101008, g3
    ldob    0x1B0(g2), r14
    cmpobg  0x1A, r14, loc_834
    ld      0x210100C, g3
    subo    0x1A, g1, g1
loc_834:                                # CODE XREF: send_tex_col_part+24↑j
    mov     4, g2
    call    send_tex_col_loop
    ret
# End of function send_tex_col_part
# ---------------------------------------------------------------------------
send_tex_col_loop_stage:                # unreachable code, name guessed
    mov     2, r9
    shlo    8, 3, r11
    b       send_tex_col_go
# =============== S U B R O U T I N E =======================================
# Stage color related
send_tex_col_loop_stage2:               # CODE XREF: send_tex_col_stage+10↑p
    mov     1, r9           # Label from Fighting Vipers source
    shlo    6, 21, r11      # r11 = 0x540 or 1344
    b       send_tex_col_go
# End of function send_tex_col_loop_stage2
# =============== S U B R O U T I N E =======================================
send_tex_col_loop:                      # CODE XREF: sub_7B4+14↑p
    mov     1, r9           # Label from Fighting Vipers source
    shlo    5, 0x15, r11
send_tex_col_go:                        # CODE XREF: ROM:00000848↑j
    lda     STAGE_PALETTE_DATA, r4 # Label from Fighting Vipers source
    shlo    9, 1, r3
    mulo    r3, g0, r3
    addo    r3, r4, r4
    mov     0, r5
loc_878:                                # CODE XREF: send_tex_col_loop+DC↓j
    lda     0x60(r4), r4    # r4 = STAGE_PALETTE_DATA+0x60
    mov     0, g0
    mulo    r11, g1, r3     # if g1 = 0, then r3 = 0
    shlo    5, 3, r7        # r7 = 0x60 or 96
    mulo    r7, r5, r7      # if r5 =0, then r7 = 0
    addo    r7, r3, r3
    addo    g3, r3, r3
loc_894:                                # CODE XREF: send_tex_col_loop+CC↓j
    ldos    (r3)[g0*2], r8
    cmpobne 2, r9, loc_8AC
    ldos    (r3)[g0*4], r8
    shlo    7, 1, r13
    addi    r13, r8, r8
    shro    1, r8, r8
loc_8AC:                                # CODE XREF: send_tex_col_loop+40↑j
    ldos    ARRAY_NUM_RED[r8*2], r10
loc_8B4:                                # CODE XREF: TEXRAM0:110131C8↓j
    stos    r10, 0x10000(r4)
    ldos    0x20(r3)[g0*2], r8
    cmpobne 2, r9, loc_8DC
    ldos    0x80(r3)[g0*4], r8
    shlo    7, 1, r13
    addi    r13, r8, r8
    shro    1, r8, r8
loc_8DC:                                # CODE XREF: send_tex_col_loop+6C↑j
    ldos    ARRAY_NUM_GREEN[r8*2], r10
    stos    r10, 0x14000(r4)
    ldos    0x40(r3)[g0*2], r8
    cmpobne 2, r9, loc_90C
    ldos    0x100(r3)[g0*4], r8
    shlo    7, 1, r13
    addi    r13, r8, r8
    shro    1, r8, r8
loc_90C:                                # CODE XREF: send_tex_col_loop+9C↑j
    ldos    ARRAY_NUM_BLUE[r8*2], r10
    stos    r10, 0x18000(r4)
    addo    2, r4, r4
    cmpinco 0xF, g0, g0
    bg      loc_894
    shlo    7, 3, r6
    addo    r6, r4, r4
    cmpinco g2, r5, r5
    bg      loc_878
    ret
# End of function send_tex_col_loop
# =============== S U B R O U T I N E =======================================
send_tex_col_skin:                      # CODE XREF: ROM:0004678C↓p
    mov     0, g2           # Label from Fighting Vipers source
    ld      fa_rob0, g3
    cmpobe  0, g0, loc_958
    shlo    10, 1, g0
    ld      fa_rob1, g3
loc_958:                                # CODE XREF: send_tex_col_skin+C↑j
    ldob    0x1B0(g3), r14
    cmpobg  26, r14, loc_968
    shlo    10, 9, g2
    subo    26, g1, g1
loc_968:                                # CODE XREF: send_tex_col_skin+20↑j
    lda     STAGE_PALETTE_DATA, r4 # 0x0031E6
    shlo    0xB, 7, r3
    addo    g0, r3, r3
    addo    r3, r4, r4
    mov     0, r5
loc_980:                                # CODE XREF: send_tex_col_skin+CC↓j
    shlo    8, 3, r3
    mulo    r3, g1, r7
    shlo    7, 3, r3
    mulo    r3, r5, r3
    addo    r3, r7, r7
    addo    g2, r7, r3
    mov     0, g0
    ld      0x2101000, r7
    addo    r3, r7, r7
assign_rgb:                             # CODE XREF: send_tex_col_skin+BC↓j
    ldos    (r7)[g0*2], r8
    ldos    ARRAY_NUM_RED[r8*2], r10
    stos    r10, 0x10000(r4)
    ldos    0x80(r7)[g0*2], r8
    ldos    ARRAY_NUM_GREEN[r8*2], r10
    stos    r10, 0x14000(r4)
    ldos    0x100(r7)[g0*2], r8
    ldos    ARRAY_NUM_BLUE[r8*2], r10
    stos    r10, 0x18000(r4)
    addo    2, r4, r4
    lda     0x3F, r6
    cmpinco r6, g0, g0
    bg      assign_rgb
    shlo    7, 3, r6
    addo    r6, r4, r4
    cmpinco 1, r5, r5
    bg      loc_980
    ret
# End of function send_tex_col_skin
