start:	BL	sub	@20000000
	B	start

sub:	PUSH	{LR}	@20000006
	MOV	R0,#0x10
	PUSH	{R0}
	BL	sub2
	POP	{R0}
	POP	{PC}

sub2:	PUSH	{R7}
	MOV	R7,SP
	LDR	R1,[R7,#4]
	POP	{R7}
	BX	LR
