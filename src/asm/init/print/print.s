        .globl s_print_mes
        .globl clr_pattern_s
        .globl print_mes
        .globl print_dec
        .globl debug_disp_mes
        .globl debug_disp_hex_h
        .globl debug_disp_hex
        .globl debug_disp_int
        .globl debug_disp_float
        .section print
# =============== S U B R O U T I N E =======================================
print_mes:                              # CODE XREF: ROM:00000AD8↑p
    mov     g0, r3          # Label from official source
    mov     g9, r4          # Move location to r4
    shlo    0xF, 1, r5
loc_5680:                               # CODE XREF: print_mes+28↓j
    ldib    (r3), r6
    addi    1, r3, r3
    cmpi    r6, 0
    be      print_mes_ex    # return
    or      r5, r6, r6
    stis    r6, (r4)
    addi    2, r4, r4
    b       loc_5680
# ---------------------------------------------------------------------------
print_mes_ex:                           # CODE XREF: print_mes+18↑j
    ret                     # return
# End of function print_mes
# =============== S U B R O U T I N E =======================================
# Print g0 as decimal
print_dec:                              # CODE XREF: Timer+104↑p
    mov     g0, r4          # Label from official source
    mov     g9, r6
    shlo    0xD, 1, r15
    cmpibl  r15, r4, loc_5728
    lda     -0x2000, r15
    cmpibg  r15, r4, loc_5728
    lda     0x8020, r3
    lda     0x802D, r5
    bbs     0x1F, r4, loc_56E0
    stos    r3, [r6*1]
    b       loc_56EC
# ---------------------------------------------------------------------------
loc_56E0:                               # CODE XREF: print_dec+2C↑j
    stos    r5, [r6*1]
    subi    r4, 0, r4
loc_56EC:                               # CODE XREF: print_dec+38↑j
    stos    r3, 2[r6*1]
    ldl     0x20C0000[r4*8], r8
    shro    0x10, r8, r10
    shro    0x10, r9, r11
    stos    r8, 4[r6*1]
    stos    r10, 6[r6*1]
    stos    r9, 8[r6*1]
    stos    r11, 0xA[r6*1]
    ret
# ---------------------------------------------------------------------------
loc_5728:                               # CODE XREF: print_dec+C↑j
    lda     0x8020, r7
    cmpi    r4, 0
    bge     loc_5744
    lda     0x802D, r7
    subi    r4, 0, r4
loc_5744:                               # CODE XREF: print_dec+90↑j
    stis    r7, (r6)
    addi    2, r6, r6
    mov     5, r8
    addi    r8, r6, r6
    addi    r8, r6, r6
loc_5758:                               # CODE XREF: print_dec+DC↓j
    xor     r5, r5, r5
    ediv    0xA, r4, r4
    lda     0x8030, r7
    addi    r4, r7, r7
    subi    2, r6, r6
    stis    r7, (r6)
    mov     r5, r4
    subo    1, r8, r8
    cmpibe  0, r4, loc_5784
    cmpoble 1, r8, loc_5758
loc_5784:                               # CODE XREF: print_dec+D8↑j
    cmpibe  0, r8, loc_57A0
    lda     0x8020, r7
loc_5790:                               # CODE XREF: print_dec+F8↓j
    subi    2, r6, r6
    stis    r7, (r6)
    cmpdeco 1, r8, r8
    bl      loc_5790
loc_57A0:                               # CODE XREF: print_dec:loc_5784↑j
    ret
# End of function print_dec
# =============== S U B R O U T I N E =======================================
s_print_dec_left:                       # CODE XREF: south_credit+324↓p
    shlo    0xF, 1, r4      # Label from official source
    mov     0, r11
    lda     texture_palette_offsets, r3
    ld      0x0(r3)[r11*4], r11
    cmpobe  0, g0, loc_5814
    mov     g0, r3
    mov     0, r8
    lda     0x3B9ACA00, r5
loc_57D0:                               # CODE XREF: s_print_dec_left+68↓j
    divo    r5, r3, r6
    cmpobe  1, r8, loc_57E0
    cmpobe  0, r6, loc_5804
    mov     1, r8
loc_57E0:                               # CODE XREF: s_print_dec_left+30↑j
    ldos    0x40(r11)[r6*4], r15
    addo    r15, r4, r7
    stos    r7, 0x0(g9)
    ldos    0x42(r11)[r6*4], r15
    addo    r15, r4, r7
    stos    r7, 0x80(g9)
    addo    2, g9, g9
loc_5804:                               # CODE XREF: s_print_dec_left+34↑j
    remo    r5, r3, r3
    divo    0xA, r5, r5
    cmpobne 0, r5, loc_57D0
    ret
# ---------------------------------------------------------------------------
loc_5814:                               # CODE XREF: s_print_dec_left+18↑j
    ldos    0x40(r11), r15
    addo    r15, r4, r7
    stos    r7, 0x0(g9)
    ldos    0x42(r11), r15
    addo    r15, r4, r7
    stos    r7, 0x80(g9)
    addo    2, g9, g9
    ret
# End of function s_print_dec_left
# =============== S U B R O U T I N E =======================================
print_bin_w:                            # CODE XREF: debug_disp_bin_w+4↓p
    mov     0x1F, r4        # Label from official source
    b       loc_5840
# End of function print_bin_w
# =============== S U B R O U T I N E =======================================
print_bin:                              # CODE XREF: debug_disp_bin+4↓p
    mov     0xF, r4         # Label from official source
loc_5840:                               # CODE XREF: print_bin_w+4↑j
    chkbit  r4, g0
    be      loc_5854
    lda     0x802D, r3
    b       loc_585C
# ---------------------------------------------------------------------------
loc_5854:                               # CODE XREF: print_bin+8↑j
    lda     0x802A, r3
loc_585C:                               # CODE XREF: print_bin+14↑j
    stis    r3, (g9)
    addi    2, g9, g9
    cmpibe  0, r4, loc_5884
    mov     r4, r5
    and     3, r5, r5
    cmpobne 0, r5, loc_5884
    lda     0x803A, r3
    stis    r3, (g9)
    addi    2, g9, g9
loc_5884:                               # CODE XREF: print_bin+28↑j
    cmpdeci 0, r4, r4
    bl      loc_5840
    ret
# End of function print_bin
# =============== S U B R O U T I N E =======================================
print_hex_b:                            # CODE XREF: debug_disp_hex_h+10↓p
    mov     6, r6           # Label from official source
    b       loc_589C
# End of function print_hex_b
# =============== S U B R O U T I N E =======================================
print_hex_w:                            # CODE XREF: print_fault+30↑p
    mov     8, r6           # Label from official source
loc_589C:                               # CODE XREF: print_hex_b+4↑j
    mov     g0, r4
    mov     g9, r5
    addo    r6, r5, r5
    addo    r6, r5, r5
loc_58AC:                               # CODE XREF: print_hex_w+38↓j
    mov     r4, r7
    shro    4, r4, r4
    subo    2, r5, r5
    and     0xF, r7, r7
    ldos    word_8E5EC[r7*2], r3
    stos    r3, (r5)
    cmpibe  0, r4, loc_58D4
    cmpdeco 1, r6, r6
    bl      loc_58AC
loc_58D4:                               # CODE XREF: print_hex_w+30↑j
    cmpibe  0, r6, loc_58F0
    lda     loc_8020, r7
loc_58E0:                               # CODE XREF: print_hex_w+54↓j
    subo    2, r5, r5
    stos    r7, (r5)
    cmpdeco 1, r6, r6
    bl      loc_58E0
loc_58F0:                               # CODE XREF: print_hex_w:loc_58D4↑j
    ret
# End of function print_hex_w
# =============== S U B R O U T I N E =======================================
print_book_time2:                       # CODE XREF: ROM:000613AC↓p
    shro    6, g0, r3       # Label from official source
    shlo    0x1A, g1, r4
    or      r3, r4, r3
    mov     g9, r4
    b       loc_5914
# End of function print_book_time2
# =============== S U B R O U T I N E =======================================
print_book_time:                        # CODE XREF: ROM:000638FC↓p
    mov     g0, r3          # Label from official source
    mov     g9, r4
    shro    6, r3, r3
loc_5914:                               # CODE XREF: print_book_time2+10↑j
    addo    0x1F, 0x1D, r12
    lda     0xE10, r11
    lda     loc_15180, r10
    divo    r10, r3, r5
    remo    r10, r3, r3
    divo    r11, r3, r6
    remo    r11, r3, r3
    divo    r12, r3, r7
    remo    r12, r3, r3
    mov     0, r9
    mov     g9, r12
    addo    0x18, r12, g9
    mov     r3, g0
    call    print_dec       # Print g0 as decimal
    addo    0x10, r12, g9
    mov     r7, g0
    call    print_dec       # Print g0 as decimal
    addo    8, r12, g9
    mov     r6, g0
    call    print_dec       # Print g0 as decimal
    mov     r12, g9
    mov     r5, g0
    call    print_dec       # Print g0 as decimal
    addo    0xC, r12, g9
    lda     0x8044, g0
    or      r9, g0, g0
    call    print_char
    addo    0x14, r12, g9
    lda     loc_8048, g0
    or      r9, g0, g0
    call    print_char
    addo    0x1C, r12, g9
    lda     0x804D, g0
    or      r9, g0, g0
    call    print_char
    addo    0x10, r12, g9
    addo    0x14, g9, g9
    lda     0x8053, g0
    or      r9, g0, g0
    call    print_char
    mov     r12, g9
    ret
# End of function print_book_time
# =============== S U B R O U T I N E =======================================
print_book_time2_s:                     # CODE XREF: ROM:0005F7D4↓p
    shro    6, g0, r3       # Label from official source
    shlo    0x1A, g1, r4
    or      r3, r4, r3
    mov     g9, r4
    b       loc_59F0
# End of function print_book_time2_s
# =============== S U B R O U T I N E =======================================
print_book_time_s:                      # CODE XREF: ROM:loc_61450↓p
    mov     g0, r3          # Label from official source
    mov     g9, r4
    shro    6, r3, r3
loc_59F0:                               # CODE XREF: print_book_time2_s+10↑j
    addo    0x1F, 0x1D, r12
    lda     0x1770, r11
    lda     0x15180, r10
    divo    r10, r3, r5
    remo    r10, r3, r3
    divo    r11, r3, r6
    remo    r11, r3, r3
    divo    r12, r3, r7
    remo    r12, r3, r3
    mov     0, r9
    mov     g9, r12
    addo    8, r12, g9
    mov     r3, g0
    call    print_dec       # Print g0 as decimal
    mov     r12, g9
    mov     r7, g0
    call    print_dec       # Print g0 as decimal
    addo    0xC, r12, g9
    lda     0x804D, g0
    or      r9, g0, g0
    call    print_char
    addo    0x14, r12, g9
    lda     0x8053, g0
    or      r9, g0, g0
    call    print_char
    mov     r12, g9
    ret
