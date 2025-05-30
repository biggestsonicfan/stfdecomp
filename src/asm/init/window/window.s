        .section window
# =============== S U B R O U T I N E =======================================
set_window_data:                        # CODE XREF: main_loop+58↓p
    st      g14, mmode # Label from official source
    lda     0x808, g14
    st      g14, 0x80(g10)
    ld      mmode, g14
    ldis    0x5010DE, r4
    shli    8, r4, r4
    lda     0x807FFFFF, r3
    and     r3, r4, r4
    ldob    0x5010DC, r3
    shlo    0x17, r3, r3
    or      r3, r4, r4
    st      r4, 0x5010E0
    st      r4, (g10)[g12*1]
    ret
# End of function set_window_data
# ---------------------------------------------------------------------------
    ret                     # unreachable code

    .section window_data
# =============== S U B R O U T I N E =======================================
window_data_init:                       # CODE XREF: ROM:00006AAC↓p
                lda     win_down_rom, r10 # Label from official source
                lda     win_down, r11   # Window down
                ldt     (r10), r4
                stt     r4, (r11)
                ldt     0xC(r10), r4
                stt     r4, 0xC(r11)
                lda     word_5600, r10
                lda     0x501500, r11
                ldt     (r10), r4
                stt     r4, (r11)
                ldt     0xC(r10), r4
                stt     r4, 0xC(r11)
                lda     word_5618, r10
                lda     0x501420, r11
                ldt     (r10), r4
                stt     r4, (r11)
                ldt     0xC(r10), r4
                stt     r4, 0xC(r11)
loc_5550:                               # DATA XREF: get_en_info+564↓o
                ret
# End of function window_data_init
# ---------------------------------------------------------------------------
WINDOW_A:                               # Label from official source
                lda     win_down_rom, g0
                call    set_window      # g0 = two shorts
                ret
# =============== S U B R O U T I N E =======================================
# g0 = two shorts
set_window:                             # CODE XREF: ROM:0000555C↑p
                st      g14, mmode # Label from official source
                lda     0x303, g14
                st      g14, 0x30(g10)
                ld      mmode, g14
                ld      0x5013F0, r7 # r7 = 128
                lda     383, r6
                mov     6, r8
loc_558C:                               # CODE XREF: set_window+4C↓j
                ldis    (g0), r3
                subi    r3, r6, r3
                ldis    2(g0), r4
                shli    0x10, r4, r4
                addi    r3, r4, r4
                addi    r7, r4, r4
                st      r4, (g10)[g12*1]
                addo    4, g0, g0
                cmpdeco 1, r8, r8
                bl      loc_558C
                ret
# End of function set_window
# ---------------------------------------------------------------------------
win_down_rom:   .short 0x180            # DATA XREF: window_data_init↑o
win_left_rom:   .short 0                # DATA XREF: sub_7D230+50↓r
win_up_rom:     .short 0                # DATA XREF: sub_7D230+10↓r
win_right_rom:  .short 0x1F0            # DATA XREF: sub_7D230+58↓r
                .short 0xC0
                .short 0xF8
                .short 0xC0
                .short 0xF8
                .short 0xC0
                .short 0xF8
                .short 0xC0
                .short 0xF8
word_55D0:      .short 0x128            # DATA XREF: ROM:00022638↓o
                .short 0
                .short 0x70
                .short 0xF7
                .short 0xCC
                .short 0x7B
                .short 0xCC
                .short 0x7B
                .short 0xCC
                .short 0x7B
                .short 0xCC
                .short 0x7B
word_55E8:      .short 0xF8             # DATA XREF: ROM:000228F4↓o
                .short 0xF8
                .short 0x40
                .short 0x1F0
                .short 0x9C
                .short 0x174
                .short 0x9C
                .short 0x174
                .short 0x9C
                .short 0x174
                .short 0x9C
                .short 0x174
word_5600:      .short 0x14F            # DATA XREF: window_data_init+20↑o
                .short 0
                .short 0
                .short 0x1EF
                .short 0xA7
                .short 0xF7
                .short 0xA7
                .short 0xF7
                .short 0xA7
                .short 0xF7
                .short 0xA7
                .short 0xF7
word_5618:      .short 0x180            # DATA XREF: window_data_init:loc_5530↑o
                .short 0x100
                .short 0
                .short 0x1F0
                .short 0xC0
                .short 0x178
                .short 0xC0
                .short 0x178
                .short 0xC0
                .short 0x178
                .short 0xC0
                .short 0x178
# =============== S U B R O U T I N E =======================================
# Doesn't seem to do anything in StF
set_viewing_data:                       # CODE XREF: ROM:00006AA8↓p
                lda     dword_8E3D4, g0 # Label from official source
                lda     0x501500, g1
                ld      0x0(g0), r3
                ld      4(g0), r4
                ld      8(g0), r5
                ld      0xC(g0), r6
                ld      0x10(g0), r7
                ld      0x14(g0), r8
                st      r3, 0x0(g1)
                st      r4, 4(g1)
                st      r5, 8(g1)
                st      r6, 0xC(g1)
                st      r7, 0x10(g1)
                st      r8, 0x14(g1)
                ret
# End of function set_viewing_data
