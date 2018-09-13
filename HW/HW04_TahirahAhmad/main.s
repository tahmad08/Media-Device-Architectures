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
	ldr	r0, .L4
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+8
	mov	r3, #0
	ldr	r2, .L4+12
	mov	r1, #60
	mov	r0, #80
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L4+16
	mov	r1, #60
	mov	r0, #89
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r1, .L4+20
	ldr	r2, .L4+24
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	351
	.word	fillScreen
	.word	drawString
	.word	.LC0
	.word	.LC1
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
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
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r2, .L7
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	1027
	.size	initialize, .-initialize
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
	push	{r4, lr}
	mov	r0, #0
	ldr	r3, .L11
	mov	lr, pc
	bx	r3
	ldr	r4, .L11+4
	ldr	r3, .L11+8
	ldr	r2, .L11+12
	mov	r1, #1
	mov	r0, #150
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L11+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L12:
	.align	2
.L11:
	.word	fillScreen
	.word	drawString
	.word	32767
	.word	.LC2
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
	push	{r4, lr}
	ldr	r4, .L20
	ldr	r3, [r4]
	ldr	r2, .L20+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L20+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L13
	ldr	r3, .L20+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L19
.L13:
	pop	{r4, lr}
	bx	lr
.L19:
	ldr	r0, [r4]
	ldr	r3, .L20+16
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L20+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L24
	sub	sp, sp, #8
	mov	r0, r6
	ldr	r3, .L24+4
	mov	lr, pc
	bx	r3
	ldr	r7, .L24+8
	ldr	r3, .L24+12
	ldr	r5, .L24+16
	ldr	r2, [r3]
	mov	r0, r7
	ldr	r1, .L24+20
	ldr	r3, .L24+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L24+28
	mov	r3, r5
	ldr	r2, .L24+32
	mov	r1, #100
	mov	r0, #70
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L24+36
	mov	r1, #40
	mov	r0, #80
	mov	lr, pc
	bx	r4
	ldr	r8, .L24+40
	str	r6, [sp]
	mov	r3, #6
	mov	r2, #8
	mov	r1, #196
	mov	r0, #80
	mov	lr, pc
	bx	r8
	str	r6, [sp]
	mov	r3, #6
	mov	r2, #8
	mov	r1, #202
	mov	r0, #80
	mov	lr, pc
	bx	r8
	mov	r3, r5
	mov	r2, r7
	mov	r1, #196
	mov	r0, #80
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L24+44
	mov	r1, #60
	mov	r0, #90
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L24+48
	str	r2, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	32564
	.word	fillScreen
	.word	buffer
	.word	bricksRemaining
	.word	32767
	.word	.LC3
	.word	sprintf
	.word	drawString
	.word	.LC4
	.word	.LC5
	.word	drawRect
	.word	.LC6
	.word	state
	.size	goToPause, .-goToPause
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
	ldr	r3, .L38
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L27
	ldr	r2, .L38+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L36
.L27:
	tst	r3, #4
	beq	.L26
	ldr	r3, .L38+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L37
.L26:
	pop	{r4, lr}
	bx	lr
.L37:
	pop	{r4, lr}
	b	goToStart
.L36:
	pop	{r4, lr}
	b	goToGame
.L39:
	.align	2
.L38:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L42
	ldr	r0, .L42+4
	ldr	r3, .L42+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L42+12
	mov	r3, r5
	ldr	r2, .L42+16
	mov	r1, #100
	mov	r0, #80
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L42+20
	mov	r1, #40
	mov	r0, #89
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L42+24
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L43:
	.align	2
.L42:
	.word	32767
	.word	17392
	.word	fillScreen
	.word	drawString
	.word	.LC7
	.word	.LC8
	.word	state
	.size	goToWin, .-goToWin
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
	ldr	r3, .L51
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L51+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L44
	ldr	r3, .L51+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L50
.L44:
	pop	{r4, lr}
	bx	lr
.L50:
	pop	{r4, lr}
	b	goToStart
.L52:
	.align	2
