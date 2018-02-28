# rgbWearable
Handmade wearable that shines a multi-colored light.

## Features
Multiple programs preloaded
Editor for defining new programs
Can switch between programs at runtime
Can sleep
Battery powered with 20uA consumption in sleep
Mounted inside wood box

## Hardware
Board size is 25mm  x 25mm 
RGB led is a ws2812 
MCU is a attiny85 
Powered by a 130mAh LiPo
LiPo charger MCP73831 onboard
Programmable via microUSB
Pushbutton for switching between programs and sleeping


## Software
Based on [light_ws2812](https://github.com/cpldcpu/light_ws2812)
Running the [micronucleus bootloader](https://github.com/micronucleus/micronucleus)
