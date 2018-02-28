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
			
			if(btnTimer < 15)
				btnTimer++;
		}		
	}
	
	
	if(btnPressed)
	{
		if(btnTimer >= 15 /*&& (btnTimer & 0x2)*/)
		{	
			retVal = LONG_PRESS;
		}
	}
	else
	{
		if(btnTimer > 0 && btnTimer < 15)
		{
			retVal = SHORT_PRESS;
		}
		btnTimer = 0;
	}
	
	return retVal;
}

void initHw()
{
	//disable interrupts
	cli();
	
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

	//set clock back to 16Mhz for bootloader
	CLKPR = 1<<CLKPCE;
	CLKPR = 0;

	//enable pin change interrupt
	GIMSK |= 1<<PCIE;
	PCMSK |= 1<<PCINT0;
	
	sei();
	
	//try to dosable BOD
	MCUCR = (1<<SE | 1<<SM1 | 1<<BODS | 1<<BODSE);
	MCUCR = (1<<SE | 1<<SM1 | 1<<BODS);
	
	__asm__ __volatile__ ("sleep" "\n\t" :: );
}

//when exiting sleep reset the part
ISR(PCINT0_vect)
{
;
}


void advanceStep(uchar program)
{
	g_curProgram.curStep = (g_curProgram.curStep + 1);
	if(g_curProgram.curStep >= g_curProgram.numStep)
	{
		g_curProgram.curStep = 0;
	}

	uchar nextStep = (g_curProgram.curStep + 1);
	if(nextStep >= g_curProgram.numStep)
	{
		nextStep = 0;
	}
	
	g_curProgram.curStepTime = 0;
	g_curProgram.maxStepTime = DURATION(gPrograms[program].steps[g_curProgram.curStep].duration);
	
	g_curProgram.curColor = gPrograms[program].pal->pal[gPrograms[program].steps[g_curProgram.curStep].col];
	g_curProgram.nextColor = gPrograms[program].pal->pal[gPrograms[program].steps[nextStep].col];
}

void resetProgram(uchar program)
{
	g_curProgram.curStep = gPrograms[program].numSteps - 1;
	g_curProgram.numStep = gPrograms[program].numSteps;
	
	advanceStep(program);
}

void doProgramLoop(uchar program)
{
	volatile tRGB interpCol;
	Command *step = &(gPrograms[program].steps[g_curProgram.curStep]);
	
	unsigned short remainingTime = g_curProgram.maxStepTime - g_curProgram.curStepTime;
 	
	if(!(step->fadeToNext))
	{
		interpCol = g_curProgram.curColor;
	}
	else
	{
		interpCol.r=((unsigned short)g_curProgram.curColor.r * remainingTime + (unsigned short)g_curProgram.nextColor.r *  g_curProgram.curStepTime) / g_curProgram.maxStepTime ;
		interpCol.g=((unsigned short)g_curProgram.curColor.g * remainingTime + (unsigned short)g_curProgram.nextColor.g *  g_curProgram.curStepTime) / g_curProgram.maxStepTime ;
		interpCol.b=((unsigned short)g_curProgram.curColor.b * remainingTime + (unsigned short)g_curProgram.nextColor.b *  g_curProgram.curStepTime) / g_curProgram.maxStepTime ;	
	}
	
	//increase current time, change to next step if needed
	g_curProgram.curStepTime++;
	if(g_curProgram.curStepTime >= g_curProgram.maxStepTime)
	{
		advanceStep(program);
	}
	
	ws2812_setleds(&interpCol, 1);
}

#define DLY_STEP 100

__attribute__ ((noreturn)) void main(void) 
{
	volatile uchar curProgram = 0;
	
	initHw();
	
	resetProgram(curProgram);

	do
	{	

		switch(keyPress())
		{
			case NO_KEY:
			break;
			
			case SHORT_PRESS:
			{
				curProgram = (curProgram + 1);
				if(curProgram >= NUM_PROGS)
					curProgram = 0;
				
				resetProgram(curProgram);
				
				break;
			}
			case LONG_PRESS:
			{
				//set led off
				tRGB col;
				col.r = col.g = col.b = 0;
				
				//wait for button release
				while(!(JUMPER_INP&_BV(JUMPER_PIN)))
				{
					col.b = 128;
					ws2812_setleds(&col, 1);
					_delay_ms(300);
					col.b = 0;
					ws2812_setleds(&col, 1);
					_delay_ms(300);
				}
				
				//reset keypress
				keyPress();

				col.r = col.g = col.b = 0;
				ws2812_setleds(&col, 1);

				gotoSleep();
				
				//wait for short or long press
				do { _delay_ms(DLY_STEP); }
				while(keyPress() == NO_KEY);
				
				//if longpress bootloader will be invoked, 
				//else bootloader will be skipped
				
				//jump to bootloader
				(*((void(*)(void))PROG_RESET))();
				
				break;
			}
		}

		doProgramLoop(curProgram);

		_delay_ms(DLY_STEP);

	}
	while(1);
}
