	.file	"main.c"
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
 ;  c:\winavr-20100110\bin\../lib/gcc/avr/4.3.3/ -DF_CPU=4125000 main.c
 ;  -mmcu=attiny85 -auxbase-strip main.s -Os -Wall -fverbose-asm
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
.global	keyPress
	.type	keyPress, @function
keyPress:
/* prologue: function */
/* frame size = 0 */
	sbic 54-32,0	 ; ,,
	rjmp .L2	 ; 
	ldi r24,lo8(5156)	 ;  __count,
	ldi r25,hi8(5156)	 ;  __count,
/* #APP */
 ;  105 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 1
	1: sbiw r24,1	 ;  __count
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	sbic 54-32,0	 ; ,,
	rjmp .L2	 ; 
	lds r24,btnTimer.1404	 ;  btnTimer.0, btnTimer
	cpi r24,lo8(15)	 ;  btnTimer.0,
	brsh .L3	 ; ,
	subi r24,lo8(-(1))	 ;  btnTimer.0,
	sts btnTimer.1404,r24	 ;  btnTimer, btnTimer.0
	rjmp .L3	 ; 
.L2:
	ldi r25,lo8(0)	 ;  retVal,
	lds r24,btnTimer.1404	 ;  btnTimer, btnTimer
	subi r24,lo8(-(-1))	 ;  btnTimer,
	cpi r24,lo8(14)	 ;  btnTimer,
	brsh .L4	 ; ,
	ldi r25,lo8(1)	 ;  retVal,
.L4:
	sts btnTimer.1404,__zero_reg__	 ;  btnTimer,
.L6:
	mov r24,r25	 ; , retVal
/* epilogue start */
	ret
.L3:
	lds r24,btnTimer.1404	 ;  btnTimer, btnTimer
	cpi r24,lo8(15)	 ;  btnTimer,
	brlo .L5	 ; ,
	ldi r25,lo8(2)	 ;  retVal,
	rjmp .L6	 ; 
.L5:
	ldi r25,lo8(0)	 ;  retVal,
	rjmp .L6	 ; 
	.size	keyPress, .-keyPress
.global	initHw
	.type	initHw, @function
initHw:
/* prologue: function */
/* frame size = 0 */
/* #APP */
 ;  68 "main.c" 1
	cli
 ;  0 "" 2
/* #NOAPP */
	out 91-32,__zero_reg__	 ; ,,
	out 53-32,__zero_reg__	 ; ,,
	ldi r24,lo8(15)	 ;  tmp55,
	out 64-32,r24	 ; ,, tmp55
	out 38-32,__zero_reg__	 ; ,,
	out 83-32,__zero_reg__	 ; ,,
	out 80-32,__zero_reg__	 ; ,,
	out 45-32,__zero_reg__	 ; ,,
	ldi r24,lo8(-128)	 ;  tmp61,
	out 40-32,r24	 ; ,, tmp61
	out 70-32,r24	 ; ,, tmp61
	ldi r24,lo8(2)	 ;  tmp65,
	out 70-32,r24	 ; ,, tmp65
	in r24,85-32	 ;  D.1430,,
	andi r24,lo8(-33)	 ;  D.1430,
	out 85-32,r24	 ; ,, D.1430
	cbi 55-32,0	 ; ,,
	sbi 56-32,0	 ; ,,
	sbi 55-32,2	 ; ,,
	sbi 56-32,2	 ; ,,
	ldi r24,lo8(1031)	 ;  __count,
	ldi r25,hi8(1031)	 ;  __count,
/* #APP */
 ;  105 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 1
	1: sbiw r24,1	 ;  __count
	brne 1b
 ;  0 "" 2
/* epilogue start */
/* #NOAPP */
	ret
	.size	initHw, .-initHw
.global	gotoSleep
	.type	gotoSleep, @function
gotoSleep:
/* prologue: function */
/* frame size = 0 */
	in r24,55-32	 ;  D.1448,,
	andi r24,lo8(-7)	 ;  D.1448,
	out 55-32,r24	 ; ,, D.1448
	in r24,56-32	 ;  D.1451,,
	andi r24,lo8(-7)	 ;  D.1451,
	out 56-32,r24	 ; ,, D.1451
	ldi r24,lo8(-128)	 ;  tmp54,
	out 70-32,r24	 ; ,, tmp54
	out 70-32,__zero_reg__	 ; ,,
	in r24,91-32	 ;  D.1455,,
	ori r24,lo8(32)	 ;  D.1455,
	out 91-32,r24	 ; ,, D.1455
	sbi 53-32,0	 ; ,,
