        .extern print_mes
        .extern print_dec
        .globl IntrHalt
        .section i_halt_func
IntrHalt:                               # CODE XREF: Timer+2C↑j
    lda     0x1000BA8, g9   # Label from Virtua Fighter 2 source
    lda     aInterruptHalt, g0 # "Interrupt Halt #"
    call    print_mes
    lda     0x1001428, g9
    ld      -8(fp), g0
    call    print_dec       # Print g0 as decimal
halt:                                   # CODE XREF: Timer:halt↓j
    b       halt
    .long 0

        .section i_halt_ascii
aInterruptHalt: .asciz "Interrupt Halt #"   # DATA XREF: Timer+E8↑o

