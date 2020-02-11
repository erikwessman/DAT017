/*
 * 	startup.c
 *
 */
 
#define STK_BASE 0xE000E010
#define STK_CTRL (unsigned int *) STK_BASE
#define STK_LOAD (unsigned int *) (STK_BASE + 4)
#define STK_VAL (unsigned int *) (STK_BASE + 8)
 
#define GPIO_E 0x40021000
#define GPIO_MODER ((volatile unsigned int *) GPIO_D)
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D + 0x14))
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D + 0x15))

__attribute__((naked)) __attribute__((section (".start_section")) )
void startup ( void )
{
__asm__ volatile(" LDR R0,=0x2001C000\n");		/* set stack */
__asm__ volatile(" MOV SP,R0\n");
__asm__ volatile(" BL main\n");					/* call main */
__asm__ volatile(".L1: B .L1\n");				/* never return */
}

#define SIMULATOR

void delay_250_ns(void) {
	*STK_CTRL = 0;
	*STK_LOAD = (168-1)/4;
	*STK_VAL = 0;
	*STK_CTRL = 5;
	while(*STK_CTRL & 0x00010000 == 0);
	*STK_CTRL = 0;
}

void delay_mikro(unsigned int ms) {
	#ifdef SIMULATOR
		ms /= 1000;
		ms++;
	#endif
	
	while(ms > 0) {
		for(int i = 0; i < 4; i++) {
			delay_250_ns;
		}
		ms--;
	}
}

void delay_milli(unsigned int ms) {
	#ifdef SIMULATOR
		ms /= 1000;
		ms++;
	#endif
	
	while(ms > 0) {
		delay_mikro(1000);
		ms--;
	}
}

void main(void)
{
}

