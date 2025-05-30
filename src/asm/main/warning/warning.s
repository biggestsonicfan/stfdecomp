        .extern s_print_mes
        .extern clr_pattern_s
        .section warning
# =============== S U B R O U T I N E =======================================
WARNING_INT:                            # DATA XREF: ROM:mode_names↑o
    ld      SKIP_WARNING, r14 # Label from Fighting Vipers source (obvious tho)
    cmpobne 0, r14, WARNING_skip # If SKIP_WARNING != 0, advance mode by 1
    ld      not_scr_bg_move, r15
    setbit  0x10, r15, r15
    st      r15, not_scr_bg_move
    ld      add_BACKUP_RAM_TO_RAM, r3
    ldob    0x3352(r3), r3  # r3 = BACKUP_RAM_START+0x3352
    cmpobne 0, r3, WARNING_skip # If country_val_bk != 0, advance mode by 1
    b       loc_7CA8
# ---------------------------------------------------------------------------
WARNING_skip:                           # CODE XREF: WARNING_INT+8↑j
    mov     2, r15
    stib    r15, mode
    ret
# ---------------------------------------------------------------------------
loc_7CA8:                               # CODE XREF: WARNING_INT+34↑j
    mov     0, g0
    shlo    0xF, 1, g1
    lda     CG_DATA_START, g2
    call    change_bg_color # Adds 0x4000 to g1 for color code
    lda     0x1000000, g9
    addo    0x1F, 0x1F, g0
    addo    0x1F, 0x11, g1
    call    clr_pattern_s   # Clears drawn mothead info
    lda     0x1000332, g9
    lda     aWARNING, g0    # "W A R N I N G"
    call    s_print_mes
    lda     0x1000618, g9
    lda     aThisGameIsToBe, g0 # "THIS GAME IS TO BE USED ONLY IN JAPAN."
    call    s_print_mes
    lda     0x1000818, g9
    lda     aExportSalesDis, g0 # "EXPORT,SALES,DISTRIBUTION AND/OR"
    call    s_print_mes
    lda     0x1000A18, g9
    lda     aOperationOutsi, g0 # "OPERATION OUTSIDE THIS AREA MAY"
    call    s_print_mes
    lda     0x1000C18, g9
    lda     aConstituteAVio, g0 # "CONSTITUTE A VIOLATION OF INTERNATIONAL"
    call    s_print_mes
    lda     0x1000E18, g9
    lda     aLawsOnCopyrigh, g0 # "LAWS ON COPYRIGHTS AND/OR INDUSTRIAL"
    call    s_print_mes
    lda     0x1001018, g9
    lda     aPropertyRights, g0 # "PROPERTY RIGHTS AND SUBJECT THE"
    call    s_print_mes
    lda     0x1001218, g9
    lda     aViolatingParty, g0 # "VIOLATING PARTY TO LEGAL PROCEEDINGS."
    call    s_print_mes
    lda     0x1001650, g9
    lda     aSegaEnterprise, g0 # "SEGA ENTERPRISES,LTD."
    call    s_print_mes
    shlo    7, 5, r15
    st      r15, CTRL_TIMER
    ldib    mode, r15
    lda     1(r15), r15
    stib    r15, mode
    ret
# End of function WARNING_INT
# =============== S U B R O U T I N E =======================================
WARNING_DSP:                            # DATA XREF: ROM:00007B0C↑o
    ld      not_scr_bg_move, r15 # Label from Fighting Vipers source (obvious tho)
    setbit  0x10, r15, r15
    st      r15, not_scr_bg_move
    ld      CTRL_TIMER, r5
    subi    1, r5, r5
    st      r5, CTRL_TIMER
    cmpibl  0, r5, loc_7DFC # return
    ldib    mode, r15
    lda     1(r15), r15
    stib    r15, mode
    ld      not_scr_bg_move, r15
    clrbit  0x10, r15, r15
    st      r15, not_scr_bg_move
loc_7DFC:                               # CODE XREF: WARNING_DSP+28↑j
    ret                     # return
# End of function WARNING_DSP
# ---------------------------------------------------------------------------
aWARNING:       .asciz "W A R N I N G" # DATA XREF: WARNING_INT+78↑o
aThisGameIsToBe:.asciz "THIS GAME IS TO BE USED ONLY IN JAPAN."
aExportSalesDis:.asciz "EXPORT,SALES,DISTRIBUTION AND/OR"
aOperationOutsi:.asciz "OPERATION OUTSIDE THIS AREA MAY"
aConstituteAVio:.asciz "CONSTITUTE A VIOLATION OF INTERNATIONAL"
aLawsOnCopyrigh:.asciz "LAWS ON COPYRIGHTS AND/OR INDUSTRIAL"
aPropertyRights:.asciz "PROPERTY RIGHTS AND SUBJECT THE"
aViolatingParty:.asciz "VIOLATING PARTY TO LEGAL PROCEEDINGS."
aSegaEnterprise:.asciz "SEGA ENTERPRISES,LTD."
                .byte 0
