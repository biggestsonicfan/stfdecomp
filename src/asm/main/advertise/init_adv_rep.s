        .section adv_replay_ram_init
# =============== S U B R O U T I N E =======================================
init_adv_rep_ram:                       # CODE XREF: ROM:00006ABC↑p
    mov     0, r15          # Label from official source
    stib    r15, replay_bank_num # Set replay_bank_num to 0
    lda     REPLAY_BANK_ADR_value, r3
    st      r3, replay_bank_adr
    lda     replay_bank_init_data, r9 # set replay_bank_adr to REPLAY_BANK_ADR_value
    ld      replay_bank_adr, r5
    lda     0x0(r5), r10
    shlo    8, 1, r8
init_read_rep:                          # CODE XREF: init_adv_rep_ram+48↓j
    ldq     (r9), r4
    stq     r4, (r10)
    addo    0x10, r9, r9
    addo    0x10, r10, r10
    cmpdeco 1, r8, r8
    bl      init_read_rep
init_rep_ram:                           # CODE XREF: ROUND_DSP+5D8↓p
    lda     rep_ram, r3 # Label from official source
    shlo    0xA, 1, r8
    mov     0, r4
    mov     0, r5
    mov     0, r6
    mov     0, r7
init_rep_lp:                            # CODE XREF: init_adv_rep_ram+74↓j
    stq     r4, (r3)        # Label from Fighting Vipers source
    addo    0x10, r3, r3
    cmpdeco 1, r8, r8
    bl      init_rep_lp
    ret
# End of function init_adv_rep_ram