/* #APP */
 ;  124 "main.c" 1
	sei
 ;  0 "" 2
/* #NOAPP */
	ldi r24,lo8(-76)	 ;  tmp61,
	out 85-32,r24	 ; ,, tmp61
	ldi r24,lo8(-80)	 ;  tmp63,
	out 85-32,r24	 ; ,, tmp63
/* #APP */
 ;  130 "main.c" 1
	sleep
	
 ;  0 "" 2
/* epilogue start */
/* #NOAPP */
	ret
	.size	gotoSleep, .-gotoSleep
.global	__vector_2
	.type	__vector_2, @function
__vector_2:
	push __zero_reg__	 ; 
	push r0	 ; 
	in r0,__SREG__	 ; 
	push r0	 ; 
	clr __zero_reg__	 ; 
/* prologue: Signal */
/* frame size = 0 */
/* epilogue start */
	pop r0	 ; 
	out __SREG__,r0	 ; 
	pop r0	 ; 
	pop __zero_reg__	 ; 
	reti
	.size	__vector_2, .-__vector_2
.global	advanceStep
	.type	advanceStep, @function
advanceStep:
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
	mov r19,r24	 ;  program, program
	lds r24,g_curProgram	 ;  D.1471, g_curProgram.curStep
	subi r24,lo8(-(1))	 ;  D.1471,
	sts g_curProgram,r24	 ;  g_curProgram.curStep, D.1471
	lds r25,g_curProgram+1	 ;  D.1472, g_curProgram.numStep
	cp r24,r25	 ;  D.1471, D.1472
	brlo .L15	 ; ,
	sts g_curProgram,__zero_reg__	 ;  g_curProgram.curStep,
.L15:
	lds r26,g_curProgram	 ;  temp.49, g_curProgram.curStep
	mov r20,r26	 ;  nextStep, temp.49
	subi r20,lo8(-(1))	 ;  nextStep,
	cp r20,r25	 ;  nextStep, D.1472
	brlo .L16	 ; ,
	ldi r20,lo8(0)	 ;  nextStep,
.L16:
	sts (g_curProgram+2)+1,__zero_reg__	 ;  g_curProgram.curStepTime,
	sts g_curProgram+2,__zero_reg__	 ;  g_curProgram.curStepTime,
	mov r24,r19	 ; , program
	ldi r25,lo8(0)	 ; ,
	ldi r22,lo8(5)	 ; ,
	ldi r23,hi8(5)	 ; ,
	rcall __mulhi3
	movw r30,r24	 ;  tmp61,
	subi r30,lo8(-(gPrograms))	 ;  tmp61,
	sbci r31,hi8(-(gPrograms))	 ;  tmp61,
	ldd r28,Z+3	 ;  D.1474, <variable>.steps
	ldd r29,Z+4	 ;  D.1474, <variable>.steps
	ldi r27,lo8(0)	 ;  D.1477,
	lsl r26	 ;  D.1477
	rol r27	 ;  D.1477
	add r26,r28	 ;  D.1477, D.1474
	adc r27,r29	 ;  D.1477, D.1474
	ld r18,X	 ;  D.1478, <variable>.duration
	mov r24,r18	 ;  D.1478, D.1478
	ldi r25,lo8(0)	 ;  D.1478,
	andi r24,lo8(31)	 ;  D.1478,
	andi r25,hi8(31)	 ;  D.1478,
	adiw r24,1	 ;  D.1478,
	swap r18	 ;  D.1478
	lsr r18	 ;  D.1478
	andi r18,lo8(7)	 ;  D.1478,
	rjmp 2f
1:	lsl r24	 ;  D.1478
	rol r25	 ;  D.1478
2:	dec r18	 ;  D.1478
	brpl 1b
	sts (g_curProgram+4)+1,r25	 ;  g_curProgram.maxStepTime, D.1478
	sts g_curProgram+4,r24	 ;  g_curProgram.maxStepTime, D.1478
	mov r24,r19	 ; , program
	ldi r25,lo8(0)	 ; ,
	ldi r22,lo8(5)	 ; ,
	ldi r23,hi8(5)	 ; ,
	rcall __mulhi3
	movw r30,r24	 ;  tmp75,
	subi r30,lo8(-(gPrograms))	 ;  tmp75,
	sbci r31,hi8(-(gPrograms))	 ;  tmp75,
	ldd r18,Z+1	 ;  D.1486, <variable>.pal
	ldd r19,Z+2	 ;  D.1486, <variable>.pal
	adiw r26,1	 ; 
	ld r24,X	 ;  tmp79
	swap r24	 ; 
	andi r24,lo8(15)	 ; ,
	ldi r25,lo8(0)	 ; ,
	ldi r22,lo8(3)	 ; ,
	ldi r23,hi8(3)	 ; ,
	rcall __mulhi3
	ldi r26,lo8(g_curProgram+6)	 ;  tmp84,
	ldi r27,hi8(g_curProgram+6)	 ;  tmp84,
	movw r30,r18	 ;  tmp85, D.1486
	add r30,r24	 ;  tmp85,
	adc r31,r25	 ;  tmp85,
	ldi r24,lo8(3)	 ;  tmp86,
.L17:
	ld r0,Z+	 ; ,
	st X+,r0	 ; ,
	subi r24,lo8(-(-1))	 ;  tmp86,
	brne .L17	 ; ,
	mov r24,r20	 ;  nextStep, nextStep
	ldi r25,lo8(0)	 ;  nextStep,
	lsl r24	 ;  nextStep
	rol r25	 ;  nextStep
	add r28,r24	 ;  D.1474, nextStep
	adc r29,r25	 ;  D.1474, nextStep
	ldd r24,Y+1	 ;  tmp92,
	swap r24	 ; 
	andi r24,lo8(15)	 ; ,
	ldi r25,lo8(0)	 ; ,
	ldi r22,lo8(3)	 ; ,
	ldi r23,hi8(3)	 ; ,
	rcall __mulhi3
	ldi r26,lo8(g_curProgram+9)	 ;  tmp97,
	ldi r27,hi8(g_curProgram+9)	 ;  tmp97,
	movw r30,r18	 ;  tmp98, D.1486
	add r30,r24	 ;  tmp98,
	adc r31,r25	 ;  tmp98,
	ldi r24,lo8(3)	 ;  tmp99,
.L18:
	ld r0,Z+	 ; ,
	st X+,r0	 ; ,
	subi r24,lo8(-(-1))	 ;  tmp99,
	brne .L18	 ; ,
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	ret
	.size	advanceStep, .-advanceStep
.global	resetProgram
	.type	resetProgram, @function
resetProgram:
/* prologue: function */
/* frame size = 0 */
	mov r18,r24	 ;  program, program
	ldi r25,lo8(0)	 ; ,
	ldi r22,lo8(5)	 ; ,
	ldi r23,hi8(5)	 ; ,
	rcall __mulhi3
	movw r30,r24	 ;  tmp47,
	subi r30,lo8(-(gPrograms))	 ;  tmp47,
	sbci r31,hi8(-(gPrograms))	 ;  tmp47,
	ld r24,Z	 ;  D.1498, <variable>.numSteps
	subi r24,lo8(-(-1))	 ;  D.1498,
	sts g_curProgram,r24	 ;  g_curProgram.curStep, D.1498
	subi r24,lo8(-(1))	 ;  D.1498,
	sts g_curProgram+1,r24	 ;  g_curProgram.numStep, D.1498
	mov r24,r18	 ; , program
	rcall advanceStep	 ; 
/* epilogue start */
	ret
	.size	resetProgram, .-resetProgram
.global	doProgramLoop
	.type	doProgramLoop, @function
