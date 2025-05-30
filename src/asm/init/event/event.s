# =============== S U B R O U T I N E =======================================
        .section mmode_set
set_mmode:                              # CODE XREF: event_loop+4↓p
    st      g14, mmode # Label from official source
    lda     0x707, g14
    st      g14, 0x70(g10)
    ld      mmode, g14
    st      g0, (g10)[g12*1]
    ret
# End of function set_mmode
