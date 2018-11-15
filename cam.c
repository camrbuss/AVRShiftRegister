#include <avr/io.h>
#include <util/delay.h>


int main()
{
	DDRB = 0xFF;
	PORTB = 0x00;

	while (1)
	{
		PORTB &= 0x00;       //turn LED off
		_delay_ms(1000);   //wait for half second
		PORTB |= 0xFF;       //turn LED on
		_delay_ms(1000);   //wait for half second
	}

	return 0;
}
