/*
* Light_WS2812 library example - RGB_blinky
*
* cycles one LED through red, green, blue
*
* This example is configured for a ATtiny85 with PLL clock fuse set and
* the WS2812 string connected to PB4.
*/

//6266 bytes left

#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include "ws2812.h"
#include "program.h"

#define PROG_RESET 0x0000

void setColor(tRGB *c, tRGB *baseColor, unsigned char brightness)
{
	c->r = baseColor->r ;//< brightness ? 0 : baseColor->r - brightness;
	c->g = baseColor->g ;//< brightness ? 0 : baseColor->g - brightness;
	c->b = baseColor->b ;//< brightness ? 0 : baseColor->b - brightness;
}

#define NO_KEY 0
#define SHORT_PRESS 1
#define LONG_PRESS 2
#define INTERP_STEPS 128

uchar keyPress()
{
	static unsigned char btnTimer=0;
	
	uchar btnPressed = 0;
	uchar retVal = NO_KEY;

	if(!(JUMPER_INP&_BV(JUMPER_PIN)))
	{
		_delay_ms(5);
		if(!(JUMPER_INP&_BV(JUMPER_PIN)) /*&& !btnPressed*/)
		{
			btnPressed = 1;
			
			if(btnTimer < 255)
				btnTimer++;
		}		
	}
	
	
	if(btnPressed)
	{
		if(btnTimer > 150 && (btnTimer & 0x2))
		{	
			retVal = LONG_PRESS;//curBrightness++;
		}
	}
	else
	{
		if(btnTimer > 0 && btnTimer < 150)
		{
			retVal = SHORT_PRESS;
		}
		btnTimer = 0;
	}
	
	return retVal;
}

void initHw()
{
	//disable pin change and int0
	GIMSK = 0;
	PCMSK = 0;
	
	//disable peripheral clocks for adc usi and tmr0 tmr1
	PRR = 0xF;
	
	//disable adc
	ADCSRA = 0;
	
	//disable tim0
	TCCR0B = 0;
	
	//dsable tim1
	TCCR1 = 0;
	
	//disable USI
	USICR = 0;
	
	//disable analog comparator
	ACSR = 1<<ACD;

	//set clock to 4Mhz
	CLKPR = 1<<CLKPCE;
	CLKPR = 1<<CLKPS1;
	
	sleep_disable();

	JUMPER_DDR &= ~_BV(JUMPER_PIN);
	JUMPER_PORT |= _BV(JUMPER_PIN);
	
	//disable rbg led power
	DDRB |= 1<<2;
	PORTB |= (1<<2);
	
	_delay_ms(1);
}

void gotoSleep(void)
{
	unsigned char mcucr1, mcucr2;
	
	DDRB &= ~(1<<1 | 1<<2);
	PORTB &= ~(1<<1 | 1<<2 /*| 1<<3 | 1<<4*/);
	//PORTB |= 1<<2;

	cli();
	
	//disable peripheral clocks for adc usi and tmr0 tmr1
	PRR = 0xF;

	//set clock back to 16Mhz for bootloader
	CLKPR = 1<<CLKPCE;
	CLKPR = 0;

	//enable pin change interrupt
	GIMSK |= 1<<PCIE;
	PCMSK |= 1<<PCINT0;
	
	//prepare sleep mode = power down
	mcucr1 = (1<<SE | 1<<SM1 | 1<<BODS | 1<<BODSE);
	mcucr2 = (1<<SE | 1<<SM1 | 1<<BODS);
	
	sei();
	
	//try to dosable BOD
	MCUCR = 0xb4;//mcucr1;
	MCUCR = 0xb0;//mcucr2;
	
	__asm__ __volatile__ ("sleep" "\n\t" :: );
}

//when exiting sleep reset the part
ISR(PCINT0_vect)
{
	//set clock back to 16Mhz
	//CLKPR = 1<<CLKPCE;
	//CLKPR = 0;
	
	volatile uchar key = NO_KEY;
	
	//wait for short or long press
	do
	{
		key = keyPress();
	}
	while(key == NO_KEY);
	
	//if longpress bootloader will be invoked, 
	//else bootloader will be skipped
	
	//jump to bootloader
	(*((void(*)(void))PROG_RESET))();
}

