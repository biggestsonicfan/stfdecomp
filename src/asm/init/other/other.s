        .global Other
        .extern IntrHalt
        .section other_func
# ---------------------------------------------------------------------------
Other:                                  # DATA XREF: ROM:000046C0↓o
    lda     IRQ_REQUEST_START, r4 # Label from Virtua Fighter 2 source
    ld      (r4), r5
    bbs     10, r5, loc_E04
    b       IntrHalt
# ---------------------------------------------------------------------------
loc_E04:                                # CODE XREF: Timer+CC↑j
    call    send_sound_code
    ret
# ---------------------------------------------------------------------------
   .long 0
   