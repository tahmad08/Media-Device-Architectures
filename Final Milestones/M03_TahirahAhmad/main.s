	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	ldr	r2, .L4+4
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r1, #7168
	mov	r2, #4352
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	ldr	r2, .L4+32
	ldrh	r1, [r3, #48]
	ldr	r3, .L4+36
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+40
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L4+44
	ldr	r2, .L4+48
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	83886592
	.word	spriteshtPal
	.word	100728832
	.word	spriteshtTiles
	.word	hideSprites
	.word	initGame
	.word	67109120
	.word	buttons
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	seed
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L8+8
	ldr	r2, .L8+12
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	goToInstr
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstr, %function
goToInstr:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+4
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L12+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToInstr, .-goToInstr
	.align	2
	.global	instr
	.syntax unified
	.arm
	.fpu softvfp
	.type	instr, %function
instr:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L21
	mov	lr, pc
	bx	r3
	ldr	r4, .L21+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L21+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1760
	mov	r2, #100663296
	ldr	r1, .L21+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L21+16
	ldr	r1, .L21+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7168
	mov	r2, #256
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r5, .L21+24
	mov	lr, pc
	bx	r5
	ldr	r3, .L21+28
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L14
	ldr	r3, .L21+32
	ldrh	r3, [r3]
	ands	r4, r3, #4
	beq	.L20
.L14:
	pop	{r4, r5, r6, lr}
	bx	lr
.L20:
	mov	lr, pc
	bx	r5
	ldr	r3, .L21+36
	mov	lr, pc
	bx	r3
	ldr	r2, .L21+40
	ldr	r3, .L21+44
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	hideSprites
	.word	DMANow
	.word	instrscrnPal
	.word	instrscrnTiles
	.word	100720640
	.word	instrscrnMap
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	flipPage
	.word	state
	.word	seed
	.size	instr, .-instr
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #5632
	mov	r5, #67108864
	ldr	r4, .L25
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L25+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #39168
	mov	r3, #704
	strh	r2, [r5, #12]	@ movhi
	ldr	r1, .L25+8
	mov	r2, #100663296
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L25+12
	ldr	r1, .L25+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L25+20
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
	.word	DMANow
	.word	topScrnPal
	.word	gamescrnTiles
	.word	100714496
	.word	gamescrnMap
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #256
	ldr	r4, .L39
	mov	r2, #83886080
	ldr	r1, .L39+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1264
	mov	r2, #100663296
	ldr	r1, .L39+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L39+12
	ldr	r1, .L39+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r3, #256
	mov	r2, #7168
	ldr	r4, .L39+20
	strh	r3, [r5]	@ movhi
	ldr	r3, [r4]
	ldr	r7, .L39+24
	add	r3, r3, #1
	strh	r2, [r5, #8]	@ movhi
	ldr	r6, .L39+28
	str	r3, [r4]
	mov	lr, pc
	bx	r6
	ldrh	r3, [r7]
	tst	r3, #8
	beq	.L28
	ldr	r2, .L39+32
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L37
.L28:
	tst	r3, #4
	beq	.L27
	ldr	r3, .L39+32
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L38
.L27:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L38:
	mov	lr, pc
	bx	r6
	ldr	r3, .L39+36
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L39+40
	pop	{r4, r5, r6, r7, r8, lr}
	str	r2, [r3]
	bx	lr
.L37:
	mov	r3, #4096
	ldr	r0, [r4]
	strh	r3, [r5]	@ movhi
	ldr	r3, .L39+44
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r7]
	b	.L28
.L40:
	.align	2
.L39:
	.word	DMANow
	.word	startscrnPal
	.word	startscrnTiles
	.word	100720640
	.word	startscrnMap
	.word	seed
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	flipPage
	.word	state
	.word	srand
	.size	start, .-start
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L50
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L50+8
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L50+12
	mov	r0, #3
	ldr	r4, .L50+16
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	ldr	r3, .L50+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L42
	ldr	r3, .L50+24
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L48
.L42:
	ldr	r3, .L50+28
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L49
.L43:
	mov	r0, #67108864
	ldr	r1, .L50+32
	ldr	r2, [r1]
	sub	r2, r2, #1
	add	r3, r2, r2, lsr #31
	asr	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r2, [r1]
	pop	{r4, r5, r6, lr}
	strh	r3, [r0, #26]	@ movhi
	bx	lr
.L49:
	ldr	r3, .L50+36
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L50+40
	str	r2, [r3]
	b	.L43
.L48:
	ldr	r3, .L50+36
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L50+40
	str	r2, [r3]
	b	.L43
.L51:
	.align	2
.L50:
	.word	updateGame
	.word	drawGame
	.word	DMANow
	.word	shadowOAM
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	livesLeft
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	state
	.size	game, .-game
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L54
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+4
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L54+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L55:
	.align	2
.L54:
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L58
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+4
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L58+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L59:
	.align	2
.L58:
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L62
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+4
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L62+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L63:
	.align	2
.L62:
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L71
	mov	lr, pc
	bx	r3
	ldr	r4, .L71+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L71+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #640
	mov	r2, #100663296
	ldr	r1, .L71+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L71+16
	ldr	r1, .L71+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7168
	mov	r2, #256
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r3, .L71+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L64
	ldr	r3, .L71+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L70
.L64:
	pop	{r4, lr}
	bx	lr
.L70:
	ldr	r3, .L71+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L72:
	.align	2
.L71:
	.word	hideSprites
	.word	DMANow
	.word	losescrnPal
	.word	losescrnTiles
	.word	100720640
	.word	losescrnMap
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	main
	.size	lose, .-lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L86
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+4
	mov	lr, pc
	bx	r3
	ldr	r6, .L86+8
	ldr	r7, .L86+12
	ldr	r5, .L86+16
	ldr	fp, .L86+20
	ldr	r10, .L86+24
	ldr	r9, .L86+28
	ldr	r8, .L86+32
	ldr	r4, .L86+36
.L74:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L75:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L75
.L77:
	.word	.L76
	.word	.L78
	.word	.L79
	.word	.L80
	.word	.L81
	.word	.L82
.L82:
	ldr	r3, .L86+40
	mov	lr, pc
	bx	r3
	b	.L74
.L81:
	ldr	r3, .L86+44
	mov	lr, pc
	bx	r3
	b	.L74
.L80:
	mov	lr, pc
	bx	r8
	b	.L74
.L79:
	mov	lr, pc
	bx	r9
	b	.L74
.L78:
	mov	lr, pc
	bx	r10
	b	.L74
.L76:
	mov	lr, pc
	bx	fp
	b	.L74
.L87:
	.align	2
.L86:
	.word	hideSprites
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instr
	.word	game
	.word	pause
	.word	67109120
	.word	lose
	.word	win
	.size	main, .-main
	.text
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L100
	mov	lr, pc
	bx	r3
	ldr	r4, .L100+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L100+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1728
	mov	r2, #100663296
	ldr	r1, .L100+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L100+16
	ldr	r1, .L100+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r4, #67108864
	mov	r2, #7168
	mov	r3, #256
	strh	r2, [r4, #8]	@ movhi
	strh	r3, [r4]	@ movhi
	ldr	r3, .L100+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L100+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L89
	ldr	r2, .L100+32
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L98
.L89:
	tst	r3, #4
	beq	.L88
	ldr	r3, .L100+32
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L99
.L88:
	pop	{r4, lr}
	bx	lr
.L99:
	ldr	r3, .L100+36
	mov	lr, pc
	bx	r3
.L98:
	mov	r3, #4096
	strh	r3, [r4]	@ movhi
	pop	{r4, lr}
	b	goToGame
.L101:
	.align	2
.L100:
	.word	hideSprites
	.word	DMANow
	.word	pausescrnPal
	.word	pausescrnTiles
	.word	100720640
	.word	pausescrnMap
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	main
	.size	pause, .-pause
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L109
	mov	lr, pc
	bx	r3
	ldr	r4, .L109+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L109+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #416
	mov	r2, #100663296
	ldr	r1, .L109+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L109+16
	ldr	r1, .L109+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7168
	mov	r2, #256
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r3, .L109+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L109+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L102
	ldr	r3, .L109+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L108
.L102:
	pop	{r4, lr}
	bx	lr
.L108:
	ldr	r3, .L109+36
	mov	lr, pc
	bx	r3
.L110:
	.align	2
.L109:
	.word	hideSprites
	.word	DMANow
	.word	winscrnPal
	.word	winscrnTiles
	.word	100720640
	.word	winscrnMap
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	main
	.size	win, .-win
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	arr,140,4
	.global	vOff
	.global	hOff
	.comm	shadowOAM,1024,4
	.comm	score,4,4
	.comm	enemy1onscrn,4,4
	.comm	maxEnemy1,4,4
	.comm	livesLeft,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
