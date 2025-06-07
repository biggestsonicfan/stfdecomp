        .section action
# =============== S U B R O U T I N E =======================================
ACT_RC_UKEMI:                           # DATA XREF: ROM:0001D130↓o
        ldob    0x1B2(g7), r3   # Label from official source
        cmpibe  0, r3, loc_1493C
        cmpibe  1, r3, loc_14960
        cmpibe  2, r3, loc_149E8
        cmpibe  3, r3, loc_14B08
        cmpibe  4, r3, loc_14B28
loc_1493C:                              # CODE XREF: ACT_RC_UKEMI+4↑j
        ld      0x0(g7), r14
        setbit  4, r14, r15
        st      r15, 0x0(g7)
        ldob    0x843(g8), r14
        ldos    0x19C(g7), g0
        call    comp_set_motion
        ldob    0x1B2(g7), r14
        addi    1, r14, r15
        stob    r15, 0x1B2(g7)
loc_14960:                              # CODE XREF: ACT_RC_UKEMI+8↑j
        ldos    0x1AA(g7), r13
        ldos    0x80E(g7), r14
        cmpobl  r13, r14, loc_14B6C
        ldob    0x843(g8), r14
        cmpobe  4, r14, loc_149C4
        ldob    0x86A(g7), r3
        bbc     1, r3, loc_149B4
        ldob    0x843(g8), r14
        lda     flt_1D294[r14*8], r4
        ldob    0x6F4(g7), r14
        cmpobge 1, r14, loc_14994
        addo    4, r4, r4
loc_14994:                              # CODE XREF: ACT_RC_UKEMI+68↑j
        ld      (r4), r4
        ld      0x2C(g7), r14
        mulr    r4, r14, r15
        st      r15, 0x2C(g7)
        ld      0x34(g7), r14
        mulr    r4, r14, r15
        st      r15, 0x34(g7)
        b       loc_149C4
# ---------------------------------------------------------------------------
loc_149B4:                              # CODE XREF: ACT_RC_UKEMI+54↑j
        bbc     0, r3, loc_149C4
        mov     0, r4
        st      r4, 0x2C(g7)
        st      r4, 0x34(g7)
loc_149C4:                              # CODE XREF: ACT_RC_UKEMI+4C↑j
        ldob    0x86A(g7), r3
        bbc     2, r3, loc_149D8
        lda     0x3ECCCCCD, r3
        st      r3, 0x30(g7)
loc_149D8:                              # CODE XREF: ACT_RC_UKEMI+A4↑j
        call    fix_hara
        ldob    0x1B2(g7), r14
        addi    1, r14, r15
        stob    r15, 0x1B2(g7)
loc_149E8:                              # CODE XREF: ACT_RC_UKEMI+C↑j
        ld      0x0(g7), r15
        bbs     2, r15, loc_149FC
        ldis    0x818(g7), r15
        stis    r15, 0x1AA(g7)
        b       loc_14B14
# ---------------------------------------------------------------------------
loc_149FC:                              # CODE XREF: ACT_RC_UKEMI+C8↑j
        ld      0x644(g7), r10
        ld      0x64C(g7), r11
        or      r10, r11, r10
        clrbit  0x1F, r10, r10
        cmpobe  0, r10, loc_14A60
        ld      0x2C(g7), r3
        clrbit  0x1F, r3, r4
        lda     0x3DB851EC, r10
        cmpr    r10, r4
        bg      loc_14A3C
        lda     0x80000000, r13
        and     r13, r3, r3
        or      r3, r10, r3
        st      r3, 0x2C(g7)
loc_14A3C:                              # CODE XREF: ACT_RC_UKEMI+100↑j
        ld      0x34(g7), r3
        clrbit  0x1F, r3, r4
        cmpr    r10, r4
        bg      loc_14A60
        lda     0x80000000, r13
        and     r13, r3, r3
        or      r3, r10, r3
        st      r3, 0x34(g7)