# End of function print_book_time_s
# ---------------------------------------------------------------------------
print_time:                             # Label from official source
    mov     g0, r3
    mov     g9, r4
    addo    0x1F, 0x1D, r11
    lda     0x8030, r5
    addo    0x10, r4, r4
    remo    0xA, r3, r6
    addo    r5, r6, r6
    stos    r6, (r4)
    subo    2, r4, r4
    divo    0xA, r3, r3
    remo    0xA, r3, r6
    addo    r5, r6, r6
    stos    r6, (r4)
    subo    2, r4, r4
    lda     0x8022, r6
    stos    r6, (r4)
    divo    0xA, r3, r3
    remo    r11, r3, r9
    divo    r11, r3, r10
    subo    2, r4, r4
    remo    0xA, r9, r6
    addo    r5, r6, r6
    stos    r6, (r4)
    subo    2, r4, r4
    divo    0xA, r9, r6
    addo    r5, r6, r6
    stos    r6, (r4)
    subo    2, r4, r4
    lda     0x8027, r6
    stos    r6, (r4)
    subo    2, r4, r4
    remo    0xA, r10, r6
    addo    r5, r6, r6
    stos    r6, (r4)
    subo    2, r4, r4
    divo    0xA, r10, r6
    addo    r5, r6, r6
    stos    r6, (r4)
    ret
# ---------------------------------------------------------------------------
print_time2:                            # Label from official source
    mov     g0, r3
    mov     g9, r4
    addo    0x10, r4, r4
    lda     0x8030, r5
    remo    0xA, r3, r6
    addo    r5, r6, r6
    stos    r6, (r4)
    subo    2, r4, r4
    divo    0xA, r3, r3
    remo    0xA, r3, r6
    addo    r5, r6, r6
    stos    r6, (r4)
    subo    2, r4, r4
    lda     0x8022, r6
    stos    r6, (r4)
    subo    2, r4, r4
    divo    0xA, r3, r3
    remo    0xA, r3, r6
    addo    r5, r6, r6
    stos    r6, (r4)
    subo    2, r4, r4
    divo    0xA, r3, r3
    remo    0xA, r3, r6
    addo    r5, r6, r6
    stos    r6, (r4)
    ret
# =============== S U B R O U T I N E =======================================
print_char:                             # CODE XREF: print_book_time+7C↑p
    mov     g0, r3          # Label from official source
    mov     g9, r4
    shlo    0xF, 1, r5
    or      r3, r5, r5
    stis    r5, (r4)
    ret
# End of function print_char
# ---------------------------------------------------------------------------
p_print_char:                           # Label from official source
    mov     g0, r4
    addo    0x1F, 1, r3
    subo    r3, r4, r3
    addo    r3, r3, r3
    addo    r3, r3, r4
    addo    r3, r4, r4
    ldos    0x503002, r3
    addo    r3, r4, r4
    ld      0x503008, r3
    shlo    7, r3, r3
    addo    r3, r4, r4
    stis    r4, 0x0(g9)
    addo    1, r4, r4
    stis    r4, 2(g9)
    addo    1, r4, r4
    stis    r4, 0x80(g9)
    addo    1, r4, r4
    stis    r4, 0x82(g9)
    addo    1, r4, r4
    stis    r4, 0x100(g9)
    addo    1, r4, r4
    stis    r4, 0x102(g9)
    ret
# =============== S U B R O U T I N E =======================================
s_print_mes:                            # CODE XREF: WARNING_INT+80↓p
    shlo    0xF, 1, r5      # Label from official source
    mov     0, r7
    lda     texture_palette_offsets, r3
    ld      0x0(r3)[r7*4], r7
loc_5C18:                               # CODE XREF: s_print_mes+48↓j
    ldob    (g0), r4
    cmpobe  0, r4, loc_5C4C
    addo    1, g0, g0
    ldos    -0x80(r7)[r4*4], r14
    ldos    -0x7E(r7)[r4*4], r15
    addo    r14, r5, r14
    stos    r14, 0x0(g9)
    addo    r15, r5, r15
    stos    r15, 0x80(g9)
    addo    2, g9, g9
    b       loc_5C18
# ---------------------------------------------------------------------------
loc_5C4C:                               # CODE XREF: s_print_mes+1C↑j
    ret
# End of function s_print_mes
# =============== S U B R O U T I N E =======================================
s_print_char:                           # CODE XREF: south_credit+3BC↓p
    shlo    0xF, 1, r5      # Label from official source
    mov     0, r7
    lda     texture_palette_offsets, r3
    ld      0x0(r3)[r7*4], r7
    ldos    -0x80(r7)[g0*4], r14
    ldos    -0x7E(r7)[g0*4], r15
    addo    r14, r5, r3
    addo    r15, r5, r4
    stos    r3, 0x0(g9)
    stos    r4, 0x80(g9)
    addo    2, g9, g9
    ret
# End of function s_print_char
# =============== S U B R O U T I N E =======================================
s_print_dec_char:                       # CODE XREF: south_credit+3C4↓p
    shlo    0xF, 1, r5      # Label from official source
    mov     0, r7
    lda     texture_palette_offsets, r3
    ld      0x0(r3)[r7*4], r7
    ldos    0x40(r7)[g0*4], r14
    ldos    0x42(r7)[g0*4], r15
    addo    r14, r5, r3
    addo    r15, r5, r4
    stos    r3, 0x0(g9)
    stos    r4, 0x80(g9)
    addo    2, g9, g9
    ret
