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
	push	{r4, lr}
	mov	r1, #140
	mov	r4, #4
	mov	lr, #2
	mov	r2, #118
	mov	ip, #25
	mov	r0, #992
	ldr	r3, .L4
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	r1, [r3]
	str	r1, [r3, #8]
	str	ip, [r3, #24]
	str	r0, [r3, #28]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
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
	.global	initBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullet, %function
initBullet:
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
	.word	bullet
	.word	rand
	.word	1717986919
	.word	1374389535
	.size	initBullet, .-initBullet
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
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
	.word	bullet
	.word	drawRect
	.size	drawBullet, .-drawBullet
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
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
	.word	bullet
	.word	player
	.word	collision
	.word	bulletOOB
	.size	updateBullet, .-updateBullet
	.align	2
	.global	initBricks
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBricks, %function
initBricks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #10
	mov	r10, #20
	mov	fp, r5
	mov	r9, r5
	ldr	r4, .L44
	ldr	r8, .L44+4
	add	r6, r4, #1440
	ldr	r7, .L44+8
	sub	sp, sp, #12
	add	r6, r6, #12
.L41:
	str	r5, [r4, #4]
	str	fp, [r4]
	str	r9, [r4, #24]
	str	r10, [r4, #28]
	mov	lr, pc
	bx	r8
	cmp	r5, #219
	addle	r5, r5, #20
	cmp	r5, #220
	mov	ip, #1
	mov	r1, #0
	movgt	r5, #10
	smull	r2, r3, r0, r7
	stm	sp, {r2-r3}
	ldr	r3, [sp, #4]
	asr	r2, r0, #31
	rsb	r3, r2, r3, asr #5
	rsb	r2, r3, r3, lsl #5
	add	r3, r3, r2, lsl #2
	sub	r3, r0, r3, lsl #2
	strh	r3, [r4, #32]	@ movhi
	str	ip, [r4, #36]
	str	r1, [r4, #40]
	add	r4, r4, #44
	addgt	fp, fp, r5
	cmp	r4, r6
	bne	.L41
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	bricks
	.word	rand
	.word	274877907
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
	push	{r4, lr}
	mov	r1, #140
	mov	r2, #118
	mov	lr, #2
	mov	r0, #992
	mov	ip, #25
	mov	r4, #4
	ldr	r3, .L48
	str	r1, [r3]
	str	r1, [r3, #8]
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	r0, [r3, #28]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	str	ip, [r3, #24]
	bl	initBullet
	bl	initBricks
	mov	r0, #35
	mov	r2, #1
	ldr	r1, .L48+4
	ldr	r3, .L48+8
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	player
	.word	bricksRemaining
	.word	bulletOOB
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
	ldr	r5, .L61
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
	ldr	r6, .L61+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L50
	mov	r0, #0
	ldr	r1, .L61+8
	ldr	r3, [r5, #16]
	ldr	r2, [r1]
	rsb	r3, r3, #0
	sub	r2, r2, #1
	str	r2, [r1]
	str	r3, [r5, #16]
	str	r0, [r4, #36]
.L50:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	bullet
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
	ldr	r3, .L77
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L64
	ldr	r3, .L77+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L76
.L64:
	ldr	r3, .L77+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L65
.L66:
	ldr	r4, .L77+12
	add	r5, r4, #1536
	add	r5, r5, #4
.L67:
	mov	r0, r4
	add	r4, r4, #44
	bl	updateBrick
	cmp	r4, r5
	bne	.L67
	pop	{r4, r5, r6, lr}
	bx	lr
.L76:
	mov	r2, #1
	ldr	r3, .L77+8
	str	r2, [r3]
.L65:
	bl	updateBullet
	b	.L66
.L78:
	.align	2
.L77:
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
	bne	.L83
	ldr	ip, [r0, #40]
	cmp	ip, #0
	beq	.L84
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L84:
	add	r2, r0, #24
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L85
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L83:
	ldrh	ip, [r4, #32]
	add	r2, r0, #24
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r4, .L85
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L86:
	.align	2
.L85:
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
	bl	drawBullet
	ldr	r4, .L91
	add	r5, r4, #1536
	add	r5, r5, #4
.L88:
	mov	r0, r4
	add	r4, r4, #44
	bl	drawBrick
	cmp	r4, r5
	bne	.L88
	pop	{r4, r5, r6, lr}
	bx	lr
.L92:
	.align	2
.L91:
	.word	bricks
	.size	drawGame, .-drawGame
	.comm	go,4,4
	.comm	bulletOOB,4,4
	.comm	bricksRemaining,4,4
	.comm	bricks,1540,4
	.comm	bullet,44,4
	.comm	player,36,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
