/*
 * 	startup.c
 *
 */
 
#define STK_BASE 0xE000E010
#define STK_CTRL (unsigned int *) STK_BASE
#define STK_LOAD (unsigned int *) (STK_BASE + 4)
#define STK_VAL (unsigned int *) (STK_BASE + 8)
 
#define GPIO_E 0x40021000
#define GPIO_MODER ((volatile unsigned int *) GPIO_E)
#define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E + 4))
#define GPIO_OSPEEDR ((volatile unsigned short *) (GPIO_E + 8))
#define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E + 0xC))
#define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E + 0x10))
#define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E + 0x11))
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E + 0x14))
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E + 0x15))
 
#define B_E	0x40
#define B_SELECT 4
#define B_RW 2
#define B_RS 1
#define B_RST 0x20
#define B_CS2 0x10
#define B_CS1 8

#define LCD_ON 0x3F // Display on
#define LCD_OFF 0x3E // Display off
#define LCD_SET_ADD 0x40 // Set horizontal coordinate
#define LCD_SET_PAGE 0xB8 // Set vertical coordinate
#define LCD_DISP_START 0xC0 // Start address
#define LCD_BUSY 0x80 // Read busy status

typedef unsigned char uint8_t;

__attribute__((naked)) __attribute__((section (".start_section")) )
void startup ( void )
{
__asm__ volatile(" LDR R0,=0x2001C000\n");		/* set stack */
__asm__ volatile(" MOV SP,R0\n");
__asm__ volatile(" BL main\n");					/* call main */
__asm__ volatile(".L1: B .L1\n");				/* never return */
}

void app_init() {
	*GPIO_MODER &= 0x00000000;
	*GPIO_MODER |= 0x55555555;
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

void delay_500_ns(void) {
	*STK_CTRL = 0;
	*STK_LOAD = (168-1)/2;
	*STK_VAL = 0;
	*STK_CTRL = 5;
	while(*STK_CTRL & 0x00010000 == 0);
	*STK_CTRL = 0;
}

void delay_micro(unsigned int ms) {
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
		delay_micro(1000);
		ms--;
	}
}

void graphic_ctrl_bit_set(uint8_t x) {
	uint8_t c = *GPIO_ODR_LOW;
	c &= ~B_SELECT;
	c |= (~B_SELECT & x);
	*GPIO_ODR_LOW = c;
}

void graphic_ctrl_bit_clear(uint8_t x) {
	uint8_t c = *GPIO_ODR_LOW;
	c &= ~B_SELECT;
	c &= ~x;
	*GPIO_ODR_LOW = c;
}

void select_controller(controller) {
	switch(controller) {
		case 0: 
			graphic_ctrl_bit_clear(B_CS1|B_CS2);
			break;
		case B_CS1: 
			graphic_ctrl_bit_clear(B_CS2);
			graphic_ctrl_bit_set(B_CS1);
			break;
		case B_CS2: 
			graphic_ctrl_bit_clear(B_CS1);
			graphic_ctrl_bit_set(B_CS2);
			break;
		case B_CS1|B_CS2: 
			graphic_ctrl_bit_set(B_CS1|B_CS2);
			break;
	}
}

void graphic_wait_ready(void) {
	graphic_ctrl_bit_set(B_E);
	*GPIO_MODER = 0x00005555;
	graphic_ctrl_bit_clear(B_RS);
	graphic_ctrl_bit_set(B_RW);
	delay_500_ns;
	while(1) {
		graphic_ctrl_bit_set(B_E);
		delay_500_ns;
		graphic_ctrl_bit_clear(B_E);
		delay_500_ns;
		if((*GPIO_ODR_LOW & LCD_BUSY) == 0) {
			break;
		}
	}
	graphic_ctrl_bit_set(B_E);
	*GPIO_MODER = 0x55555555;
}

uint8_t graphic_read(uint8_t controller) {
	uint8_t return_value;
	graphic_ctrl_bit_clear(B_E);
	*GPIO_MODER = 0x00005555;
	graphic_ctrl_bit_set(B_RS);
	graphic_ctrl_bit_set(B_RW);
	select_controller(controller);
	delay_500_ns;
	graphic_ctrl_bit_set(B_E);
	return_value = *GPIO_ODR_HIGH;
	graphic_ctrl_bit_clear(B_E);
	*GPIO_MODER = 0x55555555;
	
	if(controller == B_CS1) {
		select_controller(B_CS1);
		graphic_wait_ready();
	} else if(controller == B_CS2) {
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	return return_value;
}

void graphic_write(uint8_t value, uint8_t controller) {
	*GPIO_ODR_HIGH = value;
	select_controller(controller);
	delay_500_ns;
	graphic_ctrl_bit_set(B_E);
	delay_500_ns;
	graphic_ctrl_bit_clear(B_E);
	
	if(controller & B_CS1) {
		select_controller(B_CS1);
		graphic_wait_ready();
	} else if(controller & B_CS2) {
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	
	*GPIO_ODR_HIGH = 0;
	graphic_ctrl_bit_set(B_E);
	select_controller(0);
}

void graphic_write_command(uint8_t command, uint8_t controller) {
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	graphic_ctrl_bit_clear(B_RS);
	graphic_ctrl_bit_clear(B_RW);
	graphic_write(command, controller);
}

void graphic_write_data(uint8_t data, uint8_t controller) {
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	graphic_ctrl_bit_set(B_RS);
	graphic_ctrl_bit_clear(B_RW);
	graphic_write(data, controller);
}

uint8_t graphic_read_data(uint8_t controller) {
	graphic_read(controller);
	return graphic_read(controller);
}

void graphic_initialize(void) {
	graphic_ctrl_bit_set(B_E);
	delay_micro(10);
	graphic_ctrl_bit_clear(B_CS1);
	graphic_ctrl_bit_clear(B_CS2);
	graphic_ctrl_bit_clear(B_RST);
	graphic_ctrl_bit_clear(B_E);
	delay_milli(30);
	graphic_ctrl_bit_set(B_RST);
	graphic_write_command(LCD_OFF, B_CS1|B_CS2);
	graphic_write_command(LCD_ON, B_CS1|B_CS2);
	graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
	graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
	graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
	select_controller(0);
}

void graphic_clear_screen(void) {
	for(int page = 0; page < page; page++) {
		graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
		graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
		for(int address = 0; address < 64; address++) {
			graphic_write_data(0, B_CS1|B_CS2);
		}
	}
}

void main(void)
{
	app_init();
	graphic_initialize();
	#ifndef SIMULATOR
		graphic_clear_screen();
	#endif
	
	graphic_write_command(LCD_SET_ADD | 10, B_CS1|B_CS2);
	graphic_write_command(LCD_SET_PAGE | 1, B_CS1|B_CS2);
	graphic_write_data(0xFF, B_CS1|B_CS2);
}

