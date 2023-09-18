ARG_EXIT  = 0x5D
ARG_WRITE = 0x40

.cpu	cortex-a53
.arch	armv8-a
.data
		.align 	1
	string:		.asciz "Hello World\n"
.text
		.align 	1
		.global _start
	_start:
		LDR		x1, =string		// Meter en el X1 addr(string)
		MOV 	x2,	#12			// Meter en el X2 len(string)
		BL 		sys_write		
		B		exit

	sys_write: // Llamar al SO para que escriba
		MOV 	x8, #ARG_WRITE
		MOV 	x0, #0
		SVC		0

	exit:	// Tell SO to exit
		MOV 	x8, #ARG_EXIT
		MOV 	x0, #0
		SVC 	0
.end