#include "ws2812.h"
#include <avr/pgmspace.h>

#define DURATION(x) ((((x) & 0x1F) + 1)*(1<<(((x)>>5) & 0x7)))

#define NUM_COLS_MAX 16

typedef struct tPallette
{
	tRGB pal[NUM_COLS_MAX];
} Palette;


typedef struct tCommand
{
	unsigned char duration;
	
	unsigned char random:1;
	unsigned char randomMinMax:1;
	unsigned char reserved:1;
	unsigned char fadeToNext:1;
	unsigned char col:4;
} Command;

typedef struct tProgParams
{
	uchar curStep;
	uchar numStep;

	unsigned short curStepTime;
	unsigned short maxStepTime;

	tRGB curColor;
	tRGB nextColor;
} ProgParams;

ProgParams g_curProgram;

typedef struct tProgram
{

uchar numSteps;
Palette *pal;

Command *steps;
} Program;

Palette pal0 = {{
{0,0,0}, {0,255,0}, {255,0,0}, {0,0,255}, 
{255,0,255}, {0,102,255}, {0,153,255}, {0,153,102}, 
{255,153,0}, {255,153,255}, {255,255,0}, {102,255,51},
 {0,255,255}, {204,255,51}, {153,102,51}, {255,255,255}}};


Command stepsProg_0[] = {{0, 0, 0, 0, 0, 0}, {9, 0, 0, 0, 1, 1}, {5, 0, 0, 0, 0, 0}, {9, 0, 0, 0, 1, 1}, {31, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 15}, {4, 0, 0, 0, 0, 0}, {4, 0, 0, 0, 1, 1}, {4, 0, 0, 0, 1, 15}, {4, 0, 0, 0, 1, 1}, {132, 0, 0, 0, 1, 0}, {4, 0, 0, 0, 1, 1}, {4, 0, 0, 0, 1, 15}, {4, 0, 0, 0, 1, 0}, {4, 0, 0, 0, 1, 1}, {29, 0, 0, 0, 0, 0}};

/*Command stepsProg_1[] = {{0, 0, 0, 0, 0, 0}, {9, 0, 0, 0, 1, 2}, {5, 0, 0, 0, 0, 0}, {9, 0, 0, 0, 1, 2}, {31, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 15}, {4, 0, 0, 0, 0, 0}, {4, 0, 0, 0, 1, 2}, {4, 0, 0, 0, 1, 15}, {4, 0, 0, 0, 1, 2}, {132, 0, 0, 0, 1, 0}, {4, 0, 0, 0, 1, 2}, {4, 0, 0, 0, 1, 15}, {4, 0, 0, 0, 1, 0}, {4, 0, 0, 0, 1, 2}, {29, 0, 0, 0, 0, 0}};
*/
Command stepsProg_2[] = {{0, 0, 0, 0, 0, 0}, {9, 0, 0, 0, 1, 3}, {5, 0, 0, 0, 0, 0}, {9, 0, 0, 0, 1, 3}, {31, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 15}, {4, 0, 0, 0, 0, 0}, {4, 0, 0, 0, 1, 3}, {4, 0, 0, 0, 1, 15}, {4, 0, 0, 0, 1, 3}, {132, 0, 0, 0, 1, 0}, {4, 0, 0, 0, 1, 3}, {4, 0, 0, 0, 1, 15}, {4, 0, 0, 0, 1, 0}, {4, 0, 0, 0, 1, 3}, {29, 0, 0, 0, 0, 0}};

Command stepsProg_1[] = {{29, 0, 0, 0, 0, 1}, {29, 0, 0, 0, 0, 2}, {29, 0, 0, 0, 0, 3}, {29, 0, 0, 0, 0, 0}};

#define NUM_PROGS 3

/*PROGMEM const*/ Program gPrograms[NUM_PROGS] = 
{
	{16, &pal0, &stepsProg_0},
	{16, &pal0, &stepsProg_2},
	{4, &pal0, &stepsProg_1},
	
};


