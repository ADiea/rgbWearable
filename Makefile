DEVICE     = attiny85
#F_CPU      = 16500000
F_CPU      = 4125000
OBJECTS    = main.o ws2812.o

COMPILE = avr-gcc -Wall -Os -DF_CPU=$(F_CPU) -mmcu=$(DEVICE)
 
all:	main.hex
 
.c.o:
	$(COMPILE) -c $< -o $@
 
.S.o:
	$(COMPILE) -x assembler-with-cpp -c $< -o $@
 
#.c.s:
#	$(COMPILE) -S $< -o $@
	
%.s : %.c
	$(COMPILE) -S -fverbose-asm $< -o $@
	
%.lss: $(TARGET)
	avr-objdump -h -S $<
 
clean:
	rm -f main.hex main.elf main.s ws2812.s main.lss main.lst $(OBJECTS)
 
main.elf: $(OBJECTS)
	$(COMPILE) -o main.elf $(OBJECTS)
 
main.hex: main.elf
	rm -f main.hex
	avr-objcopy -j .text -j .data -O ihex main.elf main.hex
	avr-size main.hex
 
disasm:	main.elf
	avr-objdump -d main.elf
 
cpp:
	$(COMPILE) -E main.c