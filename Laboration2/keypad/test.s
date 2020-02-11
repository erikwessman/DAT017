   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"startup.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.section	.start_section,"ax",%progbits
  16              		.align	1
  17              		.global	startup
  18              		.syntax unified
  19              		.code	16
  20              		.thumb_func
  21              		.fpu softvfp
  23              	startup:
  24              	.LFB0:
  25              		.file 1 "C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad/startup.c"
   1:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** /*
   2:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c ****  * 	startup.c
   3:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c ****  *
   4:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c ****  */ 
   5:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c ****  
   6:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** #define GPIO_D 0x40020C00
   7:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** #define GPIO_MODER ((volatile unsigned int *) GPIO_D)
   8:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_D + 4))
   9:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_D + 0xC))
  10:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D + 0x10))
  11:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D + 0x11))
  12:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D + 0x14))
  13:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D + 0x15))
  14:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 
  15:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** __attribute__((naked)) __attribute__((section (".start_section")) )
  16:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** void startup ( void )
  17:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** {
  26              		.loc 1 17 1
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  18:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** __asm__ volatile(" LDR R0,=0x2001C000\n");		/* set stack */
  31              		.loc 1 18 1
  32              		.syntax divided
  33              	@ 18 "C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35              	
  36              	@ 0 "" 2
  19:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** __asm__ volatile(" MOV SP,R0\n");
  37              		.loc 1 19 1
  38              	@ 19 "C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad/startup.c" 1
  39 0002 8546     		 MOV SP,R0
  40              	
  41              	@ 0 "" 2
  20:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** __asm__ volatile(" BL main\n");					/* call main */
  42              		.loc 1 20 1
  43              	@ 20 "C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad/startup.c" 1
  44 0004 FFF7FEFF 		 BL main
  45              	
  46              	@ 0 "" 2
  21:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** __asm__ volatile(".L1: B .L1\n");				/* never return */
  47              		.loc 1 21 1
  48              	@ 21 "C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad/startup.c" 1
  49 0008 FEE7     		.L1: B .L1
  50              	
  51              	@ 0 "" 2
  22:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** }
  52              		.loc 1 22 1
  53              		.thumb
  54              		.syntax unified
  55 000a C046     		nop
  56              		.cfi_endproc
  57              	.LFE0:
  59              		.text
  60              		.align	1
  61              		.global	app_init
  62              		.syntax unified
  63              		.code	16
  64              		.thumb_func
  65              		.fpu softvfp
  67              	app_init:
  68              	.LFB1:
  23:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 
  24:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 
  25:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 
  26:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** void app_init(void) {
  69              		.loc 1 26 21
  70              		.cfi_startproc
  71              		@ args = 0, pretend = 0, frame = 0
  72              		@ frame_needed = 1, uses_anonymous_args = 0
  73 0000 80B5     		push	{r7, lr}
  74              		.cfi_def_cfa_offset 8
  75              		.cfi_offset 7, -8
  76              		.cfi_offset 14, -4
  77 0002 00AF     		add	r7, sp, #0
  78              		.cfi_def_cfa_register 7
  27:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	*GPIO_MODER &= 0x00000000;
  79              		.loc 1 27 14
  80 0004 114B     		ldr	r3, .L3
  81 0006 1B68     		ldr	r3, [r3]
  82 0008 104B     		ldr	r3, .L3
  83 000a 0022     		movs	r2, #0
  84 000c 1A60     		str	r2, [r3]
  28:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	*GPIO_OTYPER &= 0xFFFF00FF;
  85              		.loc 1 28 15
  86 000e 104B     		ldr	r3, .L3+4
  87 0010 1B88     		ldrh	r3, [r3]
  88 0012 9BB2     		uxth	r3, r3
  89 0014 0E4A     		ldr	r2, .L3+4
  90 0016 FF21     		movs	r1, #255
  91 0018 0B40     		ands	r3, r1
  92 001a 9BB2     		uxth	r3, r3
  93 001c 1380     		strh	r3, [r2]
  29:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	*GPIO_PUPDR &= 0x0000FFFF;
  94              		.loc 1 29 14
  95 001e 0D4B     		ldr	r3, .L3+8
  96 0020 1A68     		ldr	r2, [r3]
  97 0022 0C4B     		ldr	r3, .L3+8
  98 0024 1204     		lsls	r2, r2, #16
  99 0026 120C     		lsrs	r2, r2, #16
 100 0028 1A60     		str	r2, [r3]
  30:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	
  31:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	*GPIO_MODER |= 0x55005555;
 101              		.loc 1 31 14
 102 002a 084B     		ldr	r3, .L3
 103 002c 1A68     		ldr	r2, [r3]
 104 002e 074B     		ldr	r3, .L3
 105 0030 0949     		ldr	r1, .L3+12
 106 0032 0A43     		orrs	r2, r1
 107 0034 1A60     		str	r2, [r3]
  32:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	*GPIO_PUPDR |= 0xAA000000;
 108              		.loc 1 32 14
 109 0036 074B     		ldr	r3, .L3+8
 110 0038 1A68     		ldr	r2, [r3]
 111 003a 064B     		ldr	r3, .L3+8
 112 003c AA21     		movs	r1, #170
 113 003e 0906     		lsls	r1, r1, #24
 114 0040 0A43     		orrs	r2, r1
 115 0042 1A60     		str	r2, [r3]
  33:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** }
 116              		.loc 1 33 1
 117 0044 C046     		nop
 118 0046 BD46     		mov	sp, r7
 119              		@ sp needed
 120 0048 80BD     		pop	{r7, pc}
 121              	.L4:
 122 004a C046     		.align	2
 123              	.L3:
 124 004c 000C0240 		.word	1073875968
 125 0050 040C0240 		.word	1073875972
 126 0054 0C0C0240 		.word	1073875980
 127 0058 55550055 		.word	1426085205
 128              		.cfi_endproc
 129              	.LFE1:
 131              		.align	1
 132              		.global	ActivateRow
 133              		.syntax unified
 134              		.code	16
 135              		.thumb_func
 136              		.fpu softvfp
 138              	ActivateRow:
 139              	.LFB2:
  34:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 
  35:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** void ActivateRow(unsigned int row) {
 140              		.loc 1 35 36
 141              		.cfi_startproc
 142              		@ args = 0, pretend = 0, frame = 8
 143              		@ frame_needed = 1, uses_anonymous_args = 0
 144 005c 80B5     		push	{r7, lr}
 145              		.cfi_def_cfa_offset 8
 146              		.cfi_offset 7, -8
 147              		.cfi_offset 14, -4
 148 005e 82B0     		sub	sp, sp, #8
 149              		.cfi_def_cfa_offset 16
 150 0060 00AF     		add	r7, sp, #0
 151              		.cfi_def_cfa_register 7
 152 0062 7860     		str	r0, [r7, #4]
 153 0064 7B68     		ldr	r3, [r7, #4]
 154 0066 042B     		cmp	r3, #4
 155 0068 19D8     		bhi	.L13
 156 006a 7B68     		ldr	r3, [r7, #4]
 157 006c 9A00     		lsls	r2, r3, #2
 158 006e 0E4B     		ldr	r3, .L14
 159 0070 D318     		adds	r3, r2, r3
 160 0072 1B68     		ldr	r3, [r3]
 161 0074 9F46     		mov	pc, r3
 162              		.section	.rodata
 163              		.align	2
 164              	.L8:
 165 0000 96000000 		.word	.L12
 166 0004 76000000 		.word	.L11
 167 0008 7E000000 		.word	.L10
 168 000c 86000000 		.word	.L9
 169 0010 8E000000 		.word	.L7
 170              		.text
 171              	.L11:
  36:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	switch(row) {
  37:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		case 1: *GPIO_ODR_HIGH = 0x10; break;
 172              		.loc 1 37 11
 173 0076 0D4B     		ldr	r3, .L14+4
 174              		.loc 1 37 26
 175 0078 1022     		movs	r2, #16
 176 007a 1A70     		strb	r2, [r3]
 177              		.loc 1 37 3
 178 007c 0FE0     		b	.L6
 179              	.L10:
  38:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		case 2: *GPIO_ODR_HIGH = 0x20; break;
 180              		.loc 1 38 11
 181 007e 0B4B     		ldr	r3, .L14+4
 182              		.loc 1 38 26
 183 0080 2022     		movs	r2, #32
 184 0082 1A70     		strb	r2, [r3]
 185              		.loc 1 38 3
 186 0084 0BE0     		b	.L6
 187              	.L9:
  39:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		case 3: *GPIO_ODR_HIGH = 0x40; break;
 188              		.loc 1 39 11
 189 0086 094B     		ldr	r3, .L14+4
 190              		.loc 1 39 26
 191 0088 4022     		movs	r2, #64
 192 008a 1A70     		strb	r2, [r3]
 193              		.loc 1 39 3
 194 008c 07E0     		b	.L6
 195              	.L7:
  40:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		case 4: *GPIO_ODR_HIGH = 0x80; break;
 196              		.loc 1 40 11
 197 008e 074B     		ldr	r3, .L14+4
 198              		.loc 1 40 26
 199 0090 8022     		movs	r2, #128
 200 0092 1A70     		strb	r2, [r3]
 201              		.loc 1 40 3
 202 0094 03E0     		b	.L6
 203              	.L12:
  41:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		case 0: *GPIO_ODR_HIGH = 0x00; break;
 204              		.loc 1 41 11
 205 0096 054B     		ldr	r3, .L14+4
 206              		.loc 1 41 26
 207 0098 0022     		movs	r2, #0
 208 009a 1A70     		strb	r2, [r3]
 209              		.loc 1 41 3
 210 009c C046     		nop
 211              	.L6:
 212              	.L13:
  42:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	}
  43:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** }
 213              		.loc 1 43 1
 214 009e C046     		nop
 215 00a0 BD46     		mov	sp, r7
 216 00a2 02B0     		add	sp, sp, #8
 217              		@ sp needed
 218 00a4 80BD     		pop	{r7, pc}
 219              	.L15:
 220 00a6 C046     		.align	2
 221              	.L14:
 222 00a8 00000000 		.word	.L8
 223 00ac 150C0240 		.word	1073875989
 224              		.cfi_endproc
 225              	.LFE2:
 227              		.align	1
 228              		.global	ReadColumn
 229              		.syntax unified
 230              		.code	16
 231              		.thumb_func
 232              		.fpu softvfp
 234              	ReadColumn:
 235              	.LFB3:
  44:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 
  45:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** int ReadColumn(void) {
 236              		.loc 1 45 22
 237              		.cfi_startproc
 238              		@ args = 0, pretend = 0, frame = 8
 239              		@ frame_needed = 1, uses_anonymous_args = 0
 240 00b0 80B5     		push	{r7, lr}
 241              		.cfi_def_cfa_offset 8
 242              		.cfi_offset 7, -8
 243              		.cfi_offset 14, -4
 244 00b2 82B0     		sub	sp, sp, #8
 245              		.cfi_def_cfa_offset 16
 246 00b4 00AF     		add	r7, sp, #0
 247              		.cfi_def_cfa_register 7
  46:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	unsigned char c;
  47:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	c = *GPIO_IDR_HIGH;
 248              		.loc 1 47 6
 249 00b6 124A     		ldr	r2, .L22
 250              		.loc 1 47 4
 251 00b8 FB1D     		adds	r3, r7, #7
 252 00ba 1278     		ldrb	r2, [r2]
 253 00bc 1A70     		strb	r2, [r3]
  48:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	if (c & 0x8) return 4;
 254              		.loc 1 48 8
 255 00be FB1D     		adds	r3, r7, #7
 256 00c0 1B78     		ldrb	r3, [r3]
 257 00c2 0822     		movs	r2, #8
 258 00c4 1340     		ands	r3, r2
 259              		.loc 1 48 5
 260 00c6 01D0     		beq	.L17
 261              		.loc 1 48 22 discriminator 1
 262 00c8 0423     		movs	r3, #4
 263 00ca 15E0     		b	.L18
 264              	.L17:
  49:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	if (c & 0x4) return 3;
 265              		.loc 1 49 8
 266 00cc FB1D     		adds	r3, r7, #7
 267 00ce 1B78     		ldrb	r3, [r3]
 268 00d0 0422     		movs	r2, #4
 269 00d2 1340     		ands	r3, r2
 270              		.loc 1 49 5
 271 00d4 01D0     		beq	.L19
 272              		.loc 1 49 22 discriminator 1
 273 00d6 0323     		movs	r3, #3
 274 00d8 0EE0     		b	.L18
 275              	.L19:
  50:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	if (c & 0x2) return 2;
 276              		.loc 1 50 8
 277 00da FB1D     		adds	r3, r7, #7
 278 00dc 1B78     		ldrb	r3, [r3]
 279 00de 0222     		movs	r2, #2
 280 00e0 1340     		ands	r3, r2
 281              		.loc 1 50 5
 282 00e2 01D0     		beq	.L20
 283              		.loc 1 50 22 discriminator 1
 284 00e4 0223     		movs	r3, #2
 285 00e6 07E0     		b	.L18
 286              	.L20:
  51:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	if (c & 0x1) return 1;
 287              		.loc 1 51 8
 288 00e8 FB1D     		adds	r3, r7, #7
 289 00ea 1B78     		ldrb	r3, [r3]
 290 00ec 0122     		movs	r2, #1
 291 00ee 1340     		ands	r3, r2
 292              		.loc 1 51 5
 293 00f0 01D0     		beq	.L21
 294              		.loc 1 51 22 discriminator 1
 295 00f2 0123     		movs	r3, #1
 296 00f4 00E0     		b	.L18
 297              	.L21:
  52:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	return 0;
 298              		.loc 1 52 9
 299 00f6 0023     		movs	r3, #0
 300              	.L18:
  53:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** }
 301              		.loc 1 53 1
 302 00f8 1800     		movs	r0, r3
 303 00fa BD46     		mov	sp, r7
 304 00fc 02B0     		add	sp, sp, #8
 305              		@ sp needed
 306 00fe 80BD     		pop	{r7, pc}
 307              	.L23:
 308              		.align	2
 309              	.L22:
 310 0100 110C0240 		.word	1073875985
 311              		.cfi_endproc
 312              	.LFE3:
 314              		.section	.rodata
 315              		.align	2
 316              	.LC1:
 317 0014 0102030A 		.ascii	"\001\002\003\012\004\005\006\013\007\010\011\014\016"
 317      0405060B 
 317      0708090C 
 317      0E
 318 0021 000F0D   		.ascii	"\000\017\015"
 319              		.text
 320              		.align	1
 321              		.global	keyb
 322              		.syntax unified
 323              		.code	16
 324              		.thumb_func
 325              		.fpu softvfp
 327              	keyb:
 328              	.LFB4:
  54:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 
  55:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** unsigned char keyb(void) {
 329              		.loc 1 55 26
 330              		.cfi_startproc
 331              		@ args = 0, pretend = 0, frame = 24
 332              		@ frame_needed = 1, uses_anonymous_args = 0
 333 0104 90B5     		push	{r4, r7, lr}
 334              		.cfi_def_cfa_offset 12
 335              		.cfi_offset 4, -12
 336              		.cfi_offset 7, -8
 337              		.cfi_offset 14, -4
 338 0106 87B0     		sub	sp, sp, #28
 339              		.cfi_def_cfa_offset 40
 340 0108 00AF     		add	r7, sp, #0
 341              		.cfi_def_cfa_register 7
  56:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	unsigned char key[]={1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE,0,0xF,0xD};
 342              		.loc 1 56 16
 343 010a 3B00     		movs	r3, r7
 344 010c 164A     		ldr	r2, .L30
 345 010e 13CA     		ldmia	r2!, {r0, r1, r4}
 346 0110 13C3     		stmia	r3!, {r0, r1, r4}
 347 0112 1268     		ldr	r2, [r2]
 348 0114 1A60     		str	r2, [r3]
  57:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	int row, col;
  58:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	for (row=1; row <=4 ; row++) {
 349              		.loc 1 58 10
 350 0116 0123     		movs	r3, #1
 351 0118 7B61     		str	r3, [r7, #20]
 352              		.loc 1 58 2
 353 011a 19E0     		b	.L25
 354              	.L28:
  59:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		ActivateRow(row);
 355              		.loc 1 59 3
 356 011c 7B69     		ldr	r3, [r7, #20]
 357 011e 1800     		movs	r0, r3
 358 0120 FFF7FEFF 		bl	ActivateRow
  60:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		if( col = ReadColumn() ){
 359              		.loc 1 60 13
 360 0124 FFF7FEFF 		bl	ReadColumn
 361 0128 0300     		movs	r3, r0
 362 012a 3B61     		str	r3, [r7, #16]
 363              		.loc 1 60 5
 364 012c 3B69     		ldr	r3, [r7, #16]
 365 012e 002B     		cmp	r3, #0
 366 0130 0BD0     		beq	.L26
  61:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 			ActivateRow(0);
 367              		.loc 1 61 4
 368 0132 0020     		movs	r0, #0
 369 0134 FFF7FEFF 		bl	ActivateRow
  62:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 			return key[4*(row-1)+(col-1)];
 370              		.loc 1 62 21
 371 0138 7B69     		ldr	r3, [r7, #20]
 372 013a 013B     		subs	r3, r3, #1
 373              		.loc 1 62 16
 374 013c 9A00     		lsls	r2, r3, #2
 375              		.loc 1 62 29
 376 013e 3B69     		ldr	r3, [r7, #16]
 377 0140 013B     		subs	r3, r3, #1
 378              		.loc 1 62 24
 379 0142 D318     		adds	r3, r2, r3
 380              		.loc 1 62 14
 381 0144 3A00     		movs	r2, r7
 382 0146 D35C     		ldrb	r3, [r2, r3]
 383 0148 09E0     		b	.L29
 384              	.L26:
  58:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		ActivateRow(row);
 385              		.loc 1 58 27 discriminator 2
 386 014a 7B69     		ldr	r3, [r7, #20]
 387 014c 0133     		adds	r3, r3, #1
 388 014e 7B61     		str	r3, [r7, #20]
 389              	.L25:
  58:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		ActivateRow(row);
 390              		.loc 1 58 2 discriminator 1
 391 0150 7B69     		ldr	r3, [r7, #20]
 392 0152 042B     		cmp	r3, #4
 393 0154 E2DD     		ble	.L28
  63:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		}
  64:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	}
  65:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	ActivateRow(0);
 394              		.loc 1 65 2
 395 0156 0020     		movs	r0, #0
 396 0158 FFF7FEFF 		bl	ActivateRow
  66:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	return 0xFF;
 397              		.loc 1 66 9
 398 015c FF23     		movs	r3, #255
 399              	.L29:
  67:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** }
 400              		.loc 1 67 1 discriminator 1
 401 015e 1800     		movs	r0, r3
 402 0160 BD46     		mov	sp, r7
 403 0162 07B0     		add	sp, sp, #28
 404              		@ sp needed
 405 0164 90BD     		pop	{r4, r7, pc}
 406              	.L31:
 407 0166 C046     		.align	2
 408              	.L30:
 409 0168 14000000 		.word	.LC1
 410              		.cfi_endproc
 411              	.LFE4:
 413              		.section	.rodata
 414              		.align	2
 415              	.LC3:
 416 0024 3F065B4F 		.ascii	"?\006[Ofm}\007\177ow|\017^yq"
 416      666D7D07 
 416      7F6F777C 
 416      0F5E7971 
 417              		.text
 418              		.align	1
 419              		.global	out7seg
 420              		.syntax unified
 421              		.code	16
 422              		.thumb_func
 423              		.fpu softvfp
 425              	out7seg:
 426              	.LFB5:
  68:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 
  69:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** void out7seg(unsigned char c) {
 427              		.loc 1 69 31
 428              		.cfi_startproc
 429              		@ args = 0, pretend = 0, frame = 24
 430              		@ frame_needed = 1, uses_anonymous_args = 0
 431 016c B0B5     		push	{r4, r5, r7, lr}
 432              		.cfi_def_cfa_offset 16
 433              		.cfi_offset 4, -16
 434              		.cfi_offset 5, -12
 435              		.cfi_offset 7, -8
 436              		.cfi_offset 14, -4
 437 016e 86B0     		sub	sp, sp, #24
 438              		.cfi_def_cfa_offset 40
 439 0170 00AF     		add	r7, sp, #0
 440              		.cfi_def_cfa_register 7
 441 0172 0200     		movs	r2, r0
 442 0174 FB1D     		adds	r3, r7, #7
 443 0176 1A70     		strb	r2, [r3]
  70:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	char segCode[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x0F, 0x
 444              		.loc 1 70 7
 445 0178 0820     		movs	r0, #8
 446 017a 3B18     		adds	r3, r7, r0
 447 017c 0B4A     		ldr	r2, .L36
 448 017e 32CA     		ldmia	r2!, {r1, r4, r5}
 449 0180 32C3     		stmia	r3!, {r1, r4, r5}
 450 0182 1268     		ldr	r2, [r2]
 451 0184 1A60     		str	r2, [r3]
  71:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	if (c <= 15) {
 452              		.loc 1 71 5
 453 0186 FB1D     		adds	r3, r7, #7
 454 0188 1B78     		ldrb	r3, [r3]
 455 018a 0F2B     		cmp	r3, #15
 456 018c 06D8     		bhi	.L33
  72:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		*GPIO_ODR_LOW = segCode[c];
 457              		.loc 1 72 26
 458 018e FB1D     		adds	r3, r7, #7
 459 0190 1B78     		ldrb	r3, [r3]
 460              		.loc 1 72 3
 461 0192 0749     		ldr	r1, .L36+4
 462              		.loc 1 72 26
 463 0194 3A18     		adds	r2, r7, r0
 464 0196 D35C     		ldrb	r3, [r2, r3]
 465              		.loc 1 72 17
 466 0198 0B70     		strb	r3, [r1]
  73:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	} else {
  74:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		*GPIO_ODR_LOW = 0;
  75:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	}
  76:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** }
 467              		.loc 1 76 1
 468 019a 02E0     		b	.L35
 469              	.L33:
  74:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	}
 470              		.loc 1 74 3
 471 019c 044B     		ldr	r3, .L36+4
  74:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	}
 472              		.loc 1 74 17
 473 019e 0022     		movs	r2, #0
 474 01a0 1A70     		strb	r2, [r3]
 475              	.L35:
 476              		.loc 1 76 1
 477 01a2 C046     		nop
 478 01a4 BD46     		mov	sp, r7
 479 01a6 06B0     		add	sp, sp, #24
 480              		@ sp needed
 481 01a8 B0BD     		pop	{r4, r5, r7, pc}
 482              	.L37:
 483 01aa C046     		.align	2
 484              	.L36:
 485 01ac 24000000 		.word	.LC3
 486 01b0 140C0240 		.word	1073875988
 487              		.cfi_endproc
 488              	.LFE5:
 490              		.align	1
 491              		.global	main
 492              		.syntax unified
 493              		.code	16
 494              		.thumb_func
 495              		.fpu softvfp
 497              	main:
 498              	.LFB6:
  77:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 
  78:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** void main(void) {
 499              		.loc 1 78 17
 500              		.cfi_startproc
 501              		@ args = 0, pretend = 0, frame = 0
 502              		@ frame_needed = 1, uses_anonymous_args = 0
 503 01b4 80B5     		push	{r7, lr}
 504              		.cfi_def_cfa_offset 8
 505              		.cfi_offset 7, -8
 506              		.cfi_offset 14, -4
 507 01b6 00AF     		add	r7, sp, #0
 508              		.cfi_def_cfa_register 7
  79:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	app_init();
 509              		.loc 1 79 2
 510 01b8 FFF7FEFF 		bl	app_init
 511              	.L39:
  80:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	while(1) {
  81:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		out7seg(keyb());
 512              		.loc 1 81 3 discriminator 1
 513 01bc FFF7FEFF 		bl	keyb
 514 01c0 0300     		movs	r3, r0
 515 01c2 1800     		movs	r0, r3
 516 01c4 FFF7FEFF 		bl	out7seg
 517 01c8 F8E7     		b	.L39
 518              		.cfi_endproc
 519              	.LFE6:
 521              	.Letext0:
