start:	LDR	R0, =intvec
	LDR	R1, =shortvec
	MOV	R2, #8
	BL	copyvec
	B	start
copyvec:
	PUSH	{R0,R1,R2}
	MOV	R3, #0
copyvec1:
	CMP	R3, R2
	BGE	copyvec2
	LSL	R5, R3, #1
	LDRSH	R4, [R1, R5]
	SXTH	R4, R4
	LSL	R5, R3, #2
	STR	R4, [R0, R5]
	ADD	R3, #1
	B	copyvec1
copyvec2:
	POP	{R0, R1, R2}
	BX	LR

	.ALIGN
	.SPACE 	8
intvec:	
	.SPACE 	32
shortvec:
	.HWORD	1,2,3,4,-1,-2,-3,-4
