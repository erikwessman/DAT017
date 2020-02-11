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
  27:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	*GPIO_MODER &= 0x0000FFFF;
  79              		.loc 1 27 14
  80 0004 114B     		ldr	r3, .L3
  81 0006 1A68     		ldr	r2, [r3]
  82 0008 104B     		ldr	r3, .L3
  83 000a 1204     		lsls	r2, r2, #16
  84 000c 120C     		lsrs	r2, r2, #16
  85 000e 1A60     		str	r2, [r3]
  28:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	*GPIO_OTYPER &= 0xFFFF00FF;
  86              		.loc 1 28 15
  87 0010 0F4B     		ldr	r3, .L3+4
  88 0012 1B88     		ldrh	r3, [r3]
  89 0014 9BB2     		uxth	r3, r3
  90 0016 0E4A     		ldr	r2, .L3+4
  91 0018 FF21     		movs	r1, #255
  92 001a 0B40     		ands	r3, r1
  93 001c 9BB2     		uxth	r3, r3
  94 001e 1380     		strh	r3, [r2]
  29:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	*GPIO_PUPDR &= 0x0000FFFF;
  95              		.loc 1 29 14
  96 0020 0C4B     		ldr	r3, .L3+8
  97 0022 1A68     		ldr	r2, [r3]
  98 0024 0B4B     		ldr	r3, .L3+8
  99 0026 1204     		lsls	r2, r2, #16
 100 0028 120C     		lsrs	r2, r2, #16
 101 002a 1A60     		str	r2, [r3]
  30:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	
  31:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	*GPIO_MODER |= 0x55005555;
 102              		.loc 1 31 14
 103 002c 074B     		ldr	r3, .L3
 104 002e 1A68     		ldr	r2, [r3]
 105 0030 064B     		ldr	r3, .L3
 106 0032 0949     		ldr	r1, .L3+12
 107 0034 0A43     		orrs	r2, r1
 108 0036 1A60     		str	r2, [r3]
  32:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	*GPIO_PUPDR |= 0xAA000000;
 109              		.loc 1 32 14
 110 0038 064B     		ldr	r3, .L3+8
 111 003a 1A68     		ldr	r2, [r3]
 112 003c 054B     		ldr	r3, .L3+8
 113 003e AA21     		movs	r1, #170
 114 0040 0906     		lsls	r1, r1, #24
 115 0042 0A43     		orrs	r2, r1
 116 0044 1A60     		str	r2, [r3]
  33:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** }
 117              		.loc 1 33 1
 118 0046 C046     		nop
 119 0048 BD46     		mov	sp, r7
 120              		@ sp needed
 121 004a 80BD     		pop	{r7, pc}
 122              	.L4:
 123              		.align	2
 124              	.L3:
 125 004c 000C0240 		.word	1073875968
 126 0050 040C0240 		.word	1073875972
 127 0054 0C0C0240 		.word	1073875980
 128 0058 55550055 		.word	1426085205
 129              		.cfi_endproc
 130              	.LFE1:
 132              		.align	1
 133              		.global	ActivateRow
 134              		.syntax unified
 135              		.code	16
 136              		.thumb_func
 137              		.fpu softvfp
 139              	ActivateRow:
 140              	.LFB2:
  34:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 
  35:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** void ActivateRow(unsigned int row) {
 141              		.loc 1 35 36
 142              		.cfi_startproc
 143              		@ args = 0, pretend = 0, frame = 8
 144              		@ frame_needed = 1, uses_anonymous_args = 0
 145 005c 80B5     		push	{r7, lr}
 146              		.cfi_def_cfa_offset 8
 147              		.cfi_offset 7, -8
 148              		.cfi_offset 14, -4
 149 005e 82B0     		sub	sp, sp, #8
 150              		.cfi_def_cfa_offset 16
 151 0060 00AF     		add	r7, sp, #0
 152              		.cfi_def_cfa_register 7
 153 0062 7860     		str	r0, [r7, #4]
 154 0064 7B68     		ldr	r3, [r7, #4]
 155 0066 042B     		cmp	r3, #4
 156 0068 19D8     		bhi	.L13
 157 006a 7B68     		ldr	r3, [r7, #4]
 158 006c 9A00     		lsls	r2, r3, #2
 159 006e 0E4B     		ldr	r3, .L14
 160 0070 D318     		adds	r3, r2, r3
 161 0072 1B68     		ldr	r3, [r3]
 162 0074 9F46     		mov	pc, r3
 163              		.section	.rodata
 164              		.align	2
 165              	.L8:
 166 0000 96000000 		.word	.L12
 167 0004 76000000 		.word	.L11
 168 0008 7E000000 		.word	.L10
 169 000c 86000000 		.word	.L9
 170 0010 8E000000 		.word	.L7
 171              		.text
 172              	.L11:
  36:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	switch(row) {
  37:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		case 1: *GPIO_ODR_HIGH = 0x10; break;
 173              		.loc 1 37 11
 174 0076 0D4B     		ldr	r3, .L14+4
 175              		.loc 1 37 26
 176 0078 1022     		movs	r2, #16
 177 007a 1A70     		strb	r2, [r3]
 178              		.loc 1 37 3
 179 007c 0FE0     		b	.L6
 180              	.L10:
  38:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		case 2: *GPIO_ODR_HIGH = 0x20; break;
 181              		.loc 1 38 11
 182 007e 0B4B     		ldr	r3, .L14+4
 183              		.loc 1 38 26
 184 0080 2022     		movs	r2, #32
 185 0082 1A70     		strb	r2, [r3]
 186              		.loc 1 38 3
 187 0084 0BE0     		b	.L6
 188              	.L9:
  39:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		case 3: *GPIO_ODR_HIGH = 0x40; break;
 189              		.loc 1 39 11
 190 0086 094B     		ldr	r3, .L14+4
 191              		.loc 1 39 26
 192 0088 4022     		movs	r2, #64
 193 008a 1A70     		strb	r2, [r3]
 194              		.loc 1 39 3
 195 008c 07E0     		b	.L6
 196              	.L7:
  40:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		case 4: *GPIO_ODR_HIGH = 0x80; break;
 197              		.loc 1 40 11
 198 008e 074B     		ldr	r3, .L14+4
 199              		.loc 1 40 26
 200 0090 8022     		movs	r2, #128
 201 0092 1A70     		strb	r2, [r3]
 202              		.loc 1 40 3
 203 0094 03E0     		b	.L6
 204              	.L12:
  41:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		case 0: *GPIO_ODR_HIGH = 0x00; break;
 205              		.loc 1 41 11
 206 0096 054B     		ldr	r3, .L14+4
 207              		.loc 1 41 26
 208 0098 0022     		movs	r2, #0
 209 009a 1A70     		strb	r2, [r3]
 210              		.loc 1 41 3
 211 009c C046     		nop
 212              	.L6:
 213              	.L13:
  42:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	}
  43:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** }
 214              		.loc 1 43 1
 215 009e C046     		nop
 216 00a0 BD46     		mov	sp, r7
 217 00a2 02B0     		add	sp, sp, #8
 218              		@ sp needed
 219 00a4 80BD     		pop	{r7, pc}
 220              	.L15:
 221 00a6 C046     		.align	2
 222              	.L14:
 223 00a8 00000000 		.word	.L8
 224 00ac 150C0240 		.word	1073875989
 225              		.cfi_endproc
 226              	.LFE2:
 228              		.align	1
 229              		.global	ReadColumn
 230              		.syntax unified
 231              		.code	16
 232              		.thumb_func
 233              		.fpu softvfp
 235              	ReadColumn:
 236              	.LFB3:
  44:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 
  45:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** int ReadColumn(void) {
 237              		.loc 1 45 22
 238              		.cfi_startproc
 239              		@ args = 0, pretend = 0, frame = 8
 240              		@ frame_needed = 1, uses_anonymous_args = 0
 241 00b0 80B5     		push	{r7, lr}
 242              		.cfi_def_cfa_offset 8
 243              		.cfi_offset 7, -8
 244              		.cfi_offset 14, -4
 245 00b2 82B0     		sub	sp, sp, #8
 246              		.cfi_def_cfa_offset 16
 247 00b4 00AF     		add	r7, sp, #0
 248              		.cfi_def_cfa_register 7
  46:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	unsigned char c;
  47:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	c = *GPIO_IDR_HIGH;
 249              		.loc 1 47 6
 250 00b6 124A     		ldr	r2, .L22
 251              		.loc 1 47 4
 252 00b8 FB1D     		adds	r3, r7, #7
 253 00ba 1278     		ldrb	r2, [r2]
 254 00bc 1A70     		strb	r2, [r3]
  48:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	if (c & 0x8) return 4;
 255              		.loc 1 48 8
 256 00be FB1D     		adds	r3, r7, #7
 257 00c0 1B78     		ldrb	r3, [r3]
 258 00c2 0822     		movs	r2, #8
 259 00c4 1340     		ands	r3, r2
 260              		.loc 1 48 5
 261 00c6 01D0     		beq	.L17
 262              		.loc 1 48 22 discriminator 1
 263 00c8 0423     		movs	r3, #4
 264 00ca 15E0     		b	.L18
 265              	.L17:
  49:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	if (c & 0x4) return 3;
 266              		.loc 1 49 8
 267 00cc FB1D     		adds	r3, r7, #7
 268 00ce 1B78     		ldrb	r3, [r3]
 269 00d0 0422     		movs	r2, #4
 270 00d2 1340     		ands	r3, r2
 271              		.loc 1 49 5
 272 00d4 01D0     		beq	.L19
 273              		.loc 1 49 22 discriminator 1
 274 00d6 0323     		movs	r3, #3
 275 00d8 0EE0     		b	.L18
 276              	.L19:
  50:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	if (c & 0x2) return 2;
 277              		.loc 1 50 8
 278 00da FB1D     		adds	r3, r7, #7
 279 00dc 1B78     		ldrb	r3, [r3]
 280 00de 0222     		movs	r2, #2
 281 00e0 1340     		ands	r3, r2
 282              		.loc 1 50 5
 283 00e2 01D0     		beq	.L20
 284              		.loc 1 50 22 discriminator 1
 285 00e4 0223     		movs	r3, #2
 286 00e6 07E0     		b	.L18
 287              	.L20:
  51:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	if (c & 0x1) return 1;
 288              		.loc 1 51 8
 289 00e8 FB1D     		adds	r3, r7, #7
 290 00ea 1B78     		ldrb	r3, [r3]
 291 00ec 0122     		movs	r2, #1
 292 00ee 1340     		ands	r3, r2
 293              		.loc 1 51 5
 294 00f0 01D0     		beq	.L21
 295              		.loc 1 51 22 discriminator 1
 296 00f2 0123     		movs	r3, #1
 297 00f4 00E0     		b	.L18
 298              	.L21:
  52:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	return 0;
 299              		.loc 1 52 9
 300 00f6 0023     		movs	r3, #0
 301              	.L18:
  53:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** }
 302              		.loc 1 53 1
 303 00f8 1800     		movs	r0, r3
 304 00fa BD46     		mov	sp, r7
 305 00fc 02B0     		add	sp, sp, #8
 306              		@ sp needed
 307 00fe 80BD     		pop	{r7, pc}
 308              	.L23:
 309              		.align	2
 310              	.L22:
 311 0100 110C0240 		.word	1073875985
 312              		.cfi_endproc
 313              	.LFE3:
 315              		.section	.rodata
 316              		.align	2
 317              	.LC1:
 318 0014 0102030A 		.ascii	"\001\002\003\012\004\005\006\013\007\010\011\014\016"
 318      0405060B 
 318      0708090C 
 318      0E
 319 0021 000F0D   		.ascii	"\000\017\015"
 320              		.text
 321              		.align	1
 322              		.global	keyb
 323              		.syntax unified
 324              		.code	16
 325              		.thumb_func
 326              		.fpu softvfp
 328              	keyb:
 329              	.LFB4:
  54:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 
  55:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** unsigned char keyb(void) {
 330              		.loc 1 55 26
 331              		.cfi_startproc
 332              		@ args = 0, pretend = 0, frame = 24
 333              		@ frame_needed = 1, uses_anonymous_args = 0
 334 0104 90B5     		push	{r4, r7, lr}
 335              		.cfi_def_cfa_offset 12
 336              		.cfi_offset 4, -12
 337              		.cfi_offset 7, -8
 338              		.cfi_offset 14, -4
 339 0106 87B0     		sub	sp, sp, #28
 340              		.cfi_def_cfa_offset 40
 341 0108 00AF     		add	r7, sp, #0
 342              		.cfi_def_cfa_register 7
  56:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	unsigned char key[]={1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE,0,0xF,0xD};
 343              		.loc 1 56 16
 344 010a 3B00     		movs	r3, r7
 345 010c 164A     		ldr	r2, .L30
 346 010e 13CA     		ldmia	r2!, {r0, r1, r4}
 347 0110 13C3     		stmia	r3!, {r0, r1, r4}
 348 0112 1268     		ldr	r2, [r2]
 349 0114 1A60     		str	r2, [r3]
  57:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	int row, col;
  58:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	for (row=1; row <=4 ; row++) {
 350              		.loc 1 58 10
 351 0116 0123     		movs	r3, #1
 352 0118 7B61     		str	r3, [r7, #20]
 353              		.loc 1 58 2
 354 011a 19E0     		b	.L25
 355              	.L28:
  59:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		ActivateRow(row);
 356              		.loc 1 59 3
 357 011c 7B69     		ldr	r3, [r7, #20]
 358 011e 1800     		movs	r0, r3
 359 0120 FFF7FEFF 		bl	ActivateRow
  60:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		if( col = ReadColumn() ){
 360              		.loc 1 60 13
 361 0124 FFF7FEFF 		bl	ReadColumn
 362 0128 0300     		movs	r3, r0
 363 012a 3B61     		str	r3, [r7, #16]
 364              		.loc 1 60 5
 365 012c 3B69     		ldr	r3, [r7, #16]
 366 012e 002B     		cmp	r3, #0
 367 0130 0BD0     		beq	.L26
  61:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 			ActivateRow(0);
 368              		.loc 1 61 4
 369 0132 0020     		movs	r0, #0
 370 0134 FFF7FEFF 		bl	ActivateRow
  62:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 			return key[4*(row-1)+(col-1)];
 371              		.loc 1 62 21
 372 0138 7B69     		ldr	r3, [r7, #20]
 373 013a 013B     		subs	r3, r3, #1
 374              		.loc 1 62 16
 375 013c 9A00     		lsls	r2, r3, #2
 376              		.loc 1 62 29
 377 013e 3B69     		ldr	r3, [r7, #16]
 378 0140 013B     		subs	r3, r3, #1
 379              		.loc 1 62 24
 380 0142 D318     		adds	r3, r2, r3
 381              		.loc 1 62 14
 382 0144 3A00     		movs	r2, r7
 383 0146 D35C     		ldrb	r3, [r2, r3]
 384 0148 09E0     		b	.L29
 385              	.L26:
  58:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		ActivateRow(row);
 386              		.loc 1 58 27 discriminator 2
 387 014a 7B69     		ldr	r3, [r7, #20]
 388 014c 0133     		adds	r3, r3, #1
 389 014e 7B61     		str	r3, [r7, #20]
 390              	.L25:
  58:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		ActivateRow(row);
 391              		.loc 1 58 2 discriminator 1
 392 0150 7B69     		ldr	r3, [r7, #20]
 393 0152 042B     		cmp	r3, #4
 394 0154 E2DD     		ble	.L28
  63:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		}
  64:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	}
  65:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	ActivateRow(0);
 395              		.loc 1 65 2
 396 0156 0020     		movs	r0, #0
 397 0158 FFF7FEFF 		bl	ActivateRow
  66:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	return 0xFF;
 398              		.loc 1 66 9
 399 015c FF23     		movs	r3, #255
 400              	.L29:
  67:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** }
 401              		.loc 1 67 1 discriminator 1
 402 015e 1800     		movs	r0, r3
 403 0160 BD46     		mov	sp, r7
 404 0162 07B0     		add	sp, sp, #28
 405              		@ sp needed
 406 0164 90BD     		pop	{r4, r7, pc}
 407              	.L31:
 408 0166 C046     		.align	2
 409              	.L30:
 410 0168 14000000 		.word	.LC1
 411              		.cfi_endproc
 412              	.LFE4:
 414              		.section	.rodata
 415              		.align	2
 416              	.LC3:
 417 0024 3F065B4F 		.ascii	"?\006[Ofm}\007\177ow|\017^yq"
 417      666D7D07 
 417      7F6F777C 
 417      0F5E7971 
 418              		.text
 419              		.align	1
 420              		.global	out7seg
 421              		.syntax unified
 422              		.code	16
 423              		.thumb_func
 424              		.fpu softvfp
 426              	out7seg:
 427              	.LFB5:
  68:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 
  69:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** void out7seg(unsigned char c) {
 428              		.loc 1 69 31
 429              		.cfi_startproc
 430              		@ args = 0, pretend = 0, frame = 24
 431              		@ frame_needed = 1, uses_anonymous_args = 0
 432 016c B0B5     		push	{r4, r5, r7, lr}
 433              		.cfi_def_cfa_offset 16
 434              		.cfi_offset 4, -16
 435              		.cfi_offset 5, -12
 436              		.cfi_offset 7, -8
 437              		.cfi_offset 14, -4
 438 016e 86B0     		sub	sp, sp, #24
 439              		.cfi_def_cfa_offset 40
 440 0170 00AF     		add	r7, sp, #0
 441              		.cfi_def_cfa_register 7
 442 0172 0200     		movs	r2, r0
 443 0174 FB1D     		adds	r3, r7, #7
 444 0176 1A70     		strb	r2, [r3]
  70:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	char segCode[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x0F, 0x
 445              		.loc 1 70 7
 446 0178 0820     		movs	r0, #8
 447 017a 3B18     		adds	r3, r7, r0
 448 017c 0B4A     		ldr	r2, .L36
 449 017e 32CA     		ldmia	r2!, {r1, r4, r5}
 450 0180 32C3     		stmia	r3!, {r1, r4, r5}
 451 0182 1268     		ldr	r2, [r2]
 452 0184 1A60     		str	r2, [r3]
  71:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	if (c <= 15) {
 453              		.loc 1 71 5
 454 0186 FB1D     		adds	r3, r7, #7
 455 0188 1B78     		ldrb	r3, [r3]
 456 018a 0F2B     		cmp	r3, #15
 457 018c 06D8     		bhi	.L33
  72:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		*GPIO_ODR_LOW = segCode[c];
 458              		.loc 1 72 26
 459 018e FB1D     		adds	r3, r7, #7
 460 0190 1B78     		ldrb	r3, [r3]
 461              		.loc 1 72 3
 462 0192 0749     		ldr	r1, .L36+4
 463              		.loc 1 72 26
 464 0194 3A18     		adds	r2, r7, r0
 465 0196 D35C     		ldrb	r3, [r2, r3]
 466              		.loc 1 72 17
 467 0198 0B70     		strb	r3, [r1]
  73:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	} else {
  74:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		*GPIO_ODR_LOW = 0;
  75:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	}
  76:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** }
 468              		.loc 1 76 1
 469 019a 02E0     		b	.L35
 470              	.L33:
  74:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	}
 471              		.loc 1 74 3
 472 019c 044B     		ldr	r3, .L36+4
  74:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	}
 473              		.loc 1 74 17
 474 019e 0022     		movs	r2, #0
 475 01a0 1A70     		strb	r2, [r3]
 476              	.L35:
 477              		.loc 1 76 1
 478 01a2 C046     		nop
 479 01a4 BD46     		mov	sp, r7
 480 01a6 06B0     		add	sp, sp, #24
 481              		@ sp needed
 482 01a8 B0BD     		pop	{r4, r5, r7, pc}
 483              	.L37:
 484 01aa C046     		.align	2
 485              	.L36:
 486 01ac 24000000 		.word	.LC3
 487 01b0 140C0240 		.word	1073875988
 488              		.cfi_endproc
 489              	.LFE5:
 491              		.align	1
 492              		.global	main
 493              		.syntax unified
 494              		.code	16
 495              		.thumb_func
 496              		.fpu softvfp
 498              	main:
 499              	.LFB6:
  77:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 
  78:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** void main(void) {
 500              		.loc 1 78 17
 501              		.cfi_startproc
 502              		@ args = 0, pretend = 0, frame = 0
 503              		@ frame_needed = 1, uses_anonymous_args = 0
 504 01b4 80B5     		push	{r7, lr}
 505              		.cfi_def_cfa_offset 8
 506              		.cfi_offset 7, -8
 507              		.cfi_offset 14, -4
 508 01b6 00AF     		add	r7, sp, #0
 509              		.cfi_def_cfa_register 7
  79:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	app_init();
 510              		.loc 1 79 2
 511 01b8 FFF7FEFF 		bl	app_init
 512              	.L39:
  80:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 	while(1) {
  81:C:/Users/carls/OneDrive/Chalmers/DAT017/Laboration2/keypad\startup.c **** 		out7seg(keyb());
 513              		.loc 1 81 3 discriminator 1
 514 01bc FFF7FEFF 		bl	keyb
 515 01c0 0300     		movs	r3, r0
 516 01c2 1800     		movs	r0, r3
 517 01c4 FFF7FEFF 		bl	out7seg
 518 01c8 F8E7     		b	.L39
 519              		.cfi_endproc
 520              	.LFE6:
 522              	.Letext0:
