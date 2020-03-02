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
#define GPIO_D_MODER ((volatile unsigned int *) GPIO_D)
#define GPIO_D_OTYPER ((volatile unsigned short *) (GPIO_D + 4))
#define GPIO_D_OSPEEDR ((volatile unsigned short *) (GPIO_D + 8))
#define GPIO_D_PUPDR ((volatile unsigned int *) (GPIO_D + 0xC))
#define GPIO_D_IDR_LOW ((volatile unsigned char *) (GPIO_D + 0x10))
#define GPIO_D_IDR_HIGH ((volatile unsigned char *) (GPIO_D + 0x11))
#define GPIO_D_ODR_LOW ((volatile unsigned char *) (GPIO_D + 0x14))
#define GPIO_D_ODR_HIGH ((volatile unsigned char *) (GPIO_D + 0x15))

#define GPIO_E 0x40021000
#define GPIO_E_MODER ((volatile unsigned int *) GPIO_E)
#define GPIO_E_OTYPER ((volatile unsigned short *) (GPIO_E + 4))
#define GPIO_E_OSPEEDR ((volatile unsigned short *) (GPIO_E + 8))
#define GPIO_E_PUPDR ((volatile unsigned int *) (GPIO_E + 0xC))
#define GPIO_E_IDR_LOW ((volatile unsigned char *) (GPIO_E + 0x10))
#define GPIO_E_IDR_HIGH ((volatile unsigned char *) (GPIO_E + 0x11))
#define GPIO_E_ODR_LOW ((volatile unsigned char *) (GPIO_E + 0x14))
#define GPIO_E_ODR_HIGH ((volatile unsigned char *) (GPIO_E + 0x15))

#define SYSCFG_EXTICR1 0x40013808

#define EXTI_IMR 0x40013C00
#define EXTI_RTSR 0x40013C08
#define EXTI_FTSR 0x40013C0C
#define EXTI_PR ((volatile unsigned int *) 0x40013C14)

#define NVIC_ISER0 0xE000E100

unsigned int count = 0;

void EXTI3_irq_handler(void) {
	if(*GPIO_E_IDR_LOW & 8) {
		*EXTI_PR |= 1<<3;
		if (*GPIO_E_IDR_LOW & 1) {
			*GPIO_E_ODR_LOW |= 1<<4;
			*GPIO_E_ODR_LOW &= ~1<<4;
			count++;
		} else if(*GPIO_E_IDR_LOW & 2) {
			*GPIO_E_ODR_LOW |= 1<<5;
			*GPIO_E_ODR_LOW &= ~1<<5;
			count = 0;
		} else if(*GPIO_E_IDR_LOW & 4) {
			*GPIO_E_ODR_LOW |= 1<<6;
			*GPIO_E_ODR_LOW &= ~1<<6;
			if (count == 0xFF) {
				count = 0;
			} else {
				count = 0xFF;
			}
		}
	} 
}

void app_init(void) {
	*GPIO_D_MODER &= 0x00000000;
	*GPIO_D_MODER |= 0x55555555;
	
	*GPIO_E_MODER &= 0xFFFF0000;
	*GPIO_E_MODER |= 0x00005500;
	
	// PE3 -> EXTI3
	*((unsigned int*) SYSCFG_EXTICR1) &= ~0xF000;
	*((unsigned int*) SYSCFG_EXTICR1) |= 0x4000;
	
	*((unsigned int*) 0x40013C00) |= 8;
	*((unsigned int*) 0x40013C08) |= 8;
	
	*((void (**)(void)) 0x2001C064 ) = EXTI3_irq_handler;
	
	*((unsigned int*) NVIC_ISER0) |= 1<<9;
}

void main(void)
{
	app_init();
	while(1) {
		*GPIO_D_ODR_LOW = count;
	}
	
}