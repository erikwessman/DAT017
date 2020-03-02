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

#define GPIO_D 0x40020C00
#define GPIO_MODER ((volatile unsigned int *) GPIO_D)
#define GPIO_OTYPER ((volatile unsigned short *) (GPIO_D + 4))
#define GPIO_OSPEEDR ((volatile unsigned short *) (GPIO_D + 8))
#define GPIO_PUPDR ((volatile unsigned int *) (GPIO_D + 0xC))
#define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D + 0x10))
#define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D + 0x11))
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D + 0x14))
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D + 0x15))

#define GPIO_E 0x40021000
#define GPIO_E_MODER ((volatile unsigned int *) GPIO_E)
#define GPIO_E_IDR_LOW ((volatile unsigned char *) (GPIO_E + 0x10))
#define GPIO_E_ODR_LOW ((volatile unsigned char *) (GPIO_E + 0x14))

#define SYSCFG_EXTICR1 0x40013808

#define EXTI_IMR 0x40013C00
#define EXTI_RTSR 0x40013C08
#define EXTI_FTSR 0x40013C0C
#define EXTI_PR 0x40013C14

#define NVIC_ISER0 0xE000E100

unsigned int count = 0;

void EXTI3_irq_handler(void) {
	if(*((unsigned int*) EXTI_PR) & 8) {
		count++;
		*((unsigned int*) EXTI_PR) |= 8;
		*GPIO_E_ODR_LOW |= 1<<4;
		*GPIO_E_ODR_LOW &= ~1<<4;
	} 
}

void app_init(void) {
	*GPIO_MODER &= 0xFFFF0000;
	*GPIO_MODER |= 0x00005555;
	
	*GPIO_E_MODER &= 0xFFFF0000;
	*GPIO_E_MODER |= 0x00005500;
	
	*((unsigned int*) SYSCFG_EXTICR1) &= ~0xF000;
	// PE3 -> EXTI3
	*((unsigned int*) SYSCFG_EXTICR1) |= 0x4000;
	
	*((unsigned int*) 0x40013C00) |= 8;
	*((unsigned int*) 0x40013C08) |= 8;
	*((unsigned int*) 0x40013C0C) &= ~8;
	
	*((void (**)(void)) 0x2001C064 ) = EXTI3_irq_handler;
	
	*((unsigned int*) NVIC_ISER0) |= 1<<9;
}

void main(void)
{
	app_init();
	while(1) {
		*GPIO_ODR_LOW = count;
	}
	
}