
        .globl check_credit
        .globl dec_credit
        .globl sub_201C
        .globl sub_24CC
        .section check
# =============== S U B R O U T I N E =======================================
check_credit:                           # CODE XREF: player_entry+34↑p
    addo    4, sp, sp       # Label from official source
    st      g9, -4(sp)
    ld      add_BACKUP_RAM_TO_RAM, g9
    ld      add_BACKUP_RAM_TO_RAM, r15
    ldob    0x3324(r15), r14 # credits_required_bk_ram
    cmpobne 0x1A, r14, loc_1BA4
    ld      0x3320(r15), r14 # BACKUP_RAM_TO_RAM+0x3320
    bbc     1, r14, loc_1CA8
loc_1BA4:                               # CODE XREF: check_credit+24↑j
    mov     g0, r3
    ld      BACKUP_RAM_TO_RAM_offsets[g1*4], r4
    ldob    (g9)[r4], r4
    ld      0x3320(g9), r12
    bbs     0, r12, loc_1C64
    mov     0, g0
    call    check_credit_sub
    shro    0x10, g0, r7
    and     0xF, r7, r7
    mov     1, g0
    call    check_credit_sub
    shro    0x10, g0, r10
    and     0xF, r10, r10
    ld      0x3320(g9), r15
    bbs     1, r15, loc_1C24
    ldob    0x3380(g9), r5
    divo    r7, r5, r5
    ldob    0x3388(g9), r8
    divo    r10, r8, r8
    ldob    0x3385(g9), r6
    ldob    0x338D(g9), r9
    addo    r5, r6, r5
    addo    r5, r8, r5
    addo    r5, r9, r5
    b       loc_1C54
# ---------------------------------------------------------------------------
loc_1C24:                               # CODE XREF: check_credit+78↑j
    ldob    0x3380(g9), r5
    ldob    0x3388(g9), r8
    addo    r5, r8, r5
loc_1C38:                               # DATA XREF: zanzou_control+B4↓o
    divo    r7, r5, r5
    ldob    0x3385(g9), r6
    ldob    0x338D(g9), r9
    addo    r5, r6, r5
    addo    r5, r9, r5
loc_1C54:                               # CODE XREF: check_credit+B0↑j
    subo    1, 0, g0
    cmpobg  r4, r5, loc_1CAC
    xor     g0, g0, g0
    b       loc_1CAC
# ---------------------------------------------------------------------------
loc_1C64:                               # CODE XREF: check_credit+4C↑j
    cmpobne 0, r3, loc_1C78
    lda     0x3388(g9), r15
    mov     1, g0
    b       loc_1C84
# ---------------------------------------------------------------------------
loc_1C78:                               # CODE XREF: check_credit:loc_1C64↑j
    lda     0x3380(g9), r15
    mov     0, g0
loc_1C84:                               # CODE XREF: check_credit+104↑j
    call    check_credit_sub
    shro    0x10, g0, r7
    and     0xF, r7, r7
    ldob    0x0(r15), r5
    ldob    5(r15), r6
    divo    r7, r5, r5
    addo    r5, r6, r5
    subo    1, 0, g0
    cmpobg  r4, r5, loc_1CAC
loc_1CA8:                               # CODE XREF: check_credit+30↑j
    xor     g0, g0, g0
loc_1CAC:                               # CODE XREF: check_credit+E8↑j
    ld      -4(sp), g9
    subo    4, sp, sp
    ret
# End of function check_credit
# =============== S U B R O U T I N E =======================================
dec_credit:                             # CODE XREF: player_entry+44↑p
    addo    4, sp, sp       # Label from Fighting Vipers source
    st      g9, -4(sp)
    ld      add_BACKUP_RAM_TO_RAM, g9
    ld      0x3320(g9), r15 # BACKUP_RAM_TO_RAM+0x3320
    bbs     1, r15, loc_1CE8
    ldob    0x3324(g9), r15 # credits_required_bk_ram
    cmpobe  0x1A, r15, loc_1E70
loc_1CE8:                               # CODE XREF: dec_credit+1C↑j
    mov     g0, r3
    mov     g1, r4
    call    sub_1E80
    mov     g0, r5
    ld      0x3320(g9), r12
loc_1D00:                               # DATA XREF: ROM:000088D8↓w
    bbs     0, r12, loc_1D28
loc_1D04:                               # DATA XREF: ROM:000088E8↓w
    lda     0xFF, r15
loc_1D08:                               # DATA XREF: ROM:000088F8↓w
    and     r15, r5, r6
loc_1D0C:                               # DATA XREF: ROM:00008908↓w
    shro    8, r5, r7
loc_1D10:                               # DATA XREF: ROM:00008918↓w
    and     r15, r7, r7
loc_1D14:                               # DATA XREF: ROM:00008928↓w
    shro    0x10, r5, r8
loc_1D18:                               # DATA XREF: ROM:00008938↓w
    and     0x1F, r8, r8
loc_1D1C:                               # DATA XREF: ROM:00008948↓w
    shro    0x18, r5, r9
loc_1D20:                               # DATA XREF: ROM:00008958↓w
    and     0x1F, r9, r9
    b       loc_1D50
# ---------------------------------------------------------------------------
loc_1D28:                               # CODE XREF: dec_credit:loc_1D00↑j
    and     0x1F, r5, r7
    shro    8, r5, r9
    and     0x1F, r9, r9
    xor     r6, r6, r6
    xor     r8, r8, r8
    cmpobe  0, r3, loc_1D50
    mov     r7, r6
    mov     r9, r8
    xor     r7, r7, r7
    xor     r9, r9, r9
loc_1D50:                               # CODE XREF: dec_credit+68↑j
    ldob    0x3385(g9), r10
    subo    r8, r10, r8
    stob    r8, 0x1D03385
    stob    r8, 0x59C385
    ldob    0x338D(g9), r10
    subo    r9, r10, r9
    stob    r9, 0x1D0338D
    stob    r9, 0x59C38D
    bbc     0, r12, loc_1D90
    cmpobe  0, r3, loc_1DFC
loc_1D90:                               # CODE XREF: dec_credit+CC↑j
    mov     0, r15
    stob    r15, 0x1D03384
    stob    r15, 0x59C384
    bbs     0, r12, loc_1DCC
    bbc     1, r12, loc_1DCC
    ldob    0x3380(g9), r10
    subo    r6, r10, r10
    stob    r10, 0x1D03380
    stob    r10, 0x59C380
    b       loc_1DFC
# ---------------------------------------------------------------------------
loc_1DCC:                               # CODE XREF: dec_credit+E8↑j
    ldob    0x3380(g9), r10
    mov     0, g0
    call    check_credit_sub
    shro    0x10, g0, r13
    and     0x1F, r13, r13
    mulo    r13, r6, r13
    subo    r13, r10, r10
    stob    r10, 0x1D03380
    stob    r10, 0x59C380
loc_1DFC:                               # CODE XREF: dec_credit+D0↑j
    bbc     0, r12, loc_1E04
    cmpobne 0, r3, loc_1E70
loc_1E04:                               # CODE XREF: dec_credit:loc_1DFC↑j
    mov     0, r15
    stob    r15, CREDIT_02_bk
    stob    r15, CREDIT_02
    bbs     0, r12, loc_1E40
    bbc     1, r12, loc_1E40
loc_1E20:                               # r10 = BACKUP_RAM_TO_RAM+0x3388
    ldob    0x3388(g9), r10
    subo    r7, r10, r10
    stob    r10, CREDIT_01_bk
    stob    r10, CREDIT_01
    b       loc_1E70
# ---------------------------------------------------------------------------
loc_1E40:                               # CODE XREF: dec_credit+15C↑j
    ldob    0x3388(g9), r10
    mov     1, g0
    call    check_credit_sub
    shro    0x10, g0, r13
    and     0x1F, r13, r13
    mulo    r13, r7, r13
    subo    r13, r10, r10
    stob    r10, CREDIT_01_bk
    stob    r10, CREDIT_01
loc_1E70:                               # CODE XREF: dec_credit+28↑j
    ld      -4(sp), g9
    subo    4, sp, sp
    ret
# End of function dec_credit
# =============== S U B R O U T I N E =======================================
sub_1E80:                               # CODE XREF: dec_credit+34↑p
    addo    4, sp, sp
    st      g9, -4(sp)
    ld      add_BACKUP_RAM_TO_RAM, g9
    mov     g0, r3
    ld      BACKUP_RAM_TO_RAM_offsets[g1*4], r4
    ld      add_BACKUP_RAM_TO_RAM, r13
    ldob    (g9)[r4], r4
    ld      0x3320(g9), r12
    bbs     0, r12, loc_1FB0
    mov     0, g0
    call    check_credit_sub
    shro    0x10, g0, r7
    and     0xF, r7, r7
    mov     1, g0
    call    check_credit_sub
    shro    0x10, g0, r10
    and     0xF, r10, r10
    ld      0x3320(g9), r15
    bbc     1, r15, loc_1F24
    ldob    0x3385(g9), r6
    ldob    0x338D(g9), r9
    cmpobge r9, r4, loc_1F68
    subo    r9, r4, r4
    cmpobge r6, r4, loc_1F70
    subo    r6, r4, r4
    mulo    r7, r4, r4
    ldob    0x3388(g9), r8
    ldob    0x3380(g9), r5
    cmpobge r8, r4, loc_1F78
    subo    r8, r4, r4
    b       loc_1F80
# ---------------------------------------------------------------------------
loc_1F24:                               # CODE XREF: sub_1E80+60↑j
    ldob    0x3380(g9), r5
    ldob    0x3385(g9), r6
    divo    r7, r5, r5
    ldob    0x3388(g9), r8
    ldob    0x338D(g9), r9
    divo    r10, r8, r8
    cmpobge r9, r4, loc_1F68
    subo    r9, r4, r4
    cmpobge r6, r4, loc_1F70
    subo    r6, r4, r4
    cmpobge r8, r4, loc_1F78
    subo    r8, r4, r4
    b       loc_1F80
# ---------------------------------------------------------------------------
loc_1F68:                               # CODE XREF: sub_1E80+74↑j
    mov     r4, r9
    b       loc_1F88
# ---------------------------------------------------------------------------
loc_1F70:                               # CODE XREF: sub_1E80+7C↑j
    mov     r4, r6
    b       loc_1F8C
# ---------------------------------------------------------------------------
loc_1F78:                               # CODE XREF: sub_1E80+98↑j
    mov     r4, r8
    b       loc_1F90
# ---------------------------------------------------------------------------
loc_1F80:                               # CODE XREF: sub_1E80+A0↑j
    mov     r4, r5
    b       loc_1F94
# ---------------------------------------------------------------------------
loc_1F88:                               # CODE XREF: sub_1E80+EC↑j
    xor     r6, r6, r6
loc_1F8C:                               # CODE XREF: sub_1E80+F4↑j
    xor     r8, r8, r8
loc_1F90:                               # CODE XREF: sub_1E80+FC↑j
    xor     r5, r5, r5
loc_1F94:                               # CODE XREF: sub_1E80+104↑j
    shlo    0x18, r9, r9
    shlo    0x10, r6, r6
    shlo    8, r8, r8
    or      r5, r8, r5
    or      r5, r6, r5
    or      r5, r9, g0
    b       loc_200C
# ---------------------------------------------------------------------------
loc_1FB0:                               # CODE XREF: sub_1E80+34↑j
    cmpobne 0, r3, loc_1FC4
    lda     0x3388(g9), r15
    mov     1, g0
    b       loc_1FD0
# ---------------------------------------------------------------------------
loc_1FC4:                               # CODE XREF: sub_1E80:loc_1FB0↑j
    lda     0x3380(g9), r15
    mov     0, g0
loc_1FD0:                               # CODE XREF: sub_1E80+140↑j
    call    check_credit_sub
    shro    0x10, g0, r7
    and     0xF, r7, r7
    ldob    0x0(r15), r5
    ldob    5(r15), r6
    divo    r7, r5, r5
    cmpobge r6, r4, loc_1FF4
    subo    r6, r4, r4
    cmpobge r5, r4, loc_2000
loc_1FF4:                               # CODE XREF: sub_1E80+168↑j
    mov     r4, r6
    xor     r5, r5, r5
loc_1FFC:                               # DATA XREF: calc_mht_adr↓o
    b       loc_2004
# ---------------------------------------------------------------------------
loc_2000:                               # CODE XREF: sub_1E80+170↑j
    mov     r4, r5
loc_2004:                               # CODE XREF: sub_1E80:loc_1FFC↑j
    shlo    8, r6, r6
loc_2008:                               # DATA XREF: sub_2731C:loc_27418↓r
    or      r5, r6, g0
loc_200C:                               # CODE XREF: sub_1E80+12C↑j
    ld      -4(sp), g9
    subo    4, sp, sp
    ret
# End of function sub_1E80
# =============== S U B R O U T I N E =======================================
sub_201C:                               # CODE XREF: VsyncScr+70↑p
                ld      not_scr_bg_move, r15
                bbc     31, r15, loc_23BC
                ld      mode_flag, r15
                lda     0x10000, r14
                lda     0x20000(r14), r14 # r14 = 0x30000 (What a weird way to do this)
                and     r15, r14, r15   # 0x30000 AND 0x0 so r15 = 0x0
                cmpobne 0, r15, loc_23B4
                addo    4, sp, sp
                st      g9, -4(sp)
                ld      add_BACKUP_RAM_TO_RAM, g9
                lda     0xFF, r3
                ld      INTERUPT_FLAGS_MOMEN_ON_REL, r8
                bbc     0, r8, loc_21C4
                mov     0, r15
                st      r15, 0x50A3F8
                ld      0x3394(g9), r15
                addo    1, r15, r15
                st      r15, bk_chute_1
                st      r15, chute_1
                ld      not_scr_bg_move, r15
                setbit  10, r15, r15
                st      r15, not_scr_bg_move
                ldob    0x3320(g9), r10
                bbs     1, r10, loc_20C0
                ldob    0x3324(g9), r11 # credits_required_bk_ram
                cmpobe  26, r11, loc_21A4
