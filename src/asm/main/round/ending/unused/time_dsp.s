            .section dsp
# ---------------------------------------------------------------------------
ending_time_dsp:                        # Label from official source
    mov     g0, r11
    lda     0x100153A, g9
    remo    0xA, r11, g4
    mov     2, g3
    lda     0x1001536, g9
    divo    0xA, r11, r11
    remo    0xA, r11, g4
    call    dsp_character
    divo    0xA, r11, r11
    remo    0xA, r11, g4
    lda     0x1001530, g9
    call    dsp_character
    divo    0xA, r11, r11
    remo    6, r11, g4
    divo    6, r11, r11
    lda     0x100152C, g9
    call    dsp_character
    lda     0x1001526, g9
    remo    0xA, r11, g4
    call    dsp_character
    divo    0xA, r11, g4
    lda     0x1001522, g9
    call    dsp_character
    ret
    