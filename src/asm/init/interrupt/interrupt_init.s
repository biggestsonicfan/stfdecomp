        .globl interrupt_wait
        .globl read_sw
        .globl write_sw
        .section interrupt_init
_interrupt_register_write:              # Interrupt line configuration
    lda     0xFF000004, r4  # Label from NINDY source code
    lda     interrupt_targets, r5 # The default interrupt states we want to have
    synmov  r4, r5          # use synmov to setup the interrupt control register (only way to do it)
    lda     IRQ_REQUEST_START, r4 # Interrupt request start address
    mov     0, r5           # clear r5
    st      r5, (r4)        # load the value at IRQ_REQUEST_START
    setbit  0, r5, r5       # set the least significant bit of the interrupt request contents
    setbit  5, r5, r5       # set bit 5 of the interrupt request contents
    st      r5, 4(r4)       # save that to the word following the location we loaded from
    shlo    0x10, 0x1F, r4  # I think this is the same as loading 0x1f0000 into r4 (part of fix_stack)
    mov     0, r5           # load zero to make sure that we assign the whole thing
    modpc   r4, r4, r5      # fix the process controls manually
    lda     0xFF1F917F, r4  # set up the mask to be passed to modac
    lda     0x3F001000, r5  # setup the arithmetic controls default value
    modac   r4, r5, r5      # configure the arithmetic controls manually
    b       main            # jump to main
# End of function start_again_ip

    .section interrupt
# =============== S U B R O U T I N E =======================================
interrupt_wait:                         # CODE XREF: interrupt_wait+8↓j
    ldob    RAMBASE_START, r4 # Label from Fighting Vipers source
    cmpobg  2, r4, interrupt_wait
    bbs     0, r4, interrupt_wait
    mov     0, r3
    stob    r3, RAMBASE_START
    call    change_poly_bank
    ret
# End of function interrupt_wait
# =============== S U B R O U T I N E =======================================
io_request_chk:                         # CODE XREF: ROM:00006AC4↓p
    lda     IO_PORTS, r3    # Label from Fighting Vipers source
    lda     0x4F, r4
    stob    r4, 0x10(r3)    # Store 0x4F to IO_PORTS+0x10 why
    mov     0, r4
    st      r4, INTERUPT_FLAGS_MOMENTARY
    st      r4, INTERUPT_FLAGS_MOMEN_ON_REL
    st      r4, INTERUPT_FLAGS_HELD
    st      r4, INTERUPT_FLAGS_HELD_PREV_FRAME
    stob    r4, COIN_INTERUPT_FLAGS # 0x00 = INSERT COINS
    ret
# End of function io_request_chk
# =============== S U B R O U T I N E =======================================
read_sw:                                # CODE XREF: VsyncScr+48↑p
    lda     IO_PORTS, r4    # Label from official source
    mov     1, r5
    stos    r5, 0x40(r4)    # Set 0x1C00040 to 1
    ld      INTERUPT_FLAGS_HELD, r6
    st      r6, INTERUPT_FLAGS_HELD_PREV_FRAME
    lda     IO_PORTS, r11
    ldob    12(r11), r4     # r4 = 0xFE
    not     r4, r4          # r4 = 0xFFFFFF01
    mov     8, r3
    ld      debug_flag, r15 # r15 = 0x00008A00
    bbc     14, r15, read_inputs
dip_switch_filter:                      # Use dip switch setting (binary)
    lda     0xFF, r3
read_inputs:                            # CODE XREF: read_sw+3C↑j
    and     r3, r4, r4      # r4 = 0
    ld      0x500710, r3 # r3 = 0
    st      r3, 0x500714
    st      r4, 0x500710
    mov     0, r3
    stob    r3, 0x0(r11)
    ldob    2(r11), r7      # read IO_PORTS+0x02
    ldob    4(r11), r3      # read IO_PORTS+0x04 (P1)
    shlo    8, r3, r3
    or      r3, r7, r7
    ldob    6(r11), r3
    shlo    0x10, r3, r3
    or      r3, r7, r7
    mov     1, r3
    stob    r3, 0x0(r11)
    ldob    2(r11), r3
    lda     0xFF, r4
    bbs     7, r3, loc_1868
    clrbit  2, r4, r4
loc_1868:                               # CODE XREF: read_sw+94↑j
    bbs     6, r3, loc_1870
    clrbit  3, r4, r4
loc_1870:                               # CODE XREF: read_sw:loc_1868↑j
    shlo    0x18, r4, r4
    or      r4, r7, r7
    bbs     0xB, r7, loc_1884
    clrbit  0xA, r7, r7
    setbit  0xB, r7, r7
loc_1884:                               # CODE XREF: read_sw+AC↑j
    bbs     0x13, r7, loc_1890
    clrbit  0x12, r7, r7
    setbit  0x13, r7, r7
loc_1890:                               # CODE XREF: read_sw:loc_1884↑j
    not     r7, r8
    st      r8, INTERUPT_FLAGS_HELD
    andnot  r6, r8, r3
    st      r3, INTERUPT_FLAGS_MOMENTARY
    and     r6, r7, r4
    st      r4, INTERUPT_FLAGS_MOMEN_ON_REL
    call    seclet_command_check
    call    read_analog_to_ram # It seems 0x1C0001E (unknown_input) is used in Daytona USA as a lamp
    ret
# End of function read_sw
# =============== S U B R O U T I N E =======================================
# It seems 0x1C0001E (unknown_input) is used in Daytona USA as a lamp
read_analog_to_ram:                     # CODE XREF: read_sw+EC↑p
    lda     analog_to_digital, r11 # r3 = 0x8
    lda     analog_to_digital_ram, r10
    mov     0, r15
    stib    r15, (r11)      # store 0 at 0x1C0001E, but why
    mov     8, r3
fill_io_loop:                           # CODE XREF: read_analog_to_ram+2C↓j
    ldob    (r11), r4       # somehow r4 is now 0xFF
    stob    r4, (r10)
    addo    1, r10, r10     # increment memory address originally at 0x50071C (now 0x50071D)
    cmpdeco 1, r3, r3       # decrement counter
    bl      fill_io_loop
    ret
# End of function read_analog_to_ram
# =============== S U B R O U T I N E =======================================
seclet_command_check:                   # CODE XREF: read_sw+E8↑p
    ld      INTERUPT_FLAGS_HELD, r8 # Label from Virtua Fighter 2 source
    ld      INTERUPT_FLAGS_MOMENTARY, r9
    ld      debug_input_code_buffer, r11
    bbs     3, r8, loc_191C # test mode (9)
    bbs     27, r8, loc_191C
    bbc     24, r8, reset_debug_input
    bbc     25, r8, reset_debug_input
loc_191C:                               # CODE XREF: seclet_command_check+18↑j
    cmpobe  0, r11, loc_1964
    lda     0xF7F700, r3
    and     r3, r9, r9
    cmpobe  0, r9, loc_196C
    ldob    (r11), r3
    shlo    r3, 1, r3
    cmpobne r3, r9, loc_1964
    addo    1, r11, r11
    ldob    (r11), r3
    cmpobge 31, r3, loc_196C
    ld      debug_flag, r15
    setbit  14, r15, r15    # set bit 14 debug
    st      r15, debug_flag
reset_debug_input:                      # CODE XREF: seclet_command_check+20↑j
    mov     0, r11
    b       loc_196C
# ---------------------------------------------------------------------------
loc_1964:                               # CODE XREF: seclet_command_check:loc_191C↑j
    lda     debug_input_code_array, r11
loc_196C:                               # CODE XREF: seclet_command_check+38↑j
    st      r11, debug_input_code_buffer
    ret
# End of function seclet_command_check
# ---------------------------------------------------------------------------
debug_input_code_array:.byte 0xE, 0xE, 8, 0xF, 0xE, 8, 9, 0xE, 0xE, 0xD, 8, 0x20
# =============== S U B R O U T I N E =======================================
write_sw:                               # CODE XREF: VsyncScr+4C↑p
    lda     IO_PORTS, r11   # Label from Virtua Fighter 2 souce
    ldob    COIN_INTERUPT_FLAGS, r3 # 0x00 = INSERT COINS
    stob    r3, 0xA(r11)
    ret
# End of function write_sw

    .section poly_bank_change
# =============== S U B R O U T I N E =======================================
change_poly_bank:                       # CODE XREF: interrupt_wait+1C↑p
                lda     COPRO_CONTROL1_START, r4 # Label from official source
                ld      0xC(r4), r7
                stob    r7, 0x501000
                ret
# End of function change_poly_bank
        .section interr_targets
interrupt_targets:
    .long 0xF0E0D0C       # DATA XREF: start_again_ip+30C↑o
    .long 0
    .long 0
    .long 0
    