doProgramLoop:
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r29	 ; 
	push r28	 ; 
	rcall .
	push __tmp_reg__
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
/* prologue: function */
/* frame size = 3 */
	mov r20,r24	 ;  program, program
	lds r14,g_curProgram+4	 ;  D.1511, g_curProgram.maxStepTime
	lds r15,(g_curProgram+4)+1	 ;  D.1511, g_curProgram.maxStepTime
	lds r16,g_curProgram+2	 ;  D.1512, g_curProgram.curStepTime
	lds r17,(g_curProgram+2)+1	 ;  D.1512, g_curProgram.curStepTime
	ldi r25,lo8(0)	 ; ,
	ldi r22,lo8(5)	 ; ,
	ldi r23,hi8(5)	 ; ,
	rcall __mulhi3
	movw r30,r24	 ;  tmp55,
	subi r30,lo8(-(gPrograms))	 ;  tmp55,
	sbci r31,hi8(-(gPrograms))	 ;  tmp55,
	lds r24,g_curProgram	 ;  g_curProgram.curStep, g_curProgram.curStep
	ldi r25,lo8(0)	 ;  g_curProgram.curStep,
	lsl r24	 ;  g_curProgram.curStep
	rol r25	 ;  g_curProgram.curStep
	ldd __tmp_reg__,Z+3	 ;  <variable>.steps
	ldd r31,Z+4	 ;  <variable>.steps, <variable>.steps
	mov r30,__tmp_reg__	 ;  <variable>.steps
	add r30,r24	 ;  <variable>.steps, g_curProgram.curStep
	adc r31,r25	 ;  <variable>.steps, g_curProgram.curStep
	ldd r24,Z+1	 ;  tmp65,
	sbrc r24,3	 ;  tmp65,
	rjmp .L25	 ; 
	movw r26,r28	 ;  tmp67,
	adiw r26,1	 ;  tmp67,
	ldi r30,lo8(g_curProgram+6)	 ;  tmp68,
	ldi r31,hi8(g_curProgram+6)	 ;  tmp68,
	ldi r24,lo8(3)	 ;  tmp69,
.L26:
	ld r0,Z+	 ; ,
	st X+,r0	 ; ,
	subi r24,lo8(-(-1))	 ;  tmp69,
	brne .L26	 ; ,
	rjmp .L27	 ; 
.L25:
	movw r30,r14	 ;  remainingTime, D.1511
	sub r30,r16	 ;  remainingTime, D.1512
	sbc r31,r17	 ;  remainingTime, D.1512
	lds r24,g_curProgram+10	 ; , g_curProgram.nextColor.r
	ldi r25,lo8(0)	 ; ,
	movw r22,r16	 ; , D.1512
	rcall __mulhi3
	movw r18,r24	 ;  tmp73,
	lds r24,g_curProgram+7	 ; , g_curProgram.curColor.r
	ldi r25,lo8(0)	 ; ,
	movw r22,r30	 ; , remainingTime
	rcall __mulhi3
	add r24,r18	 ; , tmp73
	adc r25,r19	 ; , tmp73
	movw r22,r14	 ; , D.1511
	rcall __udivmodhi4
	std Y+2,r22	 ;  interpCol.r, tmp116
	lds r24,g_curProgram+9	 ; , g_curProgram.nextColor.g
	ldi r25,lo8(0)	 ; ,
	movw r22,r16	 ; , D.1512
	rcall __mulhi3
	movw r18,r24	 ;  tmp85,
	lds r24,g_curProgram+6	 ; , g_curProgram.curColor.g
	ldi r25,lo8(0)	 ; ,
	movw r22,r30	 ; , remainingTime
	rcall __mulhi3
	add r24,r18	 ; , tmp85
	adc r25,r19	 ; , tmp85
	movw r22,r14	 ; , D.1511
	rcall __udivmodhi4
	std Y+1,r22	 ;  interpCol.g, tmp122
	lds r24,g_curProgram+11	 ; , g_curProgram.nextColor.b
	ldi r25,lo8(0)	 ; ,
	movw r22,r16	 ; , D.1512
	rcall __mulhi3
	movw r18,r24	 ;  tmp97,
	lds r24,g_curProgram+8	 ; , g_curProgram.curColor.b
	ldi r25,lo8(0)	 ; ,
	movw r22,r30	 ; , remainingTime
	rcall __mulhi3
	add r24,r18	 ; , tmp97
	adc r25,r19	 ; , tmp97
	movw r22,r14	 ; , D.1511
	rcall __udivmodhi4
	std Y+3,r22	 ;  interpCol.b, tmp128
.L27:
	movw r24,r16	 ;  D.1542, D.1512
	adiw r24,1	 ;  D.1542,
	sts (g_curProgram+2)+1,r25	 ;  g_curProgram.curStepTime, D.1542
	sts g_curProgram+2,r24	 ;  g_curProgram.curStepTime, D.1542
	cp r24,r14	 ;  D.1542, D.1511
	cpc r25,r15	 ;  D.1542, D.1511
	brlo .L28	 ; ,
	mov r24,r20	 ; , program
	rcall advanceStep	 ; 