loc_20C0:                               # CODE XREF: sub_201C+94↑j
                ldob    0x50014A, r15
                addo    1, r15, r15
                stob    r15, 0x50014A
                call    sub_2F24
                cmpobne 0, g1, loc_21C4
                mov     1, g0
                lda     0x3388(g9), g1
                mov     g1, r4
                call    credit_country_val
                bbs     0x10, g0, loc_21C4
                ldob    0x338C(g9), r15
                addo    1, r15, r15
loc_2100:                               # DATA XREF: coli_recalc_pos+F0↓o
                stob    r15, CREDIT_02_bk
                stob    r15, CREDIT_02
                addo    4, sp, sp
                st      g0, -4(sp)
                addo    4, sp, sp
                st      g1, -4(sp)
                mov     1, g0
                call    check_credit_sub
                shro    0x10, g0, g0
                and     0xF, g0, r12
                ld      -4(sp), g1
loc_2140:                               # DATA XREF: ROM:0007D64C↓o
                subo    4, sp, sp
                ld      -4(sp), g0
                subo    4, sp, sp
                ldob    0x3388(g9), r11
                divo    r12, r11, r15
                addo    r11, g1, r11
                stob    r11, CREDIT_01_bk
                stob    r11, CREDIT_01
                call    sub_26C8
                ldob    0x3388(g9), r13
                divo    r12, r13, r14
                subo    r15, r14, r15
                ld      0x3398(g9), r14
                addo    r15, r14, r14
                st      r14, bk_coin_credits
                st      r14, coin_credits
                b       loc_21B8
# ---------------------------------------------------------------------------
loc_21A4:                               # CODE XREF: sub_201C+A0↑j
                ldob    0x50014A, r15
                addo    1, r15, r15
                stob    r15, 0x50014A
loc_21B8:                               # CODE XREF: sub_201C+184↑j
                lda     0xAE130B, g0    # sd_ring_5a
                call    sound_request_special
loc_21C4:                               # CODE XREF: sub_201C+4C↑j
                bbc     1, r8, loc_23A8
                mov     0, r15
                st      r15, 0x50A3F8
                ld      0x3390(g9), r15
                addo    1, r15, r15
                st      r15, bk_chute_2
                st      r15, chute_2
                ld      not_scr_bg_move, r15
                setbit  10, r15, r15
                st      r15, not_scr_bg_move
                ld      add_BACKUP_RAM_TO_RAM, r15
                ldob    0x3324(r15), r14
                cmpobne 0x1A, r14, loc_2224
                ld      0x3320(r15), r14
                bbc     1, r14, loc_2388
loc_2224:                               # CODE XREF: sub_201C+1F8↑j
                call    chute_setting_check
                cmpobne 0, g0, loc_2234
                clrbit  1, r8, r8
                b       loc_20C0
# ---------------------------------------------------------------------------
loc_2234:                               # CODE XREF: sub_201C+20C↑j
                ld      0x3320(g9), r10
                bbs     1, r10, loc_2280
                ldob    0x3324(g9), r11 # BACKUP_RAM_TO_RAM+0x3324
                ld      add_BACKUP_RAM_TO_RAM, r15
                ld      0x3320(r15), r14 # BACKUP_RAM_TO_RAM+0x3320
                bbs     0, r14, loc_22A4
                ldob    credit_required_flags[r11], r15
                cmpobe  0, r15, loc_22A4
loc_2268:                               # CODE XREF: sub_201C+284↓j
                ldob    0x50014B, r15
                addo    1, r15, r15
                stob    r15, 0x50014B
                b       loc_22B8
# ---------------------------------------------------------------------------
loc_2280:                               # CODE XREF: sub_201C+220↑j
                ld      add_BACKUP_RAM_TO_RAM, r15
                ldob    0x3327(r15), r15 # BACKUP_RAM_TO_RAM+0x3327
                ld      add_BACKUP_RAM_TO_RAM, r14
                ldob    0x3328(r14), r14 # BACKUP_RAM_TO_RAM+0x3328
                cmpobne r15, r14, loc_2268
loc_22A4:                               # CODE XREF: sub_201C+23C↑j
                ldob    0x50014A, r15
                addo    1, r15, r15
                stob    r15, 0x50014A
loc_22B8:                               # CODE XREF: sub_201C+260↑j
                call    sub_2F24
                cmpobne 0, g0, loc_23A8
                mov     0, g0
                lda     0x3380(g9), g1
                mov     g1, r4
                call    credit_country_val
                bbs     16, g0, loc_23A8
                ldob    0x3384(g9), r15 # BACKUP_RAM_TO_RAM+0x3384
                addo    1, r15, r15
                stob    r15, 0x1D03384
                stob    r15, 0x59C384
                addo    4, sp, sp
                st      g0, -4(sp)
                addo    4, sp, sp
                st      g1, -4(sp)
                mov     0, g0
                call    check_credit_sub
                shro    0x10, g0, g0
                and     0xF, g0, r12
                ld      -4(sp), g1
                subo    4, sp, sp
                ld      -4(sp), g0
                subo    4, sp, sp
                ldob    0x3380(g9), r11
                divo    r12, r11, r15
                addo    r11, g1, r11
                stob    r11, 0x1D03380
                stob    r11, 0x59C380
                call    sub_26C8
                ldob    0x3380(g9), r13
                divo    r12, r13, r14
                subo    r15, r14, r15
                ld      0x3398(g9), r14
                addo    r15, r14, r14
                st      r14, bk_coin_credits
                st      r14, coin_credits
                b       play_coin_sound
# ---------------------------------------------------------------------------
loc_2388:                               # CODE XREF: sub_201C+204↑j
                ldob    0x50014A, r15
                addo    1, r15, r15
                stob    r15, 0x50014A
play_coin_sound:                        # CODE XREF: sub_201C+368↑j
                lda     0xAE130B, g0    # sd_ring_5a
                call    sound_request_special
loc_23A8:                               # CODE XREF: sub_201C:loc_21C4↑j
                ld      -4(sp), g9
                subo    4, sp, sp
loc_23B4:                               # CODE XREF: sub_201C+28↑j
                call    sub_23DC
                call    sub_244C
loc_23BC:                               # CODE XREF: sub_201C+8↑j
                ret
# End of function sub_201C

            .section coin_interr
# =============== S U B R O U T I N E =======================================
sub_23DC:                               # CODE XREF: sub_201C:loc_23B4↑p
                ldob    COIN_INTERUPT_FLAGS, r4 # 0x00 = INSERT COINS
                ldob    0x500148, r5
                and     15, r5, r5
                cmpobne 0, r5, loc_241C
                ldob    0x50014A, r6
                cmpobe  0, r6, loc_2448
                subo    1, r6, r6
                stob    r6, 0x50014A
                addo    1, r5, r5
                stob    r5, 0x500148
                b       loc_2448
# ---------------------------------------------------------------------------
loc_241C:                               # CODE XREF: sub_23DC+14↑j
                ldob    credit_interupt_data[r5], r15
                clrbit  0, r4, r4
                cmpobe  0, r15, loc_2430
                setbit  0, r4, r4
