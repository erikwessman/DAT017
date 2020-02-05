@ mom6.asm

start:
	LDR	R6, =0x55555555
	LDR	R5, =0x40020C00
	STR	R6, [R5]
	
	LDR	R5, =0x40020C14
	
	LDR	R6, =0x40021010
main:
	LDRB	R0, [R6]
	LDRB	R1, [R6, #1]
	BIC	R0, R1
	STRB	R0, [R5]
	B	main