# End of function s_print_dec_char
# ---------------------------------------------------------------------------
clr_scr_screen:                         # Label from official source
    lda     0x80208020, r4
    mov     r4, r5
    mov     r4, r6
    mov     r4, r7
    addo    0x1F, 1, r8
    lda     0xFF, r3
    and     r3, r8, r8
    shlo    8, 1, r9
    mov     g0, r10
loc_5CF8:                               # CODE XREF: ROM:00005D40↓j
    stq     r4, 0x0(r10)
    stq     r4, 0x10(r10)
    stq     r4, 0x20(r10)
    stq     r4, 0x30(r10)
    stq     r4, 0x40(r10)
    stq     r4, 0x50(r10)
    stq     r4, 0x60(r10)
    stq     r4, 0x70(r10)
    stq     r4, 0x80(r10)
    stq     r4, 0x90(r10)
    stq     r4, 0xA0(r10)
    stq     r4, 0xB0(r10)
    stq     r4, 0xC0(r10)
    stq     r4, 0xD0(r10)
    stq     r4, 0xE0(r10)
    stq     r4, 0xF0(r10)
    cmpdeco 1, r8, r8
    addo    r9, r10, r10
    bl      loc_5CF8
    ret
# =============== S U B R O U T I N E =======================================
clr_pattern:                            # CODE XREF: sel_disp_init+988↓p
    lda     1023, r13       # Label from official source
    cmpoble r13, g0, loc_5E4C # return
    ld      texture_palette_offsets[g0*4], r10
    addi    4, r10, r10
    addo    31, 1, r3
    ld      (r10), r4
    addi    4, r10, r10
    ld      (r10), r5
    addi    4, r10, r10
loc_5D70:                               # CODE XREF: clr_pattern+48↓j
    mov     g9, r6
    mov     r5, r7
loc_5D78:                               # CODE XREF: clr_pattern+3C↓j
    stis    r3, (r6)
    addi    2, r6, r6
    cmpdeco 1, r7, r7
    bl      loc_5D78
    lda     0x80(g9), g9
    cmpdeco 1, r4, r4
    bl      loc_5D70
    ret
# End of function clr_pattern
# =============== S U B R O U T I N E =======================================
clr_pattern_s:                          # CODE XREF: scroll_all_init+10↓p
    addo    31, 1, r3       # Label from official source
    b       cps_1
# ---------------------------------------------------------------------------
fill_pattern_s:                         # CODE XREF: draw_game_over+7C↓p
    mov     g2, r3          # Label from official source
cps_1:                                  # CODE XREF: clr_pattern_s+4↑j
    mov     g9, r6          # Label from official source
    mov     g0, r7
loc_5DAC:                               # CODE XREF: clr_pattern_s+20↓j
    stis    r3, (r6)
    addi    2, r6, r6
    cmpdeco 1, r7, r7
    bl      loc_5DAC
    lda     0x80(g9), g9
    cmpdeco 1, g1, g1
    bl      cps_1
    ret
# End of function clr_pattern_s
# =============== S U B R O U T I N E =======================================
dsp_pattern_low:                        # CODE XREF: ADV_REPLAY_PIC2+60↓p
    lda     1023, r13       # Label from official source
    cmpoble r13, g0, loc_5E4C # return
    ld      texture_palette_offsets[g0*4], r10
    mov     0, r4
    ldl     4(r10), r6
    addo    0xC, r10, r8
    shlo    7, 1, r5
    mov     g9, r9
    b       loc_5E18
# End of function dsp_pattern_low
# =============== S U B R O U T I N E =======================================
dsp_pattern_new:                        # CODE XREF: ROM:000085F0↓p
    lda     1023, r13       # Label from official source
    cmpoble r13, g0, loc_5E4C # return
    ld      texture_palette_offsets[g0*4], r10
    ldos    (r10), r4       # (sonic_port_first_frame r4=0x8000)
    ldl     4(r10), r6      # Width of display pattern
    addo    0xC, r10, r8
    shlo    7, 1, r5
    mov     g9, r9
loc_5E18:                               # CODE XREF: dsp_pattern_low+24↑j
    mov     r9, r11
    mov     r7, r12
loc_5E20:                               # CODE XREF: dsp_pattern_new+44↓j
    ldis    (r8), r15       # Gets data
    addo    2, r8, r8       # (r8 = 0x299F14E)
    addo    r4, r15, r15    # (r15=0x9700)
    stos    r15, (r11)      # (store r15=0x9700 to r11=0x1005386)
    addo    2, r11, r11
    cmpdeco 1, r12, r12
    bl      loc_5E20
    addo    r5, r9, r9
    cmpdeco 1, r6, r6
    bl      loc_5E18
    lda     (g9)[r7*2], g9
loc_5E4C:                               # CODE XREF: clr_pattern+4↑j
    ret                     # return
# End of function dsp_pattern_new
# ---------------------------------------------------------------------------
dsp_pattern_bank1:                      # Label from official source
    lda     1023, r13
    cmpoble r13, g0, loc_5E4C # return
    ld      texture_palette_offsets[g0*4], r10
    ldos    (r10), r4
    setbit  0xE, r4, r4
    ldl     4(r10), r6
    addo    0xC, r10, r8
    shlo    7, 1, r5
    mov     g9, r9
loc_5E78:                               # CODE XREF: ROM:00005EA4↓j
    mov     r9, r11
    mov     r7, r12
loc_5E80:                               # CODE XREF: ROM:00005E98↓j
    ldis    (r8), r15
    addo    2, r8, r8
    addo    r4, r15, r15
    stos    r15, (r11)
    addo    2, r11, r11
    cmpdeco 1, r12, r12
    bl      loc_5E80
    addo    r5, r9, r9
    cmpdeco 1, r6, r6
    bl      loc_5E78
    lda     (g9)[r7*2], g9
    ret
# =============== S U B R O U T I N E =======================================
dsp_pattern_right:                      # CODE XREF: char_nameplate_dsp+F4↓p
    lda     1023, r13       # Label from official source
    cmpoble r13, g0, loc_5E4C # return
    ld      texture_palette_offsets[g0*4], r10
    ldos    (r10), r4
    ldl     4(r10), r6
    addo    0xC, r10, r8
    subo    r7, g9, g9
    subo    r7, g9, g9
    addo    2, g9, g9
    shlo    7, 1, r5
    mov     g9, r9
loc_5EE0:                               # CODE XREF: dsp_pattern_right+5C↓j
    mov     r9, r11
    mov     r7, r12
loc_5EE8:                               # CODE XREF: dsp_pattern_right+50↓j
    ldis    (r8), r15
    addo    2, r8, r8
    addo    r4, r15, r15
    stos    r15, (r11)
    addo    2, r11, r11
    cmpdeco 1, r12, r12
    bl      loc_5EE8
    addo    r5, r9, r9
    cmpdeco 1, r6, r6
    bl      loc_5EE0
    lda     (g9)[r7*2], g9
    ret
# End of function dsp_pattern_right
# ---------------------------------------------------------------------------
dsp_back_ground:                        # Label from official source
    lda     1023, r13
    cmpoble r13, g0, loc_5E4C # return
    ld      texture_palette_offsets[g0*4], g0
    addo    4, sp, sp
    st      g9, -4(sp)
    shlo    0xF, 1, g4
    ldis    1, g7
    addo    0x1F, 1, g3
    addo    0x1F, 1, g2
loc_5F44:                               # CODE XREF: ROM:00005F78↓j
    mov     g2, g5
loc_5F48:                               # CODE XREF: ROM:00005F60↓j
    ldis    (g0), g6
    addi    2, g0, g0
    addi    g4, g6, g6
    stis    g6, (g9)
    addi    2, g9, g9
    cmpdeco 1, g5, g5
    bl      loc_5F48
    subi    g2, g9, g9
    subi    g2, g9, g9
    shlo    7, 1, r3
    addi    r3, g9, g9
    cmpdeco 1, g3, g3
    bl      loc_5F44
    ld      -4(sp), g9
    subo    4, sp, sp
    shlo    1, g2, g2
    addo    g2, g9, g9
    ret
# =============== S U B R O U T I N E =======================================
dsp_character:                          # CODE XREF: ROM:00010664↓p
    lda     1023, r13       # Label from official source
    cmpoble r13, g0, loc_5E4C # return
    lda     texture_palette_offsets, r3
    ld      0x0(r3)[g0*4], r12
    ldis    (r12), r7
    ld      4(r12), r5
    ld      8(r12), r11
    addi    0xC, r12, r6
    mulo    g4, g3, r3
    addo    r3, r3, r3
    addo    r3, r6, r6
    shlo    7, 1, r8
    mov     g9, r4
    mov     r5, r10
loc_5FD4:                               # CODE XREF: dsp_character+78↓j
    mov     r4, r13
    mov     r6, r14
    mov     g3, r12
loc_5FE0:                               # CODE XREF: dsp_character+64↓j
    ldos    (r14), r15
    addo    2, r14, r14
    addo    r7, r15, r15
    stos    r15, (r13)
    addo    2, r13, r13
    cmpdeco 1, r12, r12
    bl      loc_5FE0
    addo    r8, r4, r4
    addo    r11, r6, r6
    addo    r11, r6, r6
    cmpdeco 1, r10, r10
    bl      loc_5FD4
    ret
# End of function dsp_character
# ---------------------------------------------------------------------------
dsp_message:                            # Label from official source
    lda     1023, r13
    cmpoble r13, g0, loc_5E4C # return
    lda     texture_palette_offsets, r3
    ld      0x0(r3)[g0*4], g0 # if g0 = unused_font_info
    ldos    (g0), r3        # r3 = 0x8000
    ldos    2(g0), r15      # r15 = 1
    ld      4(g0), r4       # r4 = 14
    ld      8(g0), r5       # r5 = 8
    ld      0xC(g0), r6     # r6 = 0x780
    addo    0x10, g0, g0
    mulo    r4, r6, r7
    shlo    1, r7, r7
    cmpo    0, r15
    bne     loc_6054
loc_6054:                               # CODE XREF: ROM:00006050↑j
    ldob    (g1), r15
    cmpobe  0, r15, loc_60DC
    ldob    (g2)[r15], r11
    remo    r6, r11, r14
    divo    r6, r11, r15
    shlo    1, r14, r14
    mulo    r4, r14, r14
    mulo    r7, r15, r15
    mulo    r5, r15, r15
    addo    r14, r15, r15
    addo    g0, r15, r8
    mov     r5, r10
loc_6084:                               # CODE XREF: ROM:000060C0↓j
    mov     r4, r11
