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
	mov	r3, #67108864
	ldr	r2, .L4
	push	{r4, lr}
	ldr	r0, .L4+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	32736
	.word	fillScreen
	.word	state
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
	ldr	r2, .L13
	ldr	r4, .L13+4
	ldrh	r2, [r2]
	ldr	r3, [r4]
	tst	r2, #8
	add	r3, r3, #1
	str	r3, [r4]
	beq	.L6
	ldr	r3, .L13+8
	ldrh	r0, [r3]
	ands	r0, r0, #8
	beq	.L12
.L6:
	pop	{r4, lr}
	bx	lr
.L12:
	ldr	r3, .L13+12
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L13+16
	ldr	r0, [r4]
	ldr	r3, .L13+20
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	oldButtons
	.word	seed
	.word	buttons
	.word	fillScreen
	.word	state
	.word	srand
	.word	initGame
	.size	start, .-start
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
	ldr	r3, .L17
	ldr	r0, .L17+4
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L17+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L18:
	.align	2
.L17:
	.word	fillScreen
	.word	32736
	.word	state
	.size	goToStart, .-goToStart
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
	ldr	r3, .L21
	mov	r0, #0
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L21+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L22:
	.align	2
.L21:
	.word	fillScreen
	.word	state
	.size	goToGame, .-goToGame
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
	ldr	r3, .L33
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L33+4
	ldrh	r3, [r3]
	push	{r4, lr}
	ands	r4, r3, #8
	beq	.L32
	pop	{r4, lr}
	bx	lr
.L32:
	ldr	r3, .L33+8
	ldr	r0, .L33+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+16
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	32736
	.word	state
	.size	win, .-win
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
	ldr	r3, .L37
	mov	r0, #992
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L37+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L38:
	.align	2
.L37:
	.word	fillScreen
	.word	state
	.size	goToWin, .-goToWin
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
	ldr	r3, .L49
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L49+4
	ldrh	r3, [r3]
	push	{r4, lr}
	ands	r4, r3, #8
	beq	.L48
	pop	{r4, lr}
	bx	lr
.L48:
	ldr	r2, .L49+8
	ldr	r3, .L49+12
	ldr	r0, .L49+16
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+20
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	oldButtons
	.word	buttons
	.word	go
	.word	fillScreen
	.word	32736
	.word	state
	.size	lose, .-lose
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
	push	{r4, r5, lr}
	mov	r5, #31
	sub	sp, sp, #12
	mov	r0, #0
	ldr	r3, .L53
	mov	lr, pc
	bx	r3
	ldr	r4, .L53+4
	str	r5, [sp]
	mov	r3, #30
	mov	r2, #85
	mov	r1, #80
	mov	r0, #35
	mov	lr, pc
	bx	r4
	str	r5, [sp]
	mov	r3, #40
	mov	r2, #20
	mov	r1, #110
	mov	r0, #100
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L53+8
	str	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	fillScreen
	.word	drawRect
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
	push	{r4, lr}
	ldr	r3, .L61
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L59
.L56:
	ldr	r3, .L61+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L60
	pop	{r4, lr}
	bx	lr
.L60:
	pop	{r4, lr}
	b	goToLose
.L59:
	ldr	r3, .L61+20
	mov	r0, #992
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L61+24
	str	r2, [r3]
	b	.L56
.L62:
	.align	2
.L61:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	bricksRemaining
	.word	bulletOOB
	.word	fillScreen
	.word	state
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
	mov	r3, #67108864
	ldr	r2, .L74
	push	{r4, r7, fp, lr}
	ldr	r0, .L74+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L74+8
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	r2, r3
	ldr	r6, .L74+12
	ldr	fp, .L74+16
	str	r3, [r6]
	ldr	r5, .L74+20
	ldr	r10, .L74+24
	ldr	r9, .L74+28
	ldr	r8, .L74+32
	ldr	r7, .L74+36
	ldr	r4, .L74+40
.L64:
	ldrh	r3, [fp]
.L65:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L65
.L67:
	.word	.L66
	.word	.L68
	.word	.L69
	.word	.L70
.L70:
	mov	lr, pc
	bx	r7
.L71:
	ldr	r2, [r6]
	b	.L64
.L69:
	mov	lr, pc
	bx	r8
	b	.L71
.L68:
	mov	lr, pc
	bx	r9
	b	.L71
.L66:
	mov	lr, pc
	bx	r10
	b	.L71
.L75:
	.align	2
.L74:
	.word	1027
	.word	32736
	.word	fillScreen
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	win
	.word	lose
	.word	67109120
	.size	main, .-main
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
