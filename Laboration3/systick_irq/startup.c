/*
 * 	startup.c
 *
 */
__attribute__((naked)) __attribute__((section (".start_section")) )
void startup ( void )
{
__asm__ volatile(" LDR R0,=0x2001C000\n");		/* set stack */
__asm__ volatile(" MOV SP,R0\n");
__asm__ volatile(" BL main\n");					/* call main */
__asm__ volatile(".L1: B .L1\n");				/* never return */
}

#define STK_BASE 0xE000E010
#define STK_CTRL (unsigned int *) STK_BASE
#define STK_LOAD (unsigned int *) (STK_BASE + 4)
#define STK_VAL (unsigned int *) (STK_BASE + 8)

#define GPIO_D 0x40020C00
#define GPIO_MODER ((volatile unsigned int *) GPIO_D)
#define GPIO_OTYPER ((volatile unsigned short *) (GPIO_D + 4))
#define GPIO_OSPEEDR ((volatile unsigned short *) (GPIO_D + 8))
#define GPIO_PUPDR ((volatile unsigned int *) (GPIO_D + 0xC))
#define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D + 0x10))
#define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D + 0x11))
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D + 0x14))
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D + 0x15))

#define SIMULATOR

#ifdef SIMULATOR
#define DELAY_COUNT 100
#else
#define DELAY_COUNT 1000000
#endif

static volatile int systick_flag;
static volatile int delay_count;

void systick_irq_handler() {
	*STK_CTRL = 0;
	delay_count--;
	
	if(delay_count > 0) {
		delay_1mikro();
	} else {
		systick_flag = 1;
	}
}

void delay_1mikro(void) {
	systick_flag = 0;
	*STK_CTRL = 0;
	*STK_LOAD = ( 168 -1 );
	*STK_VAL = 0;
	*STK_CTRL = 7;
}

void delay(unsigned int count) {
	if( count == 0)
		return;
	delay_count = count;
	systick_flag = 0;
	delay_1mikro();
}

void app_init(void) {
	*GPIO_MODER &= 0x00000000;
	*GPIO_MODER |= 0x55555555;
	
//	#define SCB_VTOR (volatile unsigned int *) 0xE000ED08
//	*SCB_VTOR = 0x2001C000;

	*((void (**)(void) ) 0x2001C03C ) = systick_irq_handler;
}

void main(void) {
	app_init();
	*GPIO_ODR_LOW = 0;
	delay(DELAY_COUNT);
	*GPIO_ODR_LOW = 0xFF;
	
	unsigned char c = 0;
	
	while(1) {
		if(systick_flag)
			break;
			
		*GPIO_ODR_HIGH = c;
		c++;
	}
	
	*GPIO_ODR_LOW = 0;
}