loc_6088:                               # CODE XREF: ROM:000060A0↓j
    ldos    (r8), r9
    addo    r3, r9, r9
    stos    r9, (g9)
    addo    2, r8, r8
    addo    2, g9, g9
    cmpdeco 1, r11, r11
    bl      loc_6088
    shlo    1, r4, r15
    subo    r15, r8, r8
    subo    r15, g9, g9
    addo    r7, r8, r8
    shlo    7, 1, r15
    addo    r15, g9, g9
    cmpdeco 1, r10, r10
    bl      loc_6084
    mulo    r5, r15, r15
    subo    r15, g9, g9
    shlo    1, r4, r15
    addo    r15, g9, g9
    addo    1, g1, g1
    b       loc_6054
# ---------------------------------------------------------------------------
loc_60DC:                               # CODE XREF: ROM:00006058↑j
    ret
# ---------------------------------------------------------------------------
dsp_char2:                              # Label from official source
    lda     1023, r13
    cmpoble r13, g0, loc_5E4C # return
    lda     texture_palette_offsets, r3
    ld      0x0(r3)[g0*4], g0
    ldos    (g0), r3
    ldos    2(g0), r15
    ld      4(g0), r4
    ld      8(g0), r5
    ld      0xC(g0), r6
    addo    0x10, g0, g4
    mulo    r4, r6, r7
    shlo    1, r7, r7
    cmpo    0, r15
    bne     loc_6120
loc_6120:                               # CODE XREF: ROM:0000611C↑j
    ldob    (g2)[g1], r11
    remo    r6, r11, r14
    divo    r6, r11, r15
    shlo    1, r14, r14
    mulo    r4, r14, r14
    mulo    r7, r15, r15
    mulo    r5, r15, r15
    addo    r14, r15, r15
    addo    g4, r15, r8
    mov     r5, r10
loc_6148:                               # CODE XREF: ROM:00006184↓j
    mov     r4, r11
loc_614C:                               # CODE XREF: ROM:00006164↓j
    ldos    (r8), r9
    addo    r3, r9, r9
    stos    r9, (g9)
    addo    2, r8, r8
    addo    2, g9, g9
    cmpdeco 1, r11, r11
    bl      loc_614C
    shlo    1, r4, r15
    subo    r15, r8, r8
    subo    r15, g9, g9
    addo    r7, r8, r8
    shlo    7, 1, r15
    addo    r15, g9, g9
    cmpdeco 1, r10, r10
    bl      loc_6148
    mulo    r5, r15, r15
    subo    r15, g9, g9
    shlo    1, r4, r15
    addo    r15, g9, g9
    ret
# =============== S U B R O U T I N E =======================================
dsp_mes_2x3:                            # CODE XREF: sel_disp_init+780↓p
    mov     13, r11         # Label from official source
    lda     texture_palette_offsets, r4
    ld      0x0(r4)[r11*4], r11 # r11 = yellow_font_info
    ldos    (r11), r3       # r3 = 0x8000
    ldos    2(r11), r15     # r15 = 1
    addo    12, r11, r11
    shlo    7, 1, r10
    cmpo    0, r15
    bne     dsp_mes_char_tex_setup
dsp_mes_char_tex_setup:                 # CODE XREF: dsp_mes_2x3+28↑j
    ldob    (g0), r15       # g0 = ascii data
    cmpo    0, r15
    be      loc_6250        # if ascii is 0, return
    addo    1, g0, g0       # g0 = Pointer to next character in string
    ldob    asciihex_to_texindex_table[r15], r12 # r12 = 0x07
    shro    3, r12, r13     # r13 = 0
    shlo    3, r13, r13     # r13 = 0
    subo    r13, r12, r14   # r14 = 7
    shlo    2, r13, r13     # r13 = 0
    shlo    2, r14, r14     # r14 = 0x1C or 28
    addo    r13, r13, r15   # r15 = 0
    addo    r13, r15, r15   # r15 = 0
    addo    r14, r15, r15   # r15 = 0x1C or 28
    addo    r11, r15, r6    # r6 = 0x298D0F4
    mov     3, r7
loc_6208:                               # CODE XREF: dsp_mes_2x3+9C↓j
    mov     2, r8
loc_620C:                               # CODE XREF: dsp_mes_2x3+88↓j
    ldos    (r6), r15
    addo    r3, r15, r15
    stos    r15, (g9)
    addo    2, r6, r6
    addo    2, g9, g9
    cmpdeco 1, r8, r8
    bl      loc_620C
    addo    28, r6, r6
    addo    r10, g9, g9
    subo    4, g9, g9
    cmpdeco 1, r7, r7
    bl      loc_6208
    subo    r10, g9, g9     # Subtract 0x80 for each vertical block
    subo    r10, g9, g9
    subo    r10, g9, g9
    addo    4, g9, g9       # This moves N blocks right for next character
    b       dsp_mes_char_tex_setup
# ---------------------------------------------------------------------------
loc_6250:                               # CODE XREF: dsp_mes_2x3+34↑j
    ret                     # return
# End of function dsp_mes_2x3
# =============== S U B R O U T I N E =======================================
dsp_char_2x3:                           # CODE XREF: sub_4FBB4+20↓p
    mov     13, r11         # Label from official source
    lda     texture_palette_offsets, r4
    ld      0x0(r4)[r11*4], r11
    ldos    (r11), r3
    ldos    2(r11), r15
    addo    0xC, r11, r11
    shlo    7, 1, r10
    cmpo    0, r15
    bne     loc_6280
loc_6280:                               # CODE XREF: dsp_char_2x3+28↑j
    ldob    asciihex_to_texindex_table[g0], r12
    shro    3, r12, r13
    shlo    3, r13, r13
    subo    r13, r12, r14
    shlo    2, r13, r13
    shlo    2, r14, r14
    addo    r13, r13, r15
    addo    r13, r15, r15
    addo    r14, r15, r15
    addo    r11, r15, r6
    mov     3, r7
