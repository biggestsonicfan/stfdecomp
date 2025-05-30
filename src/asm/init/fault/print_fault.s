
        .globl _display_trace_fault
        .globl _display_operation_fault
        .globl _display_arithmetic_fault
        .globl _display_floating_point_fault
        .globl _display_constrain_fault
        .globl _display_protection_fault
        .globl _display_machine_fault
        .globl _display_type_fault
        .section init_pfault
_display_trace_fault:                                # DATA XREF: ROM:boot_fault_table↓o
    lda     0x1000A28, g9
    balx    debug_disp_mes, r14
# ---------------------------------------------------------------------------
aTrace_0:       .asciz "TRACE"
    .short 0
# ---------------------------------------------------------------------------
    ret
# ---------------------------------------------------------------------------
    lda     aTraceFaults, r4 # "Trace Faults"
    b       print_fault
# ---------------------------------------------------------------------------
_display_operation_fault:                                # DATA XREF: ROM:00004434↓o
    lda     aOperationFault, r4 # "Operation Faults"
    b       print_fault
# ---------------------------------------------------------------------------
_display_arithmetic_fault:                                # DATA XREF: ROM:00004438↓o
    lda     aArithmeticFaul, r4 # "Arithmetic Faults"
    b       print_fault
# ---------------------------------------------------------------------------
_display_floating_point_fault:                                # DATA XREF: ROM:0000443C↓o
    lda     aFloatingPointF, r4 # "Floating-Point Faults"
    b       print_fault
# ---------------------------------------------------------------------------
_display_constrain_fault:                                # DATA XREF: ROM:00004440↓o
    lda     aConstraintFaul, r4 # "Constraint Faults"
    b       print_fault
# ---------------------------------------------------------------------------
_display_protection_fault:                                # DATA XREF: ROM:00004444↓o
    lda     aProtectionFaul, r4 # "Protection Faults"
    b       print_fault
# ---------------------------------------------------------------------------
_display_machine_fault:                                # DATA XREF: ROM:00004448↓o
    lda     aMachineFaults, r4 # "Machine Faults"
    b       print_fault
# ---------------------------------------------------------------------------
_display_type_fault:                                # DATA XREF: ROM:0000444C↓o
    lda     aTypeFaults, r4 # "Type Faults"
    b       print_fault
# =============== S U B R O U T I N E =======================================
print_fault:                            # CODE XREF: ROM:00000B34↑j
    lda     0x1000BA8, g9
    mov     r4, g0
    call    print_mes
    lda     0x1000C28, g9
    lda     aIp, g0         # "IP :"
    call    print_mes
    lda     0x1000EA8, g9
    mov     rip, g0
    call    print_hex_w
    ret

init_hang:                               # CODE XREF: ROM:loc_BC4↓j
    b       init_hang                    # unreachable code

    .section fault_ascii
aTraceFaults:   .asciz "Trace Faults"       # DATA XREF: ROM:00000B2C↑o
aOperationFault:.asciz "Operation Faults"   # DATA XREF: ROM:loc_B38↑o
aArithmeticFaul:.asciz "Arithmetic Faults"  # DATA XREF: ROM:loc_B44↑o
aFloatingPointF:.asciz "Floating-Point Faults"
aConstraintFaul:.asciz "Constraint Faults"  # DATA XREF: ROM:loc_B5C↑o
aProtectionFaul:.asciz "Protection Faults"  # DATA XREF: ROM:loc_B68↑o
aMachineFaults: .asciz "Machine Faults"     # DATA XREF: ROM:loc_B74↑o
aTypeFaults:    .asciz "Type Faults"        # DATA XREF: ROM:loc_B80↑o
aIp:            .asciz "IP :"               # DATA XREF: print_fault+18↑o
