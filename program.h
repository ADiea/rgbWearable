#include "ws2812.h"
#include <avr/pgmspace.h>

#define NUM_COLS_MAX 16

typedef struct tPallette
{
	unsigned char numCols;
	//G R B
	tRGB pal[NUM_COLS_MAX];
} Palette;


/*PROGMEM const */Palette pal0 = 
{
	3, //G R B
	{{0,255,0},
	{255,0,0},
	{0,0,255}, 
	{128,255,0}, {0,0,0}, {0,0,0}, {0,0,0}, 
	{0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, 
	{0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}}
};

/*
PROGMEM const Palette pal1 = 
{
	3, //G R B
	{{0,255,0},
	{255,0,0},
	{0,0,255}, 
	{0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, 
	{0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, 
	{0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}}
};
*/
#define MAX_DURATION 3968
#define MSEC2DUR(x) ((unsigned short)(x) / 128)
#define CMD_LAST 0
#define CMD_FADE 1
#define CMD_NOFADE 2
#define CMD_RSVD 3

typedef struct tCommand
{

	unsigned char col:4;
	unsigned char op:2;
	unsigned char dur0:5;
	unsigned char dur1:5;

} Command;

#define MAX_PROG_STEPS 8

#define PROG_TYPE_FADE 0

typedef struct tProgParams
{
uchar curStep;
tRGB curColor;
tRGB nextColor;


} ProgParams;

ProgParams g_curProgram;

typedef struct tProgram
{

uchar progType;
Palette *pal;

Command steps[MAX_PROG_STEPS];
} Program;


#define NUM_PROGS 3

/*PROGMEM const*/ Program gPrograms[NUM_PROGS] = 
{
{PROG_TYPE_FADE, &pal0, {{0, CMD_FADE, MSEC2DUR(128), MSEC2DUR(MAX_DURATION)}, {1, CMD_FADE, MSEC2DUR(150), MSEC2DUR(MAX_DURATION)}, {2, CMD_FADE, MSEC2DUR(128), MSEC2DUR(MAX_DURATION)}, {0, CMD_LAST, 0, 0}, {0, CMD_LAST, 0, 0}, {0, CMD_LAST, 0, 0}, {0, CMD_LAST, 0, 0}, {0, CMD_LAST, 0, 0}}},
{PROG_TYPE_FADE, &pal0, {{3, CMD_FADE, MSEC2DUR(256), MSEC2DUR(256)}, {4, CMD_FADE, MSEC2DUR(256), MSEC2DUR(256)}, {0, CMD_LAST, 0, 0}, {0, CMD_LAST, 0, 0}, {0, CMD_LAST, 0, 0}, {0, CMD_LAST, 0, 0}, {0, CMD_LAST, 0, 0}, {0, CMD_LAST, 0, 0}}},
{PROG_TYPE_FADE, &pal0, {{0, CMD_FADE, MSEC2DUR(128), MSEC2DUR(0)}, {4, CMD_FADE, MSEC2DUR(128), MSEC2DUR(0)}, {0, CMD_FADE, MSEC2DUR(128), MSEC2DUR(0)}, {4, CMD_FADE, MSEC2DUR(300), MSEC2DUR(0)}, 
						  {2, CMD_FADE, MSEC2DUR(2), MSEC2DUR(0)}, {4, CMD_FADE, MSEC2DUR(128), MSEC2DUR(0)}, {2, CMD_FADE, MSEC2DUR(128), MSEC2DUR(0)}, {4, CMD_FADE, MSEC2DUR(1000), MSEC2DUR(0)}}}
};


