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
	mov	r2, #83886080
	ldr	r1, .L4
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L4+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L4+24
	ldr	r2, .L4+28
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	titlePal
	.word	DMANow
	.word	titleBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
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
	.word	1044
	.size	initialize, .-initialize
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
	ldr	r4, .L16
	ldr	r3, [r4]
	ldr	r2, .L16+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L16+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L9
	ldr	r3, .L16+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L15
.L9:
	pop	{r4, lr}
	bx	lr
.L15:
	ldr	r0, [r4]
	ldr	r3, .L16+16
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L16+20
	ldr	r3, .L16+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	state
	.word	initGame
	.size	start, .-start
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
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L19
	str	r2, [r3]
	bx	lr
.L20:
	.align	2
.L19:
	.word	state
	.size	goToGame, .-goToGame
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
	mov	r0, #253
	ldr	r3, .L23
	mov	lr, pc
	bx	r3
	ldr	r4, .L23+4
	mov	r3, #248
	ldr	r2, .L23+8
	mov	r1, #105
	mov	r0, #77
	mov	lr, pc
	bx	r4
	ldr	r2, .L23+12
	mov	r1, #58
	mov	r0, #87
	mov	r3, #248
	mov	lr, pc
	bx	r4
	ldr	r3, .L23+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+20
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L23+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L24:
	.align	2
.L23:
	.word	fillScreen4
	.word	drawString4
	.word	.LC0
	.word	.LC1
	.word	waitForVBlank
	.word	flipPage
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
	ldr	r3, .L37
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L37+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L26
	ldr	r2, .L37+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L35
.L26:
	tst	r3, #4
	beq	.L25
	ldr	r3, .L37+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L36
.L25:
	pop	{r4, lr}
	bx	lr
.L35:
	mov	r2, #1
	ldr	r3, .L37+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L36:
	pop	{r4, lr}
	b	goToStart
.L38:
	.align	2
.L37:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
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
	push	{r4, lr}
	mov	r0, #255
	ldr	r3, .L41
	mov	lr, pc
	bx	r3
	ldr	r4, .L41+4
	mov	r3, #248
	ldr	r2, .L41+8
	mov	r1, #91
	mov	r0, #77
	mov	lr, pc
	bx	r4
	mov	r3, #248
	ldr	r2, .L41+12
	mov	r1, #38
	mov	r0, #87
	mov	lr, pc
	bx	r4
	ldr	r2, .L41+16
	mov	r1, #58
	mov	r0, #97
	mov	r3, #248
	mov	lr, pc
	bx	r4
	ldr	r3, .L41+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L41+24
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L41+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L42:
	.align	2
.L41:
	.word	fillScreen4
	.word	drawString4
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	waitForVBlank
	.word	flipPage
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
	ldr	r3, .L50
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L43
	ldr	r3, .L50+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L49
.L43:
	pop	{r4, lr}
	bx	lr
.L49:
	pop	{r4, lr}
	b	goToStart
.L51:
	.align	2
.L50:
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
	push	{r4, lr}
	mov	r0, #251
	ldr	r3, .L54
	mov	lr, pc
	bx	r3
	ldr	r4, .L54+4
	mov	r3, #248
	ldr	r2, .L54+8
	mov	r1, #58
	mov	r0, #77
	mov	lr, pc
	bx	r4
	ldr	r2, .L54+12
	mov	r1, #58
	mov	r0, #87
	mov	r3, #248
	mov	lr, pc
	bx	r4
	ldr	r3, .L54+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+20
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L54+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L55:
	.align	2
.L54:
	.word	fillScreen4
	.word	drawString4
	.word	.LC5
	.word	.LC4
	.word	waitForVBlank
	.word	flipPage
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
	ldr	r3, .L67
	sub	sp, sp, #8
	ldr	r4, .L67+4
	ldr	r5, .L67+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+12
	mov	lr, pc
	bx	r3
	ldr	r6, .L67+16
	ldr	r3, [r5]
	ldr	r2, [r4]
	ldr	r1, .L67+20
	ldr	r0, .L67+24
	mov	lr, pc
	bx	r6
	mov	r3, #252
	ldr	r2, .L67+24
	mov	r1, #5
	mov	r0, #145
	ldr	r6, .L67+28
	mov	lr, pc
	bx	r6
	mov	r2, #255
	ldr	r3, [r4]
	mov	r1, #73
	mov	r0, #145
	str	r2, [sp]
	lsl	r3, r3, #1
	mov	r2, #8
	ldr	r6, .L67+32
	mov	lr, pc
	bx	r6
	ldr	r3, .L67+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+44
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L57
	ldr	r3, .L67+48
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L64
.L57:
	ldr	r3, [r5]
	cmp	r3, #20
	beq	.L65
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L66
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L66:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	goToLose
.L64:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	goToPause
.L65:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	goToWin
.L68:
	.align	2
.L67:
	.word	updateGame
	.word	health
	.word	hearts
	.word	drawGame
	.word	sprintf
	.word	.LC6
	.word	buffer
	.word	drawString4
	.word	drawRect4
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.size	game, .-game
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
	ldr	r1, .L80
	push	{r4, r7, fp, lr}
	ldr	r3, .L80+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L80+8
	ldr	fp, .L80+12
	ldr	r5, .L80+16
	ldr	r10, .L80+20
	ldr	r9, .L80+24
	ldr	r8, .L80+28
	ldr	r7, .L80+32
	ldr	r4, .L80+36
.L70:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L71:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L71
.L73:
	.word	.L72
	.word	.L74
	.word	.L75
	.word	.L76
	.word	.L76
.L76:
	mov	lr, pc
	bx	r7
	b	.L70
.L75:
	mov	lr, pc
	bx	r8
	b	.L70
.L74:
	mov	lr, pc
	bx	r9
	b	.L70
.L72:
	mov	lr, pc
	bx	r10
	b	.L70
.L81:
	.align	2
.L80:
	.word	1044
	.word	goToStart
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.size	main, .-main
	.text
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
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Pause\000"
	.space	2
.LC1:
	.ascii	"Press start to resume\000"
	.space	2
.LC2:
	.ascii	" You Won!\000"
	.space	2
.LC3:
	.ascii	"All three have life insurance!\000"
	.space	1
.LC4:
	.ascii	"Press start to play again\000"
	.space	2
.LC5:
	.ascii	"You killed all three men.\000"
	.space	2
.LC6:
	.ascii	"Health: %d                Hearts: %d\000"
	.ident	"GCC: (devkitARM release 47) 7.1.0"
