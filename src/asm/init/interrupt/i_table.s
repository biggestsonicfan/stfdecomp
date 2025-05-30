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
   risk.							  */
/******************************************************************/

/*     Initial Interrupt Table        */
 	.globl	_intr_table
	.extern IntrHalt
	.extern VsyncScr
	.extern VsyncObj
	.extern Timer
	.extern Other
	.set _user_intr30,0
	.set _user_intr31,0
	.set _user_NMI,0
	.align	6
	.section interr_table
_intr_table: 
	.long	0		# Pending Priorities    0 - The first long of the interrupt_table_pointer is pending priorities
	.fill	8,4,0		# Pending Interrupts   4 + (0->7)*4     

/******************************************************************/        
/*	interrupt vectors 0-7 are not accessible due to how the system 
	priority scheme works instead it becomes the scratch space for 
	the processor to track pending interrupts and priorities so if
	the priority of the process controls is greater than or equal to
	the incoming priority then it it recorded in this area here 
	The interrupt table is broken up into 32 priority groups of 8 
	entries each

 	Based off of this, I am guessing that sega set the priority in the
	process controls to zero so that any any interrupts will always be
	serviced. Makes sense, they are not running something like VxWorks
 	They may also modify this table later on in the boot process too. */
/******************************************************************/	

	.long	IntrHalt		# interrupt table entry   8
	.long	IntrHalt		# interrupt table entry   9
	.long	IntrHalt		# interrupt table entry  10
	.long	IntrHalt		# interrupt table entry  11
	.long	VsyncScr		# interrupt table entry  12
	.long	VsyncObj		# interrupt table entry  13
	.long	Timer			# interrupt table entry  14
	.long	Other			# interrupt table entry  15
	.long	IntrHalt		# interrupt table entry  16
	.long	IntrHalt		# interrupt table entry  17
	.long	IntrHalt		# interrupt table entry  18
	.long	IntrHalt		# interrupt table entry  19
	.long	IntrHalt		# interrupt table entry  20
	.long	IntrHalt		# interrupt table entry  21
	.long	IntrHalt		# interrupt table entry  22
	.long	IntrHalt		# interrupt table entry  23
	.long	IntrHalt		# interrupt table entry  24
	.long	IntrHalt		# interrupt table entry  25
	.long	IntrHalt		# interrupt table entry  26
	.long	IntrHalt		# interrupt table entry  27
	.long	IntrHalt		# interrupt table entry  28
	.long	IntrHalt		# interrupt table entry  29
	.long	IntrHalt		# interrupt table entry  30
	.long	IntrHalt		# interrupt table entry  31
	.long	IntrHalt		# interrupt table entry  32
	.long	IntrHalt		# interrupt table entry  33
	.long	IntrHalt		# interrupt table entry  34
	.long	IntrHalt		# interrupt table entry  35
	.long	IntrHalt		# interrupt table entry  36
	.long	IntrHalt		# interrupt table entry  37
	.long	IntrHalt		# interrupt table entry  38
	.long	IntrHalt		# interrupt table entry  39
	.long	IntrHalt		# interrupt table entry  40
	.long	IntrHalt		# interrupt table entry  41
	.long	IntrHalt		# interrupt table entry  42
	.long	IntrHalt		# interrupt table entry  43
	.long	IntrHalt		# interrupt table entry  44
	.long	IntrHalt		# interrupt table entry  45
	.long	IntrHalt		# interrupt table entry  46
	.long	IntrHalt		# interrupt table entry  47
	.long	IntrHalt		# interrupt table entry  48
	.long	IntrHalt		# interrupt table entry  49
	.long	IntrHalt		# interrupt table entry  50
	.long	IntrHalt		# interrupt table entry  51
	.long	IntrHalt		# interrupt table entry  52
	.long	IntrHalt		# interrupt table entry  53
	.long	IntrHalt		# interrupt table entry  54
	.long	IntrHalt		# interrupt table entry  55
	.long	IntrHalt		# interrupt table entry  56
	.long	IntrHalt		# interrupt table entry  57
	.long	IntrHalt		# interrupt table entry  58
	.long	IntrHalt		# interrupt table entry  59
	.long	IntrHalt		# interrupt table entry  60
	.long	IntrHalt		# interrupt table entry  61
	.long	IntrHalt		# interrupt table entry  62
	.long	IntrHalt		# interrupt table entry  63
	.long	IntrHalt		# interrupt table entry  64
	.long	IntrHalt		# interrupt table entry  65
	.long	IntrHalt		# interrupt table entry  66
	.long	IntrHalt		# interrupt table entry  67
	.long	IntrHalt		# interrupt table entry  68
	.long	IntrHalt		# interrupt table entry  69
	.long	IntrHalt		# interrupt table entry  70
	.long	IntrHalt		# interrupt table entry  71
	.long	IntrHalt		# interrupt table entry  72
	.long	IntrHalt		# interrupt table entry  73
	.long	IntrHalt		# interrupt table entry  74
	.long	IntrHalt		# interrupt table entry  75
	.long	IntrHalt		# interrupt table entry  76
	.long	IntrHalt		# interrupt table entry  77
	.long	IntrHalt		# interrupt table entry  78
	.long	IntrHalt		# interrupt table entry  79
	.long	IntrHalt		# interrupt table entry  80
	.long	IntrHalt		# interrupt table entry  81
	.long	IntrHalt		# interrupt table entry  82
	.long	IntrHalt		# interrupt table entry  83
	.long	IntrHalt		# interrupt table entry  84
	.long	IntrHalt		# interrupt table entry  85
	.long	IntrHalt		# interrupt table entry  86
	.long	IntrHalt		# interrupt table entry  87
	.long	IntrHalt		# interrupt table entry  88
	.long	IntrHalt		# interrupt table entry  89
	.long	IntrHalt		# interrupt table entry  90
	.long	IntrHalt		# interrupt table entry  91
	.long	IntrHalt		# interrupt table entry  92
	.long	IntrHalt		# interrupt table entry  93
	.long	IntrHalt		# interrupt table entry  94
	.long	IntrHalt		# interrupt table entry  95
	.long	IntrHalt		# interrupt table entry  96
	.long	IntrHalt		# interrupt table entry  97
	.long	IntrHalt		# interrupt table entry  98
	.long	IntrHalt		# interrupt table entry  99
	.long	IntrHalt		# interrupt table entry 100
	.long	IntrHalt		# interrupt table entry 101
	.long	IntrHalt		# interrupt table entry 102
	.long	IntrHalt		# interrupt table entry 103
	.long	IntrHalt		# interrupt table entry 104
	.long	IntrHalt		# interrupt table entry 105
	.long	IntrHalt		# interrupt table entry 106
	.long	IntrHalt		# interrupt table entry 107
	.long	IntrHalt		# interrupt table entry 108
	.long	IntrHalt		# interrupt table entry 109
	.long	IntrHalt		# interrupt table entry 110
	.long	IntrHalt		# interrupt table entry 111
	.long	IntrHalt		# interrupt table entry 112
	.long	IntrHalt		# interrupt table entry 113
	.long	IntrHalt		# interrupt table entry 114
	.long	IntrHalt		# interrupt table entry 115
	.long	IntrHalt		# interrupt table entry 116
	.long	IntrHalt		# interrupt table entry 117
	.long	IntrHalt		# interrupt table entry 118
	.long	IntrHalt		# interrupt table entry 119
	.long	IntrHalt		# interrupt table entry 120
	.long	IntrHalt		# interrupt table entry 121
	.long	IntrHalt		# interrupt table entry 122
	.long	IntrHalt		# interrupt table entry 123
	.long	IntrHalt		# interrupt table entry 124
	.long	IntrHalt		# interrupt table entry 125
	.long	IntrHalt		# interrupt table entry 126
	.long	IntrHalt		# interrupt table entry 127
	.long	IntrHalt		# interrupt table entry 128
	.long	IntrHalt		# interrupt table entry 129
	.long	IntrHalt		# interrupt table entry 130
	.long	IntrHalt		# interrupt table entry 131
	.long	IntrHalt		# interrupt table entry 132
	.long	IntrHalt		# interrupt table entry 133
	.long	IntrHalt		# interrupt table entry 134
	.long	IntrHalt		# interrupt table entry 135
	.long	IntrHalt		# interrupt table entry 136
	.long	IntrHalt		# interrupt table entry 137
	.long	IntrHalt		# interrupt table entry 138
	.long	IntrHalt		# interrupt table entry 139
	.long	IntrHalt		# interrupt table entry 140
	.long	IntrHalt		# interrupt table entry 141
	.long	IntrHalt		# interrupt table entry 142
	.long	IntrHalt		# interrupt table entry 143
	.long	IntrHalt		# interrupt table entry 144
	.long	IntrHalt		# interrupt table entry 145
	.long	IntrHalt		# interrupt table entry 146
	.long	IntrHalt		# interrupt table entry 147
	.long	IntrHalt		# interrupt table entry 148
	.long	IntrHalt		# interrupt table entry 149
	.long	IntrHalt		# interrupt table entry 150
	.long	IntrHalt		# interrupt table entry 151
	.long	IntrHalt		# interrupt table entry 152
	.long	IntrHalt		# interrupt table entry 153
	.long	IntrHalt		# interrupt table entry 154
	.long	IntrHalt		# interrupt table entry 155
	.long	IntrHalt		# interrupt table entry 156
	.long	IntrHalt		# interrupt table entry 157
	.long	IntrHalt		# interrupt table entry 158
	.long	IntrHalt		# interrupt table entry 159
	.long	IntrHalt		# interrupt table entry 160
	.long	IntrHalt		# interrupt table entry 161
	.long	IntrHalt		# interrupt table entry 162
	.long	IntrHalt		# interrupt table entry 163
	.long	IntrHalt		# interrupt table entry 164
	.long	IntrHalt		# interrupt table entry 165
	.long	IntrHalt		# interrupt table entry 166
	.long	IntrHalt		# interrupt table entry 167
	.long	IntrHalt		# interrupt table entry 168
	.long	IntrHalt		# interrupt table entry 169
	.long	IntrHalt		# interrupt table entry 170
	.long	IntrHalt		# interrupt table entry 171
	.long	IntrHalt		# interrupt table entry 172
	.long	IntrHalt		# interrupt table entry 173
	.long	IntrHalt		# interrupt table entry 174
	.long	IntrHalt		# interrupt table entry 175
	.long	IntrHalt		# interrupt table entry 176
	.long	IntrHalt		# interrupt table entry 177
	.long	IntrHalt		# interrupt table entry 178
	.long	IntrHalt		# interrupt table entry 179
	.long	IntrHalt		# interrupt table entry 180
	.long	IntrHalt		# interrupt table entry 181
	.long	IntrHalt		# interrupt table entry 182
	.long	IntrHalt		# interrupt table entry 183
	.long	IntrHalt		# interrupt table entry 184
	.long	IntrHalt		# interrupt table entry 185
	.long	IntrHalt		# interrupt table entry 186
	.long	IntrHalt		# interrupt table entry 187
	.long	IntrHalt		# interrupt table entry 188
	.long	IntrHalt		# interrupt table entry 189
	.long	IntrHalt		# interrupt table entry 190
	.long	IntrHalt		# interrupt table entry 191
	.long	IntrHalt		# interrupt table entry 192
	.long	IntrHalt		# interrupt table entry 193
	.long	IntrHalt		# interrupt table entry 194
	.long	IntrHalt		# interrupt table entry 195
	.long	IntrHalt		# interrupt table entry 196
	.long	IntrHalt		# interrupt table entry 197
	.long	IntrHalt		# interrupt table entry 198
	.long	IntrHalt		# interrupt table entry 199
	.long	IntrHalt		# interrupt table entry 200
	.long	IntrHalt		# interrupt table entry 201
	.long	IntrHalt		# interrupt table entry 202
	.long	IntrHalt		# interrupt table entry 203
	.long	IntrHalt		# interrupt table entry 204
	.long	IntrHalt		# interrupt table entry 205
	.long	IntrHalt		# interrupt table entry 206
	.long	IntrHalt		# interrupt table entry 207
	.long	IntrHalt		# interrupt table entry 208
	.long	IntrHalt		# interrupt table entry 209
	.long	IntrHalt		# interrupt table entry 210
	.long	IntrHalt		# interrupt table entry 211
	.long	IntrHalt		# interrupt table entry 212
	.long	IntrHalt		# interrupt table entry 213
	.long	IntrHalt		# interrupt table entry 214
	.long	IntrHalt		# interrupt table entry 215
	.long	IntrHalt		# interrupt table entry 216
	.long	IntrHalt		# interrupt table entry 217
	.long	IntrHalt		# interrupt table entry 218
	.long	IntrHalt		# interrupt table entry 219
	.long	IntrHalt		# interrupt table entry 220
	.long	IntrHalt		# interrupt table entry 221
	.long	IntrHalt		# interrupt table entry 222
	.long	IntrHalt		# interrupt table entry 223
	.long	IntrHalt		# interrupt table entry 224
	.long	IntrHalt		# interrupt table entry 225
	.long	IntrHalt		# interrupt table entry 226
	.long	IntrHalt		# interrupt table entry 227
	.long	IntrHalt		# interrupt table entry 228
	.long	IntrHalt		# interrupt table entry 229
	.long	IntrHalt		# interrupt table entry 230
	.long	IntrHalt		# interrupt table entry 231
	.long	IntrHalt		# interrupt table entry 232
	.long	IntrHalt		# interrupt table entry 233
	.long	IntrHalt		# interrupt table entry 234
	.long	IntrHalt		# interrupt table entry 235
	.long	IntrHalt		# interrupt table entry 236
	.long	IntrHalt		# interrupt table entry 237
	.long	IntrHalt		# interrupt table entry 238
	.long	IntrHalt		# interrupt table entry 239
	.long	IntrHalt		# interrupt table entry 240
	.long	IntrHalt		# interrupt table entry 241
	.long	IntrHalt		# interrupt table entry 242
	.long	IntrHalt		# interrupt table entry 243
	.long	_user_intr30;	# reserved
	.long	_user_intr30;	# reserved
	.long	_user_intr30;	# reserved
	.long	_user_intr30;	# reserved
	.long	_user_NMI;		# system error interrupt (MC)
							# Non-Maskable Interrupt (CA)
	.long	_user_intr31;	# reserved
	.long	_user_intr31;	# reserved
	.long	_user_intr31;	# reserved
	.long	IntrHalt;		# interrupt table entry 252
	.long	IntrHalt;		# interrupt table entry 253
	.long	IntrHalt;		# interrupt table entry 254
	.long	IntrHalt;		# interrupt table entry 255
