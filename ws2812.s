	.file	"ws2812.c"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__CCP__  = 0x34
__tmp_reg__ = 0
__zero_reg__ = 1
 ;  GNU C (WinAVR 20100110) version 4.3.3 (avr)
 ; 	compiled by GNU C version 3.4.5 (mingw-vista special r3), GMP version 4.2.3, MPFR version 2.4.1.
 ;  GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ;  options passed:  -imultilib avr25 -iprefix
 ;  c:\winavr-20100110\bin\../lib/gcc/avr/4.3.3/ -DF_CPU=4125000 ws2812.c
 ;  -mmcu=attiny85 -auxbase-strip ws2812.s -Os -Wall -fverbose-asm
 ;  options enabled:  -falign-loops -fargument-alias -fauto-inc-dec
 ;  -fbranch-count-reg -fcaller-saves -fcommon -fcprop-registers
 ;  -fcrossjumping -fcse-follow-jumps -fdefer-pop -fearly-inlining
 ;  -feliminate-unused-debug-types -fexpensive-optimizations
 ;  -fforward-propagate -ffunction-cse -fgcse -fgcse-lm
 ;  -fguess-branch-probability -fident -fif-conversion -fif-conversion2
 ;  -finline-functions -finline-functions-called-once
 ;  -finline-small-functions -fipa-pure-const -fipa-reference -fivopts
 ;  -fkeep-static-consts -fleading-underscore -fmath-errno
 ;  -fmerge-constants -fmerge-debug-strings -fmove-loop-invariants
 ;  -fomit-frame-pointer -foptimize-register-move -foptimize-sibling-calls
 ;  -fpeephole -fpeephole2 -freg-struct-return -fregmove
 ;  -freorder-functions -frerun-cse-after-loop -fsched-interblock
 ;  -fsched-spec -fsched-stalled-insns-dep -fsigned-zeros
 ;  -fsplit-ivs-in-unroller -fsplit-wide-types -fstrict-aliasing
 ;  -fstrict-overflow -fthread-jumps -ftoplevel-reorder -ftrapping-math
 ;  -ftree-ccp -ftree-copy-prop -ftree-copyrename -ftree-dce
 ;  -ftree-dominator-opts -ftree-dse -ftree-fre -ftree-loop-im
 ;  -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
 ;  -ftree-reassoc -ftree-salias -ftree-scev-cprop -ftree-sink -ftree-sra
 ;  -ftree-store-ccp -ftree-ter -ftree-vect-loop-version -ftree-vrp
 ;  -funit-at-a-time -fverbose-asm -fzero-initialized-in-bss

 ;  Compiler executable checksum: 61d68a374065d489330774d2533cbbdf

	.text
.global	ws2812_sendarray_mask
	.type	ws2812_sendarray_mask, @function
ws2812_sendarray_mask:
/* prologue: function */
/* frame size = 0 */
	movw r30,r24	 ;  data, data
	in r24,56-32	 ;  D.1303,,
	mov r18,r20	 ;  masklo, maskhi
	com r18	 ;  masklo
	and r18,r24	 ;  masklo, D.1303
	in r25,56-32	 ;  maskhi.21,,
	or r25,r20	 ;  maskhi.21, maskhi
	in r19,__SREG__	 ;  sreg_prev
/* #APP */
 ;  114 "ws2812.c" 1
	cli
 ;  0 "" 2
/* #NOAPP */
	rjmp .L2	 ; 
.L3:
	ld r24,Z+	 ;  curbyte,
/* #APP */
 ;  119 "ws2812.c" 1
	       ldi   r20,8  	 ;  ctr
	loop19:            
	       out   24,r25 	 ; , maskhi.21
	       sbrs  r24,7  	 ;  curbyte
	       out   24,r18 	 ; , masklo
	       lsl   r24    	 ;  curbyte
	nop      
	       out   24,r18 	 ; , masklo
	       dec   r20    	 ;  ctr
	       brne  loop19
	
 ;  0 "" 2
/* #NOAPP */
	subi r22,lo8(-(-1))	 ;  datlen,
	sbci r23,hi8(-(-1))	 ;  datlen,
.L2:
	cp r22,__zero_reg__	 ;  datlen
	cpc r23,__zero_reg__	 ;  datlen
	brne .L3	 ; ,
	out __SREG__,r19	 ;  sreg_prev
/* epilogue start */
	ret
	.size	ws2812_sendarray_mask, .-ws2812_sendarray_mask
.global	ws2812_sendarray
	.type	ws2812_sendarray, @function
ws2812_sendarray:
/* prologue: function */
/* frame size = 0 */
	ldi r20,lo8(2)	 ; ,
	rcall ws2812_sendarray_mask	 ; 
/* epilogue start */
	ret
	.size	ws2812_sendarray, .-ws2812_sendarray
.global	ws2812_setleds_pin
	.type	ws2812_setleds_pin, @function
ws2812_setleds_pin:
/* prologue: function */
/* frame size = 0 */
	movw r30,r22	 ;  leds, leds
	in r18,55-32	 ;  D.1279,,
	or r18,r20	 ;  D.1279, pinmask
	out 55-32,r18	 ; ,, D.1279
	lsl r22	 ;  tmp50
	rol r23	 ;  tmp50
	add r22,r30	 ;  tmp50, leds
	adc r23,r31	 ;  tmp50, leds
	rcall ws2812_sendarray_mask	 ; 
	ldi r24,lo8(68)	 ;  __count,
/* #APP */
 ;  83 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 1
	1: dec r24	 ;  __count
	brne 1b
 ;  0 "" 2
/* epilogue start */
/* #NOAPP */
	ret
	.size	ws2812_setleds_pin, .-ws2812_setleds_pin
.global	ws2812_setleds
	.type	ws2812_setleds, @function
ws2812_setleds:
/* prologue: function */
/* frame size = 0 */
	movw r30,r24	 ;  ledarray, ledarray
	ldd r24,Z+1	 ;  <variable>.r, <variable>.r
	tst r24	 ;  <variable>.r
	brne .L10	 ; ,
	ld r24,Z	 ;  <variable>.g, <variable>.g
	tst r24	 ;  <variable>.g
	brne .L10	 ; ,
	ldd r24,Z+2	 ;  <variable>.b, <variable>.b
	tst r24	 ;  <variable>.b
	brne .L10	 ; ,
	sbi 56-32,2	 ; ,,
	ret
.L10:
	cbi 56-32,2	 ; ,,
	movw r24,r30	 ; , ledarray
	ldi r20,lo8(2)	 ; ,
	rcall ws2812_setleds_pin	 ; 
	ret
	.size	ws2812_setleds, .-ws2812_setleds
