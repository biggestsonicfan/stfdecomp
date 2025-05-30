
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
   risk.							 							  */
/******************************************************************/
/* **************************************** */
/*      User Fault Table                    */
/* 	                                    	*/
/* generic fault handler: entry 0 	    	*/
/* trace fault handler:	entry 1 	    	*/
/* **************************************** */

		.extern fault_table
        .extern _user_arithmetic
        .extern _user_machine
        .extern _user_trace
        .extern _user_operation
        .extern _user_real_arithmetic
        .extern _user_constraint
        .extern _user_protection
        .extern _user_type

		.globl fault_table
		.set _user_reserved,0
		.align 8
		.section ftable

fault_table:
	.word	_user_reserved		# Type 0 Reserved Fault Handler / Override Fault (MC)
	.word	0					# 4
	.word	_user_trace			# 8 - Trace Fault
	.word	0					#
	.word	_user_operation		# Operation Fault
	.word	0					#
	.word	_user_arithmetic	# Arithmetic Fault
	.word	0					#
	.word	_user_real_arithmetic	# Floating Point Fault
	.word	0					#
	.word	_user_constraint	# Constraint Fault
	.word	0					#
	.word	_user_reserved		# Type 6 Reserved Fault Handler / Virtual Memory Fault (MC)
	.word	0					#
	.word	_user_protection	# Protection Fault
	.word	0					#
	.word	_user_machine		# Machine Fault
	.word	0					#
	.word	_user_reserved		# Structural Fault (MC) 
	.word	0					#
	.word	_user_type			# Type Fault
	.word	0					#
	.word	_user_reserved		# Type 11 Reserved Fault Handler
	.word	0					#
	.word	_user_reserved		# Type 12 Reserved Fault Handler / Process Fault (MC)
	.word	0					#
	.word	_user_reserved		# Type 13 Reserved Fault Handler / Descriptor Fault (MC)
	.word	0					#
	.word	_user_reserved		# Type 14 Reserved Fault Handler / Event Fault (MC)
	.word	0					#
	.word	_user_reserved		# Type 15 Reserved Fault Handler
	.word	0					#
	.word	_user_reserved		# Type 16 Reserved Fault Handler
	.word	0					#
	.word	_user_reserved		# Type 17 Reserved Fault Handler
	.word	0					#
	.word	_user_reserved		# Type 18 Reserved Fault Handler
	.word	0					#
	.word	_user_reserved		# Type 19 Reserved Fault Handler
	.word	0					#
	.word	_user_reserved		# Type 20 Reserved Fault Handler
	.word	0					#
	.word	_user_reserved		# Type 21 Reserved Fault Handler
	.word	0					#
	.word	_user_reserved		# Type 22 Reserved Fault Handler
	.word	0					#
	.word	_user_reserved		# Type 23 Reserved Fault Handler
	.word	0					#
	.word	_user_reserved		# Type 24 Reserved Fault Handler
	.word	0					#
	.word	_user_reserved		# Type 25 Reserved Fault Handler
	.word	0					#
	.word	_user_reserved		# Type 26 Reserved Fault Handler
	.word	0					#
	.word	_user_reserved		# Type 27 Reserved Fault Handler
	.word	0					#
	.word	_user_reserved		# Type 28 Reserved Fault Handler
	.word	0					#
	.word	_user_reserved		# Type 29 Reserved Fault Handler
	.word	0					#
	.word	_user_reserved		# Type 30 Reserved Fault Handler
	.word	0					#
	.word	_user_reserved		# Type 31 Reserved Fault Handler
	.word	0					#