.L51:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L55
	mov	r0, #0
	ldr	r3, .L55+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L55+8
	mov	r3, r5
	ldr	r2, .L55+12
	mov	r1, #70
	mov	r0, #80
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L55+16
	mov	r1, #40
	mov	r0, #89
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L55+20
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L56:
	.align	2
.L55:
	.word	32767
	.word	fillScreen
	.word	drawString
	.word	.LC9
	.word	.LC8
	.word	state
	.size	goToLose, .-goToLose
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
	mov	r6, #0
	ldr	r4, .L68
	sub	sp, sp, #8
	ldr	r3, .L68+4
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, .L68+8
	ldr	r3, .L68+12
	ldr	r0, .L68+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L68+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L68+24
	mov	lr, pc
	bx	r3
	ldr	r5, .L68+28
	mov	r3, #6
	mov	r2, #8
	mov	r1, #107
	mov	r0, #150
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #6
	mov	r2, #8
	mov	r1, #113
	mov	r0, #150
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	ldr	r3, .L68+32
	ldr	r2, .L68+16
	mov	r1, #107
	mov	r0, #150
	ldr	r5, .L68+36
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	cmp	r3, r6
	beq	.L65
.L58:
	ldr	r3, .L68+40
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L66
.L59:
	ldr	r3, .L68+44
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L57
	ldr	r3, .L68+48
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L67
.L57:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L66:
	bl	goToLose
	b	.L59
.L65:
	bl	goToWin
	b	.L58
.L67:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	goToPause
.L69:
	.align	2
.L68:
	.word	bricksRemaining
	.word	updateGame
	.word	.LC3
	.word	sprintf
	.word	buffer
	.word	waitForVBlank
	.word	drawGame
	.word	drawRect
	.word	32767
	.word	drawString
	.word	ballOOB
	.word	oldButtons
	.word	buttons
	.size	game, .-game
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
	ldr	r3, .L77
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L70
	ldr	r3, .L77+8
	ldrh	r3, [r3]
	ands	r3, r3, #8
	beq	.L76
.L70:
	pop	{r4, lr}
	bx	lr
.L76:
	ldr	r2, .L77+12
	pop	{r4, lr}
	str	r3, [r2]
	b	goToStart
.L78:
	.align	2
.L77:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	go
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
	mov	r2, #67108864
	ldr	r1, .L91
	push	{r4, r7, fp, lr}
	ldr	r3, .L91+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L91+8
	ldr	r7, .L91+12
	ldr	r5, .L91+16
	ldr	fp, .L91+20
	ldr	r10, .L91+24
	ldr	r9, .L91+28
	ldr	r8, .L91+32
	ldr	r4, .L91+36
.L80:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L81:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L81
.L83:
	.word	.L82
	.word	.L84
	.word	.L85
	.word	.L86
	.word	.L87
.L87:
	ldr	r3, .L91+40
	mov	lr, pc
	bx	r3
	b	.L80
.L86:
	mov	lr, pc
	bx	r8
	b	.L80
.L85:
	mov	lr, pc
	bx	r9
	b	.L80
.L84:
	mov	lr, pc
	bx	r10
	b	.L80
.L82:
	mov	lr, pc
	bx	fp
	b	.L80
.L92:
	.align	2
.L91:
	.word	1027
	.word	goToStart
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.word	lose
	.size	main, .-main
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"WELCOME to Breakout\000"
.LC1:
	.ascii	"To play, hit start.\000"
.LC2:
	.ascii	"Bricks Remaining: \000"
	.space	1
.LC3:
	.ascii	"%d\000"
	.space	1
.LC4:
	.ascii	"Pause\000"
	.space	2
.LC5:
	.ascii	"Bricks remaining in game: \000"
	.space	1
.LC6:
	.ascii	"To resume, hit start\000"
	.space	3
.LC7:
	.ascii	"YOU WON!\000"
	.space	3
.LC8:
	.ascii	"To play again, hit start.\000"
	.space	2
.LC9:
	.ascii	"YOU LOST! wild.\000"
	.ident	"GCC: (devkitARM release 47) 7.1.0"
