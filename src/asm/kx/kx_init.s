# A carbon copy of the "core initialization block" found in the KB programmers reference manual
# Another word for this is the IMI or Initial memory image
# the i960 Kx/Sx/MC processors start at address 0 when executing
# the first word is the pointer to the SAT or system address table, it is a rebranded segment table
# which has magic constants for our purposes. However, for completeness, each
# entry in the SAT is supposed to be four words in size and is called a segment descriptor
#
# if you're super curious look at the MC manual, but the part we care about are the last
# two words, the second to last word is the address we care about
# the last word are flags
#
# We actually describe the offset into the SAT from within the PRCB. My guess is that Intel did
# not want to discuss segments when it wasn't possible to use them fully (Kx and Sx don't support
# the Protected Architecture


/*  From the Intel 80960KB Programmers Reference Manual Mar88   */
###################################################################
#   Below is example system initialization code and tables.
#   The code builds the prcb in memory, sets up the stack frame,
#   the interrupt, fault, and system procedure tables, and
#   then vectors to a user defined routine.
####################################################################

#   ------  declare the below symbols public

    .globl system_address_table
    .globl prcb_ptr
    .globl start_ip
    #.globl csl   - This is set by our linker script
    .globl user stack
    .globl globl sup_stack
    .globl intr stack

/*  ".globl" labels will be Intel provided labels while
    ".global" labels will be defined for this assembly  - BSF*/

    .global check_word1
    .global check_word2
    .global check_word3
    .global check_word4
    .global copro_down
    .global copro_down2
    .global local_IAC
    .global pcrb
    .global start_ip_add

#   ------  define lAC address
    .set local_IAC, 0xFF000010

.include        "src/include/code_globals.S"

                .text
system_address_table:
                .long system_address_table  #   SAT pointer
pcrb:           .long prcb_ptr              #   PRCB pointer
                .long 0
start_ip_add:   .long start_ip              #   Pointer to first IP
check_word1:    .word cs1                   #   calculated at link time
check_word2:    .long 0                     #   cs1 = -(segtab + PRCB + startup)
check_word3:    .long 0                 # DATA XREF: ROM:0000B89C↓o
check_word4:    .long -1                # DATA XREF: ROM:0001126C↓o
                .long 0
                .long 0
                .long 0
                .long 0
                .fill 72, 1, 0
                .long sys_proc_table
                .long 0x304000FB        # Initialization words, denotes that this is the system procedure table entry
                .fill 8, 1, 0
                .long system_address_table # pointer back to the start of the system address table (this MUST exist)
                .long 0xFC00FB          # Initialization words, the kind of segment selector entry (in this case it is the pointer back to the start of the SAT)
                .fill 8, 1, 0
                .long sys_proc_table
                .long 0xFC00A3          # Initialization words
                .fill 8, 1, 0
                .long fault_proc_table
               .long 0xFC00A3          # Initialization words
