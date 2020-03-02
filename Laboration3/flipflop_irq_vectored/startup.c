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
#define GPIO_E_PUPDR ((volatile unsigned int *) (GPIO_E + 0xC))
#define GPIO_E_IDR_LOW ((volatile unsigned char *) (GPIO_E + 0x10))
#define GPIO_E_ODR_LOW ((volatile unsigned char *) (GPIO_E + 0x14))

#define SYSCFG_BASE ((volatile unsigned int *) 0x40013800)
#define SYSCFG_EXTICR1 ((volatile unsigned int *) 0x40013808)
#define EXTI_IMR ((volatile unsigned int *) 0x40013C00)
#define EXTI_FTSR ((volatile unsigned int *) 0x40013C0C)
#define EXTI_RTSR ((volatile unsigned int *) 0x40013C08)
#define EXTI_PR ((volatile unsigned int *) 0x40013C14)

#define EXTI3_IRQVEC ((void (**) (void)) 0x2001C064)
#define EXTI2_IRQVEC ((void (**) (void)) 0x2001C060)
#define EXTI1_IRQVEC ((void (**) (void)) 0x2001C05C)
#define EXTI0_IRQVEC ((void (**) (void)) 0x2001C058)

#define NVIC_ISER0 ((volatile unsigned int *) 0xE000E100)
#define NVIC_EXTI3_IRQ_BPOS 1<<9
#define NVIC_EXTI2_IRQ_BPOS 1<<8
#define NVIC_EXTI1_IRQ_BPOS 1<<7
#define NVIC_EXTI0_IRQ_BPOS 1<<6

#define EXTI3_IRQ_BPOS 1<<3
#define EXTI2_IRQ_BPOS 1<<2
#define EXTI1_IRQ_BPOS 1<<1
#define EXTI0_IRQ_BPOS 1

unsigned int count = 0;

void EXTI0_irq_handler(void) {
	if(*EXTI_PR & EXTI0_IRQ_BPOS) {
		*GPIO_E_ODR_LOW |= 1<<4;
		*GPIO_E_ODR_LOW &= ~(1<<4);
		*EXTI_PR |= EXTI0_IRQ_BPOS;
		count++;
	}
}

void EXTI1_irq_handler(void) {
	if(*EXTI_PR & EXTI1_IRQ_BPOS) {
		*GPIO_E_ODR_LOW |= 1<<5;
		*GPIO_E_ODR_LOW &= ~(1<<5);
		*EXTI_PR |= EXTI1_IRQ_BPOS;
		count = 0;
	}
}

void EXTI2_irq_handler(void) {
	if(*EXTI_PR & EXTI2_IRQ_BPOS) {
		*GPIO_E_ODR_LOW |= 1<<6;
		*GPIO_E_ODR_LOW &= ~(1<<6);
		*EXTI_PR |= EXTI2_IRQ_BPOS;
		if (count == 0xFF) {
				count = 0;
		} else {
			count = 0xFF;
		}
	}
}

void app_init(void) {
	*GPIO_D_MODER &= 0x00000000;
	*GPIO_D_MODER |= 0x55555555;
	
	*GPIO_E_MODER &= 0xFFFF0000;
	*GPIO_E_MODER |= 0x00005500;
	*GPIO_E_PUPDR = 0;
	*GPIO_E_OTYPER = 0;
	
	// PE0 -> EXTI0
	*((unsigned int*) SYSCFG_EXTICR1) &= ~0x000F;
	*((unsigned int*) SYSCFG_EXTICR1) |= 0x0004;
	
	// PE1 -> EXTI1
	*((unsigned int*) SYSCFG_EXTICR1) &= ~0x00F0;
	*((unsigned int*) SYSCFG_EXTICR1) |= 0x0040;
	
	// PE2 -> EXTI2
	*((unsigned int*) SYSCFG_EXTICR1) &= ~0x0F00;
	*((unsigned int*) SYSCFG_EXTICR1) |= 0x0400;
	
	*EXTI_IMR |= EXTI0_IRQ_BPOS | EXTI1_IRQ_BPOS | EXTI2_IRQ_BPOS;
	*EXTI_RTSR |= EXTI0_IRQ_BPOS | EXTI1_IRQ_BPOS | EXTI2_IRQ_BPOS;
	
	*((void (**)(void)) EXTI2_IRQVEC ) = EXTI2_irq_handler;
	*((void (**)(void)) EXTI1_IRQVEC ) = EXTI1_irq_handler;
	*((void (**)(void)) EXTI0_IRQVEC ) = EXTI0_irq_handler;
	
	*((unsigned int*) NVIC_ISER0) |= NVIC_EXTI0_IRQ_BPOS | NVIC_EXTI1_IRQ_BPOS | NVIC_EXTI2_IRQ_BPOS;
}

void main(void)
{
	app_init();
	while(1) {
		*GPIO_D_ODR_LOW = count;
	}
}

