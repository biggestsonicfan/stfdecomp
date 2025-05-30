        .section fbi_pic
# ---------------------------------------------------------------------------
ADV_FBI_PIC_INT:                        # DATA XREF: ROM:advertise_steps↑o
    ld      not_scr_bg_move, r15 # Label from official source
    setbit  14, r15, r15
    st      r15, not_scr_bg_move
    lda     0x1000000, g9
    addo    0x1F, 0x1F, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    ld      POLYGON_DISP, r15
    clrbit  0, r15, r15
    st      r15, POLYGON_DISP
    mov     1, r4
    ld      mod_fa_coli, r3
    ld      0x0(r3), r5
    clrbit  31, r5, r5
    st      r5, 0x0(r3)
    ld      mod_fa_game_disp, r3
    ld      0x0(r3), r4
    setbit  30, r4, r4      # set bit 30 at fa_game_disp
    setbit  23, r4, r4
    setbit  20, r4, r4
    setbit  25, r4, r4
    st      r4, 0x0(r3)
    ld      add_BACKUP_RAM_TO_RAM, r3
    ldob    0x3352(r3), r3  # r3 = BACKUP_RAM_TO_RAM+0x3352
    cmpobne 1, r3, load_ADV_SEGA_PIC_INT # if country_val isn't 1 (USA) skip to load Sega splash screen
    addo    4, sp, sp
    st      g0, -4(sp)
    addo    4, sp, sp
    st      g1, -4(sp)
    call    sub_2B5C
    mov     g0, r3
    mov     g1, r4
    ld      -4(sp), g1
    subo    4, sp, sp
    ld      -4(sp), g0
    subo    4, sp, sp
    addo    r3, r4, r4
    cmpobne 0, r4, load_ADV_SEGA_PIC_INT
    lda     6, g0           # FBI pic CG (remember divide by 2) = 3
    call    _Scroll_Initialize
    mov     0, r15
    stis    r15, scrB_H_page
    mov     0, r15
    stis    r15, scrB_V_page
    lda     0x1004000, g9
    lda     88, g0          # FBI TEXTURE CELL
    call    dsp_pattern_new
    shlo    6, 5, r15
    st      r15, CTRL_TIMER
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
    ret
# ---------------------------------------------------------------------------
load_ADV_SEGA_PIC_INT:                  # CODE XREF: ROM:0000857C↑j
    mov     2, r15
    stib    r15, _sub_mode
    b       ADV_SEGA_PIC_INT
# ---------------------------------------------------------------------------
ADV_FBI_PIC_DSP:                        # DATA XREF: ROM:00007F28↑o
    ld      add_BACKUP_RAM_TO_RAM, r15 # Label from official source
    ldob    0x3324(r15), r14
    cmpobne 0x1A, r14, loc_8648
    ld      0x3320(r15), r14
    bbc     1, r14, loc_86E4
loc_8648:                               # CODE XREF: ROM:00008638↑j
    ld      INTERUPT_FLAGS_MOMEN_ON_REL, r3
    mov     3, r4           # FBI PIC CG (3)
    and     r4, r3, r4
    cmpobne 0, r4, loc_8674
    ld      INTERUPT_FLAGS_MOMENTARY, r3
    lda     0x8000008, r4
    and     r4, r3, r4
    cmpobe  0, r4, loc_86E4
loc_8674:                               # CODE XREF: ROM:00008658↑j
    addo    4, sp, sp
    st      g0, -4(sp)
    addo    4, sp, sp
    st      g1, -4(sp)
    call    sub_2B5C
    mov     g0, r3
    mov     g1, r4
    ld      -4(sp), g1
    subo    4, sp, sp
    ld      -4(sp), g0
    subo    4, sp, sp
    ld      add_BACKUP_RAM_TO_RAM, r15
    ld      0x3320(r15), r14 # r14 = BACKUP_RAM_START+0x3320
    bbc     0, r14, loc_86D8
    ld      INTERUPT_FLAGS_MOMEN_ON_REL, r15
    bbc     0, r15, loc_86D4
    mov     r3, r4
loc_86D4:                               # CODE XREF: ROM:000086CC↑j
    b       loc_86DC
# ---------------------------------------------------------------------------
loc_86D8:                               # CODE XREF: ROM:000086C0↑j
    addo    r3, r4, r4
loc_86DC:                               # CODE XREF: ROM:loc_86D4↑j
    cmpoble 0x18, r4, loc_86E4
    b       loc_86FC
# ---------------------------------------------------------------------------
loc_86E4:                               # CODE XREF: ROM:00008644↑j
    ld      CTRL_TIMER, r5
    subi    1, r5, r5
    st      r5, CTRL_TIMER
    cmpibl  0, r5, loc_8710
loc_86FC:                               # CODE XREF: ROM:000086E0↑j
    ldib    _sub_mode, r15
    lda     1(r15), r15
    stib    r15, _sub_mode
loc_8710:                               # CODE XREF: ROM:000086F8↑j
    ret
