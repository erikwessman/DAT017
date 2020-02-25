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

__attribute__((naked)) __attribute__((section (".start_section")) )
void startup ( void )
{
__asm__ volatile(" LDR R0,=0x2001C000\n");		/* set stack */
__asm__ volatile(" MOV SP,R0\n");
__asm__ volatile(" BL main\n");					/* call main */
__asm__ volatile(".L1: B .L1\n");				/* never return */
}

#define USBDM




void delay_250_ns(void) {
	*STK_CTRL = 0;
	*STK_LOAD = (168-1)/4;
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
			delay_250_ns();
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

void ascii_ctrl_bit_set(unsigned char c) {
	unsigned char current = *GPIO_ODR_LOW;
	*GPIO_ODR_LOW = B_SELECT | current | c;
}

void ascii_ctrl_bit_clear(unsigned char c) {
	unsigned char current = *GPIO_ODR_LOW;
	*GPIO_ODR_LOW = B_SELECT | (current & ~c);
}

void ascii_write_controller(unsigned char byte) {
	ascii_ctrl_bit_set(B_E);
	*GPIO_ODR_HIGH = byte;
	delay_250_ns();
	ascii_ctrl_bit_clear(B_E);
}

void ascii_write_cmd(unsigned char command) {
	ascii_ctrl_bit_clear(B_RS);
	ascii_ctrl_bit_clear(B_RW);
	ascii_write_controller(command);
}

void ascii_write_data(unsigned char data) {
	ascii_ctrl_bit_set(B_RS);
	ascii_ctrl_bit_clear(B_RW);
	ascii_write_controller(data);
}

unsigned char ascii_read_controller(void) {
	unsigned char return_value;
	ascii_ctrl_bit_set(B_E);
	delay_250_ns();
	delay_250_ns();
	return_value = *GPIO_ODR_HIGH;
	ascii_ctrl_bit_clear(B_E);
	return return_value;
}

unsigned char ascii_read_status(void) {
	unsigned char return_value;
	*GPIO_MODER &= 0x0000FFFF;
	ascii_ctrl_bit_clear(B_RS);
	ascii_ctrl_bit_set(B_RW);
	return_value = ascii_read_controller();
	*GPIO_MODER |= 0x55550000;
}

unsigned char ascii_read_data(void) {
	unsigned char return_value;
	*GPIO_MODER &= 0x0000FFFF;
	ascii_ctrl_bit_set(B_RS);
	ascii_ctrl_bit_set(B_RW);
	return_value = ascii_read_controller();
	*GPIO_MODER |= 0x55550000;
}

void ascii_init(void) {
	//Function set
	while((ascii_read_status() & 0x80) == 0x80);
	delay_micro(8);
	ascii_write_cmd(0x38);
	delay_micro(40);
	
	//Display control
	while((ascii_read_status() & 0x80) == 0x80);
	delay_micro(8);
	ascii_write_cmd(0x0E);
	delay_micro(40);
	
	//Clear display
	while((ascii_read_status() & 0x80) == 0x80);
	delay_micro(8);
	ascii_write_cmd(1);
	delay_micro(2);

	//Entry mode set
	while((ascii_read_status() & 0x80) == 0x80);
	delay_micro(8);
	ascii_write_cmd(0x06);
	delay_micro(40);
}

void ascii_gotoxy(int row, int column) {
	int address = row - 1;
	if (column == 2) {
		address += 0x40;
	}
	ascii_write_cmd(0x80 | address);
}

void ascii_write_char(unsigned char c) {
	while((ascii_read_status() & 0x80) == 0x80);
	delay_micro(8);
	ascii_write_data(c);
	delay_micro(45);
}

void app_init() {
	#ifdef USBDM
		*((unsigned long *) 0x40023830) = 0x18;
		__asm volatile(" LDR R0,= 0x08000209\n BLX R0 \n");
	#endif
	*GPIO_MODER &= 0x00000000;
	*GPIO_MODER |= 0x55555555;
}

void main(int argc, char **argv)
{
	char *s;
	char test1[] = "Test";
	char test2[] = "123";
	
	app_init();
	ascii_init();
	delay_milli(1);
	ascii_gotoxy(1,1);
	delay_milli(1);
	s = test1;
	while(*s) {
		ascii_write_char(*s++);
	}
	delay_milli(1);
	ascii_gotoxy(1,2);
	delay_milli(1);
	s = test2;
	while(*s) {
		ascii_write_char(*s++);
	}
	return 0;
}

