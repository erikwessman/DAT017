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
  25              		.file 1 "C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3/startup.c"
   1:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** /*
   2:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c ****  * 	startup.c
   3:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c ****  *
   4:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c ****  */
   5:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c ****  
   6:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** #define STK_BASE 0xE000E010
   7:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** #define STK_CTRL (unsigned int *) STK_BASE
   8:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** #define STK_LOAD (unsigned int *) (STK_BASE + 4)
   9:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** #define STK_VAL (unsigned int *) (STK_BASE + 8)
  10:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c ****  
  11:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** #define GPIO_E 0x40021000
  12:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** #define GPIO_MODER ((volatile unsigned int *) GPIO_E)
  13:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E + 4))
  14:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** #define GPIO_OSPEEDR ((volatile unsigned short *) (GPIO_E + 8))
  15:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E + 0xC))
  16:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E + 0x10))
  17:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E + 0x11))
  18:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E + 0x14))
  19:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E + 0x15))
  20:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
  21:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** #define B_E	0x40
  22:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** #define B_SELECT 4
  23:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** #define B_RW 2
  24:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** #define B_RS 1
  25:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
  26:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** __attribute__((naked)) __attribute__((section (".start_section")) )
  27:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** void startup ( void )
  28:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** {
  26              		.loc 1 28 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  29:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** __asm__ volatile(" LDR R0,=0x2001C000\n");		/* set stack */
  31              		.loc 1 29 0
  32              		.syntax divided
  33              	@ 29 "C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35              	
  36              	@ 0 "" 2
  30:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** __asm__ volatile(" MOV SP,R0\n");
  37              		.loc 1 30 0
  38              	@ 30 "C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3/startup.c" 1
  39 0002 8546     		 MOV SP,R0
  40              	
  41              	@ 0 "" 2
  31:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** __asm__ volatile(" BL main\n");					/* call main */
  42              		.loc 1 31 0
  43              	@ 31 "C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3/startup.c" 1
  44 0004 FFF7FEFF 		 BL main
  45              	
  46              	@ 0 "" 2
  32:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** __asm__ volatile(".L1: B .L1\n");				/* never return */
  47              		.loc 1 32 0
  48              	@ 32 "C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3/startup.c" 1
  49 0008 FEE7     		.L1: B .L1
  50              	
  51              	@ 0 "" 2
  33:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** }
  52              		.loc 1 33 0
  53              		.thumb
  54              		.syntax unified
  55 000a C046     		nop
  56              		.cfi_endproc
  57              	.LFE0:
  59              		.text
  60              		.align	1
  61              		.global	delay_250_ns
  62              		.syntax unified
  63              		.code	16
  64              		.thumb_func
  65              		.fpu softvfp
  67              	delay_250_ns:
  68              	.LFB1:
  34:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
  35:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** #define USBDM
  36:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
  37:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
  38:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
  39:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
  40:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** void delay_250_ns(void) {
  69              		.loc 1 40 0
  70              		.cfi_startproc
  71              		@ args = 0, pretend = 0, frame = 0
  72              		@ frame_needed = 1, uses_anonymous_args = 0
  73 0000 80B5     		push	{r7, lr}
  74              		.cfi_def_cfa_offset 8
  75              		.cfi_offset 7, -8
  76              		.cfi_offset 14, -4
  77 0002 00AF     		add	r7, sp, #0
  78              		.cfi_def_cfa_register 7
  41:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	*STK_CTRL = 0;
  79              		.loc 1 41 0
  80 0004 094B     		ldr	r3, .L3
  81 0006 0022     		movs	r2, #0
  82 0008 1A60     		str	r2, [r3]
  42:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	*STK_LOAD = (168-1)/4;
  83              		.loc 1 42 0
  84 000a 094B     		ldr	r3, .L3+4
  85 000c 2922     		movs	r2, #41
  86 000e 1A60     		str	r2, [r3]
  43:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	*STK_VAL = 0;
  87              		.loc 1 43 0
  88 0010 084B     		ldr	r3, .L3+8
  89 0012 0022     		movs	r2, #0
  90 0014 1A60     		str	r2, [r3]
  44:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	*STK_CTRL = 5;
  91              		.loc 1 44 0
  92 0016 054B     		ldr	r3, .L3
  93 0018 0522     		movs	r2, #5
  94 001a 1A60     		str	r2, [r3]
  45:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	while(*STK_CTRL & 0x00010000 == 0);
  95              		.loc 1 45 0
  96 001c C046     		nop
  46:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	*STK_CTRL = 0;
  97              		.loc 1 46 0
  98 001e 034B     		ldr	r3, .L3
  99 0020 0022     		movs	r2, #0
 100 0022 1A60     		str	r2, [r3]
  47:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** }
 101              		.loc 1 47 0
 102 0024 C046     		nop
 103 0026 BD46     		mov	sp, r7
 104              		@ sp needed
 105 0028 80BD     		pop	{r7, pc}
 106              	.L4:
 107 002a C046     		.align	2
 108              	.L3:
 109 002c 10E000E0 		.word	-536813552
 110 0030 14E000E0 		.word	-536813548
 111 0034 18E000E0 		.word	-536813544
 112              		.cfi_endproc
 113              	.LFE1:
 115              		.align	1
 116              		.global	delay_micro
 117              		.syntax unified
 118              		.code	16
 119              		.thumb_func
 120              		.fpu softvfp
 122              	delay_micro:
 123              	.LFB2:
  48:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
  49:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** void delay_micro(unsigned int ms) {
 124              		.loc 1 49 0
 125              		.cfi_startproc
 126              		@ args = 0, pretend = 0, frame = 16
 127              		@ frame_needed = 1, uses_anonymous_args = 0
 128 0038 80B5     		push	{r7, lr}
 129              		.cfi_def_cfa_offset 8
 130              		.cfi_offset 7, -8
 131              		.cfi_offset 14, -4
 132 003a 84B0     		sub	sp, sp, #16
 133              		.cfi_def_cfa_offset 24
 134 003c 00AF     		add	r7, sp, #0
 135              		.cfi_def_cfa_register 7
 136 003e 7860     		str	r0, [r7, #4]
  50:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	#ifdef SIMULATOR
  51:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 		ms /= 1000;
  52:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 		ms++;
  53:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	#endif
  54:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	
  55:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	while(ms > 0) {
 137              		.loc 1 55 0
 138 0040 0DE0     		b	.L6
 139              	.L9:
 140              	.LBB2:
  56:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 		for(int i = 0; i < 4; i++) {
 141              		.loc 1 56 0
 142 0042 0023     		movs	r3, #0
 143 0044 FB60     		str	r3, [r7, #12]
 144 0046 04E0     		b	.L7
 145              	.L8:
  57:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 			delay_250_ns();
 146              		.loc 1 57 0 discriminator 3
 147 0048 FFF7FEFF 		bl	delay_250_ns
  56:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 		for(int i = 0; i < 4; i++) {
 148              		.loc 1 56 0 discriminator 3
 149 004c FB68     		ldr	r3, [r7, #12]
 150 004e 0133     		adds	r3, r3, #1
 151 0050 FB60     		str	r3, [r7, #12]
 152              	.L7:
  56:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 		for(int i = 0; i < 4; i++) {
 153              		.loc 1 56 0 is_stmt 0 discriminator 1
 154 0052 FB68     		ldr	r3, [r7, #12]
 155 0054 032B     		cmp	r3, #3
 156 0056 F7DD     		ble	.L8
 157              	.LBE2:
  58:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 		}
  59:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 		ms--;
 158              		.loc 1 59 0 is_stmt 1
 159 0058 7B68     		ldr	r3, [r7, #4]
 160 005a 013B     		subs	r3, r3, #1
 161 005c 7B60     		str	r3, [r7, #4]
 162              	.L6:
  55:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 		for(int i = 0; i < 4; i++) {
 163              		.loc 1 55 0
 164 005e 7B68     		ldr	r3, [r7, #4]
 165 0060 002B     		cmp	r3, #0
 166 0062 EED1     		bne	.L9
  60:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	}
  61:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** }
 167              		.loc 1 61 0
 168 0064 C046     		nop
 169 0066 BD46     		mov	sp, r7
 170 0068 04B0     		add	sp, sp, #16
 171              		@ sp needed
 172 006a 80BD     		pop	{r7, pc}
 173              		.cfi_endproc
 174              	.LFE2:
 176              		.align	1
 177              		.global	delay_milli
 178              		.syntax unified
 179              		.code	16
 180              		.thumb_func
 181              		.fpu softvfp
 183              	delay_milli:
 184              	.LFB3:
  62:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
  63:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** void delay_milli(unsigned int ms) {
 185              		.loc 1 63 0
 186              		.cfi_startproc
 187              		@ args = 0, pretend = 0, frame = 8
 188              		@ frame_needed = 1, uses_anonymous_args = 0
 189 006c 80B5     		push	{r7, lr}
 190              		.cfi_def_cfa_offset 8
 191              		.cfi_offset 7, -8
 192              		.cfi_offset 14, -4
 193 006e 82B0     		sub	sp, sp, #8
 194              		.cfi_def_cfa_offset 16
 195 0070 00AF     		add	r7, sp, #0
 196              		.cfi_def_cfa_register 7
 197 0072 7860     		str	r0, [r7, #4]
  64:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	#ifdef SIMULATOR
  65:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 		ms /= 1000;
  66:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 		ms++;
  67:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	#endif
  68:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	
  69:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	while(ms > 0) {
 198              		.loc 1 69 0
 199 0074 07E0     		b	.L11
 200              	.L12:
  70:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 		delay_micro(1000);
 201              		.loc 1 70 0
 202 0076 FA23     		movs	r3, #250
 203 0078 9B00     		lsls	r3, r3, #2
 204 007a 1800     		movs	r0, r3
 205 007c FFF7FEFF 		bl	delay_micro
  71:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 		ms--;
 206              		.loc 1 71 0
 207 0080 7B68     		ldr	r3, [r7, #4]
 208 0082 013B     		subs	r3, r3, #1
 209 0084 7B60     		str	r3, [r7, #4]
 210              	.L11:
  69:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 		delay_micro(1000);
 211              		.loc 1 69 0
 212 0086 7B68     		ldr	r3, [r7, #4]
 213 0088 002B     		cmp	r3, #0
 214 008a F4D1     		bne	.L12
  72:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	}
  73:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** }
 215              		.loc 1 73 0
 216 008c C046     		nop
 217 008e BD46     		mov	sp, r7
 218 0090 02B0     		add	sp, sp, #8
 219              		@ sp needed
 220 0092 80BD     		pop	{r7, pc}
 221              		.cfi_endproc
 222              	.LFE3:
 224              		.align	1
 225              		.global	ascii_ctrl_bit_set
 226              		.syntax unified
 227              		.code	16
 228              		.thumb_func
 229              		.fpu softvfp
 231              	ascii_ctrl_bit_set:
 232              	.LFB4:
  74:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
  75:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** void ascii_ctrl_bit_set(unsigned char c) {
 233              		.loc 1 75 0
 234              		.cfi_startproc
 235              		@ args = 0, pretend = 0, frame = 16
 236              		@ frame_needed = 1, uses_anonymous_args = 0
 237 0094 80B5     		push	{r7, lr}
 238              		.cfi_def_cfa_offset 8
 239              		.cfi_offset 7, -8
 240              		.cfi_offset 14, -4
 241 0096 84B0     		sub	sp, sp, #16
 242              		.cfi_def_cfa_offset 24
 243 0098 00AF     		add	r7, sp, #0
 244              		.cfi_def_cfa_register 7
 245 009a 0200     		movs	r2, r0
 246 009c FB1D     		adds	r3, r7, #7
 247 009e 1A70     		strb	r2, [r3]
  76:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	unsigned char current = *GPIO_ODR_LOW;
 248              		.loc 1 76 0
 249 00a0 094A     		ldr	r2, .L14
 250 00a2 0F21     		movs	r1, #15
 251 00a4 7B18     		adds	r3, r7, r1
 252 00a6 1278     		ldrb	r2, [r2]
 253 00a8 1A70     		strb	r2, [r3]
  77:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	*GPIO_ODR_LOW = B_SELECT | current | c;
 254              		.loc 1 77 0
 255 00aa 7A18     		adds	r2, r7, r1
 256 00ac FB1D     		adds	r3, r7, #7
 257 00ae 1278     		ldrb	r2, [r2]
 258 00b0 1B78     		ldrb	r3, [r3]
 259 00b2 1343     		orrs	r3, r2
 260 00b4 DBB2     		uxtb	r3, r3
 261 00b6 044A     		ldr	r2, .L14
 262 00b8 0421     		movs	r1, #4
 263 00ba 0B43     		orrs	r3, r1
 264 00bc DBB2     		uxtb	r3, r3
 265 00be 1370     		strb	r3, [r2]
  78:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** }
 266              		.loc 1 78 0
 267 00c0 C046     		nop
 268 00c2 BD46     		mov	sp, r7
 269 00c4 04B0     		add	sp, sp, #16
 270              		@ sp needed
 271 00c6 80BD     		pop	{r7, pc}
 272              	.L15:
 273              		.align	2
 274              	.L14:
 275 00c8 14100240 		.word	1073877012
 276              		.cfi_endproc
 277              	.LFE4:
 279              		.align	1
 280              		.global	ascii_ctrl_bit_clear
 281              		.syntax unified
 282              		.code	16
 283              		.thumb_func
 284              		.fpu softvfp
 286              	ascii_ctrl_bit_clear:
 287              	.LFB5:
  79:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
  80:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** void ascii_ctrl_bit_clear(unsigned char c) {
 288              		.loc 1 80 0
 289              		.cfi_startproc
 290              		@ args = 0, pretend = 0, frame = 16
 291              		@ frame_needed = 1, uses_anonymous_args = 0
 292 00cc 80B5     		push	{r7, lr}
 293              		.cfi_def_cfa_offset 8
 294              		.cfi_offset 7, -8
 295              		.cfi_offset 14, -4
 296 00ce 84B0     		sub	sp, sp, #16
 297              		.cfi_def_cfa_offset 24
 298 00d0 00AF     		add	r7, sp, #0
 299              		.cfi_def_cfa_register 7
 300 00d2 0200     		movs	r2, r0
 301 00d4 FB1D     		adds	r3, r7, #7
 302 00d6 1A70     		strb	r2, [r3]
  81:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	unsigned char current = *GPIO_ODR_LOW;
 303              		.loc 1 81 0
 304 00d8 0C4A     		ldr	r2, .L17
 305 00da 0F21     		movs	r1, #15
 306 00dc 7B18     		adds	r3, r7, r1
 307 00de 1278     		ldrb	r2, [r2]
 308 00e0 1A70     		strb	r2, [r3]
  82:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	*GPIO_ODR_LOW = B_SELECT | (current & ~c);
 309              		.loc 1 82 0
 310 00e2 FB1D     		adds	r3, r7, #7
 311 00e4 1B78     		ldrb	r3, [r3]
 312 00e6 5BB2     		sxtb	r3, r3
 313 00e8 DB43     		mvns	r3, r3
 314 00ea 5BB2     		sxtb	r3, r3
 315 00ec 7A18     		adds	r2, r7, r1
 316 00ee 1278     		ldrb	r2, [r2]
 317 00f0 52B2     		sxtb	r2, r2
 318 00f2 1340     		ands	r3, r2
 319 00f4 5BB2     		sxtb	r3, r3
 320 00f6 0422     		movs	r2, #4
 321 00f8 1343     		orrs	r3, r2
 322 00fa 5AB2     		sxtb	r2, r3
 323 00fc 034B     		ldr	r3, .L17
 324 00fe D2B2     		uxtb	r2, r2
 325 0100 1A70     		strb	r2, [r3]
  83:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** }
 326              		.loc 1 83 0
 327 0102 C046     		nop
 328 0104 BD46     		mov	sp, r7
 329 0106 04B0     		add	sp, sp, #16
 330              		@ sp needed
 331 0108 80BD     		pop	{r7, pc}
 332              	.L18:
 333 010a C046     		.align	2
 334              	.L17:
 335 010c 14100240 		.word	1073877012
 336              		.cfi_endproc
 337              	.LFE5:
 339              		.align	1
 340              		.global	ascii_write_controller
 341              		.syntax unified
 342              		.code	16
 343              		.thumb_func
 344              		.fpu softvfp
 346              	ascii_write_controller:
 347              	.LFB6:
  84:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
  85:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** void ascii_write_controller(unsigned char byte) {
 348              		.loc 1 85 0
 349              		.cfi_startproc
 350              		@ args = 0, pretend = 0, frame = 8
 351              		@ frame_needed = 1, uses_anonymous_args = 0
 352 0110 80B5     		push	{r7, lr}
 353              		.cfi_def_cfa_offset 8
 354              		.cfi_offset 7, -8
 355              		.cfi_offset 14, -4
 356 0112 82B0     		sub	sp, sp, #8
 357              		.cfi_def_cfa_offset 16
 358 0114 00AF     		add	r7, sp, #0
 359              		.cfi_def_cfa_register 7
 360 0116 0200     		movs	r2, r0
 361 0118 FB1D     		adds	r3, r7, #7
 362 011a 1A70     		strb	r2, [r3]
  86:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_ctrl_bit_set(B_E);
 363              		.loc 1 86 0
 364 011c 4020     		movs	r0, #64
 365 011e FFF7FEFF 		bl	ascii_ctrl_bit_set
  87:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	*GPIO_ODR_HIGH = byte;
 366              		.loc 1 87 0
 367 0122 064A     		ldr	r2, .L20
 368 0124 FB1D     		adds	r3, r7, #7
 369 0126 1B78     		ldrb	r3, [r3]
 370 0128 1370     		strb	r3, [r2]
  88:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	delay_250_ns();
 371              		.loc 1 88 0
 372 012a FFF7FEFF 		bl	delay_250_ns
  89:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_ctrl_bit_clear(B_E);
 373              		.loc 1 89 0
 374 012e 4020     		movs	r0, #64
 375 0130 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  90:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** }
 376              		.loc 1 90 0
 377 0134 C046     		nop
 378 0136 BD46     		mov	sp, r7
 379 0138 02B0     		add	sp, sp, #8
 380              		@ sp needed
 381 013a 80BD     		pop	{r7, pc}
 382              	.L21:
 383              		.align	2
 384              	.L20:
 385 013c 15100240 		.word	1073877013
 386              		.cfi_endproc
 387              	.LFE6:
 389              		.align	1
 390              		.global	ascii_write_cmd
 391              		.syntax unified
 392              		.code	16
 393              		.thumb_func
 394              		.fpu softvfp
 396              	ascii_write_cmd:
 397              	.LFB7:
  91:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
  92:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** void ascii_write_cmd(unsigned char command) {
 398              		.loc 1 92 0
 399              		.cfi_startproc
 400              		@ args = 0, pretend = 0, frame = 8
 401              		@ frame_needed = 1, uses_anonymous_args = 0
 402 0140 80B5     		push	{r7, lr}
 403              		.cfi_def_cfa_offset 8
 404              		.cfi_offset 7, -8
 405              		.cfi_offset 14, -4
 406 0142 82B0     		sub	sp, sp, #8
 407              		.cfi_def_cfa_offset 16
 408 0144 00AF     		add	r7, sp, #0
 409              		.cfi_def_cfa_register 7
 410 0146 0200     		movs	r2, r0
 411 0148 FB1D     		adds	r3, r7, #7
 412 014a 1A70     		strb	r2, [r3]
  93:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 413              		.loc 1 93 0
 414 014c 0120     		movs	r0, #1
 415 014e FFF7FEFF 		bl	ascii_ctrl_bit_clear
  94:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 416              		.loc 1 94 0
 417 0152 0220     		movs	r0, #2
 418 0154 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  95:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_write_controller(command);
 419              		.loc 1 95 0
 420 0158 FB1D     		adds	r3, r7, #7
 421 015a 1B78     		ldrb	r3, [r3]
 422 015c 1800     		movs	r0, r3
 423 015e FFF7FEFF 		bl	ascii_write_controller
  96:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** }
 424              		.loc 1 96 0
 425 0162 C046     		nop
 426 0164 BD46     		mov	sp, r7
 427 0166 02B0     		add	sp, sp, #8
 428              		@ sp needed
 429 0168 80BD     		pop	{r7, pc}
 430              		.cfi_endproc
 431              	.LFE7:
 433              		.align	1
 434              		.global	ascii_write_data
 435              		.syntax unified
 436              		.code	16
 437              		.thumb_func
 438              		.fpu softvfp
 440              	ascii_write_data:
 441              	.LFB8:
  97:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
  98:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** void ascii_write_data(unsigned char data) {
 442              		.loc 1 98 0
 443              		.cfi_startproc
 444              		@ args = 0, pretend = 0, frame = 8
 445              		@ frame_needed = 1, uses_anonymous_args = 0
 446 016a 80B5     		push	{r7, lr}
 447              		.cfi_def_cfa_offset 8
 448              		.cfi_offset 7, -8
 449              		.cfi_offset 14, -4
 450 016c 82B0     		sub	sp, sp, #8
 451              		.cfi_def_cfa_offset 16
 452 016e 00AF     		add	r7, sp, #0
 453              		.cfi_def_cfa_register 7
 454 0170 0200     		movs	r2, r0
 455 0172 FB1D     		adds	r3, r7, #7
 456 0174 1A70     		strb	r2, [r3]
  99:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 457              		.loc 1 99 0
 458 0176 0120     		movs	r0, #1
 459 0178 FFF7FEFF 		bl	ascii_ctrl_bit_set
 100:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 460              		.loc 1 100 0
 461 017c 0220     		movs	r0, #2
 462 017e FFF7FEFF 		bl	ascii_ctrl_bit_clear
 101:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_write_controller(data);
 463              		.loc 1 101 0
 464 0182 FB1D     		adds	r3, r7, #7
 465 0184 1B78     		ldrb	r3, [r3]
 466 0186 1800     		movs	r0, r3
 467 0188 FFF7FEFF 		bl	ascii_write_controller
 102:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** }
 468              		.loc 1 102 0
 469 018c C046     		nop
 470 018e BD46     		mov	sp, r7
 471 0190 02B0     		add	sp, sp, #8
 472              		@ sp needed
 473 0192 80BD     		pop	{r7, pc}
 474              		.cfi_endproc
 475              	.LFE8:
 477              		.align	1
 478              		.global	ascii_read_controller
 479              		.syntax unified
 480              		.code	16
 481              		.thumb_func
 482              		.fpu softvfp
 484              	ascii_read_controller:
 485              	.LFB9:
 103:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
 104:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** unsigned char ascii_read_controller(void) {
 486              		.loc 1 104 0
 487              		.cfi_startproc
 488              		@ args = 0, pretend = 0, frame = 8
 489              		@ frame_needed = 1, uses_anonymous_args = 0
 490 0194 80B5     		push	{r7, lr}
 491              		.cfi_def_cfa_offset 8
 492              		.cfi_offset 7, -8
 493              		.cfi_offset 14, -4
 494 0196 82B0     		sub	sp, sp, #8
 495              		.cfi_def_cfa_offset 16
 496 0198 00AF     		add	r7, sp, #0
 497              		.cfi_def_cfa_register 7
 105:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	unsigned char return_value;
 106:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_ctrl_bit_set(B_E);
 498              		.loc 1 106 0
 499 019a 4020     		movs	r0, #64
 500 019c FFF7FEFF 		bl	ascii_ctrl_bit_set
 107:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	delay_250_ns();
 501              		.loc 1 107 0
 502 01a0 FFF7FEFF 		bl	delay_250_ns
 108:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	delay_250_ns();
 503              		.loc 1 108 0
 504 01a4 FFF7FEFF 		bl	delay_250_ns
 109:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	return_value = *GPIO_ODR_HIGH;
 505              		.loc 1 109 0
 506 01a8 064A     		ldr	r2, .L26
 507 01aa FB1D     		adds	r3, r7, #7
 508 01ac 1278     		ldrb	r2, [r2]
 509 01ae 1A70     		strb	r2, [r3]
 110:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_ctrl_bit_clear(B_E);
 510              		.loc 1 110 0
 511 01b0 4020     		movs	r0, #64
 512 01b2 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 111:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	return return_value;
 513              		.loc 1 111 0
 514 01b6 FB1D     		adds	r3, r7, #7
 515 01b8 1B78     		ldrb	r3, [r3]
 112:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** }
 516              		.loc 1 112 0
 517 01ba 1800     		movs	r0, r3
 518 01bc BD46     		mov	sp, r7
 519 01be 02B0     		add	sp, sp, #8
 520              		@ sp needed
 521 01c0 80BD     		pop	{r7, pc}
 522              	.L27:
 523 01c2 C046     		.align	2
 524              	.L26:
 525 01c4 15100240 		.word	1073877013
 526              		.cfi_endproc
 527              	.LFE9:
 529              		.align	1
 530              		.global	ascii_read_status
 531              		.syntax unified
 532              		.code	16
 533              		.thumb_func
 534              		.fpu softvfp
 536              	ascii_read_status:
 537              	.LFB10:
 113:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
 114:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** unsigned char ascii_read_status(void) {
 538              		.loc 1 114 0
 539              		.cfi_startproc
 540              		@ args = 0, pretend = 0, frame = 8
 541              		@ frame_needed = 1, uses_anonymous_args = 0
 542 01c8 90B5     		push	{r4, r7, lr}
 543              		.cfi_def_cfa_offset 12
 544              		.cfi_offset 4, -12
 545              		.cfi_offset 7, -8
 546              		.cfi_offset 14, -4
 547 01ca 83B0     		sub	sp, sp, #12
 548              		.cfi_def_cfa_offset 24
 549 01cc 00AF     		add	r7, sp, #0
 550              		.cfi_def_cfa_register 7
 115:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	unsigned char return_value;
 116:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	*GPIO_MODER &= 0x0000FFFF;
 551              		.loc 1 116 0
 552 01ce 0E4B     		ldr	r3, .L29
 553 01d0 1A68     		ldr	r2, [r3]
 554 01d2 0D4B     		ldr	r3, .L29
 555 01d4 1204     		lsls	r2, r2, #16
 556 01d6 120C     		lsrs	r2, r2, #16
 557 01d8 1A60     		str	r2, [r3]
 117:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 558              		.loc 1 117 0
 559 01da 0120     		movs	r0, #1
 560 01dc FFF7FEFF 		bl	ascii_ctrl_bit_clear
 118:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 561              		.loc 1 118 0
 562 01e0 0220     		movs	r0, #2
 563 01e2 FFF7FEFF 		bl	ascii_ctrl_bit_set
 119:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	return_value = ascii_read_controller();
 564              		.loc 1 119 0
 565 01e6 FC1D     		adds	r4, r7, #7
 566 01e8 FFF7FEFF 		bl	ascii_read_controller
 567 01ec 0300     		movs	r3, r0
 568 01ee 2370     		strb	r3, [r4]
 120:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	*GPIO_MODER |= 0x55550000;
 569              		.loc 1 120 0
 570 01f0 054B     		ldr	r3, .L29
 571 01f2 1A68     		ldr	r2, [r3]
 572 01f4 044B     		ldr	r3, .L29
 573 01f6 0549     		ldr	r1, .L29+4
 574 01f8 0A43     		orrs	r2, r1
 575 01fa 1A60     		str	r2, [r3]
 121:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** }
 576              		.loc 1 121 0
 577 01fc C046     		nop
 578 01fe 1800     		movs	r0, r3
 579 0200 BD46     		mov	sp, r7
 580 0202 03B0     		add	sp, sp, #12
 581              		@ sp needed
 582 0204 90BD     		pop	{r4, r7, pc}
 583              	.L30:
 584 0206 C046     		.align	2
 585              	.L29:
 586 0208 00100240 		.word	1073876992
 587 020c 00005555 		.word	1431633920
 588              		.cfi_endproc
 589              	.LFE10:
 591              		.align	1
 592              		.global	ascii_read_data
 593              		.syntax unified
 594              		.code	16
 595              		.thumb_func
 596              		.fpu softvfp
 598              	ascii_read_data:
 599              	.LFB11:
 122:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
 123:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** unsigned char ascii_read_data(void) {
 600              		.loc 1 123 0
 601              		.cfi_startproc
 602              		@ args = 0, pretend = 0, frame = 8
 603              		@ frame_needed = 1, uses_anonymous_args = 0
 604 0210 90B5     		push	{r4, r7, lr}
 605              		.cfi_def_cfa_offset 12
 606              		.cfi_offset 4, -12
 607              		.cfi_offset 7, -8
 608              		.cfi_offset 14, -4
 609 0212 83B0     		sub	sp, sp, #12
 610              		.cfi_def_cfa_offset 24
 611 0214 00AF     		add	r7, sp, #0
 612              		.cfi_def_cfa_register 7
 124:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	unsigned char return_value;
 125:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	*GPIO_MODER &= 0x0000FFFF;
 613              		.loc 1 125 0
 614 0216 0E4B     		ldr	r3, .L32
 615 0218 1A68     		ldr	r2, [r3]
 616 021a 0D4B     		ldr	r3, .L32
 617 021c 1204     		lsls	r2, r2, #16
 618 021e 120C     		lsrs	r2, r2, #16
 619 0220 1A60     		str	r2, [r3]
 126:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 620              		.loc 1 126 0
 621 0222 0120     		movs	r0, #1
 622 0224 FFF7FEFF 		bl	ascii_ctrl_bit_set
 127:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 623              		.loc 1 127 0
 624 0228 0220     		movs	r0, #2
 625 022a FFF7FEFF 		bl	ascii_ctrl_bit_set
 128:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	return_value = ascii_read_controller();
 626              		.loc 1 128 0
 627 022e FC1D     		adds	r4, r7, #7
 628 0230 FFF7FEFF 		bl	ascii_read_controller
 629 0234 0300     		movs	r3, r0
 630 0236 2370     		strb	r3, [r4]
 129:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	*GPIO_MODER |= 0x55550000;
 631              		.loc 1 129 0
 632 0238 054B     		ldr	r3, .L32
 633 023a 1A68     		ldr	r2, [r3]
 634 023c 044B     		ldr	r3, .L32
 635 023e 0549     		ldr	r1, .L32+4
 636 0240 0A43     		orrs	r2, r1
 637 0242 1A60     		str	r2, [r3]
 130:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** }
 638              		.loc 1 130 0
 639 0244 C046     		nop
 640 0246 1800     		movs	r0, r3
 641 0248 BD46     		mov	sp, r7
 642 024a 03B0     		add	sp, sp, #12
 643              		@ sp needed
 644 024c 90BD     		pop	{r4, r7, pc}
 645              	.L33:
 646 024e C046     		.align	2
 647              	.L32:
 648 0250 00100240 		.word	1073876992
 649 0254 00005555 		.word	1431633920
 650              		.cfi_endproc
 651              	.LFE11:
 653              		.align	1
 654              		.global	ascii_init
 655              		.syntax unified
 656              		.code	16
 657              		.thumb_func
 658              		.fpu softvfp
 660              	ascii_init:
 661              	.LFB12:
 131:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
 132:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** void ascii_init(void) {
 662              		.loc 1 132 0
 663              		.cfi_startproc
 664              		@ args = 0, pretend = 0, frame = 0
 665              		@ frame_needed = 1, uses_anonymous_args = 0
 666 0258 80B5     		push	{r7, lr}
 667              		.cfi_def_cfa_offset 8
 668              		.cfi_offset 7, -8
 669              		.cfi_offset 14, -4
 670 025a 00AF     		add	r7, sp, #0
 671              		.cfi_def_cfa_register 7
 133:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	//Function set
 134:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80);
 672              		.loc 1 134 0
 673 025c C046     		nop
 674              	.L35:
 675              		.loc 1 134 0 is_stmt 0 discriminator 1
 676 025e FFF7FEFF 		bl	ascii_read_status
 677 0262 0300     		movs	r3, r0
 678 0264 1A00     		movs	r2, r3
 679 0266 8023     		movs	r3, #128
 680 0268 1340     		ands	r3, r2
 681 026a 802B     		cmp	r3, #128
 682 026c F7D0     		beq	.L35
 135:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	delay_micro(8);
 683              		.loc 1 135 0 is_stmt 1
 684 026e 0820     		movs	r0, #8
 685 0270 FFF7FEFF 		bl	delay_micro
 136:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_write_cmd(0x38);
 686              		.loc 1 136 0
 687 0274 3820     		movs	r0, #56
 688 0276 FFF7FEFF 		bl	ascii_write_cmd
 137:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	delay_micro(40);
 689              		.loc 1 137 0
 690 027a 2820     		movs	r0, #40
 691 027c FFF7FEFF 		bl	delay_micro
 138:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	
 139:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	//Display control
 140:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80);
 692              		.loc 1 140 0
 693 0280 C046     		nop
 694              	.L36:
 695              		.loc 1 140 0 is_stmt 0 discriminator 1
 696 0282 FFF7FEFF 		bl	ascii_read_status
 697 0286 0300     		movs	r3, r0
 698 0288 1A00     		movs	r2, r3
 699 028a 8023     		movs	r3, #128
 700 028c 1340     		ands	r3, r2
 701 028e 802B     		cmp	r3, #128
 702 0290 F7D0     		beq	.L36
 141:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	delay_micro(8);
 703              		.loc 1 141 0 is_stmt 1
 704 0292 0820     		movs	r0, #8
 705 0294 FFF7FEFF 		bl	delay_micro
 142:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_write_cmd(0x0E);
 706              		.loc 1 142 0
 707 0298 0E20     		movs	r0, #14
 708 029a FFF7FEFF 		bl	ascii_write_cmd
 143:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	delay_micro(40);
 709              		.loc 1 143 0
 710 029e 2820     		movs	r0, #40
 711 02a0 FFF7FEFF 		bl	delay_micro
 144:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	
 145:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	//Clear display
 146:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80);
 712              		.loc 1 146 0
 713 02a4 C046     		nop
 714              	.L37:
 715              		.loc 1 146 0 is_stmt 0 discriminator 1
 716 02a6 FFF7FEFF 		bl	ascii_read_status
 717 02aa 0300     		movs	r3, r0
 718 02ac 1A00     		movs	r2, r3
 719 02ae 8023     		movs	r3, #128
 720 02b0 1340     		ands	r3, r2
 721 02b2 802B     		cmp	r3, #128
 722 02b4 F7D0     		beq	.L37
 147:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	delay_micro(8);
 723              		.loc 1 147 0 is_stmt 1
 724 02b6 0820     		movs	r0, #8
 725 02b8 FFF7FEFF 		bl	delay_micro
 148:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_write_cmd(1);
 726              		.loc 1 148 0
 727 02bc 0120     		movs	r0, #1
 728 02be FFF7FEFF 		bl	ascii_write_cmd
 149:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	delay_micro(2);
 729              		.loc 1 149 0
 730 02c2 0220     		movs	r0, #2
 731 02c4 FFF7FEFF 		bl	delay_micro
 150:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
 151:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	//Entry mode set
 152:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80);
 732              		.loc 1 152 0
 733 02c8 C046     		nop
 734              	.L38:
 735              		.loc 1 152 0 is_stmt 0 discriminator 1
 736 02ca FFF7FEFF 		bl	ascii_read_status
 737 02ce 0300     		movs	r3, r0
 738 02d0 1A00     		movs	r2, r3
 739 02d2 8023     		movs	r3, #128
 740 02d4 1340     		ands	r3, r2
 741 02d6 802B     		cmp	r3, #128
 742 02d8 F7D0     		beq	.L38
 153:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	delay_micro(8);
 743              		.loc 1 153 0 is_stmt 1
 744 02da 0820     		movs	r0, #8
 745 02dc FFF7FEFF 		bl	delay_micro
 154:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_write_cmd(0x06);
 746              		.loc 1 154 0
 747 02e0 0620     		movs	r0, #6
 748 02e2 FFF7FEFF 		bl	ascii_write_cmd
 155:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	delay_micro(40);
 749              		.loc 1 155 0
 750 02e6 2820     		movs	r0, #40
 751 02e8 FFF7FEFF 		bl	delay_micro
 156:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** }
 752              		.loc 1 156 0
 753 02ec C046     		nop
 754 02ee BD46     		mov	sp, r7
 755              		@ sp needed
 756 02f0 80BD     		pop	{r7, pc}
 757              		.cfi_endproc
 758              	.LFE12:
 760              		.align	1
 761              		.global	ascii_gotoxy
 762              		.syntax unified
 763              		.code	16
 764              		.thumb_func
 765              		.fpu softvfp
 767              	ascii_gotoxy:
 768              	.LFB13:
 157:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
 158:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** void ascii_gotoxy(int row, int column) {
 769              		.loc 1 158 0
 770              		.cfi_startproc
 771              		@ args = 0, pretend = 0, frame = 16
 772              		@ frame_needed = 1, uses_anonymous_args = 0
 773 02f2 80B5     		push	{r7, lr}
 774              		.cfi_def_cfa_offset 8
 775              		.cfi_offset 7, -8
 776              		.cfi_offset 14, -4
 777 02f4 84B0     		sub	sp, sp, #16
 778              		.cfi_def_cfa_offset 24
 779 02f6 00AF     		add	r7, sp, #0
 780              		.cfi_def_cfa_register 7
 781 02f8 7860     		str	r0, [r7, #4]
 782 02fa 3960     		str	r1, [r7]
 159:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	int address = row - 1;
 783              		.loc 1 159 0
 784 02fc 7B68     		ldr	r3, [r7, #4]
 785 02fe 013B     		subs	r3, r3, #1
 786 0300 FB60     		str	r3, [r7, #12]
 160:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	if (column == 2) {
 787              		.loc 1 160 0
 788 0302 3B68     		ldr	r3, [r7]
 789 0304 022B     		cmp	r3, #2
 790 0306 02D1     		bne	.L40
 161:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 		address += 0x40;
 791              		.loc 1 161 0
 792 0308 FB68     		ldr	r3, [r7, #12]
 793 030a 4033     		adds	r3, r3, #64
 794 030c FB60     		str	r3, [r7, #12]
 795              	.L40:
 162:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	}
 163:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_write_cmd(0x80 | address);
 796              		.loc 1 163 0
 797 030e FB68     		ldr	r3, [r7, #12]
 798 0310 5BB2     		sxtb	r3, r3
 799 0312 8022     		movs	r2, #128
 800 0314 5242     		rsbs	r2, r2, #0
 801 0316 1343     		orrs	r3, r2
 802 0318 5BB2     		sxtb	r3, r3
 803 031a DBB2     		uxtb	r3, r3
 804 031c 1800     		movs	r0, r3
 805 031e FFF7FEFF 		bl	ascii_write_cmd
 164:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** }
 806              		.loc 1 164 0
 807 0322 C046     		nop
 808 0324 BD46     		mov	sp, r7
 809 0326 04B0     		add	sp, sp, #16
 810              		@ sp needed
 811 0328 80BD     		pop	{r7, pc}
 812              		.cfi_endproc
 813              	.LFE13:
 815              		.align	1
 816              		.global	ascii_write_char
 817              		.syntax unified
 818              		.code	16
 819              		.thumb_func
 820              		.fpu softvfp
 822              	ascii_write_char:
 823              	.LFB14:
 165:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
 166:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** void ascii_write_char(unsigned char c) {
 824              		.loc 1 166 0
 825              		.cfi_startproc
 826              		@ args = 0, pretend = 0, frame = 8
 827              		@ frame_needed = 1, uses_anonymous_args = 0
 828 032a 80B5     		push	{r7, lr}
 829              		.cfi_def_cfa_offset 8
 830              		.cfi_offset 7, -8
 831              		.cfi_offset 14, -4
 832 032c 82B0     		sub	sp, sp, #8
 833              		.cfi_def_cfa_offset 16
 834 032e 00AF     		add	r7, sp, #0
 835              		.cfi_def_cfa_register 7
 836 0330 0200     		movs	r2, r0
 837 0332 FB1D     		adds	r3, r7, #7
 838 0334 1A70     		strb	r2, [r3]
 167:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80);
 839              		.loc 1 167 0
 840 0336 C046     		nop
 841              	.L42:
 842              		.loc 1 167 0 is_stmt 0 discriminator 1
 843 0338 FFF7FEFF 		bl	ascii_read_status
 844 033c 0300     		movs	r3, r0
 845 033e 1A00     		movs	r2, r3
 846 0340 8023     		movs	r3, #128
 847 0342 1340     		ands	r3, r2
 848 0344 802B     		cmp	r3, #128
 849 0346 F7D0     		beq	.L42
 168:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	delay_micro(8);
 850              		.loc 1 168 0 is_stmt 1
 851 0348 0820     		movs	r0, #8
 852 034a FFF7FEFF 		bl	delay_micro
 169:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_write_data(c);
 853              		.loc 1 169 0
 854 034e FB1D     		adds	r3, r7, #7
 855 0350 1B78     		ldrb	r3, [r3]
 856 0352 1800     		movs	r0, r3
 857 0354 FFF7FEFF 		bl	ascii_write_data
 170:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	delay_micro(45);
 858              		.loc 1 170 0
 859 0358 2D20     		movs	r0, #45
 860 035a FFF7FEFF 		bl	delay_micro
 171:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** }
 861              		.loc 1 171 0
 862 035e C046     		nop
 863 0360 BD46     		mov	sp, r7
 864 0362 02B0     		add	sp, sp, #8
 865              		@ sp needed
 866 0364 80BD     		pop	{r7, pc}
 867              		.cfi_endproc
 868              	.LFE14:
 870              		.align	1
 871              		.global	app_init
 872              		.syntax unified
 873              		.code	16
 874              		.thumb_func
 875              		.fpu softvfp
 877              	app_init:
 878              	.LFB15:
 172:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
 173:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** void app_init() {
 879              		.loc 1 173 0
 880              		.cfi_startproc
 881              		@ args = 0, pretend = 0, frame = 0
 882              		@ frame_needed = 1, uses_anonymous_args = 0
 883 0366 80B5     		push	{r7, lr}
 884              		.cfi_def_cfa_offset 8
 885              		.cfi_offset 7, -8
 886              		.cfi_offset 14, -4
 887 0368 00AF     		add	r7, sp, #0
 888              		.cfi_def_cfa_register 7
 174:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	#ifdef USBDM
 175:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 		*((unsigned long *) 0x40023830) = 0x18;
 889              		.loc 1 175 0
 890 036a 094B     		ldr	r3, .L44
 891 036c 1822     		movs	r2, #24
 892 036e 1A60     		str	r2, [r3]
 176:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 		__asm volatile(" LDR R0,= 0x08000209\n BLX R0 \n");
 893              		.loc 1 176 0
 894              		.syntax divided
 895              	@ 176 "C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3/startup.c" 1
 896 0370 3148     		 LDR R0,= 0x08000209
 897 0372 8047     	 BLX R0 
 898              	
 899              	@ 0 "" 2
 177:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	#endif
 178:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	*GPIO_MODER &= 0x00000000;
 900              		.loc 1 178 0
 901              		.thumb
 902              		.syntax unified
 903 0374 074B     		ldr	r3, .L44+4
 904 0376 1B68     		ldr	r3, [r3]
 905 0378 064B     		ldr	r3, .L44+4
 906 037a 0022     		movs	r2, #0
 907 037c 1A60     		str	r2, [r3]
 179:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	*GPIO_MODER |= 0x55555555;
 908              		.loc 1 179 0
 909 037e 054B     		ldr	r3, .L44+4
 910 0380 1A68     		ldr	r2, [r3]
 911 0382 044B     		ldr	r3, .L44+4
 912 0384 0449     		ldr	r1, .L44+8
 913 0386 0A43     		orrs	r2, r1
 914 0388 1A60     		str	r2, [r3]
 180:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** }
 915              		.loc 1 180 0
 916 038a C046     		nop
 917 038c BD46     		mov	sp, r7
 918              		@ sp needed
 919 038e 80BD     		pop	{r7, pc}
 920              	.L45:
 921              		.align	2
 922              	.L44:
 923 0390 30380240 		.word	1073887280
 924 0394 00100240 		.word	1073876992
 925 0398 55555555 		.word	1431655765
 926              		.cfi_endproc
 927              	.LFE15:
 929              		.section	.rodata
 930              		.align	2
 931              	.LC0:
 932 0000 54657374 		.ascii	"Test\000"
 932      00
 933              		.text
 934              		.align	1
 935              		.global	main
 936              		.syntax unified
 937              		.code	16
 938              		.thumb_func
 939              		.fpu softvfp
 941              	main:
 942              	.LFB16:
 181:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 
 182:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** void main(int argc, char **argv)
 183:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** {
 943              		.loc 1 183 0
 944              		.cfi_startproc
 945              		@ args = 0, pretend = 0, frame = 24
 946              		@ frame_needed = 1, uses_anonymous_args = 0
 947 039c 90B5     		push	{r4, r7, lr}
 948              		.cfi_def_cfa_offset 12
 949              		.cfi_offset 4, -12
 950              		.cfi_offset 7, -8
 951              		.cfi_offset 14, -4
 952 039e 87B0     		sub	sp, sp, #28
 953              		.cfi_def_cfa_offset 40
 954 03a0 00AF     		add	r7, sp, #0
 955              		.cfi_def_cfa_register 7
 956 03a2 7860     		str	r0, [r7, #4]
 957 03a4 3960     		str	r1, [r7]
 184:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	char *s;
 185:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	char test1[] = "Test";
 958              		.loc 1 185 0
 959 03a6 0C24     		movs	r4, #12
 960 03a8 3B19     		adds	r3, r7, r4
 961 03aa 214A     		ldr	r2, .L52
 962 03ac 1168     		ldr	r1, [r2]
 963 03ae 1960     		str	r1, [r3]
 964 03b0 1279     		ldrb	r2, [r2, #4]
 965 03b2 1A71     		strb	r2, [r3, #4]
 186:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	char test2[] = "123";
 966              		.loc 1 186 0
 967 03b4 0823     		movs	r3, #8
 968 03b6 FB18     		adds	r3, r7, r3
 969 03b8 1E4A     		ldr	r2, .L52+4
 970 03ba 1A60     		str	r2, [r3]
 187:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	
 188:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	app_init();
 971              		.loc 1 188 0
 972 03bc FFF7FEFF 		bl	app_init
 189:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_init();
 973              		.loc 1 189 0
 974 03c0 FFF7FEFF 		bl	ascii_init
 190:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	delay_milli(1);
 975              		.loc 1 190 0
 976 03c4 0120     		movs	r0, #1
 977 03c6 FFF7FEFF 		bl	delay_milli
 191:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_gotoxy(1,1);
 978              		.loc 1 191 0
 979 03ca 0121     		movs	r1, #1
 980 03cc 0120     		movs	r0, #1
 981 03ce FFF7FEFF 		bl	ascii_gotoxy
 192:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	delay_milli(1);
 982              		.loc 1 192 0
 983 03d2 0120     		movs	r0, #1
 984 03d4 FFF7FEFF 		bl	delay_milli
 193:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	s = test1;
 985              		.loc 1 193 0
 986 03d8 3B19     		adds	r3, r7, r4
 987 03da 7B61     		str	r3, [r7, #20]
 194:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	while(*s) {
 988              		.loc 1 194 0
 989 03dc 06E0     		b	.L47
 990              	.L48:
 195:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 		ascii_write_char(*s++);
 991              		.loc 1 195 0
 992 03de 7B69     		ldr	r3, [r7, #20]
 993 03e0 5A1C     		adds	r2, r3, #1
 994 03e2 7A61     		str	r2, [r7, #20]
 995 03e4 1B78     		ldrb	r3, [r3]
 996 03e6 1800     		movs	r0, r3
 997 03e8 FFF7FEFF 		bl	ascii_write_char
 998              	.L47:
 194:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	while(*s) {
 999              		.loc 1 194 0
 1000 03ec 7B69     		ldr	r3, [r7, #20]
 1001 03ee 1B78     		ldrb	r3, [r3]
 1002 03f0 002B     		cmp	r3, #0
 1003 03f2 F4D1     		bne	.L48
 196:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	}
 197:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	delay_milli(1);
 1004              		.loc 1 197 0
 1005 03f4 0120     		movs	r0, #1
 1006 03f6 FFF7FEFF 		bl	delay_milli
 198:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	ascii_gotoxy(1,2);
 1007              		.loc 1 198 0
 1008 03fa 0221     		movs	r1, #2
 1009 03fc 0120     		movs	r0, #1
 1010 03fe FFF7FEFF 		bl	ascii_gotoxy
 199:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	
 200:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	delay_milli(1);
 1011              		.loc 1 200 0
 1012 0402 0120     		movs	r0, #1
 1013 0404 FFF7FEFF 		bl	delay_milli
 201:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	s = test2;
 1014              		.loc 1 201 0
 1015 0408 0823     		movs	r3, #8
 1016 040a FB18     		adds	r3, r7, r3
 1017 040c 7B61     		str	r3, [r7, #20]
 202:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	while(*s) {
 1018              		.loc 1 202 0
 1019 040e 06E0     		b	.L49
 1020              	.L50:
 203:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 		ascii_write_char(*s++);
 1021              		.loc 1 203 0
 1022 0410 7B69     		ldr	r3, [r7, #20]
 1023 0412 5A1C     		adds	r2, r3, #1
 1024 0414 7A61     		str	r2, [r7, #20]
 1025 0416 1B78     		ldrb	r3, [r3]
 1026 0418 1800     		movs	r0, r3
 1027 041a FFF7FEFF 		bl	ascii_write_char
 1028              	.L49:
 202:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	while(*s) {
 1029              		.loc 1 202 0
 1030 041e 7B69     		ldr	r3, [r7, #20]
 1031 0420 1B78     		ldrb	r3, [r3]
 1032 0422 002B     		cmp	r3, #0
 1033 0424 F4D1     		bne	.L50
 204:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	}
 205:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** 	return 0;
 1034              		.loc 1 205 0
 1035 0426 C046     		nop
 206:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab2_3\startup.c **** }
 1036              		.loc 1 206 0
 1037 0428 BD46     		mov	sp, r7
 1038 042a 07B0     		add	sp, sp, #28
 1039              		@ sp needed
 1040 042c 90BD     		pop	{r4, r7, pc}
 1041              	.L53:
 1042 042e C046     		.align	2
 1043              	.L52:
 1044 0430 00000000 		.word	.LC0
 1045 0434 31323300 		.word	3355185
 1046              		.cfi_endproc
 1047              	.LFE16:
 1049              	.Letext0:
