        .section wait
# ---------------------------------------------------------------------------
ENDSUB_WAIT_1_alt:                      # unreachable code
    shlo    6, 1, r10
    cmpibg  g1, r10, loc_10324
    shlo    0xA, 1, r3
    mulo    r3, g1, r4
    divo    r10, r4, r4
    shlo    0xD, 1, r5
    addo    r5, r4, r5
    stos    r5, 0x100A008
loc_10324:                              # CODE XREF: ROM:00010304↑j
    shro    1, r10, r10
    cmpobne r10, g1, loc_1035C
    lda     0x1000000, g9
    addo    0x1F, 0x1F, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s
    lda     0x1000A50, g9
    ldob    STAGE_ID, r4    # As the replay stages advance, so do the credits to display
    ldos    un_staff_credit_textures[r4*2], g0
    call    dsp_pattern_new
loc_1035C:                              # CODE XREF: ROM:00010328↑j
    ret
# ---------------------------------------------------------------------------
