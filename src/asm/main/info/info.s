        .section info
INFO_INT:                               # DATA XREF: ROM:00007B24↑o
    ldib    mode, r15       # Label from official source
    lda     1(r15), r15
    stib    r15, mode
    ret