loc_2430:                               # CODE XREF: sub_23DC+4C↑j
                stob    r4, COIN_INTERUPT_FLAGS # 0x00 = INSERT COINS
                addo    1, r5, r5
                and     0xF, r5, r5
                stob    r5, 0x500148
loc_2448:                               # CODE XREF: sub_23DC+20↑j
                ret
# End of function sub_23DC
# =============== S U B R O U T I N E =======================================
sub_244C:                               # CODE XREF: sub_201C+39C↑p
                ldob    COIN_INTERUPT_FLAGS, r4 # 0x00 = INSERT COINS
                ldob    0x500149, r5
                and     15, r5, r5
                cmpobne 0, r5, loc_248C
                ldob    0x50014B, r6
                cmpobe  0, r6, loc_24B8
                subo    1, r6, r6
                stob    r6, 0x50014B
                addo    1, r5, r5
                stob    r5, 0x500149
                b       loc_24B8
# ---------------------------------------------------------------------------
loc_248C:                               # CODE XREF: sub_244C+14↑j
                ldob    credit_interupt_data[r5], r15
                clrbit  1, r4, r4
                cmpobe  0, r15, loc_24A0
                setbit  1, r4, r4
loc_24A0:                               # CODE XREF: sub_244C+4C↑j
                stob    r4, COIN_INTERUPT_FLAGS # 0x00 = INSERT COINS
                addo    1, r5, r5
                and     0xF, r5, r5
                stob    r5, 0x500149
loc_24B8:                               # CODE XREF: sub_244C+20↑j
                ret
# End of function sub_244C

        .section more_credit_code
# =============== S U B R O U T I N E =======================================
sub_24CC:                               # CODE XREF: VsyncScr+74↑p
    ld      not_scr_bg_move, r15
    bbc     31, r15, loc_26C4
    ld      mode_flag, r15
    lda     0x10000, r14
    lda     0x20000(r14), r14
    and     r15, r14, r15
    cmpobne 0, r15, loc_26C4
    addo    4, sp, sp
    st      g9, -4(sp)
    ld      add_BACKUP_RAM_TO_RAM, g9
    ld      INTERUPT_FLAGS_HELD, r13
    bbs     3, r13, loc_252C
    bbs     27, r13, loc_252C
    mov     0, r15
    st      r15, 0x50A3F4
    b       loc_26B4
# ---------------------------------------------------------------------------
loc_252C:                               # CODE XREF: sub_24CC+48↑j
    ld      0x50A3F4, r15
    cmpobne 0, r15, loc_254C
    ld      INTERUPT_FLAGS_MOMENTARY, r13
    bbs     3, r13, loc_254C # Service Coin
    bbs     27, r13, loc_254C # Inputs don't go that high
    b       loc_26B4
# ---------------------------------------------------------------------------
loc_254C:                               # CODE XREF: sub_24CC+68↑j
    addo    1, r15, r15
    st      r15, 0x50A3F4
    cmpobge 6, r15, loc_26B4
    mov     0, r15
    st      r15, 0x50A3F4
    ld      0x50A3F8, r13
    cmpoble 9, r13, loc_26B4
    addo    1, r13, r13
    st      r13, 0x50A3F8
    call    chute_setting_check
    mov     g0, r3
    cmpobe  3, r3, loc_26B4
    ld      not_scr_bg_move, r15
    setbit  0xA, r15, r15
    st      r15, not_scr_bg_move
    call    sub_2F24
    mov     g0, r4
    mov     g1, r5
    cmpobe  2, r3, loc_25FC
    cmpobe  1, r4, loc_26B4
    ldob    0x3385(g9), r15
    addo    1, r15, r15
    stob    r15, 0x1D03385
    stob    r15, 0x59C385
    ld      0x339C(g9), r15
    addo    1, r15, r15
    st      r15, bk_service_credits
    st      r15, service_credits
    lda     0xAE130B, g0    # sd_ring_5a
    call    sound_request_special
    b       loc_26B4
# ---------------------------------------------------------------------------
loc_25FC:                               # CODE XREF: sub_24CC+E0↑j
    cmpobe  1, r4, loc_2658
    ld      INTERUPT_FLAGS_HELD, r15
    bbs     5, r15, loc_2614 # P2 Start
    bbc     4, r15, loc_2614 # P1 Start
    b       loc_2658
# ---------------------------------------------------------------------------
loc_2614:                               # CODE XREF: sub_24CC+13C↑j
    ldob    0x3385(g9), r15
    addo    1, r15, r15
    stob    r15, 0x1D03385
    stob    r15, 0x59C385
    ld      0x339C(g9), r15
    addo    1, r15, r15
    st      r15, bk_service_credits
    st      r15, service_credits
loc_264C:                               # DATA XREF: ROM:loc_2B2B4↓o
    lda     0xAE130B, g0    # sd_ring_5a
    call    sound_request_special
loc_2658:                               # CODE XREF: sub_24CC:loc_25FC↑j
    cmpobe  1, r5, loc_26B4
    ld      INTERUPT_FLAGS_HELD, r15
    bbs     4, r15, loc_2670 # P1 Start
    bbc     5, r15, loc_2670 # P2 Start
    b       loc_26B4
# ---------------------------------------------------------------------------
loc_2670:                               # CODE XREF: sub_24CC+198↑j
    ldob    0x338D(g9), r15
    addo    1, r15, r15
    stob    r15, 0x1D0338D
    stob    r15, 0x59C38D
    ld      0x339C(g9), r15
    addo    1, r15, r15
    st      r15, bk_service_credits
    st      r15, service_credits
    lda     0xAE130B, g0    # sd_ring_5a
    call    sound_request_special
loc_26B4:                               # CODE XREF: sub_24CC+5C↑j
    call    sub_26C8
    ld      -4(sp), g9
    subo    4, sp, sp
loc_26C4:                               # CODE XREF: sub_24CC+8↑j
    ret
# End of function sub_24CC
# =============== S U B R O U T I N E =======================================
sub_26C8:                               # CODE XREF: sub_201C+154↑p
    call    sub_2F24
    mov     g0, r10
    mov     g1, r11
    ld      add_BACKUP_RAM_TO_RAM, r15
    ld      0x3320(r15), r15
    bbs     0, r15, loc_273C
    bbc     1, r15, loc_273C
    cmpobne 1, r10, loc_27CC
    mov     0, g0
    call    check_credit_sub
    shlo    8, g0, g0
    shro    0x18, g0, r12
    ldob    0x3388(g9), r15
    remo    r12, r15, r14
    subo    r14, r15, r15
loc_2710:                               # DATA XREF: rvb_send1↓o
    stob    r15, CREDIT_01_bk
    stob    r15, CREDIT_01
    ldob    0x3380(g9), r15
    addo    r14, r15, r15
    stob    r15, 0x1D03380
    stob    r15, 0x59C380
loc_273C:                               # CODE XREF: sub_26C8+1C↑j
    cmpobne 1, r10, loc_2784
    mov     0, g0
    call    check_credit_sub
    shlo    8, g0, g0
    shro    0x18, g0, r12
    ldob    0x3380(g9), r15
    remo    r12, r15, r14
    subo    r14, r15, r15
    stob    r15, 0x1D03380
    stob    r15, 0x59C380
    mov     0, r14
    stob    r14, 0x1D03384
    stob    r14, 0x59C384
loc_2784:                               # CODE XREF: sub_26C8:loc_273C↑j
    cmpobne 1, r11, loc_27CC
    mov     1, g0
    call    check_credit_sub
    shlo    8, g0, g0
    shro    0x18, g0, r12
    ldob    0x3388(g9), r15
    remo    r12, r15, r14
    subo    r14, r15, r15
    stob    r15, CREDIT_01_bk
    stob    r15, CREDIT_01
    mov     0, r14
    stob    r14, CREDIT_02_bk
    stob    r14, CREDIT_02
loc_27CC:                               # CODE XREF: sub_26C8+24↑j
    ldob    0x3352(g9), r13
    mov     9, r12
    cmpobne 1, r13, loc_27E0
    mov     0x18, r12
loc_27E0:                               # CODE XREF: sub_26C8+110↑j
    ld      add_BACKUP_RAM_TO_RAM, r14
    ld      0x3320(g9), r13
    bbc     0, r13, loc_2898
    mov     0, g0
    lda     0x3380(g9), g1
    mov     g1, r4
    call    credit_country_val
    bbc     0x10, g0, loc_2844
    clrbit  0x10, g0, g0
    subo    r12, g0, r6
    mov     0, g0
    call    check_credit_sub
    shro    0x10, g0, g0
    and     0xF, g0, r7
    mulo    r7, r6, r6
    ldob    0x3380(g9), r15
    subo    r6, r15, r15
    stob    r15, 0x1D03380
    stob    r15, 0x59C380
loc_2844:                               # CODE XREF: sub_26C8+140↑j
    mov     1, g0
    lda     0x3388(g9), g1
    mov     g1, r4
    call    credit_country_val
    bbc     0x10, g0, loc_29C4
    clrbit  0x10, g0, g0
    subo    r12, g0, r6
    mov     1, g0
    call    check_credit_sub
    shro    0x10, g0, g0
    and     0xF, g0, r7
    mulo    r7, r6, r6
    ldob    0x3388(g9), r15
    subo    r6, r15, r15
    stob    r15, CREDIT_01_bk
    stob    r15, CREDIT_01
    b       loc_29C4
# ---------------------------------------------------------------------------
loc_2898:                               # CODE XREF: sub_26C8+128↑j
    mov     0, g0
    lda     0x3380(g9), g1
    mov     g1, r4
    call    credit_country_val
    clrbit  0x10, g0, r6
    mov     1, g0
    lda     0x3388(g9), g1
    mov     g1, r5
    call    credit_country_val
    clrbit  0x10, g0, r7
    addo    r6, r7, r8
    cmpobge r12, r8, loc_29C4
    subo    r12, r8, r8
    ldob    0x3385(g9), r9
    ldob    0x338D(g9), r10
    cmpobge r10, r8, loc_2900
    subo    r10, r8, r8
    cmpobge r9, r8, loc_2908
    subo    r9, r8, r8
    cmpobge r7, r8, loc_2910
    subo    r7, r8, r8
    b       loc_2918
# ---------------------------------------------------------------------------
loc_2900:                               # CODE XREF: sub_26C8+21C↑j
    mov     r8, r10
    b       loc_2920
# ---------------------------------------------------------------------------
loc_2908:                               # CODE XREF: sub_26C8+224↑j
    mov     r8, r9
    b       loc_2924
# ---------------------------------------------------------------------------
loc_2910:                               # CODE XREF: sub_26C8+22C↑j
    mov     r8, r7
    b       loc_2928
# ---------------------------------------------------------------------------
loc_2918:                               # CODE XREF: sub_26C8+234↑j
    mov     r8, r6
    b       loc_292C
# ---------------------------------------------------------------------------
loc_2920:                               # CODE XREF: sub_26C8+23C↑j
    xor     r9, r9, r9
loc_2924:                               # CODE XREF: sub_26C8+244↑j
    xor     r7, r7, r7
loc_2928:                               # CODE XREF: sub_26C8+24C↑j
    xor     r6, r6, r6
loc_292C:                               # CODE XREF: sub_26C8+254↑j
    mov     0, g0
    call    check_credit_sub
    shro    0x10, g0, g0
    and     0xF, g0, r15
    mulo    r15, r6, r6
    mov     1, g0
    call    check_credit_sub
    shro    0x10, g0, g0
    and     0xF, g0, r15
    mulo    r15, r7, r7
    ldob    0x338D(g9), r15
    subo    r10, r15, r15
    stob    r15, 0x1D0338D
    stob    r15, 0x59C38D
    ldob    0x3385(g9), r15
    subo    r9, r15, r15
    stob    r15, 0x1D03385
    stob    r15, 0x59C385
    ldob    0x3388(g9), r15
    subo    r7, r15, r15
    stob    r15, CREDIT_01_bk
    stob    r15, CREDIT_01
    ldob    0x3380(g9), r15
    subo    r6, r15, r15
    stob    r15, 0x1D03380
    stob    r15, 0x59C380
loc_29C4:                               # CODE XREF: sub_26C8+190↑j
    ret
# End of function sub_26C8
# ---------------------------------------------------------------------------
un_backup_check:
    ld      add_BACKUP_RAM_TO_RAM, r9
    mov     g0, r10
    lda     0x3380(r9), r8  # r8 = BACKUP_RAM_TO_RAM+0x3380
    cmpobe  0, r10, loc_29E8
    lda     0x3388(r9), r8  # r8 = BACKUP_RAM_TO_RAM+0x3388
loc_29E8:                               # CODE XREF: ROM:000029DC↑j
    mov     r10, g0
    call    check_credit_sub
    shlo    8, g0, g0
    shro    0x18, g0, r11
    cmpobe  0, r11, loc_2A2C
    ldob    4(r8), r3
    ldob    0x0(r8), r4
    remo    r11, r4, r5
    lda     0x3380, r15
    cmpobe  0, r10, loc_2A1C
    lda     0x3388, r15
loc_2A1C:                               # CODE XREF: ROM:00002A10↑j
    stob    r5, 0x1D00004(r15)          # BACKUP_RAM_START+4
    stob    r5, 0x599004(r15)           # BACKUP_RAM_TO_RAM+4
loc_2A2C:                               # CODE XREF: ROM:000029F8↑j
    mov     r10, g0
    ret
# =============== S U B R O U T I N E =======================================
coin_current_clear:                     # CODE XREF: ROM:00006AF8↓p
    addo    4, sp, sp       # Label from Virtua Fighter 2 source
    st      g0, -4(sp)
loc_2A40:                               # DATA XREF: rob_disp+8C↓o
    mov     0, r15
    stob    r15, 0x1D03384
    stob    r15, 0x59C384
    mov     0, r15
    stob    r15, CREDIT_02_bk
    stob    r15, CREDIT_02
    ld      add_BACKUP_RAM_TO_RAM, r4
    ldob    0x3380(r4), r4
    ld      add_BACKUP_RAM_TO_RAM, r5
    ldob    0x3388(r5), r5
    mov     0, g0
    call    check_credit_sub
    shlo    8, g0, g0
    shro    0x18, g0, r6
    mov     1, g0
    call    check_credit_sub
    shlo    8, g0, g0
    shro    0x18, g0, r7
loc_2AA8:                               # DATA XREF: rob_revise_yang+16C↓o
    call    chute_setting_check
    cmpobe  3, g0, loc_2B10
    cmpobe  2, g0, loc_2AC8
    ld      add_BACKUP_RAM_TO_RAM, r3
    ld      0x3320(r3), r3
    bbs     1, r3, loc_2ADC
loc_2AC8:                               # CODE XREF: coin_current_clear+7C↑j
    remo    r6, r4, r8
    remo    r7, r5, r9
    subo    r8, r4, r4
    subo    r9, r5, r5
    b       loc_2AF0
# ---------------------------------------------------------------------------
loc_2ADC:                               # CODE XREF: coin_current_clear+90↑j
    addo    r4, r5, r4
    remo    r6, r4, r8
    subo    r8, r4, r4
    mov     0, r5
    b       loc_2AF0
# ---------------------------------------------------------------------------
loc_2AF0:                               # CODE XREF: coin_current_clear+A4↑j
    stob    r4, 0x1D03380
    stob    r4, 0x59C380
    stob    r5, CREDIT_01_bk
    stob    r5, CREDIT_01
loc_2B10:                               # CODE XREF: coin_current_clear+78↑j
    ld      -4(sp), g0
    subo    4, sp, sp
    ret
# End of function coin_current_clear
# =============== S U B R O U T I N E =======================================
credit_country_val:                     # CODE XREF: sub_201C+D0↑p
    mov     g0, r3
    call    sub_2C18
    mov     g0, r5
    xor     r10, r10, r10
    ld      add_BACKUP_RAM_TO_RAM, r12
    ldob    0x3352(r12), r12 # r12 = country_val
    mov     9, r11
    cmpobne 1, r12, loc_2B4C
    mov     24, r11
loc_2B4C:                               # CODE XREF: credit_country_val+24↑j
    cmpobg  r11, r5, loc_2B54
    setbit  16, r10, r10
loc_2B54:                               # CODE XREF: credit_country_val:loc_2B4C↑j
    or      r10, g0, g0
    ret
# End of function credit_country_val
# =============== S U B R O U T I N E =======================================
sub_2B5C:                               # CODE XREF: ROM:00008598↓p
    mov     0, g0
loc_2B60:                               # DATA XREF: MAIN_DATA:026EEF50↓o
    call    check_credit_sub
    shlo    8, g0, r4
    shro    0x18, r4, r4
    mov     1, g0
    call    check_credit_sub
    shlo    8, g0, r5
    shro    0x18, r5, r5
    ld      add_BACKUP_RAM_TO_RAM, r6
    ldob    0x3380(r6), r6
    ld      add_BACKUP_RAM_TO_RAM, r7
    ldob    0x3388(r7), r7
    ld      add_BACKUP_RAM_TO_RAM, r8
    ldob    0x3385(r8), r8
    ld      add_BACKUP_RAM_TO_RAM, r9
    ldob    0x338D(r9), r9
    call    chute_setting_check
    cmpobe  3, g0, loc_2C04
    cmpobe  2, g0, loc_2BF0
    ld      add_BACKUP_RAM_TO_RAM, r15
    ld      0x3320(r15), r15
    bbc     1, r15, loc_2BF0
    addo    r6, r7, r6
    divo    r4, r6, r6
    addo    r8, r6, r6
    mov     r9, r7
    b       loc_2C0C
# ---------------------------------------------------------------------------
loc_2BF0:                               # CODE XREF: sub_2B5C+68↑j
    divo    r4, r6, r6
    divo    r5, r7, r7
    addo    r8, r6, r6
    addo    r9, r7, r7
    b       loc_2C0C
# ---------------------------------------------------------------------------
loc_2C04:                               # CODE XREF: sub_2B5C+64↑j
    mov     0, r6
    mov     r6, r7
loc_2C0C:                               # CODE XREF: sub_2B5C+90↑j
    mov     r6, g0
    mov     r7, g1
    ret
# End of function sub_2B5C
# =============== S U B R O U T I N E =======================================
sub_2C18:                               # CODE XREF: credit_country_val+4↑p
    mov     g0, r3
    mov     g1, r4
    addo    4, sp, sp
    st      g0, -4(sp)
    addo    4, sp, sp
    st      g1, -4(sp)
    call    check_credit_sub
    and     0xF, g0, r5
    shro    8, g0, r6
    and     0xF, r6, r6
    shro    0x10, g0, r7
    and     0xF, r7, r7
    ld      -4(sp), g1
    subo    4, sp, sp
    ld      -4(sp), g0
    subo    4, sp, sp
    call    sub_2C90
    mov     g0, g1
    addo    r5, g1, g1
    ldob    0x0(r4), r8
    ldob    5(r4), r9
    cmpobe  0, r7, loc_2C8C
    divo    r7, r8, r13
    addo    r13, r9, g0
    ret
# ---------------------------------------------------------------------------
loc_2C8C:                               # CODE XREF: sub_2C18+64↑j
    ret
# End of function sub_2C18
# =============== S U B R O U T I N E =======================================
sub_2C90:                               # CODE XREF: sub_2C18+50↑p
    mov     g1, r3
    call    check_credit_sub
    and     0xF, g0, r5
    shro    8, g0, r6
    and     0xF, r6, r6
    ldob    4(r3), r7
    addo    1, r7, r8
    mulo    r5, r7, r7
    mulo    r5, r8, r8
    xor     g0, g0, g0
    cmpobe  1, r6, loc_2CCC
    cmpobe  0, r6, loc_2CCC
    divo    r6, r7, r7
    divo    r6, r8, r8
    subo    r7, r8, g0
loc_2CCC:                               # CODE XREF: sub_2C90+28↑j
    ret
# End of function sub_2C90
# =============== S U B R O U T I N E =======================================
check_credit_sub:                       # CODE XREF: check_credit+54↑p
    st      sp, ptr_BACKUP_RAM_TO_RAM
    st      g0, 0x50F304
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     r15, r15
    mov     g0, r6
    addo    4, sp, sp
    st      g9, -4(sp)
    ld      add_BACKUP_RAM_TO_RAM, g9
    ld      0x3320(g9), r12
    bbs     1, r12, loc_2D98
    ldob    0x3324(g9), r11
    call    chute_setting_check
    cmpobe  3, g0, loc_2DD0
    cmpobe  2, g0, loc_2D8C
    ldob    byte_2DF4[r11*2], r9
    cmpobe  0, r6, loc_2D80
    ldob    byte_2DF5[r11*2], r9
loc_2D80:                               # CODE XREF: check_credit_sub+A4↑j
    ld      word_2E2C[r9*4], g0
    b       loc_2DD8
# ---------------------------------------------------------------------------
loc_2D8C:                               # CODE XREF: check_credit_sub+98↑j
    ldob    byte_2DF5[r11*2], r9
    b       loc_2D80
# ---------------------------------------------------------------------------
loc_2D98:                               # CODE XREF: check_credit_sub+84↑j
    ldob    0x3325(g9), r3
    ldob    0x3326(g9), r4
    ldob    0x3328(g9), r5
    cmpobe  0, g0, loc_2DBC
    ldob    0x3327(g9), r5
loc_2DBC:                               # CODE XREF: check_credit_sub+E0↑j
    shlo    0x10, r3, r3
    shlo    8, r4, r4
    or      r3, r4, r3
    or      r5, r3, g0
    b       loc_2DD8
# ---------------------------------------------------------------------------
loc_2DD0:                               # CODE XREF: check_credit_sub+94↑j
    xor     g0, g0, g0
    b       loc_2DE4
# ---------------------------------------------------------------------------
loc_2DD8:                               # CODE XREF: check_credit_sub+B8↑j
    lda     0x10101, r15
    addo    r15, g0, g0
loc_2DE4:                               # CODE XREF: check_credit_sub+104↑j
    ld      -4(sp), g9
    subo    4, sp, sp
    ret
# End of function check_credit_sub

        .section chute
# =============== S U B R O U T I N E =======================================
chute_setting_check:                    # CODE XREF: sub_201C:loc_2224↑p
    ld      add_BACKUP_RAM_TO_RAM, r3 # Label from Virtua Fighter 2 source
    ld      add_BACKUP_RAM_TO_RAM, r15
    ldob    0x3324(r15), r14 # r14 = credits_required_bk_ram
    cmpobne 0x1A, r14, loc_2E94
    ld      0x3320(r15), r14
    bbc     1, r14, loc_2EFC
loc_2E94:                               # CODE XREF: chute_setting_check+18↑j
    ld      add_BACKUP_RAM_TO_RAM, r15
    ld      0x3320(r15), r14 # r14 = BACKUP_RAM_TO_RAM+0x3320 and BACKUP_RAM_START+0x3320
    bbs     0, r14, loc_2EF4
    ld      0x3320(r3), r15 # r15 = BACKUP_RAM_TO_RAM+0x3320 and BACKUP_RAM_START+0x3320
    bbc     1, r15, loc_2ECC
    ldob    0x3327(r3), r15 # r15 = BACKUP_RAM_TO_RAM+0x3327 and BACKUP_RAM_START+0x3327
    ldob    0x3328(r3), r14 # r14 = BACKUP_RAM_TO_RAM+0x3328 and BACKUP_RAM_START+0x3328
    cmpobne r15, r14, loc_2EEC
    b       loc_2EE0
# ---------------------------------------------------------------------------
loc_2ECC:                               # CODE XREF: chute_setting_check+44↑j
    ldob    0x3324(r3), r5  # r5 = credits_required_bk_ram
    ldob    credit_required_array[r5], g0
    cmpobne 0, g0, loc_2EEC
loc_2EE0:                               # CODE XREF: chute_setting_check+5C↑j
    mov     0, g0
    cmpo    g0, g0          # true
    b       loc_2F04
# ---------------------------------------------------------------------------
loc_2EEC:                               # CODE XREF: chute_setting_check+58↑j
    mov     1, g0
    b       loc_2F00
# ---------------------------------------------------------------------------
loc_2EF4:                               # CODE XREF: chute_setting_check+38↑j
    mov     2, g0
    b       loc_2F00
# ---------------------------------------------------------------------------
loc_2EFC:                               # CODE XREF: chute_setting_check+24↑j
    mov     3, g0
loc_2F00:                               # CODE XREF: chute_setting_check+84↑j
    cmpo    1, 0            # false
loc_2F04:                               # CODE XREF: chute_setting_check+7C↑j
    ret
# End of function chute_setting_check
# ---------------------------------------------------------------------------

    .section even_more_credit_code
# =============== S U B R O U T I N E =======================================
sub_2F24:                               # CODE XREF: sub_201C+B8↑p
    ld      add_BACKUP_RAM_TO_RAM, r15
    ldob    0x3324(r15), r14
    cmpobne 0x1A, r14, loc_2F44
    ld      0x3320(r15), r14
    bbc     1, r14, loc_3054
loc_2F44:                               # CODE XREF: sub_2F24+10↑j
    ld      add_BACKUP_RAM_TO_RAM, r3
    ldob    0x3352(r3), r15
    mov     9, r11
    cmpobne 1, r15, loc_2F60
    mov     0x18, r11
loc_2F60:                               # CODE XREF: sub_2F24+34↑j
    ldob    0x3380(r3), r6
    ldob    0x3388(r3), r7
    ldob    0x3385(r3), r8
    ldob    0x338D(r3), r9
    mov     0, g0
    call    check_credit_sub
    mov     g0, r4
    mov     1, g0
    call    check_credit_sub
    mov     g0, r5
    shlo    8, r4, r4
    shro    0x18, r4, r4
    shlo    8, r5, r5
    shro    0x18, r5, r5
    call    chute_setting_check
    cmpobe  3, g0, loc_3054
    cmpobe  2, g0, loc_3028
    ld      add_BACKUP_RAM_TO_RAM, r15
    ld      0x3320(r15), r15
    bbs     1, r15, loc_2FCC
    b       loc_2FF8
# ---------------------------------------------------------------------------
loc_2FCC:                               # CODE XREF: sub_2F24+A0↑j
    addo    r6, r7, r6
    divo    r4, r6, r6
    addo    r8, r9, r8
    addo    r8, r6, r6
    cmpobge r6, r11, loc_2FEC
    mov     0, g0
    mov     g0, g1
    b       loc_305C
# ---------------------------------------------------------------------------
loc_2FEC:                               # CODE XREF: sub_2F24+B8↑j
    mov     1, g0
    mov     g0, g1
    b       loc_305C
# ---------------------------------------------------------------------------
loc_2FF8:                               # CODE XREF: sub_2F24+A4↑j
    divo    r4, r6, r6
    divo    r5, r7, r7
    addo    r6, r8, r6
    addo    r7, r9, r7
    addo    r6, r7, r6
    cmpobge r6, r11, loc_301C
    mov     0, g0
    mov     g0, g1
    b       loc_305C
# ---------------------------------------------------------------------------
loc_301C:                               # CODE XREF: sub_2F24+E8↑j
    mov     1, g0
    mov     g0, g1
    b       loc_305C
# ---------------------------------------------------------------------------
loc_3028:                               # CODE XREF: sub_2F24+8C↑j
    divo    r4, r6, r6
    divo    r5, r7, r7
    addo    r6, r8, r6
    addo    r7, r9, r7
    mov     0, g0
    mov     g0, g1
    cmpobl  r6, r11, loc_3048
    mov     1, g0
loc_3048:                               # CODE XREF: sub_2F24+11C↑j
    cmpobl  r7, r11, loc_3050
    mov     1, g1
loc_3050:                               # CODE XREF: sub_2F24:loc_3048↑j
    b       loc_305C
