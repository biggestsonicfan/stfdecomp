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

#   ------  declare the below symbols external
    .extern _intr_table

/* ------ define IAC address                                */

	.set	local_IAC, 0xFF000010

/* ------ core initialization block (located at address 0)  */
/* ------   ( 8 words)					                    */

	.section start_prog
start:

system_address_table:
    .long system_address_table  #   0 - SAT pointer
pcrb:
    .long prcb_ptr              #   4 - PRCB pointer
    .long 0
start_ip_add:
    .long start_ip              #   12 - Pointer to first IP
check_word1:    
    .long cs1                   #   16 - calculated at link time
check_word2:    
    .long 0                     #   cs1 = -(segtab + PRCB + startup)
check_word3:    
    .long 0                     #   20 - cs1= -(SAT + PRCB + startIP)
check_word4:    
    .long -1

/*  Model2 config information */
    .long 0
    .long 0
    .long 0
    .long 0
    .space 72
rom_prcb:
    .long sys_proc_table
    .long 0x304000FB        # 120 - Initialization words, denotes that this is the system procedure table entry
    
    .space 8

    .long system_address_table # 136 - pointer back to the start of the system address table (this MUST exist)
    .long 0xFC00FB          #  140 -Initialization words, the kind of segment selector entry (in this case it is the pointer back to the start of the SAT)
    
    .space 8

    .long sys_proc_table
    .long 0xFC00A3          # 152 - Initialization words
    
    .space 8

    .long fault_proc_table
    .long 0xFC00A3          # 168 - Initialization words

/* ------ initial PRCB  */

/* ------ This is our startup PRCB.  After initialization, */
/* ------ this will be copied to RAM 			   */
	    .align 6
        .section prcb_data
prcb_ptr:
	.long	0            	#   0 - reserved
	.long	start_ip_add    #   4 - initialize to 0x0c 
	.long	0            	#   8 - reserved
	.long	0    	  	    #  12 - reserved 
	.long	0    	        #  16 - reserved 
	.long	_intr_table	    #  20 - interrupt table address
	.long	_intr_stack	    #  24 - interrupt stack pointer
	.long	0x0		        #  28 - reserved

/******************************************************************
	The following are hardcoded constants in the Sx/Kx manuals
	These are actually segment selectors in disguise
	They point to table entries found in the SAT/IST
 	SAT or system address table is the non protected architecture
	name of the initialization segment table.
	If you shift the numbers to the right by 6 you'll get the 
	table index in the SAT
******************************************************************/
/* Go to index 7 in the SAT, this is region 3 ss in MC but I don't really have a name for K and S processors */
	.long	0x1FF	        #  32 - pointer to offset zero
/* In the SAT table we want the system procedure table to be found at offset 9 */
	.long	0x27F	        #  36 - system procedure table pointer
	.long	fault_table	    #  40 - fault table
	.long	0x0		        #  44 - reserved (secondary processor controls)
	.space	12	        	#  48 - reserved
	.long	0x0	        	#  60 - reserved
	.space	8	        	#  64 - reserved
	.long	0x0	        	#  72 - reserved
	.long	0x0	        	#  76 - reserved
	.space	48	        	#  80 - scratch space (resumption)
	.space	44	        	# 128 - scratch space ( error)

/* The system procedure table will only be used if the 	*/
/* user makes a supervisor procedure call     		*/
	    .align 6
        .section sys_proc
sys_proc_table:
	.long	0			# Reserved  
	.long	0			# Reserved
	.long	0			# Reserved
	.long	_trap_stack + 0x01	# Supervisor stack pointer      
	.long	0			# Preserved
	.long	0			# Preserved
	.long	0			# Preserved
	.long	0			# Preserved
	.long	0			# Preserved
	.long	0			# Preserved
	.long	0			# Preserved
	.long	0			# Preserved
	.long	0       	# 0 - console I/O routines 
	.long	0       	# 1 - remote host service request
	.long	0   		# 2 - laser printer I/O routines
	.long	0			# 3 - reserved for CX compatibility
	.long	0 			# 4 - reserved for CX compatibility
	.long	0			# 5 - reserved for CX compatibility

/* Below is the fault table for calls to the fault handler.   */
/* This table is provided because the above table (supervisor */
/* table) will allow tracing of fault events, whereas this    */
/* table will not allow tracing of fault events 	      */

	.align 6
    .section fault_proc
fault_proc_table:
	.long	0				# Reserved
	.long	0				# Reserved
	.long	0				# Reserved
	.long	_trap_stack 			# Supervisor stack pointer      
	.long	0				# Preserved
	.long	0				# Preserved
	.long	0				# Preserved
	.long	0				# Preserved
	.long	0				# Preserved
	.long	0				# Preserved
	.long	0				# Preserved
	.long	0				# Preserved

/******************************************************************
	The following word is the initial interrupt vector values that
    the i960 will invoke when one triggers interrupts on the four
    external interrupt sources, SEGA has opted to make them	very 
    _low_ priority!

 	Each byte corresponds to a different interrupt line:
	0-7: ~INT0 (highest priority)
	8-15: INT1
	24-31: ~INT3

    On startup, the Kx has a starting value of 0xFF00'0000 which
    puts its interrupt controller in.
    This needs to be fixed to be in direct interrupt mode

    Here are the vector indicies:
    ~INT0: 0x0C
    INT1: 0x0D
    INT2: 0x0E
    ~INT3: 0x0F
******************************************************************/
        .extern _display_trace_fault
        .extern _display_operation_fault
        .extern _display_arithmetic_fault
        .extern _display_floating_point_fault
        .extern _display_constrain_fault
        .extern _display_protection_fault
        .extern _display_machine_fault
        .extern _display_type_fault
        .section boot_ftable
