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
  25              		.file 1 "C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2/startup.c"
   1:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** /*
   2:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c ****  * 	startup.c
   3:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c ****  *
   4:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c ****  */
   5:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c ****  
   6:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c ****  #define STK_D 0xE000E010
   7:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c ****  #define STK_CTRL (unsigned int *) STK_D
   8:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c ****  #define STK_LOAD (unsigned int *) (STK_D + 4)
   9:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c ****  #define STK_VAL (unsigned int *) (STK_D + 8)
  10:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c ****  
  11:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** #define GPIO_D 0x40021000
  12:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** #define GPIO_MODER ((volatile unsigned int *) GPIO_D)
  13:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D + 0x14))
  14:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 
  15:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** __attribute__((naked)) __attribute__((section (".start_section")) )
  16:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** void startup ( void )
  17:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** {
  26              		.loc 1 17 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  18:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** __asm__ volatile(" LDR R0,=0x2001C000\n");		/* set stack */
  31              		.loc 1 18 0
  32              		.syntax divided
  33              	@ 18 "C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35              	
  36              	@ 0 "" 2
  19:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** __asm__ volatile(" MOV SP,R0\n");
  37              		.loc 1 19 0
  38              	@ 19 "C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2/startup.c" 1
  39 0002 8546     		 MOV SP,R0
  40              	
  41              	@ 0 "" 2
  20:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** __asm__ volatile(" BL main\n");					/* call main */
  42              		.loc 1 20 0
  43              	@ 20 "C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2/startup.c" 1
  44 0004 FFF7FEFF 		 BL main
  45              	
  46              	@ 0 "" 2
  21:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** __asm__ volatile(".L1: B .L1\n");				/* never return */
  47              		.loc 1 21 0
  48              	@ 21 "C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2/startup.c" 1
  49 0008 FEE7     		.L1: B .L1
  50              	
  51              	@ 0 "" 2
  22:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** }
  52              		.loc 1 22 0
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
  23:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 
  24:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** #define USBDM
  25:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 
  26:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** void app_init(void) {
  69              		.loc 1 26 0
  70              		.cfi_startproc
  71              		@ args = 0, pretend = 0, frame = 0
  72              		@ frame_needed = 1, uses_anonymous_args = 0
  73 0000 80B5     		push	{r7, lr}
  74              		.cfi_def_cfa_offset 8
  75              		.cfi_offset 7, -8
  76              		.cfi_offset 14, -4
  77 0002 00AF     		add	r7, sp, #0
  78              		.cfi_def_cfa_register 7
  27:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	#ifdef USBDM
  28:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		*((unsigned long *) 0x40023830) = 0x18;
  79              		.loc 1 28 0
  80 0004 054B     		ldr	r3, .L3
  81 0006 1822     		movs	r2, #24
  82 0008 1A60     		str	r2, [r3]
  29:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		__asm volatile(" LDR R0,= 0x08000209\n BLX R0 \n");
  83              		.loc 1 29 0
  84              		.syntax divided
  85              	@ 29 "C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2/startup.c" 1
  86 000a 3848     		 LDR R0,= 0x08000209
  87 000c 8047     	 BLX R0 
  88              	
  89              	@ 0 "" 2
  30:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	#endif
  31:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	*GPIO_MODER = 0x55555555;
  90              		.loc 1 31 0
  91              		.thumb
  92              		.syntax unified
  93 000e 044B     		ldr	r3, .L3+4
  94 0010 044A     		ldr	r2, .L3+8
  95 0012 1A60     		str	r2, [r3]
  32:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** }
  96              		.loc 1 32 0
  97 0014 C046     		nop
  98 0016 BD46     		mov	sp, r7
  99              		@ sp needed
 100 0018 80BD     		pop	{r7, pc}
 101              	.L4:
 102 001a C046     		.align	2
 103              	.L3:
 104 001c 30380240 		.word	1073887280
 105 0020 00100240 		.word	1073876992
 106 0024 55555555 		.word	1431655765
 107              		.cfi_endproc
 108              	.LFE1:
 110              		.align	1
 111              		.global	delay_250_ns
 112              		.syntax unified
 113              		.code	16
 114              		.thumb_func
 115              		.fpu softvfp
 117              	delay_250_ns:
 118              	.LFB2:
  33:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 
  34:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** //#define SIMULATOR
  35:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 
  36:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** void delay_250_ns(void) {
 119              		.loc 1 36 0
 120              		.cfi_startproc
 121              		@ args = 0, pretend = 0, frame = 0
 122              		@ frame_needed = 1, uses_anonymous_args = 0
 123 0028 80B5     		push	{r7, lr}
 124              		.cfi_def_cfa_offset 8
 125              		.cfi_offset 7, -8
 126              		.cfi_offset 14, -4
 127 002a 00AF     		add	r7, sp, #0
 128              		.cfi_def_cfa_register 7
  37:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	*STK_CTRL = 0;
 129              		.loc 1 37 0
 130 002c 094B     		ldr	r3, .L6
 131 002e 0022     		movs	r2, #0
 132 0030 1A60     		str	r2, [r3]
  38:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	*STK_LOAD = (168-1)/4;
 133              		.loc 1 38 0
 134 0032 094B     		ldr	r3, .L6+4
 135 0034 2922     		movs	r2, #41
 136 0036 1A60     		str	r2, [r3]
  39:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	*STK_VAL = 0;
 137              		.loc 1 39 0
 138 0038 084B     		ldr	r3, .L6+8
 139 003a 0022     		movs	r2, #0
 140 003c 1A60     		str	r2, [r3]
  40:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	*STK_CTRL = 5;
 141              		.loc 1 40 0
 142 003e 054B     		ldr	r3, .L6
 143 0040 0522     		movs	r2, #5
 144 0042 1A60     		str	r2, [r3]
  41:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	while(*STK_CTRL & 0x00010000 == 0);
 145              		.loc 1 41 0
 146 0044 C046     		nop
  42:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	*STK_CTRL = 0;
 147              		.loc 1 42 0
 148 0046 034B     		ldr	r3, .L6
 149 0048 0022     		movs	r2, #0
 150 004a 1A60     		str	r2, [r3]
  43:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** }
 151              		.loc 1 43 0
 152 004c C046     		nop
 153 004e BD46     		mov	sp, r7
 154              		@ sp needed
 155 0050 80BD     		pop	{r7, pc}
 156              	.L7:
 157 0052 C046     		.align	2
 158              	.L6:
 159 0054 10E000E0 		.word	-536813552
 160 0058 14E000E0 		.word	-536813548
 161 005c 18E000E0 		.word	-536813544
 162              		.cfi_endproc
 163              	.LFE2:
 165              		.align	1
 166              		.global	delay_mikro
 167              		.syntax unified
 168              		.code	16
 169              		.thumb_func
 170              		.fpu softvfp
 172              	delay_mikro:
 173              	.LFB3:
  44:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 
  45:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** void delay_mikro(unsigned int ms) {
 174              		.loc 1 45 0
 175              		.cfi_startproc
 176              		@ args = 0, pretend = 0, frame = 16
 177              		@ frame_needed = 1, uses_anonymous_args = 0
 178 0060 80B5     		push	{r7, lr}
 179              		.cfi_def_cfa_offset 8
 180              		.cfi_offset 7, -8
 181              		.cfi_offset 14, -4
 182 0062 84B0     		sub	sp, sp, #16
 183              		.cfi_def_cfa_offset 24
 184 0064 00AF     		add	r7, sp, #0
 185              		.cfi_def_cfa_register 7
 186 0066 7860     		str	r0, [r7, #4]
  46:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	#ifdef SIMULATOR
  47:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		ms /= 1000;
  48:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		ms++;
  49:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	#endif
  50:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	
  51:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	while(ms > 0) {
 187              		.loc 1 51 0
 188 0068 0DE0     		b	.L9
 189              	.L12:
 190              	.LBB2:
  52:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		for(int i = 0; i < 4; i++) {
 191              		.loc 1 52 0
 192 006a 0023     		movs	r3, #0
 193 006c FB60     		str	r3, [r7, #12]
 194 006e 04E0     		b	.L10
 195              	.L11:
  53:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 			delay_250_ns();
 196              		.loc 1 53 0 discriminator 3
 197 0070 FFF7FEFF 		bl	delay_250_ns
  52:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		for(int i = 0; i < 4; i++) {
 198              		.loc 1 52 0 discriminator 3
 199 0074 FB68     		ldr	r3, [r7, #12]
 200 0076 0133     		adds	r3, r3, #1
 201 0078 FB60     		str	r3, [r7, #12]
 202              	.L10:
  52:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		for(int i = 0; i < 4; i++) {
 203              		.loc 1 52 0 is_stmt 0 discriminator 1
 204 007a FB68     		ldr	r3, [r7, #12]
 205 007c 032B     		cmp	r3, #3
 206 007e F7DD     		ble	.L11
 207              	.LBE2:
  54:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		}
  55:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		ms--;
 208              		.loc 1 55 0 is_stmt 1
 209 0080 7B68     		ldr	r3, [r7, #4]
 210 0082 013B     		subs	r3, r3, #1
 211 0084 7B60     		str	r3, [r7, #4]
 212              	.L9:
  51:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		for(int i = 0; i < 4; i++) {
 213              		.loc 1 51 0
 214 0086 7B68     		ldr	r3, [r7, #4]
 215 0088 002B     		cmp	r3, #0
 216 008a EED1     		bne	.L12
  56:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	}
  57:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** }
 217              		.loc 1 57 0
 218 008c C046     		nop
 219 008e BD46     		mov	sp, r7
 220 0090 04B0     		add	sp, sp, #16
 221              		@ sp needed
 222 0092 80BD     		pop	{r7, pc}
 223              		.cfi_endproc
 224              	.LFE3:
 226              		.align	1
 227              		.global	delay_milli
 228              		.syntax unified
 229              		.code	16
 230              		.thumb_func
 231              		.fpu softvfp
 233              	delay_milli:
 234              	.LFB4:
  58:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 
  59:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** void delay_milli(unsigned int ms) {
 235              		.loc 1 59 0
 236              		.cfi_startproc
 237              		@ args = 0, pretend = 0, frame = 8
 238              		@ frame_needed = 1, uses_anonymous_args = 0
 239 0094 80B5     		push	{r7, lr}
 240              		.cfi_def_cfa_offset 8
 241              		.cfi_offset 7, -8
 242              		.cfi_offset 14, -4
 243 0096 82B0     		sub	sp, sp, #8
 244              		.cfi_def_cfa_offset 16
 245 0098 00AF     		add	r7, sp, #0
 246              		.cfi_def_cfa_register 7
 247 009a 7860     		str	r0, [r7, #4]
  60:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	#ifdef SIMULATOR
  61:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		ms /= 1000;
  62:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		ms++;
  63:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	#endif
  64:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	
  65:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	while(ms > 0) {
 248              		.loc 1 65 0
 249 009c 07E0     		b	.L14
 250              	.L15:
  66:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		delay_mikro(1000);
 251              		.loc 1 66 0
 252 009e FA23     		movs	r3, #250
 253 00a0 9B00     		lsls	r3, r3, #2
 254 00a2 1800     		movs	r0, r3
 255 00a4 FFF7FEFF 		bl	delay_mikro
  67:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		ms--;
 256              		.loc 1 67 0
 257 00a8 7B68     		ldr	r3, [r7, #4]
 258 00aa 013B     		subs	r3, r3, #1
 259 00ac 7B60     		str	r3, [r7, #4]
 260              	.L14:
  65:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		delay_mikro(1000);
 261              		.loc 1 65 0
 262 00ae 7B68     		ldr	r3, [r7, #4]
 263 00b0 002B     		cmp	r3, #0
 264 00b2 F4D1     		bne	.L15
  68:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	}
  69:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** }
 265              		.loc 1 69 0
 266 00b4 C046     		nop
 267 00b6 BD46     		mov	sp, r7
 268 00b8 02B0     		add	sp, sp, #8
 269              		@ sp needed
 270 00ba 80BD     		pop	{r7, pc}
 271              		.cfi_endproc
 272              	.LFE4:
 274              		.align	1
 275              		.global	main
 276              		.syntax unified
 277              		.code	16
 278              		.thumb_func
 279              		.fpu softvfp
 281              	main:
 282              	.LFB5:
  70:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 
  71:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** void main(void)
  72:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** {
 283              		.loc 1 72 0
 284              		.cfi_startproc
 285              		@ args = 0, pretend = 0, frame = 0
 286              		@ frame_needed = 1, uses_anonymous_args = 0
 287 00bc 80B5     		push	{r7, lr}
 288              		.cfi_def_cfa_offset 8
 289              		.cfi_offset 7, -8
 290              		.cfi_offset 14, -4
 291 00be 00AF     		add	r7, sp, #0
 292              		.cfi_def_cfa_register 7
  73:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	app_init();
 293              		.loc 1 73 0
 294 00c0 FFF7FEFF 		bl	app_init
 295              	.L17:
  74:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 	while(1) {
  75:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		*GPIO_ODR_LOW = 0;
 296              		.loc 1 75 0 discriminator 1
 297 00c4 084B     		ldr	r3, .L18
 298 00c6 0022     		movs	r2, #0
 299 00c8 1A70     		strb	r2, [r3]
  76:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		delay_milli(500);
 300              		.loc 1 76 0 discriminator 1
 301 00ca FA23     		movs	r3, #250
 302 00cc 5B00     		lsls	r3, r3, #1
 303 00ce 1800     		movs	r0, r3
 304 00d0 FFF7FEFF 		bl	delay_milli
  77:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		*GPIO_ODR_LOW = 0xFF;
 305              		.loc 1 77 0 discriminator 1
 306 00d4 044B     		ldr	r3, .L18
 307 00d6 FF22     		movs	r2, #255
 308 00d8 1A70     		strb	r2, [r3]
  78:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		delay_milli(500);
 309              		.loc 1 78 0 discriminator 1
 310 00da FA23     		movs	r3, #250
 311 00dc 5B00     		lsls	r3, r3, #1
 312 00de 1800     		movs	r0, r3
 313 00e0 FFF7FEFF 		bl	delay_milli
  75:C:/Users/eriwes/Downloads/DAT017-master/Laboration1/LaborationsfilerC/lab_2_2\startup.c **** 		delay_milli(500);
 314              		.loc 1 75 0 discriminator 1
 315 00e4 EEE7     		b	.L17
 316              	.L19:
 317 00e6 C046     		.align	2
 318              	.L18:
 319 00e8 14100240 		.word	1073877012
 320              		.cfi_endproc
 321              	.LFE5:
 323              	.Letext0:
