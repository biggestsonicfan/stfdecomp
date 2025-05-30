        .section serial_init
_disable_ints:
    lda     SERIAL_START, r4
    mov     0, r5
    stos    r5, 2(r4)       # Store 0 in Serial byte 2
    bal     _serial_sync_delay # Counter loop 4 times then come back and load 0x278
    stos    r5, 2(r4)       # Store 0 in Serial byte 2 again
loc_27C:                                # Run the 4 count loop again then come back to 0x280
    bal     _serial_sync_delay
    stos    r5, 2(r4)       # Store 0 in Serial byte 2 once again
    shlo    6, 1, r5        # r5 now equals 0x40
    bal     _serial_sync_delay # Run the count loop again then come back to 0x28C
    stos    r5, 2(r4)       # Store 0x40 at Serial byte 2
    lda     78, r5          # r5 = 0x4E now
    bal     _serial_sync_delay # loop again
    stos    r5, 2(r4)       # Store 0x4E at byte 2 of Serial
    lda     IO_PORTS, r4
    mov     0, r5
    stob    r5, 0x40(r4)    # Set 0x1C00040 to 0
    mov     1, r5
    stob    r5, 0x24(r4)    # Set 0x1C00024 to 1
    lda     0x53, r5
    stob    r5, 0x34(r4)    # Set 0x1C00034 to 0x53
    lda     0x45, r5
    stob    r5, 0x36(r4)    # Set 0x1C00036 to 0x45
    lda     0x47, r5
    stob    r5, 0x38(r4)    # Set 0x1C00038 to 0x47
    lda     0x41, r5
    stob    r5, 0x3A(r4)    # Set 0x1C0003A to 0x41

        .section serial_delay
_serial_sync_delay:                     # CODE XREF: start_again_ip+24↑p
    mov     4, r3           # int count = 4
serial_loop:                            # CODE XREF: _serial_sync_delay:loc_BD0↓j
    cmpdeco 1, r3, r3       # decrement count
loc_BD0:                                # loop until count is 0
    bl      serial_loop     # (Loop 4 times)
    bx      (g14)           # Then execute address in g14