.L28:
	movw r24,r28	 ; ,
	adiw r24,1	 ; ,
	ldi r22,lo8(1)	 ; ,
	ldi r23,hi8(1)	 ; ,
	rcall ws2812_setleds	 ; 
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r28	 ; 
	pop r29	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	ret
	.size	doProgramLoop, .-doProgramLoop
.global	main
	.type	main, @function
main:
	push r29	 ; 
	push r28	 ; 
	rcall .
	rcall .
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
/* prologue: function */
/* frame size = 4 */
	ldi r24,lo8(2)	 ;  tmp53,
	std Y+1,r24	 ;  curProgram, tmp53
	rcall initHw	 ; 
	ldd r24,Y+1	 ;  curProgram.2, curProgram
	rcall resetProgram	 ; 
	ldi r17,lo8(-128)	 ;  tmp76,
	ldi r30,lo8(2)	 ; ,
	mov r14,r30	 ;  tmp77,
	mov r15,__zero_reg__	 ;  tmp77
	add r14,r28	 ;  tmp77,
	adc r15,r29	 ;  tmp77,
	clr r10	 ;  tmp78
	clr r11	 ;  tmp78
	ldi r23,lo8(103)	 ; ,
	mov r12,r23	 ;  tmp80,
	mov r13,__zero_reg__	 ;  tmp80
.L39:
	rcall keyPress	 ; 
	cpi r24,lo8(1)	 ;  D.1560,
	breq .L33	 ; ,
	cpi r24,lo8(2)	 ;  D.1560,
	brne .L32	 ; ,
	rjmp .L44	 ; 
.L33:
	ldd r24,Y+1	 ;  curProgram.3, curProgram
	subi r24,lo8(-(1))	 ;  curProgram.3,
	std Y+1,r24	 ;  curProgram, curProgram.3
	ldd r24,Y+1	 ;  curProgram.5, curProgram
	cpi r24,lo8(3)	 ;  curProgram.5,
	brlo .L35	 ; ,
	std Y+1,__zero_reg__	 ;  curProgram,
.L35:
	ldd r24,Y+1	 ;  curProgram.6, curProgram
	rcall resetProgram	 ; 
	rjmp .L32	 ; 
.L44:
	std Y+4,r17	 ;  col.b, tmp76
	std Y+2,r17	 ;  col.g, tmp76
	std Y+3,r17	 ;  col.r, tmp76
	movw r24,r14	 ; , tmp77
	ldi r22,lo8(1)	 ; ,
	ldi r23,hi8(1)	 ; ,
	rcall ws2812_setleds	 ; 
.L36:
	sbis 54-32,0	 ; ,,
	rjmp .L36	 ; 
	rcall keyPress	 ; 
	std Y+4,__zero_reg__	 ;  col.b,
	std Y+2,__zero_reg__	 ;  col.g,
	std Y+3,__zero_reg__	 ;  col.r,
	movw r24,r14	 ; , tmp77
	ldi r22,lo8(1)	 ; ,
	ldi r23,hi8(1)	 ; ,
	rcall ws2812_setleds	 ; 
	rcall gotoSleep	 ; 
.L37:
	rcall keyPress	 ; 
	tst r24	 ; 
	breq .L37	 ; ,
	movw r30,r10	 ;  tmp78
	icall
.L32:
	ldd r24,Y+1	 ;  curProgram.7, curProgram
	rcall doProgramLoop	 ; 
	ldi r24,lo8(1000)	 ;  __ticks,
	ldi r25,hi8(1000)	 ;  __ticks,
.L38:
	movw r30,r12	 ;  __count, tmp80
/* #APP */
 ;  105 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 1
	1: sbiw r30,1	 ;  __count
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	sbiw r24,1	 ;  __ticks,
	brne .L38	 ; ,
	rjmp .L39	 ; 
	.size	main, .-main
.global	pal0
	.data
	.type	pal0, @object
	.size	pal0, 48
