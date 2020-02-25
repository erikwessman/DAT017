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
  25              		.file 1 "C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22/startup.c"
   1:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** /*
   2:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c ****  * 	startup.c
   3:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c ****  *
   4:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c ****  */
   5:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** /*
   6:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c ****  * 	startup.c
   7:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c ****  *
   8:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c ****  */ 
   9:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c ****  
  10:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** #define GPIO_D 0x40020C00
  11:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** #define GPIO_MODER ((volatile unsigned int *) GPIO_D)
  12:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_D + 4))
  13:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_D + 0xC))
  14:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D + 0x10))
  15:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D + 0x11))
  16:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D + 0x14))
  17:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D + 0x15))
  18:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 
  19:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** __attribute__((naked)) __attribute__((section (".start_section")) )
  20:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** void startup ( void )
  21:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** {
  26              		.loc 1 21 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  22:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** __asm__ volatile(" LDR R0,=0x2001C000\n");		/* set stack */
  31              		.loc 1 22 0
  32              		.syntax divided
  33              	@ 22 "C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35              	
  36              	@ 0 "" 2
  23:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** __asm__ volatile(" MOV SP,R0\n");
  37              		.loc 1 23 0
  38              	@ 23 "C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22/startup.c" 1
  39 0002 8546     		 MOV SP,R0
  40              	
  41              	@ 0 "" 2
  24:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** __asm__ volatile(" BL main\n");					/* call main */
  42              		.loc 1 24 0
  43              	@ 24 "C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22/startup.c" 1
  44 0004 FFF7FEFF 		 BL main
  45              	
  46              	@ 0 "" 2
  25:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** __asm__ volatile(".L1: B .L1\n");				/* never return */
  47              		.loc 1 25 0
  48              	@ 25 "C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22/startup.c" 1
  49 0008 FEE7     		.L1: B .L1
  50              	
  51              	@ 0 "" 2
  26:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** }
  52              		.loc 1 26 0
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
  27:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 
  28:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** #define USBDM
  29:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 
  30:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** void app_init(void) {
  69              		.loc 1 30 0
  70              		.cfi_startproc
  71              		@ args = 0, pretend = 0, frame = 0
  72              		@ frame_needed = 1, uses_anonymous_args = 0
  73 0000 80B5     		push	{r7, lr}
  74              		.cfi_def_cfa_offset 8
  75              		.cfi_offset 7, -8
  76              		.cfi_offset 14, -4
  77 0002 00AF     		add	r7, sp, #0
  78              		.cfi_def_cfa_register 7
  31:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	#ifdef USBDM
  32:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 		*((unsigned long *) 0x40023830) = 0x18;
  79              		.loc 1 32 0
  80 0004 134B     		ldr	r3, .L3
  81 0006 1822     		movs	r2, #24
  82 0008 1A60     		str	r2, [r3]
  33:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	#endif
  34:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	*GPIO_MODER &= 0x00FF0000;
  83              		.loc 1 34 0
  84 000a 134B     		ldr	r3, .L3+4
  85 000c 1968     		ldr	r1, [r3]
  86 000e 124B     		ldr	r3, .L3+4
  87 0010 FF22     		movs	r2, #255
  88 0012 1204     		lsls	r2, r2, #16
  89 0014 0A40     		ands	r2, r1
  90 0016 1A60     		str	r2, [r3]
  35:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	*GPIO_OTYPER &= 0xFFFF00FF;
  91              		.loc 1 35 0
  92 0018 104B     		ldr	r3, .L3+8
  93 001a 1B88     		ldrh	r3, [r3]
  94 001c 9BB2     		uxth	r3, r3
  95 001e 0F4A     		ldr	r2, .L3+8
  96 0020 FF21     		movs	r1, #255
  97 0022 0B40     		ands	r3, r1
  98 0024 9BB2     		uxth	r3, r3
  99 0026 1380     		strh	r3, [r2]
  36:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	*GPIO_PUPDR &= 0x0000FFFF;
 100              		.loc 1 36 0
 101 0028 0D4B     		ldr	r3, .L3+12
 102 002a 1A68     		ldr	r2, [r3]
 103 002c 0C4B     		ldr	r3, .L3+12
 104 002e 1204     		lsls	r2, r2, #16
 105 0030 120C     		lsrs	r2, r2, #16
 106 0032 1A60     		str	r2, [r3]
  37:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	
  38:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	*GPIO_MODER |= 0x55005555;
 107              		.loc 1 38 0
 108 0034 084B     		ldr	r3, .L3+4
 109 0036 1A68     		ldr	r2, [r3]
 110 0038 074B     		ldr	r3, .L3+4
 111 003a 0A49     		ldr	r1, .L3+16
 112 003c 0A43     		orrs	r2, r1
 113 003e 1A60     		str	r2, [r3]
  39:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	*GPIO_PUPDR |= 0xAA000000;
 114              		.loc 1 39 0
 115 0040 074B     		ldr	r3, .L3+12
 116 0042 1A68     		ldr	r2, [r3]
 117 0044 064B     		ldr	r3, .L3+12
 118 0046 AA21     		movs	r1, #170
 119 0048 0906     		lsls	r1, r1, #24
 120 004a 0A43     		orrs	r2, r1
 121 004c 1A60     		str	r2, [r3]
  40:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** }
 122              		.loc 1 40 0
 123 004e C046     		nop
 124 0050 BD46     		mov	sp, r7
 125              		@ sp needed
 126 0052 80BD     		pop	{r7, pc}
 127              	.L4:
 128              		.align	2
 129              	.L3:
 130 0054 30380240 		.word	1073887280
 131 0058 000C0240 		.word	1073875968
 132 005c 040C0240 		.word	1073875972
 133 0060 0C0C0240 		.word	1073875980
 134 0064 55550055 		.word	1426085205
 135              		.cfi_endproc
 136              	.LFE1:
 138              		.align	1
 139              		.global	ActivateRow
 140              		.syntax unified
 141              		.code	16
 142              		.thumb_func
 143              		.fpu softvfp
 145              	ActivateRow:
 146              	.LFB2:
  41:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 
  42:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** void ActivateRow(unsigned int row) {
 147              		.loc 1 42 0
 148              		.cfi_startproc
 149              		@ args = 0, pretend = 0, frame = 8
 150              		@ frame_needed = 1, uses_anonymous_args = 0
 151 0068 80B5     		push	{r7, lr}
 152              		.cfi_def_cfa_offset 8
 153              		.cfi_offset 7, -8
 154              		.cfi_offset 14, -4
 155 006a 82B0     		sub	sp, sp, #8
 156              		.cfi_def_cfa_offset 16
 157 006c 00AF     		add	r7, sp, #0
 158              		.cfi_def_cfa_register 7
 159 006e 7860     		str	r0, [r7, #4]
  43:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	switch(row) {
 160              		.loc 1 43 0
 161 0070 7B68     		ldr	r3, [r7, #4]
 162 0072 042B     		cmp	r3, #4
 163 0074 19D8     		bhi	.L13
 164 0076 7B68     		ldr	r3, [r7, #4]
 165 0078 9A00     		lsls	r2, r3, #2
 166 007a 0E4B     		ldr	r3, .L14
 167 007c D318     		adds	r3, r2, r3
 168 007e 1B68     		ldr	r3, [r3]
 169 0080 9F46     		mov	pc, r3
 170              		.section	.rodata
 171              		.align	2
 172              	.L8:
 173 0000 A2000000 		.word	.L7
 174 0004 82000000 		.word	.L9
 175 0008 8A000000 		.word	.L10
 176 000c 92000000 		.word	.L11
 177 0010 9A000000 		.word	.L12
 178              		.text
 179              	.L9:
  44:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 		case 1: *GPIO_ODR_HIGH = 0x10; break;
 180              		.loc 1 44 0
 181 0082 0D4B     		ldr	r3, .L14+4
 182 0084 1022     		movs	r2, #16
 183 0086 1A70     		strb	r2, [r3]
 184 0088 0FE0     		b	.L6
 185              	.L10:
  45:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 		case 2: *GPIO_ODR_HIGH = 0x20; break;
 186              		.loc 1 45 0
 187 008a 0B4B     		ldr	r3, .L14+4
 188 008c 2022     		movs	r2, #32
 189 008e 1A70     		strb	r2, [r3]
 190 0090 0BE0     		b	.L6
 191              	.L11:
  46:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 		case 3: *GPIO_ODR_HIGH = 0x40; break;
 192              		.loc 1 46 0
 193 0092 094B     		ldr	r3, .L14+4
 194 0094 4022     		movs	r2, #64
 195 0096 1A70     		strb	r2, [r3]
 196 0098 07E0     		b	.L6
 197              	.L12:
  47:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 		case 4: *GPIO_ODR_HIGH = 0x80; break;
 198              		.loc 1 47 0
 199 009a 074B     		ldr	r3, .L14+4
 200 009c 8022     		movs	r2, #128
 201 009e 1A70     		strb	r2, [r3]
 202 00a0 03E0     		b	.L6
 203              	.L7:
  48:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 		case 0: *GPIO_ODR_HIGH = 0x00; break;
 204              		.loc 1 48 0
 205 00a2 054B     		ldr	r3, .L14+4
 206 00a4 0022     		movs	r2, #0
 207 00a6 1A70     		strb	r2, [r3]
 208 00a8 C046     		nop
 209              	.L6:
 210              	.L13:
  49:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	}
  50:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** }
 211              		.loc 1 50 0
 212 00aa C046     		nop
 213 00ac BD46     		mov	sp, r7
 214 00ae 02B0     		add	sp, sp, #8
 215              		@ sp needed
 216 00b0 80BD     		pop	{r7, pc}
 217              	.L15:
 218 00b2 C046     		.align	2
 219              	.L14:
 220 00b4 00000000 		.word	.L8
 221 00b8 150C0240 		.word	1073875989
 222              		.cfi_endproc
 223              	.LFE2:
 225              		.align	1
 226              		.global	ReadColumn
 227              		.syntax unified
 228              		.code	16
 229              		.thumb_func
 230              		.fpu softvfp
 232              	ReadColumn:
 233              	.LFB3:
  51:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 
  52:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** int ReadColumn(void) {
 234              		.loc 1 52 0
 235              		.cfi_startproc
 236              		@ args = 0, pretend = 0, frame = 8
 237              		@ frame_needed = 1, uses_anonymous_args = 0
 238 00bc 80B5     		push	{r7, lr}
 239              		.cfi_def_cfa_offset 8
 240              		.cfi_offset 7, -8
 241              		.cfi_offset 14, -4
 242 00be 82B0     		sub	sp, sp, #8
 243              		.cfi_def_cfa_offset 16
 244 00c0 00AF     		add	r7, sp, #0
 245              		.cfi_def_cfa_register 7
  53:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	unsigned char c;
  54:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	c = *GPIO_IDR_HIGH;
 246              		.loc 1 54 0
 247 00c2 124A     		ldr	r2, .L22
 248 00c4 FB1D     		adds	r3, r7, #7
 249 00c6 1278     		ldrb	r2, [r2]
 250 00c8 1A70     		strb	r2, [r3]
  55:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	if (c & 0x8) return 4;
 251              		.loc 1 55 0
 252 00ca FB1D     		adds	r3, r7, #7
 253 00cc 1B78     		ldrb	r3, [r3]
 254 00ce 0822     		movs	r2, #8
 255 00d0 1340     		ands	r3, r2
 256 00d2 01D0     		beq	.L17
 257              		.loc 1 55 0 is_stmt 0 discriminator 1
 258 00d4 0423     		movs	r3, #4
 259 00d6 15E0     		b	.L18
 260              	.L17:
  56:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	if (c & 0x4) return 3;
 261              		.loc 1 56 0 is_stmt 1
 262 00d8 FB1D     		adds	r3, r7, #7
 263 00da 1B78     		ldrb	r3, [r3]
 264 00dc 0422     		movs	r2, #4
 265 00de 1340     		ands	r3, r2
 266 00e0 01D0     		beq	.L19
 267              		.loc 1 56 0 is_stmt 0 discriminator 1
 268 00e2 0323     		movs	r3, #3
 269 00e4 0EE0     		b	.L18
 270              	.L19:
  57:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	if (c & 0x2) return 2;
 271              		.loc 1 57 0 is_stmt 1
 272 00e6 FB1D     		adds	r3, r7, #7
 273 00e8 1B78     		ldrb	r3, [r3]
 274 00ea 0222     		movs	r2, #2
 275 00ec 1340     		ands	r3, r2
 276 00ee 01D0     		beq	.L20
 277              		.loc 1 57 0 is_stmt 0 discriminator 1
 278 00f0 0223     		movs	r3, #2
 279 00f2 07E0     		b	.L18
 280              	.L20:
  58:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	if (c & 0x1) return 1;
 281              		.loc 1 58 0 is_stmt 1
 282 00f4 FB1D     		adds	r3, r7, #7
 283 00f6 1B78     		ldrb	r3, [r3]
 284 00f8 0122     		movs	r2, #1
 285 00fa 1340     		ands	r3, r2
 286 00fc 01D0     		beq	.L21
 287              		.loc 1 58 0 is_stmt 0 discriminator 1
 288 00fe 0123     		movs	r3, #1
 289 0100 00E0     		b	.L18
 290              	.L21:
  59:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	return 0;
 291              		.loc 1 59 0 is_stmt 1
 292 0102 0023     		movs	r3, #0
 293              	.L18:
  60:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** }
 294              		.loc 1 60 0
 295 0104 1800     		movs	r0, r3
 296 0106 BD46     		mov	sp, r7
 297 0108 02B0     		add	sp, sp, #8
 298              		@ sp needed
 299 010a 80BD     		pop	{r7, pc}
 300              	.L23:
 301              		.align	2
 302              	.L22:
 303 010c 110C0240 		.word	1073875985
 304              		.cfi_endproc
 305              	.LFE3:
 307              		.section	.rodata
 308              		.align	2
 309              	.LC0:
 310 0014 01       		.byte	1
 311 0015 02       		.byte	2
 312 0016 03       		.byte	3
 313 0017 0A       		.byte	10
 314 0018 04       		.byte	4
 315 0019 05       		.byte	5
 316 001a 06       		.byte	6
 317 001b 0B       		.byte	11
 318 001c 07       		.byte	7
 319 001d 08       		.byte	8
 320 001e 09       		.byte	9
 321 001f 0C       		.byte	12
 322 0020 0E       		.byte	14
 323 0021 00       		.byte	0
 324 0022 0F       		.byte	15
 325 0023 0D       		.byte	13
 326              		.text
 327              		.align	1
 328              		.global	keyb
 329              		.syntax unified
 330              		.code	16
 331              		.thumb_func
 332              		.fpu softvfp
 334              	keyb:
 335              	.LFB4:
  61:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 
  62:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** unsigned char keyb(void) {
 336              		.loc 1 62 0
 337              		.cfi_startproc
 338              		@ args = 0, pretend = 0, frame = 24
 339              		@ frame_needed = 1, uses_anonymous_args = 0
 340 0110 90B5     		push	{r4, r7, lr}
 341              		.cfi_def_cfa_offset 12
 342              		.cfi_offset 4, -12
 343              		.cfi_offset 7, -8
 344              		.cfi_offset 14, -4
 345 0112 87B0     		sub	sp, sp, #28
 346              		.cfi_def_cfa_offset 40
 347 0114 00AF     		add	r7, sp, #0
 348              		.cfi_def_cfa_register 7
  63:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	unsigned char key[]={1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE,0,0xF,0xD};
 349              		.loc 1 63 0
 350 0116 3B00     		movs	r3, r7
 351 0118 164A     		ldr	r2, .L30
 352 011a 13CA     		ldmia	r2!, {r0, r1, r4}
 353 011c 13C3     		stmia	r3!, {r0, r1, r4}
 354 011e 1268     		ldr	r2, [r2]
 355 0120 1A60     		str	r2, [r3]
  64:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	int row, col;
  65:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	for (row=1; row <=4 ; row++) {
 356              		.loc 1 65 0
 357 0122 0123     		movs	r3, #1
 358 0124 7B61     		str	r3, [r7, #20]
 359 0126 19E0     		b	.L25
 360              	.L28:
  66:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 		ActivateRow(row);
 361              		.loc 1 66 0
 362 0128 7B69     		ldr	r3, [r7, #20]
 363 012a 1800     		movs	r0, r3
 364 012c FFF7FEFF 		bl	ActivateRow
  67:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 		if( col = ReadColumn() ){
 365              		.loc 1 67 0
 366 0130 FFF7FEFF 		bl	ReadColumn
 367 0134 0300     		movs	r3, r0
 368 0136 3B61     		str	r3, [r7, #16]
 369 0138 3B69     		ldr	r3, [r7, #16]
 370 013a 002B     		cmp	r3, #0
 371 013c 0BD0     		beq	.L26
  68:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 			ActivateRow(0);
 372              		.loc 1 68 0
 373 013e 0020     		movs	r0, #0
 374 0140 FFF7FEFF 		bl	ActivateRow
  69:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 			return key[4*(row-1)+(col-1)];
 375              		.loc 1 69 0
 376 0144 7B69     		ldr	r3, [r7, #20]
 377 0146 013B     		subs	r3, r3, #1
 378 0148 9A00     		lsls	r2, r3, #2
 379 014a 3B69     		ldr	r3, [r7, #16]
 380 014c 013B     		subs	r3, r3, #1
 381 014e D318     		adds	r3, r2, r3
 382 0150 3A00     		movs	r2, r7
 383 0152 D35C     		ldrb	r3, [r2, r3]
 384 0154 09E0     		b	.L29
 385              	.L26:
  65:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 		ActivateRow(row);
 386              		.loc 1 65 0 discriminator 2
 387 0156 7B69     		ldr	r3, [r7, #20]
 388 0158 0133     		adds	r3, r3, #1
 389 015a 7B61     		str	r3, [r7, #20]
 390              	.L25:
  65:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 		ActivateRow(row);
 391              		.loc 1 65 0 is_stmt 0 discriminator 1
 392 015c 7B69     		ldr	r3, [r7, #20]
 393 015e 042B     		cmp	r3, #4
 394 0160 E2DD     		ble	.L28
  70:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 		}
  71:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	}
  72:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	ActivateRow(0);
 395              		.loc 1 72 0 is_stmt 1
 396 0162 0020     		movs	r0, #0
 397 0164 FFF7FEFF 		bl	ActivateRow
  73:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	return 0xFF;
 398              		.loc 1 73 0
 399 0168 FF23     		movs	r3, #255
 400              	.L29:
  74:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** }
 401              		.loc 1 74 0 discriminator 1
 402 016a 1800     		movs	r0, r3
 403 016c BD46     		mov	sp, r7
 404 016e 07B0     		add	sp, sp, #28
 405              		@ sp needed
 406 0170 90BD     		pop	{r4, r7, pc}
 407              	.L31:
 408 0172 C046     		.align	2
 409              	.L30:
 410 0174 14000000 		.word	.LC0
 411              		.cfi_endproc
 412              	.LFE4:
 414              		.section	.rodata
 415              		.align	2
 416              	.LC1:
 417 0024 3F       		.byte	63
 418 0025 06       		.byte	6
 419 0026 5B       		.byte	91
 420 0027 4F       		.byte	79
 421 0028 66       		.byte	102
 422 0029 6D       		.byte	109
 423 002a 7D       		.byte	125
 424 002b 07       		.byte	7
 425 002c 7F       		.byte	127
 426 002d 6F       		.byte	111
 427 002e 77       		.byte	119
 428 002f 7C       		.byte	124
 429 0030 0F       		.byte	15
 430 0031 5E       		.byte	94
 431 0032 79       		.byte	121
 432 0033 71       		.byte	113
 433              		.text
 434              		.align	1
 435              		.global	out7seg
 436              		.syntax unified
 437              		.code	16
 438              		.thumb_func
 439              		.fpu softvfp
 441              	out7seg:
 442              	.LFB5:
  75:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 
  76:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** void out7seg(unsigned char c) {
 443              		.loc 1 76 0
 444              		.cfi_startproc
 445              		@ args = 0, pretend = 0, frame = 24
 446              		@ frame_needed = 1, uses_anonymous_args = 0
 447 0178 90B5     		push	{r4, r7, lr}
 448              		.cfi_def_cfa_offset 12
 449              		.cfi_offset 4, -12
 450              		.cfi_offset 7, -8
 451              		.cfi_offset 14, -4
 452 017a 87B0     		sub	sp, sp, #28
 453              		.cfi_def_cfa_offset 40
 454 017c 00AF     		add	r7, sp, #0
 455              		.cfi_def_cfa_register 7
 456 017e 0200     		movs	r2, r0
 457 0180 FB1D     		adds	r3, r7, #7
 458 0182 1A70     		strb	r2, [r3]
  77:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	char segCode[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x0F, 0x
 459              		.loc 1 77 0
 460 0184 0823     		movs	r3, #8
 461 0186 FB18     		adds	r3, r7, r3
 462 0188 0B4A     		ldr	r2, .L36
 463 018a 13CA     		ldmia	r2!, {r0, r1, r4}
 464 018c 13C3     		stmia	r3!, {r0, r1, r4}
 465 018e 1268     		ldr	r2, [r2]
 466 0190 1A60     		str	r2, [r3]
  78:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	if (c <= 15) {
 467              		.loc 1 78 0
 468 0192 FB1D     		adds	r3, r7, #7
 469 0194 1B78     		ldrb	r3, [r3]
 470 0196 0F2B     		cmp	r3, #15
 471 0198 07D8     		bhi	.L33
  79:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 		*GPIO_ODR_LOW = segCode[c];
 472              		.loc 1 79 0
 473 019a FB1D     		adds	r3, r7, #7
 474 019c 1B78     		ldrb	r3, [r3]
 475 019e 0749     		ldr	r1, .L36+4
 476 01a0 0822     		movs	r2, #8
 477 01a2 BA18     		adds	r2, r7, r2
 478 01a4 D35C     		ldrb	r3, [r2, r3]
 479 01a6 0B70     		strb	r3, [r1]
  80:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	} else {
  81:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 		*GPIO_ODR_LOW = 0;
  82:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	}
  83:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** }
 480              		.loc 1 83 0
 481 01a8 02E0     		b	.L35
 482              	.L33:
  81:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	}
 483              		.loc 1 81 0
 484 01aa 044B     		ldr	r3, .L36+4
 485 01ac 0022     		movs	r2, #0
 486 01ae 1A70     		strb	r2, [r3]
 487              	.L35:
 488              		.loc 1 83 0
 489 01b0 C046     		nop
 490 01b2 BD46     		mov	sp, r7
 491 01b4 07B0     		add	sp, sp, #28
 492              		@ sp needed
 493 01b6 90BD     		pop	{r4, r7, pc}
 494              	.L37:
 495              		.align	2
 496              	.L36:
 497 01b8 24000000 		.word	.LC1
 498 01bc 140C0240 		.word	1073875988
 499              		.cfi_endproc
 500              	.LFE5:
 502              		.align	1
 503              		.global	main
 504              		.syntax unified
 505              		.code	16
 506              		.thumb_func
 507              		.fpu softvfp
 509              	main:
 510              	.LFB6:
  84:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 
  85:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** void main(void) {
 511              		.loc 1 85 0
 512              		.cfi_startproc
 513              		@ args = 0, pretend = 0, frame = 8
 514              		@ frame_needed = 1, uses_anonymous_args = 0
 515 01c0 90B5     		push	{r4, r7, lr}
 516              		.cfi_def_cfa_offset 12
 517              		.cfi_offset 4, -12
 518              		.cfi_offset 7, -8
 519              		.cfi_offset 14, -4
 520 01c2 83B0     		sub	sp, sp, #12
 521              		.cfi_def_cfa_offset 24
 522 01c4 00AF     		add	r7, sp, #0
 523              		.cfi_def_cfa_register 7
  86:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	unsigned char c;
  87:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	app_init();
 524              		.loc 1 87 0
 525 01c6 FFF7FEFF 		bl	app_init
 526              	.L39:
  88:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 	while(1) {
  89:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 		c = keyb();
 527              		.loc 1 89 0 discriminator 1
 528 01ca FC1D     		adds	r4, r7, #7
 529 01cc FFF7FEFF 		bl	keyb
 530 01d0 0300     		movs	r3, r0
 531 01d2 2370     		strb	r3, [r4]
  90:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 		out7seg(c);
 532              		.loc 1 90 0 discriminator 1
 533 01d4 FB1D     		adds	r3, r7, #7
 534 01d6 1B78     		ldrb	r3, [r3]
 535 01d8 1800     		movs	r0, r3
 536 01da FFF7FEFF 		bl	out7seg
  89:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab22\startup.c **** 		out7seg(c);
 537              		.loc 1 89 0 discriminator 1
 538 01de F4E7     		b	.L39
 539              		.cfi_endproc
 540              	.LFE6:
 542              	.Letext0:
