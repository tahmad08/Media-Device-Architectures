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
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #140
	str	lr, [sp, #-4]!
	mov	r2, #118
	mov	lr, #4
	mov	ip, #2
	mov	r0, #30
	ldr	r3, .L4
	str	r1, [r3]
	str	r1, [r3, #8]
	ldr	r1, .L4+4
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	17392
	.size	initPlayer, .-initPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L10
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L7
	ldr	r3, .L10+4
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #16]
	cmp	r2, r1
	bge	.L9
.L7:
	ldr	r3, .L10
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bxne	lr
	ldr	r3, .L10+4
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #16]
	ldr	r2, [r3, #24]
	rsb	ip, r0, #240
	add	r2, r1, r2
	cmp	r2, ip
	addle	r1, r1, r0
	strle	r1, [r3, #4]
	bx	lr
.L9:
	sub	r2, r2, r1
	str	r2, [r3, #4]
	bx	lr
.L11:
	.align	2
.L10:
	.word	67109120
	.word	player
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	push	{r4, r5, lr}
	ldr	r4, .L14
	sub	sp, sp, #12
	add	r2, r4, #20
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L14+4
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldrh	ip, [r4, #28]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	player
	.word	drawRect
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBall, %function
initBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #3
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L18
	ldr	r5, .L18+4
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	mov	lr, pc
	bx	r5
	ldr	r3, .L18+8
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #3
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	add	r0, r0, #70
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	mov	r2, #1
	mvn	ip, #32768
	mov	r1, #0
	ldr	r3, .L18+12
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	ldr	lr, [r4]
	sub	r3, r0, r3, lsl r2
	add	r3, r3, #80
	str	lr, [r4, #8]
	strh	ip, [r4, #32]	@ movhi
	str	r1, [r4, #40]
	str	r3, [r4, #4]
	str	r3, [r4, #12]
	str	r2, [r4, #16]
	str	r2, [r4, #20]
	str	r2, [r4, #36]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	ball
	.word	rand
	.word	1717986919
	.word	1374389535
	.size	initBall, .-initBall
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L26
	ldr	r3, [r4, #36]
	cmp	r3, #0
	sub	sp, sp, #12
	bne	.L24
	ldr	ip, [r4, #40]
	cmp	ip, #0
	beq	.L25
.L22:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L25:
	add	r2, r4, #24
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L26+4
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L22
.L24:
	mov	ip, #0
	add	r2, r4, #24
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L26+4
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldrh	ip, [r4, #32]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	b	.L22
.L27:
	.align	2
.L26:
	.word	ball
	.word	drawRect
	.size	drawBall, .-drawBall
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L36
	ldr	r0, [r4]
	cmp	r0, #0
	ldrle	r3, [r4, #16]
	ldr	r1, [r4, #4]
	rsble	r3, r3, #0
	strle	r3, [r4, #16]
	cmp	r1, #0
	sub	sp, sp, #20
	ldr	r3, [r4, #28]
	ble	.L30
	add	r2, r1, r3
	cmp	r2, #239
	ble	.L31
.L30:
	ldr	r2, [r4, #20]
	rsb	r2, r2, #0
	str	r2, [r4, #20]
.L31:
	ldr	r2, .L36+4
	add	r5, r2, #20
	ldm	r5, {r5, ip}
	str	ip, [sp, #12]
	ldm	r2, {ip, lr}
	str	r5, [sp, #8]
	ldr	r2, [r4, #24]
	stm	sp, {ip, lr}
	ldr	r5, .L36+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldrne	r3, [r4, #16]
	ldr	r2, [r4, #24]
	rsbne	r1, r3, #0
	ldr	r3, [r4]
	add	r2, r3, r2
	ldreq	r1, [r4, #16]
	strne	r1, [r4, #16]
	cmp	r2, #159
	movgt	r2, #0
	ldrgt	r0, .L36+12
	strgt	r2, [r4, #36]
	strgt	r2, [r0]
	ldr	r2, [r4, #4]
	ldr	r0, [r4, #20]
	add	r3, r3, r1
	add	r2, r2, r0
	str	r3, [r4]
	str	r2, [r4, #4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	ball
	.word	player
	.word	collision
	.word	ballOOB
	.size	updateBall, .-updateBall
	.align	2
	.global	initBricks
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBricks, %function
initBricks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L46
	push	{r4, r5, r6, lr}
	mov	r0, r2
	mov	r6, #15
	mov	r5, r2
	mov	r4, #20
	mov	lr, #1
	ldr	r1, .L46+4
	add	ip, r3, #1584
	b	.L41
.L45:
	cmp	r2, #239
	bgt	.L39
	cmp	r3, ip
	beq	.L44
.L41:
	cmp	r2, #239
	stm	r3, {r0, r2}
	str	r6, [r3, #24]
	str	r4, [r3, #28]
	strh	r1, [r3, #32]	@ movhi
	str	lr, [r3, #36]
	str	r5, [r3, #40]
	add	r2, r2, #20
	add	r3, r3, #44
	ble	.L45
.L39:
	cmp	r3, ip
	mov	r2, #0
	add	r0, r0, #15
	add	r1, r1, #8192
	bne	.L41
.L44:
	pop	{r4, r5, r6, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	bricks
	.word	10000
	.size	initBricks, .-initBricks
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #140
	push	{r4, lr}
	mov	r2, #118
	mov	lr, #4
	mov	r0, #30
	mov	ip, #2
	ldr	r3, .L50
	str	r1, [r3]
	str	r1, [r3, #8]
	ldr	r1, .L50+4
	str	lr, [r3, #16]
	str	r0, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	str	ip, [r3, #20]
	bl	initBall
	bl	initBricks
	mov	r0, #36
	mov	r2, #1
	ldr	r1, .L50+8
	ldr	r3, .L50+12
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	player
	.word	17392
	.word	bricksRemaining
	.word	ballOOB
	.size	initGame, .-initGame
	.align	2
	.global	updateBrick
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBrick, %function
updateBrick:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L63
	ldr	lr, [r0, #28]
	sub	sp, sp, #16
	add	r2, r5, #24
	ldr	ip, [r4, #24]
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	ldm	r5, {r0, r1}
	stm	sp, {ip, lr}
	ldr	r6, .L63+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L52
	mov	r0, #0
	ldr	r1, .L63+8
	ldr	r3, [r5, #16]
	ldr	r2, [r1]
	rsb	r3, r3, #0
	sub	r2, r2, #1
	str	r2, [r1]
	str	r3, [r5, #16]
	str	r0, [r4, #36]
.L52:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	ball
	.word	collision
	.word	bricksRemaining
	.size	updateBrick, .-updateBrick
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r3, .L79
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L66
	ldr	r3, .L79+4
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L78
.L66:
	ldr	r3, .L79+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L67
.L68:
	ldr	r4, .L79+12
	add	r5, r4, #1584
.L69:
	mov	r0, r4
	add	r4, r4, #44
	bl	updateBrick
	cmp	r4, r5
	bne	.L69
	pop	{r4, r5, r6, lr}
	bx	lr
.L78:
	mov	r2, #1
	ldr	r3, .L79+8
	str	r2, [r3]
.L67:
	bl	updateBall
	b	.L68
.L80:
	.align	2
.L79:
	.word	oldButtons
	.word	buttons
	.word	go
	.word	bricks
	.size	updateGame, .-updateGame
	.align	2
	.global	drawBrick
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBrick, %function
drawBrick:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	sub	sp, sp, #12
	mov	r4, r0
	bne	.L85
	ldr	ip, [r0, #40]
	cmp	ip, #0
	beq	.L86
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L86:
	add	r2, r0, #24
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L87
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L85:
	ldrh	ip, [r4, #32]
	add	r2, r0, #24
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r4, .L87
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L88:
	.align	2
.L87:
	.word	drawRect
	.size	drawBrick, .-drawBrick
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	drawPlayer
	bl	drawBall
	ldr	r4, .L93
	add	r5, r4, #1584
.L90:
	mov	r0, r4
	add	r4, r4, #44
	bl	drawBrick
	cmp	r4, r5
	bne	.L90
	pop	{r4, r5, r6, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	bricks
	.size	drawGame, .-drawGame
	.comm	go,4,4
	.comm	ballOOB,4,4
	.comm	bricksRemaining,4,4
	.comm	bricks,1584,4
	.comm	ball,44,4
	.comm	player,36,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
