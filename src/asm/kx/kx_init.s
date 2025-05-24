# a carbon copy of the "core initialization block" found in the KB programmers reference manual
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

.text

.global pcrb
.global system_address_table
.global start_ip
.global start_ip_add
.global check_word1
.global check_word2
.global check_word3
.global check_word4
.global copro_down
.global copro_down2

.include        "src/include/code_globals.S"

system_address_table:.long system_address_table
pcrb:           .long prcb_ptr             # DATA XREF: ROUND_DSP:READY_INT↓o
                .long 0
start_ip_add:   .long start_ip          # DATA XREF: ROM:00003C44↓o
check_word1:    .word cs1               # DATA XREF: ROUND_DSP+CE0↓o
check_word2:    .long 0                 # DATA XREF: ROUND_DSP+1A34↓o
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
# =============== S U B R O U T I N E =======================================
start_ip:                               # CODE XREF: test_sw_chk+B4↓j
                lda     CPU_CONTROL_START, g0 # Label from official source
                lda     _wait_data, g1
                subo    1, 0, g3        # g3 = 0xFFFFFFFF or -1
loc_C4:                                 # CODE XREF: start_ip+2C↓j
                ld      (g1), g2        # g2 = 4
                cmpo    g2, g3          # compare g2 and g3
loc_CC:                                 # branch to clear_RAMBASE if g2 = g3
                be      clear_RAMBASE
                st      g2, (g0)
                addo    4, g0, g0
                addo    4, g1, g1
                b       loc_C4
# ---------------------------------------------------------------------------
clear_RAMBASE:                          # CODE XREF: start_ip:loc_CC↑j
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
                lda     1028, g0
                lda     0, g4
                lda     _intr_table, g1
                lda     _intr_table_ram, g2
                bal     move_data
                lda     176, g0         # load length of PRCB
                lda     0, g4
                lda     prcb_ptr, g1
                lda     _prcb_ram, g2
                bal     move_data       # fix up the PRCB to point to a new interrupt table
                lda     _intr_table_ram, g12
                st      g12, 0x14(g2)   # at this point, the PRCB, and the interrupt table have been moved to RAM.
                call    warn_screen_show_check # It is time to issue a reinitialize IAC, which will start us a new withour RAM based PRCB.
                st      g0, SKIP_WARNING
                cmpobne 0, g0, loc_1E0
                call    copro_down
                lda     700000, r3
loc_1D4:                                # CODE XREF: start_ip+128↓j
                cmpdeco 1, r3, r3       # decrement r3 700000 times...
                bl      loc_1D4
                call    copro_down2
loc_1E0:                                # CODE XREF: start_ip+114↑j
                call    _INTR_ram__am1_users2_yasuda_mb_src_init_0
_Reinitialize:                          # Label from Motor Raid source
                lda     0xFF000010, g5  # IAC Message Port
                lda     _reinitialize_IAC, g6
call_to_0x250:                          # Jumps to start_again_ip
                synmovq g5, g6
system_hang:                            # CODE XREF: start_ip:system_hang↓j
                b       system_hang
# End of function start_ip