loc_62B0:                               # CODE XREF: dsp_char_2x3+8C↓j
    mov     2, r8
loc_62B4:                               # CODE XREF: dsp_char_2x3+78↓j
    ldos    (r6), r15
    addo    r3, r15, r15
    stos    r15, (g9)
    addo    2, r6, r6
    addo    2, g9, g9
    cmpdeco 1, r8, r8
    bl      loc_62B4
    addo    0x1C, r6, r6
    addo    r10, g9, g9
    subo    4, g9, g9
    cmpdeco 1, r7, r7
    bl      loc_62B0
    subo    r10, g9, g9
    subo    r10, g9, g9
    subo    r10, g9, g9
    addo    4, g9, g9
    ret
# End of function dsp_char_2x3
# =============== S U B R O U T I N E =======================================
dsp_num_2x3:                            # CODE XREF: print_dec_2x3+30↓p
    mov     13, r11         # Label from official source
    lda     texture_palette_offsets, r4
    ld      0x0(r4)[r11*4], r11
    ldos    (r11), r3
    ldos    2(r11), r15
    addo    0xC, r11, r11
    shlo    7, 1, r10
    cmpo    0, r15
    bne     loc_6324
loc_6324:                               # CODE XREF: dsp_num_2x3+28↑j
    addo    0x1F, 9, r12
    addo    g0, r12, r12
    shro    3, r12, r13
    shlo    3, r13, r13
    subo    r13, r12, r14
    shlo    2, r13, r13
    shlo    2, r14, r14
    addo    r13, r13, r15
    addo    r13, r15, r15
    addo    r14, r15, r15
    addo    r11, r15, r6
    mov     3, r7
loc_6354:                               # CODE XREF: dsp_num_2x3+8C↓j
    mov     2, r8
loc_6358:                               # CODE XREF: dsp_num_2x3+78↓j
    ldos    (r6), r15
    addo    r3, r15, r15
    stos    r15, (g9)
    addo    2, r6, r6
    addo    2, g9, g9
    cmpdeco 1, r8, r8
    bl      loc_6358
    addo    0x1C, r6, r6
    addo    r10, g9, g9
    subo    4, g9, g9
    cmpdeco 1, r7, r7
    bl      loc_6354
    subo    r10, g9, g9
    subo    r10, g9, g9
    subo    r10, g9, g9
    addo    4, g9, g9
    ret
# End of function dsp_num_2x3
# =============== S U B R O U T I N E =======================================
print_dec_2x3:                          # CODE XREF: char_vic_rank_disp_one_line_sub+2C↓p
    mov     g0, r11         # Label from official source
    lda     0x50E000, r10
    mov     0, r3
loc_63AC:                               # CODE XREF: print_dec_2x3+24↓j
    remo    0xA, r11, g0
    divo    0xA, r11, r11
    stob    g0, (r10)
    addo    1, r10, r10
    addo    1, r3, r3
    cmpobne 0, r11, loc_63AC
loc_63C4:                               # CODE XREF: print_dec_2x3+38↓j
    ldob    0x50DFFF(r3), g0
    call    dsp_num_2x3
    cmpdeco 1, r3, r3
    bl      loc_63C4
    ret
# End of function print_dec_2x3
# =============== S U B R O U T I N E =======================================
make_dec_string_right:                  # CODE XREF: disp_dec_r+8↓p
    cmpobe  0, g1, loc_642C # Label from official source
    mov     g0, r11
    lda     0x50E000(g1), r10
    mov     g1, r3
loc_63F0:                               # CODE XREF: make_dec_string_right+2C↓j
    remo    0xA, r11, r9
    divo    0xA, r11, r11
    subo    1, r10, r10
    stob    r9, (r10)
    cmpobe  0, r11, loc_6410
    cmpdeco 1, r3, r3
    bl      loc_63F0
    b       loc_642C
# ---------------------------------------------------------------------------
loc_6410:                               # CODE XREF: make_dec_string_right+24↑j
    mov     0xA, r9
    subo    1, r3, r3
    cmpobe  0, r3, loc_642C
loc_641C:                               # CODE XREF: make_dec_string_right+4C↓j
    subo    1, r10, r10
    stob    r9, (r10)
    cmpdeco 1, r3, r3
    bl      loc_641C
loc_642C:                               # CODE XREF: make_dec_string_right↑j
    mov     r10, g0
    ret
# End of function make_dec_string_right
# =============== S U B R O U T I N E =======================================
make_dec_string_zero_right:             # CODE XREF: disp_dec+8↓p
    cmpobe  0, g1, loc_6460 # Label from official source
    mov     g0, r11
    lda     0x50E000(g1), r10
    mov     g1, r3
loc_6448:                               # CODE XREF: make_dec_string_zero_right+28↓j
    remo    0xA, r11, r9
    divo    0xA, r11, r11
    subo    1, r10, r10
    stob    r9, (r10)
    cmpdeco 1, r3, r3
    bl      loc_6448
loc_6460:                               # CODE XREF: make_dec_string_zero_right↑j
    mov     r10, g0
    ret
# End of function make_dec_string_zero_right
# =============== S U B R O U T I N E =======================================
make_dec_string_left:                   # CODE XREF: sub_7B380+114↓p
    mov     g0, r11         # Label from official source
    lda     0x50E000(g1), r10
    mov     g1, r3
    mov     0, g1
