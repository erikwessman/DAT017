/*
 * 	startup.c
 *
 */
#define GPIO_D 0x40020C00
#define GPIO_MODER ((volatile unsigned int *) GPIO_D);
#define GPIO_OTYPER ((volatile unsigned short *) (GPIO_D + 4);
#define GPIO_PUPDR ((volatile unsigned int *) (GPIO_D + 0xC));
 
__attribute__((naked)) __attribute__((section (".start_section")) )
void startup ( void )
{
__asm__ volatile(" LDR R0,=0x2001C000\n");		/* set stack */
__asm__ volatile(" MOV SP,R0\n");
__asm__ volatile(" BL main\n");					/* call main */
__asm__ volatile(".L1: B .L1\n");				/* never return */
}

void app_init(void) {
	*GPIO_MODER &= 0x0000FFFF;
	*GPIO_OTYPER &= 0xFFFF00FF;
	*GPIO_PUPDR &= 0x0000FFFF;
	
	*GPIO_MODER |= 0x55000000;
	*GPIO_PUPDR |= 0x00AA0000;
}

void main(void) {
}

