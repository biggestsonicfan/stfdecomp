        .globl check_sram_all
        .extern make_crc
        .extern debug_disp_mes
        .section sram
check_sram_all:                         # CODE XREF: ROM:00003A24↓j
    mov     22, r15         # Label from official FV source
    stib    r15, TST_RED_ADD
    mov     22, r15
    stib    r15, TST_GRN_ADD
    mov     22, r15
    stib    r15, TST_BLUE_ADD
    addo    0x1F, 0x17, r15 # r15 = 0x36 (54)
    stib    r15, TST_RED_MUL
    addo    0x1F, 0x17, r15 # r15 = 0x36 (54)
    stib    r15, TST_GRN_MUL
    addo    0x1F, 0x17, r15 # r15 = 0x36 (54)
    stib    r15, TST_BLUE_MUL
    mov     31, r15
    stib    r15, TST_B_BRIGHT
    call    make_lay_col_256_tbl
    call    chg_scr_color_req
    call    init_scroll
    lda     0, g0
    call    _Scroll_Initialize
    call    possible_ascii_leftover
    subo    1, 0, g0
    shlo    0x14, 0x1D, r15
    st      r15, add_BACKUP_RAM_TO_RAM
backup_ram_check:                       # DATA XREF: ADV_REPLAY_PIC+8↓o
    call    power_test_check
    cmpobne 0, g0, PowerWarning
    lda     0x534F4E49, r8
    lda     0x43544845, r9
    lda     0x46494748, r10
    lda     0x54455220, r11
    ldq     aInosehtchgifRe_0, r4 # "INOSEHTCHGIF RET"
    cmpobne r4, r8, BackupRamIsBro
    cmpobne r5, r9, BackupRamIsBro
    cmpobne r6, r10, BackupRamIsBro
    cmpobne r7, r11, BackupRamIsBro
    mov     0x12, r8
    ldos    short_0x12, r4
    cmpobne r4, r8, BackupRamIsWro
    ld      add_BACKUP_RAM_TO_RAM, r15
    lda     0x3340(r15), g0 # g0 = BACKUP_RAM_TO_RAM+03340
    addo    0x1F, 1, g2
    mov     0, g1
    call    make_crc        # crc value stored to g0
    ldos    crc_value_bk, r15
    cmpobe  g0, r15, loc_3754
    call    init_game_assignments
    call    rank_init
    ld      add_BACKUP_RAM_TO_RAM, r15
    lda     0x3340(r15), g0 # g0 = BACKUP_RAM_TO_RAM+03340
    addo    0x1F, 1, g2
    mov     0, g1
    call    make_crc        # crc value stored to g0
    stos    g0, crc_value_bk
loc_3754:                               # CODE XREF: ROM:00003724↑j
    ld      add_BACKUP_RAM_TO_RAM, r15
    lda     0x3320(r15), g0 # g0 = BACKUP_RAM_TO_RAM+03320
    mov     15, g2
    mov     0, g1
    call    make_crc        # crc value stored to g0
    ldos    0x1D03300, r15
    cmpobe  g0, r15, loc_37A8
    call    sram_clear_for_coin_assign
    call    rank_init
    ld      add_BACKUP_RAM_TO_RAM, r15
    lda     0x3320(r15), g0
    mov     15, g2
    mov     0, g1
    call    make_crc        # crc value stored to g0
    stos    g0, 0x1D03300
loc_37A8:                               # CODE XREF: ROM:00003778↑j
    b       loc_388C
# ---------------------------------------------------------------------------
BackupRamIsWro:                         # CODE XREF: ROM:000036FC↑j
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x10008A4, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
aBackupRamIsWro:.asciz "BACKUP RAM IS WRONG VERSION."
    .fill 3, 1, 0
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
    b       INITIALIZED
# ---------------------------------------------------------------------------
BackupRamIsBro:                         # CODE XREF: ROM:000036E0↑j
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x10008AA, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
aBackupRamIsBro:.asciz "BACKUP RAM IS BROKEN."
    .short 0
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
INITIALIZED:                            # CODE XREF: ROM:000037F4↑j
    call    sram_clear_for_coin_assign
    call    init_game_assignments
    call    init_some_backup_stuff
    call    rank_init
    call    set_game_assign_byte_flag
    call    sub_62328
    call    write_stats_to_backup_ram
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x1000934, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
aInitialized:   .asciz "INITIALIZED."
    .fill 3, 1, 0
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
loc_388C:                               # CODE XREF: ROM:loc_37A8↑j
    shlo    0x14, 0x1D, r15
    st      r15, add_BACKUP_RAM_TO_RAM
    ldob    0x500171, r3
    setbit  0, r3, r3
    stob    r3, 0x500171
    lda     BACKUP_RAM_START, r3
    lda     BACKUP_RAM_TO_RAM, r4
    lda     dword_3FE0, r5
    shro    4, r5, r5
loc_38C8:                               # CODE XREF: ROM:000038DC↓j
    ldq     (r3), r8
    addo    0x10, r3, r3
    stq     r8, (r4)
    addo    0x10, r4, r4
    cmpdeci 1, r5, r5
    bl      loc_38C8
    b       loc_3ABC
# ---------------------------------------------------------------------------
PowerWarning:                           # CODE XREF: ROM:000036B4↑j
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x10005B8, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
aWarning:       .asciz "WARNING!"
    .fill 3, 1, 0
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x100071E, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
aVoltageOfPower:.asciz "VOLTAGE OF POWER-SUPPLY IS TOO LOW."
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x1000814, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
aPleaseIncrease:.asciz "PLEASE INCREASE THE VOLTAGE UP TO 5.0v...    "
    .short 0
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
loc_39BC:                               # CODE XREF: ROM:000039C4↓j
    subo    1, 0, g0
    call    power_test_check
    cmpobne 0, g0, loc_39BC
loc_39C8:                               # CODE XREF: ROM:000039D0↓j
    subo    1, 0, g0
    call    power_test_check
    cmpobne 0, g0, loc_39C8
loc_39D4:                               # CODE XREF: ROM:000039DC↓j
    subo    1, 0, g0
    call    power_test_check
    cmpobne 0, g0, loc_39D4
loc_39E0:                               # CODE XREF: ROM:000039E8↓j
    subo    1, 0, g0
    call    power_test_check
    cmpobne 0, g0, loc_39E0
loc_39EC:                               # CODE XREF: ROM:000039F4↓j
    subo    1, 0, g0
    call    power_test_check
    cmpobne 0, g0, loc_39EC
    addo    4, sp, sp
    st      g0, -4(sp)
    lda     0x1000868, g9
Ok:
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
aOk_0:          .asciz "OK."
# ---------------------------------------------------------------------------
    ld      -4(sp), g0
    subo    4, sp, sp
    b       check_sram_all
# ---------------------------------------------------------------------------
    lda     BACKUP_RAM_TO_RAM, r12
    ldq     0x3308(r12), r4 # r4 = BACKUP_RAM_TO_RAM+0x3308
    lda     0x534F4E49, r8
    lda     0x43544845, r9
loc_3A48:                               # DATA XREF: calc_unit_mat+6F0↓o
    lda     0x46494748, r10
    lda     0x54455220, r11
    cmpobne r4, r8, backup_ram_string_fails
    cmpobne r5, r9, backup_ram_string_fails
    cmpobne r6, r10, backup_ram_string_fails
    cmpobne r7, r11, backup_ram_string_fails
    mov     0x12, r8
    ldos    backup_ram_check_0x12, r4
    cmpobne r4, r8, backup_ram_string_fails
loc_3A78:                               # DATA XREF: calc_unit_mat+A74↓o
    b       loc_3A98
# ---------------------------------------------------------------------------
backup_ram_string_fails:                # CODE XREF: ROM:00003A58↑j
    call    sram_clear_for_coin_assign
    call    init_game_assignments
loc_3A84:                               # DATA XREF: calc_unit_mat+B00↓o
    call    init_some_backup_stuff
    call    rank_init
    call    set_game_assign_byte_flag
    call    sub_62328
    call    write_stats_to_backup_ram
loc_3A98:                               # CODE XREF: ROM:loc_3A78↑j
    lda     BACKUP_RAM_TO_RAM, r15
    st      r15, add_BACKUP_RAM_TO_RAM
loc_3AA8:                               # DATA XREF: calc_unit_mat+D78↓o
    ldob    0x500171, r3
    clrbit  0, r3, r3
    stob    r3, 0x500171
loc_3ABC:                               # CODE XREF: ROM:000038E0↑j
    ld      add_BACKUP_RAM_TO_RAM, r8
    lda     0x534F4E49, r15
    st      r15, 0x3308(r8)
    lda     0x43544845, r15
    st      r15, 0x330C(r8)
    lda     0x46494748, r15
    st      r15, 0x3310(r8)
    lda     0x54455220, r15
    st      r15, 0x3314(r8) # r8 = BACKUP_RAM_TO_RAM+0x3314 and BACKUP_RAM_START+0x3314
    mov     0x12, r4
    stos    r4, 0x3306(r8)  # store r8 to BACKUP_RAM_TO_RAM+0x3306
    lda     BACKUP_RAM_TO_RAM, r15
    st      r15, add_BACKUP_RAM_TO_RAM
    mov     0, r3
loc_3B24:                               # DATA XREF: calc_unit_mat:loc_17114↓o
    stob    r3, 0x500148
    stob    r3, 0x500149
    stob    r3, 0x50014A
    stob    r3, 0x50014B
    ret
# =============== S U B R O U T I N E =======================================
power_test_check:                      # CODE XREF: ROM:backup_ram_check↑p
    subo    1, 0, g0
    lda     0x55, r4
    lda     0xAA, r6
loc_3B54:                               # DATA XREF: calc_unit_mat:loc_173CC↓o
    shlo    0x14, 0x1D, r3  # r3 = 0x1D00000 or BACKUP_RAM_START
    ldob    (r3), r15
    stob    r4, (r3)
    ldob    (r3), r5
    stob    r15, (r3)
    cmpo    r4, r5
    bne     loc_3C28
    ldob    (r3), r15
    stob    r6, (r3)
loc_3B78:                               # DATA XREF: calc_unit_mat:loc_176C4↓o
    ldob    (r3), r5
    stob    r15, (r3)
    cmpo    r6, r5
loc_3B84:                               # DATA XREF: calc_unit_mat:loc_17750↓o
    bne     loc_3C28
    addo    1, r3, r3
    ldob    (r3), r15
    stob    r4, (r3)
    ldob    (r3), r5
    stob    r15, (r3)
loc_3B9C:                               # DATA XREF: calc_unit_mat:loc_1793C↓o
    cmpo    r4, r5
    bne     loc_3C28
    ldob    (r3), r15
loc_3BA8:                               # DATA XREF: calc_unit_mat:loc_179C8↓o
    stob    r6, (r3)
    ldob    (r3), r5
    stob    r15, (r3)
    cmpo    r6, r5
    bne     loc_3C28
    addo    1, r3, r3
    ldob    (r3), r15
    stob    r4, (r3)
    ldob    (r3), r5
    stob    r15, (r3)
    cmpo    r4, r5
    bne     loc_3C28
    ldob    (r3), r15
    stob    r6, (r3)
    ldob    (r3), r5
    stob    r15, (r3)
    cmpo    r6, r5
    bne     loc_3C28
    addo    1, r3, r3
    ldob    (r3), r15
    stob    r4, (r3)
    ldob    (r3), r5
    stob    r15, (r3)
    cmpo    r4, r5
    bne     loc_3C28
    ldob    (r3), r15
    stob    r6, (r3)
    ldob    (r3), r5
    stob    r15, (r3)
    cmpo    r6, r5
    bne     loc_3C28
    xor     g0, g0, g0
loc_3C28:                               # CODE XREF: power_test_check+24↑j
    ret
# End of function power_test_check