loc_647C:                               # CODE XREF: make_dec_string_left+2C↓j
    cmpobe  g1, r3, loc_6498
    remo    0xA, r11, r9
    divo    0xA, r11, r11
    subo    1, r10, r10
    stob    r9, (r10)
    addo    1, g1, g1
    cmpobne 0, r11, loc_647C
loc_6498:                               # CODE XREF: make_dec_string_left:loc_647C↑j
    mov     r10, g0
    ret
# End of function make_dec_string_left
# =============== S U B R O U T I N E =======================================
scroll_all_init:                        # CODE XREF: ROM:NAME_INT↓p
    lda     0x1000000, g9   # Label from official source
    addo    0x1F, 0x1F, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    lda     0x1004000, g9
    addo    0x1F, 0x1F, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    lda     0x1002000, g9
    addo    0x1F, 0x1F, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    lda     0x1006000, g9
    addo    0x1F, 0x1F, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    mov     0, r15
    stis    r15, 0x100A000
    mov     0, r15
    stis    r15, 0x100A008
    mov     0, r15
    stis    r15, scrB_H_page
    mov     0, r15
    stis    r15, scrB_V_page
    lda     0x100C000, r14
    mov     0, r15
    shlo    0xB, 1, r13
loc_6530:                               # CODE XREF: scroll_all_init+9C↓j
    stis    r15, (r14)
    addo    2, r14, r14
    cmpdeco 1, r13, r13
    bl      loc_6530
    lda     0x100D000, r14
    mov     0, r15
    shlo    0xB, 1, r13
loc_6550:                               # CODE XREF: scroll_all_init+BC↓j
    stis    r15, (r14)
    addo    2, r14, r14
    cmpdeco 1, r13, r13
    bl      loc_6550
    lda     0x1008000, r14
    shlo    9, 1, r15
    shlo    7, 3, r13
loc_6570:                               # CODE XREF: scroll_all_init+DC↓j
    stis    r15, (r14)
    addo    2, r14, r14
    cmpdeco 1, r13, r13
    bl      loc_6570
    lda     0x1008800, r14
    shlo    9, 1, r15
    shlo    7, 3, r13
loc_6590:                               # CODE XREF: scroll_all_init+FC↓j
    stis    r15, (r14)
    addo    2, r14, r14
    cmpdeco 1, r13, r13
    bl      loc_6590
    ret
# End of function scroll_all_init
# ---------------------------------------------------------------------------
debug_disp_ang:                         # Label from official source
    lda     0xE10, r15
    mulo    r15, g0, g0
    lda     0xFFFF, r15
    divo    r15, g0, g0
    b       debug_disp_int
# =============== S U B R O U T I N E =======================================
debug_disp_float:                       # CODE XREF: ROM:000067A0↓p
    cvtri   g0, g0          # Label from official source
# End of function debug_disp_float
# =============== S U B R O U T I N E =======================================
# Attributes: noreturn
debug_disp_int:                         # CODE XREF: set_obj-140↑p
    mov     g9, r15         # Label from official source
    call    print_dec       # Print g0 as decimal
    addo    0xE, g9, g9
    b       r14_dispText
# End of function debug_disp_int
# =============== S U B R O U T I N E =======================================
# Attributes: noreturn
debug_disp_hex:                         # CODE XREF: ROM:00004DA4↑p
    mov     g9, r15         # Label from official source
    call    print_hex_w
    addo    0x12, g9, g9
    b       r14_dispText
# End of function debug_disp_hex
# =============== S U B R O U T I N E =======================================
# Attributes: noreturn
debug_disp_hex_b:
    lda     0xFF, r15       # Label from official source
    b       loc_65F0
# End of function debug_disp_hex_b
# =============== S U B R O U T I N E =======================================
debug_disp_hex_h:                       # CODE XREF: ROM:00004DE8↑p
    lda     0xFFFF, r15     # Label from official source
loc_65F0:                               # CODE XREF: debug_disp_hex_b+4↑j
    and     r15, g0, g0
    mov     g9, r15
    call    print_hex_b
    addo    0xE, g9, g9
loc_6600:                               # DATA XREF: smooth_int+94↓o
    b       r14_dispText
# End of function debug_disp_hex_h
# =============== S U B R O U T I N E =======================================
debug_disp_bin:
    mov     g9, r15         # Label from official source
    call    print_bin
    addo    2, g9, g9
    b       r14_dispText
# End of function debug_disp_bin
# =============== S U B R O U T I N E =======================================
debug_disp_bin_w:
    mov     g9, r15         # Label from official source
    call    print_bin_w
    addo    2, g9, g9
    b       r14_dispText
# End of function debug_disp_bin_w
# =============== S U B R O U T I N E =======================================
debug_disp_mes:                         # CODE XREF: ROM:loc_B18↑p
    mov     g9, r15         # Label from official source
r14_dispText:                           # CODE XREF: debug_disp_int+C↑j
    mov     r14, g0
    call    print_mes
    mov     r15, g9
    shlo    7, 1, r15
    addo    r15, g9, g9
    b       bal_disp_exit
# ---------------------------------------------------------------------------
disp_mes:                               # Label from official source
    mov     r14, g0
    call    print_mes
bal_disp_exit:                          # CODE XREF: debug_disp_mes+18↑j
    lda     0xFFFFFF, r15   # Label from official source
loc_6650:                               # CODE XREF: debug_disp_mes+34↓j
    ld      (r14), g0
    lda     4(r14), r14
    cmpobl  r15, g0, loc_6650
    bx      (r14)
# End of function debug_disp_mes
