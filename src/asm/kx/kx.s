/******************************************************************/
/* 		Copyright (c) 1989, Intel Corporation

   Intel hereby grants you permission to copy, modify, and 
   distribute this software and its documentation.  Intel grants
   this permission provided that the above copyright notice 
   appears in all copies and that both the copyright notice and
   this permission notice appear in supporting documentation.  In
   addition, Intel grants this permission provided that you
   prominently mark as not part of the original any modifications
   made to this software or documentation, and that the name of 
   Intel Corporation not be used in advertising or publicity 
   pertaining to distribution of the software or the documentation 
   without specific, written prior permission.  

   Intel Corporation does not warrant, guarantee or make any 
   representations regarding the use of, or the results of the use
   of, the software and documentation in terms of correctness, 
   accuracy, reliability, currentness, or otherwise; and you rely
   on the software, documentation and results solely at your own 
   risk.							                              */
/******************************************************************/
	.globl	_Reinitialize                          # Label from Motor Raid source
                                                   # Label is "iac" in Intel docs

/*   From the Intel 80960KB Programmers Reference Manual Mar88   */
#
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

_Reinitialize:
	lda local_IAC, g5
    lda _reinitialize_IAC, g6
	synmovq g5, g6
system_hang:
    b       system_hang
