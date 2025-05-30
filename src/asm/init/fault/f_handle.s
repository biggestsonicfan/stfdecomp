/* ********************************************************** */
/*		User Fault Table 									  */

        .globl fault_table
        .globl _user_arithmetic
        .globl _user_machine
        .globl _user_trace
        .globl _user_operation
        .globl _user_real_arithmetic
        .globl _user_constraint
        .globl _user_protection
        .globl _user_type
        
        .extern print_mes
        .section load_fault_ascii
# ---------------------------------------------------------------------------
_user_arithmetic:                       # DATA XREF: ROM:00004518↓o
    lda     aArithmetic, r4 # "arithmetic"
    b       loc_A70
# ---------------------------------------------------------------------------
_user_machine:                          # DATA XREF: ROM:00004540↓o
    lda     aMachine, r4    # "machine"
    b       loc_A70
# ---------------------------------------------------------------------------
_user_trace:                            # DATA XREF: ROM:00004508↓o
    lda     aTrace, r4      # "trace"
    b       loc_A70
# ---------------------------------------------------------------------------
_user_operation:                        # DATA XREF: ROM:00004510↓o
    lda     aOperation, r4  # "operation"
    b       loc_A70
# ---------------------------------------------------------------------------
_user_real_arithmetic:              # DATA XREF: ROM:00004520↓o
    lda     aRealArithmetic, r4 # "real_arithmetic"
    b       loc_A70
# ---------------------------------------------------------------------------
_user_constraint:                        # DATA XREF: ROM:00004528↓o
    lda     aConstrain, r4  # "constrain"
    b       loc_A70
# ---------------------------------------------------------------------------
_user_protection:                       # DATA XREF: ROM:00004538↓o
    lda     aProtection, r4 # "protection"
    b       loc_A70
# ---------------------------------------------------------------------------
_user_type:                             # DATA XREF: ROM:00004550↓o
    lda     aType, r4       # "type"
    b       loc_A70
# ---------------------------------------------------------------------------
loc_A70:                                # CODE XREF: ROM:00000A18↑j
    addo    4, sp, sp       # Allocate space on the stack
    st      g0, -4(sp)      # save g0 to the stack
    addo    4, sp, sp       # allocate next word on the stack
    st      g1, -4(sp)      # save g1 to the stack
    addo    4, sp, sp       # allocate next word...
    st      g2, -4(sp)      # save g2
    addo    4, sp, sp       # allocate more spac
    st      g9, -4(sp)      # save g9...
    ld      -4(fp), r3      # access the last word of the fault record located above the start of the current frame pointer
    lda     TEXTURE_BUFFER, g1
    st      r3, 0x0(sp)
    st      r4, 4(sp)
    mov     2, r15
    balx    sub_4ED24, r14  # hmmm, we want to keep stay in the current fault handler frame... why
# ---------------------------------------------------------------------------
aIpXS:          .asciz "IP:%x %s"
    .fill 3, 1, 0
# ---------------------------------------------------------------------------
    lda     0x1000000, g9
    call    print_mes
    ld      -4(sp), g9
    subo    4, sp, sp
    ld      -4(sp), g2
    subo    4, sp, sp
    ld      -4(sp), g1
    subo    4, sp, sp
    ld      -4(sp), g0
    subo    4, sp, sp
    ret
# ---------------------------------------------------------------------------
    .section fault_ascii
aArithmetic:    .asciz "arithmetic"         # DATA XREF: ROM:Arithmetic_Fault↑o
aMachine:       .asciz "machine"            # DATA XREF: ROM:Machine_Fault↑o
aTrace:         .asciz "trace"              # DATA XREF: ROM:Trace_Fault↑o
aOperation:     .asciz "operation"          # DATA XREF: ROM:Operation_Fault↑o
aRealArithmetic:.asciz "real_arithmetic"
aConstrain:     .asciz "constrain"          # DATA XREF: ROM:Constrain_Fault↑o
aProtection:    .asciz "protection"         # DATA XREF: ROM:Protection_Fault↑o
aType:          .asciz "type"               # DATA XREF: ROM:Type_Fault↑o