pal0:
 ;  pal:
 ;  g:
	.byte	0
 ;  r:
	.byte	0
 ;  b:
	.byte	0
 ;  g:
	.byte	0
 ;  r:
	.byte	-1
 ;  b:
	.byte	0
 ;  g:
	.byte	-1
 ;  r:
	.byte	0
 ;  b:
	.byte	0
 ;  g:
	.byte	0
 ;  r:
	.byte	0
 ;  b:
	.byte	-1
 ;  g:
	.byte	-1
 ;  r:
	.byte	0
 ;  b:
	.byte	-1
 ;  g:
	.byte	0
 ;  r:
	.byte	102
 ;  b:
	.byte	-1
 ;  g:
	.byte	0
 ;  r:
	.byte	-103
 ;  b:
	.byte	-1
 ;  g:
	.byte	0
 ;  r:
	.byte	-103
 ;  b:
	.byte	102
 ;  g:
	.byte	-1
 ;  r:
	.byte	-103
 ;  b:
	.byte	0
 ;  g:
	.byte	-1
 ;  r:
	.byte	-103
 ;  b:
	.byte	-1
 ;  g:
	.byte	-1
 ;  r:
	.byte	-1
 ;  b:
	.byte	0
 ;  g:
	.byte	102
 ;  r:
	.byte	-1
 ;  b:
	.byte	51
 ;  g:
	.byte	0
 ;  r:
	.byte	-1
 ;  b:
	.byte	-1
 ;  g:
	.byte	-52
 ;  r:
	.byte	-1
 ;  b:
	.byte	51
 ;  g:
	.byte	-103
 ;  r:
	.byte	102
 ;  b:
	.byte	51
 ;  g:
	.byte	-1
 ;  r:
	.byte	-1
 ;  b:
	.byte	-1
.global	stepsProg_0
	.type	stepsProg_0, @object
	.size	stepsProg_0, 32
stepsProg_0:
 ;  duration:
	.byte	0
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	0
 ;  duration:
	.byte	9
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	24
 ;  duration:
	.byte	5
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	0
 ;  duration:
	.byte	9
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	24
 ;  duration:
	.byte	31
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	0
 ;  duration:
	.byte	0
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	240
 ;  duration:
	.byte	4
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	0
 ;  duration:
	.byte	4
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	24
 ;  duration:
	.byte	4
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	248
 ;  duration:
	.byte	4
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	24
 ;  duration:
	.byte	-124
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	8
 ;  duration:
	.byte	4
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	24
 ;  duration:
	.byte	4
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	248
 ;  duration:
	.byte	4
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	8
 ;  duration:
	.byte	4
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	24
 ;  duration:
	.byte	29
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	0
.global	stepsProg_2
	.type	stepsProg_2, @object
	.size	stepsProg_2, 32
stepsProg_2:
 ;  duration:
	.byte	0
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	0
 ;  duration:
	.byte	9
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	56
 ;  duration:
	.byte	5
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	0
 ;  duration:
	.byte	9
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	56
 ;  duration:
	.byte	31
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	0
 ;  duration:
	.byte	0
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	240
 ;  duration:
	.byte	4
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	0
 ;  duration:
	.byte	4
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	56
 ;  duration:
	.byte	4
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	248
 ;  duration:
	.byte	4
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	56
 ;  duration:
	.byte	-124
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	8
 ;  duration:
	.byte	4
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	56
 ;  duration:
	.byte	4
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	248
 ;  duration:
	.byte	4
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	8
 ;  duration:
	.byte	4
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	56
 ;  duration:
	.byte	29
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	0
.global	stepsProg_1
	.type	stepsProg_1, @object
	.size	stepsProg_1, 8
stepsProg_1:
 ;  duration:
	.byte	29
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	16
 ;  duration:
	.byte	29
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	32
 ;  duration:
	.byte	29
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	48
 ;  duration:
	.byte	29
 ;  random:
 ;  randomMinMax:
 ;  reserved:
 ;  fadeToNext:
 ;  col:
	.byte	0
.global	gPrograms
	.type	gPrograms, @object
	.size	gPrograms, 15
gPrograms:
 ;  numSteps:
	.byte	16
 ;  pal:
	.word	pal0
 ;  steps:
	.word	stepsProg_0
 ;  numSteps:
	.byte	16
 ;  pal:
	.word	pal0
 ;  steps:
	.word	stepsProg_2
 ;  numSteps:
	.byte	4
 ;  pal:
	.word	pal0
 ;  steps:
	.word	stepsProg_1
	.lcomm btnTimer.1404,1
	.comm g_curProgram,12,1
.global __do_copy_data
.global __do_clear_bss