void resetProgram(uchar program, unsigned short *interpDelay)
{
	g_curProgram.curStep = 0;
	*interpDelay = gPrograms[program].steps[g_curProgram.curStep / 2].dur0;  
	g_curProgram.curColor = gPrograms[program].pal->pal[gPrograms[program].steps[0].col];
	
	if(gPrograms[program].steps[1].op == CMD_LAST)
	{
		g_curProgram.nextColor = g_curProgram.curColor;

	}
	else g_curProgram.nextColor = gPrograms[program].pal->pal[gPrograms[program].steps[1].col];
}

void doProgramLoop(uchar program, unsigned char interpStep)
{
	volatile tRGB interpCol;
	if(g_curProgram.curStep % 2 == 0)
	{
		interpCol = g_curProgram.curColor;
	}
	else
	{
		interpCol.r=((unsigned short)g_curProgram.curColor.r * (INTERP_STEPS - interpStep) + (unsigned short)g_curProgram.nextColor.r * interpStep) / INTERP_STEPS;
		interpCol.g=((unsigned short)g_curProgram.curColor.g * (INTERP_STEPS - interpStep) + (unsigned short)g_curProgram.nextColor.g * interpStep) / INTERP_STEPS;
		interpCol.b=((unsigned short)g_curProgram.curColor.b * (INTERP_STEPS - interpStep) + (unsigned short)g_curProgram.nextColor.b * interpStep) / INTERP_STEPS;
		
	}
	
	interpCol.r=0;
	interpCol.g=0;
	interpCol.b=1;
	ws2812_setleds(&interpCol, 1);
}

void advanceStep(uchar program, unsigned short *interpDelay)
{
	uchar nextStep = (g_curProgram.curStep + 1)%(2*MAX_PROG_STEPS);
	
	if((nextStep % 2 == 0) && gPrograms[program].steps[nextStep/2].op == CMD_LAST)
	{
		g_curProgram.curStep = 0;
		nextStep = 0;
	}
	else
	{
		g_curProgram.curStep = nextStep;
	}
	
	nextStep = (g_curProgram.curStep/2 + 1)%(MAX_PROG_STEPS);
	
	if(gPrograms[program].steps[nextStep].op == CMD_LAST)
	{
		nextStep= 0;
	}

	
	if(g_curProgram.curStep % 2 == 0)
	{
		*interpDelay = gPrograms[program].steps[g_curProgram.curStep / 2].dur0;
		
	}
	else
	{
		*interpDelay = gPrograms[program].steps[g_curProgram.curStep / 2].dur1;
	}
	
	g_curProgram.curColor = gPrograms[program].pal->pal[gPrograms[program].steps[g_curProgram.curStep / 2].col];
	g_curProgram.nextColor = gPrograms[program].pal->pal[gPrograms[program].steps[nextStep].col];

}

int main(void)
{
	volatile unsigned char curTime = 0;
	volatile uchar curProgram = 2;
	//char curBrightness = 0;
	
	volatile unsigned short interpStep = 1;

	initHw();
	
	resetProgram(curProgram, &interpStep);

	do
	{	

		switch(keyPress())
		{
			case NO_KEY:
			break;
			
			case SHORT_PRESS:
			{
				curProgram = (curProgram + 1) % NUM_PROGS;
				resetProgram(curProgram, &interpStep);
				curTime = 0;
				break;
			}
			case LONG_PRESS:
			{
				//set led off
				tRGB col;
				col.r = col.g = col.b = 128;
				ws2812_setleds(&col, 1);

				//wait for button release
				while(!(JUMPER_INP&_BV(JUMPER_PIN)))
				;

				//reset keypress
				keyPress();

				col.r = col.g = col.b = 1;
				ws2812_setleds(&col, 1);

				gotoSleep();
				break;
			}
		}

		curTime = (curTime + 1) % INTERP_STEPS;

		if(curTime == 0 || interpStep == 0)
		{
			advanceStep(curProgram, &interpStep);
		}
		
		doProgramLoop(curProgram, curTime);

		_delay_ms(interpStep);

	}
	while(1);
}
