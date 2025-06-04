        .section calculation
# =============== S U B R O U T I N E =======================================
# g7 = damage reciever
# g8 = damage dealer
damage_calculation:                     # CODE XREF: ACT_RC_NAGERARE:loc_153BC↑p
    call    ketchup         # g7 = damage reciever
    stos    g0, 0x1F70(g8)  # P2_PARTS+0x1F70 or P1_PARTS+0x1F70
    ldis    game_timer, r14
    cmpibge 0, r14, loc_1972C # return
    ldob    0x1B1(g7), r14  # P1_SELECTED or P2_SELECTED
    cmpobe  16, r14, loc_1972C # if player is Super Sonic, branch (return)
    ldis    0x1AC(g7), r14  # p1_energy or p2_energy
    subi    g0, r14, r3     # store calculated energy to r3
    stos    g0, 0xC54(g7)   # P1_PARTS+0xC54 or P2_PARTS+0xC54
    cmpibl  0, r3, loc_1971C # branch if 0 is less than calculated damage
    ld      0x0(g7), r15
    setbit  5, r15, r15
    st      r15, 0x0(g7)
    mov     0, r3
loc_1971C:                              # CODE XREF: damage_calculation+2C↑j
    stos    r3, 0x1AC(g7)   # p1_energy or p2_energy
    cmpo    0, g0           # if the damage calculated is 0 then return
    be      loc_1972C       # return
    call    ring_tobitiri_set # Ring Scatter
loc_1972C:                              # CODE XREF: damage_calculation+14↑j
    ret                     # return
# End of function damage_calculation
# =============== S U B R O U T I N E =======================================
sub_19730:                              # CODE XREF: ROM:0002B404↓p
    ldis    0x1AC(g7), r7
    ldis    0x1AC(g8), r8
    subi    r7, r8, r3
    b       loc_1974C
# End of function sub_19730
# =============== S U B R O U T I N E =======================================
# g7 = damage reciever
# g8 = damage dealer
ketchup:                                # CODE XREF: damage_calculation↑p
    ldis    0x1AC(g8), r7   # p1_energy or p2_energy
    ldis    0x1AC(g7), r8   # p2_energy or p1_energy
    subi    r7, r8, r3
loc_1974C:                              # CODE XREF: sub_19730+C↑j
    ld      add_BACKUP_RAM_TO_RAM, r14
    ldob    0x3353(r14), r14 # BACKUP_RAM_TO_RAM+0x3353
    bbc     7, r14, loc_19764
    ret
# ---------------------------------------------------------------------------
loc_19764:                              # CODE XREF: ketchup+1C↑j
    ldis    energy_max, r9
    subi    r8, r9, r9
    shri    1, r9, r9
    addo    0x1F, 0x13, r4
    subi    r9, r4, r4
    cmpible 0, r4, loc_19784
    mov     0, r4
loc_19784:                              # CODE XREF: ketchup+3C↑j
    cmpibge r4, r3, loc_19790
    mov     r4, r3
    b       loc_1979C
# ---------------------------------------------------------------------------
loc_19790:                              # CODE XREF: ketchup:loc_19784↑j
    subo    0x1E, 0, r4
    cmpible r4, r3, loc_1979C
    mov     r4, r3
loc_1979C:                              # CODE XREF: ketchup+4C↑j
    cvtir   r3, r3
    cvtir   g0, r4
    lda     0x3C23D70A, r13 # Float 0.01
    mulr    r13, r3, r3
    lda     0x3F800000, r13 # Float 1.0
    addr    r13, r3, r3
    mulr    r3, r4, r4
    cvtri   r4, g0
    ret
# End of function ketchup