# ---------------------------------------------------------------------------
loc_3054:                               # CODE XREF: sub_2F24+1C↑j
    mov     2, g0
    mov     g0, g1
loc_305C:                               # CODE XREF: sub_2F24+C4↑j
    ret
# End of function sub_2F24
# =============== S U B R O U T I N E =======================================
sub_3060:                               # CODE XREF: south_credit+1FC↓p
    call    chute_setting_check
    mov     g0, r3
    cmpobe  3, r3, loc_3130
    mov     0, g0
    call    check_credit_sub
    shlo    8, g0, g0
    shro    0x18, g0, r5
    mov     1, g0
    call    check_credit_sub
    shlo    8, g0, g0
    shro    0x18, g0, r6
    ld      add_BACKUP_RAM_TO_RAM, r7
    ldob    0x3380(r7), r7
    ld      add_BACKUP_RAM_TO_RAM, r8
    ldob    0x3388(r8), r8
    cmpobe  2, r3, loc_3114
    ld      add_BACKUP_RAM_TO_RAM, r11
    ld      0x3320(r11), r11
    bbc     1, r11, loc_30DC
    addo    r7, r8, r7
    remo    r5, r7, g0
    mov     r5, g1
    mov     0, g2
    mov     r5, g9
    b       loc_3140
# ---------------------------------------------------------------------------
loc_30DC:                               # CODE XREF: sub_3060+60↑j
    call    chute_setting_check
    cmpobe  0, g0, loc_30FC
    remo    r5, r7, r7
    mov     r7, g0
    mov     r5, g1
    mov     0, g2
    mov     r5, g9
    b       loc_3140
# ---------------------------------------------------------------------------
loc_30FC:                               # CODE XREF: sub_3060+80↑j
    remo    r6, r8, r8
    mov     r8, g0
    mov     r6, g1
    mov     0, g2
    mov     r6, g9
loc_3110:                               # DATA XREF: copro_down2+BC↑o
    b       loc_3140
# ---------------------------------------------------------------------------
loc_3114:                               # CODE XREF: sub_3060+4C↑j
    remo    r5, r7, r7
    remo    r6, r8, r8
    mov     r7, g0
    mov     r5, g1
    mov     r8, g2
    mov     r6, g9
    b       loc_3140
# ---------------------------------------------------------------------------
loc_3130:                               # CODE XREF: sub_3060+8↑j
    mov     0, g0
    mov     1, g1
    mov     g0, g2
    mov     g1, g9
loc_3140:                               # CODE XREF: sub_3060+78↑j
    ret
# End of function sub_3060
# ---------------------------------------------------------------------------
    ld      add_BACKUP_RAM_TO_RAM, r11 # unreachable code
    mov     g0, r3
    lda     0x3380(r11), r10
    cmpobe  0, r3, loc_3164
    lda     0x3388(r11), r10
loc_3164:                               # CODE XREF: ROM:00003158↑j
    ld      add_BACKUP_RAM_TO_RAM, r15
    ldob    0x3324(r15), r14
    cmpobne 0x1A, r14, loc_3184
    ld      0x3320(r15), r14
    bbc     1, r14, loc_31B4
loc_3184:                               # CODE XREF: ROM:00003174↑j
    mov     r3, g0
    call    check_credit_sub
    shlo    0x18, g0, r4
    shro    0x18, r4, r4
    shlo    0x10, g0, r5
    shro    0x18, r5, r5
    cmpobe  1, r5, loc_31B4
    ldob    4(r10), r6
    mulo    r6, r4, r6
    remo    r5, r6, r7
    mov     r7, g0
    b       loc_31B8
# ---------------------------------------------------------------------------
loc_31B4:                               # CODE XREF: ROM:00003180↑j
    mov     0, g0
loc_31B8:                               # CODE XREF: ROM:000031B0↑j
    ret

        .section credit_backup_ram
BACKUP_RAM_TO_RAM_offsets:.long 0x332A  # DATA XREF: check_credit+38↓r
    .long 0x332B            # BACKUP_RAM_TO_RAM+0x332B
    .long 0x332D            # BACKUP_RAM_TO_RAM+0x332D
    .long 0x332E            # BACKUP_RAM_TO_RAM+0x332E

        .section credits_required
# ---------------------------------------------------------------------------
credit_required_flags:
    .byte 0                 # DATA XREF: sub_201C+240↑r
    .byte 1
    .byte 1
    .byte 1
    .byte 1
    .byte 0
    .byte 1
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 1
    .byte 1
    .byte 0
    .byte 1
    .byte 0
    .byte 0
    .byte 0
    .byte 1
    .byte 0
    .byte 1
    .byte 0
    .byte 1
    .byte 0
    .byte 1
    .byte 1
    .byte 0
        .section credit_interr_data
# ---------------------------------------------------------------------------
credit_interupt_data:
    .byte 0                 # DATA XREF: sub_23DC:loc_241C↑r
    .byte 1
    .byte 1
    .byte 1
    .byte 1
    .byte 1
    .byte 1
    .byte 1
    .long 0
    .long 0

        .section more_credit_data
# ---------------------------------------------------------------------------
byte_2DF4:      
    .byte 0                 # DATA XREF: check_credit_sub+9C↑r
byte_2DF5:
    .byte 0                 # DATA XREF: check_credit_sub+A8↑r
    .byte 0
    .byte 1
    .byte 0
    .byte 2
    .byte 0
    .byte 3
    .byte 0
    .byte 4
    .byte 1
    .byte 1
word_2E00:
    .short 0x401            # DATA XREF: MAIN_DATA:02892DB4↓o
word_2E02:
    .short 0x202
    .short 0x303
    .short 0x404
    .short 0x505
    .short 0x606
    .short 6
    .short 0x106
    .short 0x707
    .short 0x207
    .short 0x808
    .short 0x909
    .short 0xA0A
    .short 0x40A
    .short 0xF0F
    .short 0x10B
    .short 0xC0C
    .short 0x20C
    .short 0xD0D
    .short 0x50D
    .short 0xE0E
    .short 0
word_2E2C:
    .short 0                # DATA XREF: check_credit_sub:loc_2D80↑r
    .short 0
    .short 1
    .short 0
    .short 2
    .short 0
    .short 3
    .short 0
    .short 4
    .short 0
    .short 5
    .short 0
    .short 0
    .short 1
    .short 0x100
    .short 0
    .short 0
    .short 2
    .short 0
    .short 3
    .short 0x300
    .short 0
    .short 0x400
    .short 2
    .short 0x400
    .short 1
    .short 0x400
    .short 0
    .short 0
    .short 0
    .short 0
    .short 4

        .section cred_required
credit_required_array:
    .byte 0           # DATA XREF: chute_setting_check+68↑r
    .byte 1
    .byte 1
    .byte 1
    .byte 1
    .byte 0
    .byte 1
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 1
    .byte 1
    .byte 0
    .byte 1
    .byte 0
    .byte 0
    .byte 0
    .byte 1
    .byte 0
    .byte 1
    .byte 0
    .byte 1
    .byte 0
    .byte 1
    .byte 0
    .byte 0
