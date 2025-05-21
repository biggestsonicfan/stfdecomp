    .data
    .global _cpres_start2

_cpres_end:     .long 0
                .long 0
_cpres_start2:  .long 0xA1              # DATA XREF: copro_down2+4C↑o
                .long 0x20000
                .long 1