loc_14A60:                              # CODE XREF: ACT_RC_UKEMI+E8↑j
        ldos    0x1AA(g7), r13
        ld      0xAF8(g7), r14
        cmpobl  r13, r14, loc_14B6C
        ld      0xA08(g7), r15
        bbs     1, r15, loc_14B6C
        ld      0x1F8(g7), r3
        lda     0x3F99999A, r4
        cmpr    r3, r4
        bl      loc_14B6C
        ld      0x1A4(g7), r15
        bbs     0xE, r15, loc_14B6C
        mov     0, r3
        st      r3, 0x19C(g7)
        mov     6, r3
        stob    r3, 0x19F(g7)
        mov     2, r3
        stob    r3, 0x1B2(g7)
        ld      0x1A4(g7), r15
        setbit  0xC, r15, r15
        st      r15, 0x1A4(g7)
        ld      0x0(g7), r15
        clrbit  4, r15, r15
        st      r15, 0x0(g7)
        ld      0x1A4(g7), r15
        clrbit  0, r15, r15
        st      r15, 0x1A4(g7)
        ld      0x70C(g7), r15
        clrbit  2, r15, r15
        st      r15, 0x70C(g7)
        addo    0x1F, 0xF, r15
        stib    r15, 0x5BE(g7)
        ld      0xA08(g7), r15
        setbit  0x1F, r15, r15
        st      r15, 0xA08(g7)
        ld      0xA08(g7), r15
        setbit  0x11, r15, r15
        st      r15, 0xA08(g7)
        ld      0xA08(g7), r15
        setbit  0x15, r15, r15
        st      r15, 0xA08(g7)
        b       loc_14B6C
# ---------------------------------------------------------------------------
loc_14B08:                              # CODE XREF: ACT_RC_UKEMI+10↑j
        ldos    0x1AA(g7), r13
        ldos    0x818(g7), r14
        cmpobl  r13, r14, loc_14B6C
loc_14B14:                              # CODE XREF: ACT_RC_UKEMI+D4↑j
        mov     1, g0
        call    stage_contact_sound
        b       loc_14B20
# ---------------------------------------------------------------------------
loc_14B20:                              # CODE XREF: ACT_RC_UKEMI+1F8↑j
        mov     4, r15
        stib    r15, 0x1B2(g7)
loc_14B28:                              # CODE XREF: ACT_RC_UKEMI+14↑j
        ldos    0x1AA(g7), r13
        ldos    0x80C(g7), r14
        cmpobl  r13, r14, loc_14B6C
        mov     0, r3
        st      r3, 0x2C(g7)
        st      r3, 0x30(g7)
        st      r3, 0x34(g7)
        ld      0x1A4(g7), r14
        clrbit  0, r14, r15
        st      r15, 0x1A4(g7)
        ld      0x0(g7), r14
        clrbit  4, r14, r15
        st      r15, 0x0(g7)
        mov     0, r15
        st      r15, 0x19C(g7)
        mov     0, r15
        stib    r15, 0x6F5(g7)
loc_14B6C:                              # CODE XREF: ACT_RC_UKEMI+44↑j
        ret
# End of function ACT_RC_UKEMI
# ---------------------------------------------------------------------------
loc_14B28_alt:                           # unreachable code
        ld      0x0(g7), r14
        clrbit  4, r14, r15
        st      r15, 0x0(g7)
        mov     0, r15
        st      r15, 0x19C(g7)
        mov     0, r15
        stib    r15, 0x6F5(g7)
        ret

                .section act_rc_ukemi_floats
flt_1D294:      .float 4.0              # DATA XREF: ACT_RC_UKEMI+5C↑o
                .float 1.0
                .float 4.0
                .float 1.0
                .float 12.0
                .float 1.0
                .float 12.0
                .float 1.0
                .float 1.0
                .float 1.0
                .float 4.0
                .float 1.0
                .float 8.0
                .float 1.0
                .float 4.0
                .float 1.0
                .float 4.0
                .float 1.0
                .float 24.0
                .float 24.0
                