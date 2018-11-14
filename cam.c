// #define __AVR_ATmega328P__
#define F_CPU 16000000UL
// #define __OPTIMIZE__
#include <avr/io.h>
#include <util/delay.h>


int main()
{
	DDRB = 0xFF;
	PORTB = 0x00;

	while (1)
	{
		PORTB &= 0x00;       //turn LED off
		_delay_ms(100);   //wait for half second
		PORTB |= 0xFF;       //turn LED on
		_delay_ms(100);   //wait for half second
	};
	// unsigned char j = 0;
	// for (j = 0; j < 254; j++) {
	// 	unsigned char i = 0;
	// 	unsigned char f = 0;
	// 	for (i = 0; i < 254; i++) {
	// 		f = f + 1;
	// 		f = f - 1;
	// 	}
	// 	// _delay_ms(1000);
	// 	PORTB = ~PORTB;
	// }
	return 0;
}