boot_fault_table:
    .long _display_trace_fault+2
    .long _display_operation_fault+2
    .long _display_arithmetic_fault+2
    .long _display_floating_point_fault+2
    .long _display_constrain_fault+2
    .long _display_protection_fault+2
    .long _display_machine_fault+2
    .long _display_type_fault+2


	    .align	4
        .section reinit_iac
_reinitialize_IAC:	
	.long	0x93000000		        # reinitialize IAC message
	.long	system_address_table 
	.long	prcb_ram		        # use newly copied PRCB
	.long	start_again_ip		    # start here 
purge_instruction_cache_iac:
    .long 0x89000000
    .long 0
    .long 0
    .long 0
_wait_data:     .long 4                 # DATA XREF: start_ip+8↑o
    .long 2
    .long 0x42
    .long 2
    .long 1
    .long 2
    .long 0x10
    .long 0x10
    .long 0x20
    .long 0x10
    .long 0x10
    .long 0x10
    .long 0x10
    .long 0x10
    .long 0xFFFFFFFF

#   ---              
#   ---   Processor starts execution at this spot after reset.
#   ---
        .section start_ip_first
start_ip:
    lda     CPU_CONTROL_START, g0 # Label from official source
    lda     _wait_data, g1
    subo    1, 0, g3        # g3 = 0xFFFFFFFF or -1
loc_C4:                                 # CODE XREF: start_ip+2C↓j
    ld      (g1), g2        # g2 = 4
    cmpo    g2, g3          # compare g2 and g3
loc_CC:                                 # branch to clear_clear_ram if g2 = g3
    be      clear_ram
    st      g2, (g0)
    addo    4, g0, g0
    addo    4, g1, g1
    b       loc_C4
clear_ram:
    lda     RAMBASE_START, r14
    mov     0, r15
    lda     160760, r13     # loop counter r13 = 160760 loops
loc_F4:                                 # CODE XREF: start_ip:loc_100↓j
    st      r15, (r14)      # store 0 in RAMBASE address at offset r14
    lda     4(r14), r14     # r14 = r14+0x04
    cmpdeco 1, r13, r13     # decrement loop counter
loc_100:                                # DATA XREF: camera_init+96C↓o
    bl      loc_F4          # loop finishes at 0x59CFE0
loc_104:                                # Start new loop at 0x59D000
    lda     0x59D000, r14
    mov     0, r15          # We're storing 0 again
    lda     101376, r13     # init loop counter r13 for 101376 loops
loc_118:                                # CODE XREF: start_ip+74↓j
    st      r15, (r14)      # store 0 in RAMBASE address at offset r14
    lda     4(r14), r14     # r14 = r14+0x04
    cmpdeco 1, r13, r13     # decrement loop counter
    bl      loc_118         # loop finishes at 0x600000
    mov     2, r5
    stob    r5, 0x500F00
    lda     0x10F00000, r15 # MAME says this is 0x11000000
    st      r15, texram_0
    lda     0x11100000, r15
loc_14C:                                # DATA XREF: ROM:0005CA30↓o
    st      r15, texram_0_1
    lda     0x11300000, r15
    st      r15, texram_1
    lda     LUMA_START, r15
    st      r15, luma_ram

#   ---
#   --- Processor will copy PRCB to ram space, located at prcb_ram
#   ---
        .section prcb_to_ram
    lda     176, g0             #   load length of prcb
    lda     0, g4               #   initialize offset to 0
    lda     prcb_ptr, g1        #   load source
    lda     prcb_ram, g2        #   load destination
    bal     move_data           #   branch to move routine

#   ---
#   --- copy the interrupt table to RAM
#   ---
        .section intr_to_ram
    lda     1028, g0            #   load length of intr table
    lda     0, g4               #   initialize offset to a
    lda     _intr_table, g1      #   load source
    lda     intr_ram, g2        #   load addrss of new table
    bal     move_data           #   branch to move routine


# -- At this point, the prcb, and interrupt table have
# -- been moved to RAM. It is time
# -- to issue a REINITIALIZE lAC, which will start us anew with
# -- our RAM based prcb.
# --
# -- The lAC message, found in the 4 words located at the
# -- reinitialize_iac label, contain pointers to the current
# -- System address table, the new, RAM based PRCB, and to
# -- the instruction pointer labeled start_again_ip
#
        .section reinit
_Reinitialize:
	lda local_IAC, g5
    lda _reinitialize_IAC, g6
	synmovq g5, g6
system_hang:
    b       system_hang

        .section init_move_data
move_data:                              # CODE XREF: start_ip+DC↑p
    ldq     (g1)[g4*1], g8    # Label from Virtua Fighter 2 and Daytona source
    stq     g8, (g2)[g4*1]    # load four words into g8
    addi    g4, 16, g4      # store to RAM block
    cmpibg  g0, g4, move_data # increment index
    bx      (g14)           # loop until done


    .section start_again
start_again_ip:                         # DATA XREF: ROM:0000446C↓o
    ld      not_scr_bg_move, r15
    clrbit  31, r15, r15
    st      r15, not_scr_bg_move
