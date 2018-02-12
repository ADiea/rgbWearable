/*
 * light_ws2812_config.h
 *
 * Created: 18.01.2014 09:58:15
 *
 * User Configuration file for the light_ws2812_lib
 *
 */ 


#ifndef WS2812_CONFIG_H_
#define WS2812_CONFIG_H_

///////////////////////////////////////////////////////////////////////
// Define I/O pin
///////////////////////////////////////////////////////////////////////

#define ws2812_port B     // Data port 
#define ws2812_pin  1     // Data out pin

#define JUMPER_PIN    PB0
#define JUMPER_PORT   PORTB 
#define JUMPER_DDR    DDRB 
#define JUMPER_INP    PINB 

#endif /* WS2812_CONFIG_H_ */