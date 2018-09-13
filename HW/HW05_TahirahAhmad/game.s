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
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet.part.0, %function
updateBullet.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0]
	ldr	r3, [r0, #16]
	add	r3, r2, r3
	cmp	r3, #0
	ble	.L2
	ldr	r1, [r0, #12]
	ldr	r3, [r0, #4]
	add	r3, r3, r1
	sub	r1, r3, #1
	cmp	r1, #237
	bls	.L5
.L2:
	mov	r3, #0
	str	r3, [r0, #28]
	bx	lr
.L5:
	ldr	r1, [r0, #8]
	add	r2, r1, r2
	stm	r0, {r2, r3}
	bx	lr
	.size	updateBullet.part.0, .-updateBullet.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall.part.2, %function
updateBall.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r9, .L32
	ldr	r3, [r9]
	cmp	r3, #6
	sub	sp, sp, #16
	mov	r5, r0
	ble	.L7
	ldr	r2, .L32+4
	smull	r0, r1, r3, r2
	asr	r2, r3, #31
	add	r1, r3, r1
	rsb	r2, r2, r1, asr #2
	rsb	r2, r2, r2, lsl #3
	cmp	r3, r2
	moveq	r3, #1
	streq	r3, [r5, #28]
.L7:
	ldr	r0, [r5]
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #16]
	add	r0, r0, r3
	add	r3, r0, r2
	cmp	r3, #159
	movgt	r3, #0
	ldr	r1, .L32+8
	add	r4, r1, #12
	ldm	r4, {r4, ip}
	strgt	r3, [r5, #32]
	str	r0, [r5]
	ldr	r3, [r5, #20]
	str	ip, [sp, #12]
	ldm	r1, {ip, lr}
	str	r4, [sp, #8]
	ldr	r7, .L32+12
	ldr	r1, [r5, #4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L9
	ldr	r3, [r5, #24]
	cmp	r3, #0
	ldr	r3, [r5, #28]
	bne	.L10
	cmp	r3, #0
	bne	.L11
	ldr	r2, .L32+16
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	mov	r3, #0
	str	r3, [r5, #32]
.L9:
	ldr	r4, .L32+20
	mov	r8, #0
	ldr	r10, .L32+24
	add	r6, r4, #320
	b	.L17
.L15:
	add	r4, r4, #32
	cmp	r4, r6
	beq	.L30
.L17:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L15
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	str	lr, [sp, #12]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L15
	str	r8, [r4, #28]
	ldr	r3, [r5, #24]
	cmp	r3, #0
	str	r8, [r5, #32]
	bne	.L15
	ldr	r3, [r5, #28]
	cmp	r3, #0
	bne	.L15
	ldr	r2, [r10]
	ldr	r3, [r9]
	add	r4, r4, #32
	sub	r2, r2, #1
	add	r3, r3, #1
	cmp	r4, r6
	str	r2, [r10]
	str	r3, [r9]
	bne	.L17
.L30:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L10:
	ldr	r2, .L32+24
	cmp	r3, #0
	ldr	r3, [r2]
	beq	.L31
.L18:
	cmp	r3, #14
	movgt	r3, #15
	addle	r3, r3, #1
	str	r3, [r2]
.L12:
	mov	r3, #0
	str	r3, [r5, #32]
	b	.L9
.L11:
	ldr	r2, .L32+24
	ldr	r3, [r2]
	b	.L18
.L31:
	ldr	r1, [r9]
	sub	r3, r3, #1
	add	r1, r1, #1
	str	r3, [r2]
	str	r1, [r9]
	b	.L12
.L33:
	.align	2
.L32:
	.word	j
	.word	-1840700269
	.word	player
	.word	collision
	.word	hearts
	.word	bullets
	.word	health
	.size	updateBall.part.2, .-updateBall.part.2
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
	mov	r2, #20
	mov	r4, #125
	mov	lr, #118
	mov	ip, #2
	mov	r0, #16
	mov	r1, #24
	ldr	r3, .L36
	stm	r3, {r4, lr}
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	pop	{r4, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	player
	.size	initPlayer, .-initPlayer
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
	push	{r4, lr}
	ldr	r0, .L40
	ldr	ip, .L40+4
	sub	sp, sp, #8
	add	r2, r0, #12
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r4, .L40+8
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	player
	.word	catcherBitmap
	.word	drawImage4
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mvn	r1, #1
	mov	r4, #2
	mov	lr, #4
	mov	r2, #0
	mvn	ip, #3
	ldr	r3, .L46
	add	r0, r3, #320
.L43:
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	r1, [r3, #8]
	str	r2, [r3, #12]
	strb	ip, [r3, #24]
	str	r2, [r3, #28]
	stm	r3, {r1, r2}
	add	r3, r3, #32
	cmp	r3, r0
	bne	.L43
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L58
	mov	r3, #0
	mov	r2, r0
	b	.L51
.L49:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #32
	bxeq	lr
.L51:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	bne	.L49
	push	{r4, lr}
	mov	r4, #1
	ldr	lr, .L58+4
	ldr	r1, [lr, #16]
	ldr	r2, [lr, #4]
	add	ip, r0, r3, lsl #5
	add	r1, r1, r1, lsr #31
	add	r2, r2, r1, asr r4
	ldr	r1, [ip, #20]
	ldr	lr, [lr]
	add	r1, r1, r1, lsr #31
	sub	r2, r2, r1, asr r4
	str	lr, [r0, r3, lsl #5]
	str	r4, [ip, #28]
	str	r2, [ip, #4]
	pop	{r4, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
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
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	b	updateBullet.part.0
	.size	updateBullet, .-updateBullet
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
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	mov	ip, r0
	push	{r4, lr}
	ldrb	ip, [ip, #24]	@ zero_extendqisi2
	sub	sp, sp, #8
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r4, .L71
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L72:
	.align	2
.L71:
	.word	drawRect4
	.size	drawBullet, .-drawBullet
	.align	2
	.global	initBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBalls, %function
initBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, #0
	ldr	r8, .L77
	mov	lr, pc
	bx	r8
	mov	r9, #2
	mov	r10, r5
	mov	r6, #12
	ldr	r1, .L77+4
	smull	r2, r3, r0, r1
	asr	r7, r0, #31
	rsb	r7, r7, r3, asr #7
	add	r7, r7, r7, lsl r9
	add	r7, r7, r7, lsl #4
	ldr	r4, .L77+8
	sub	r7, r0, r7, lsl r9
.L74:
	str	r6, [r4, #16]
	str	r6, [r4, #20]
	str	r10, [r4]
	mov	lr, pc
	bx	r8
	and	r3, r5, #1
	add	r0, r0, r7
	add	r5, r5, #1
	add	r0, r0, #100
	cmp	r5, #45
	stmib	r4, {r0, r9}
	str	r10, [r4, #32]
	str	r3, [r4, #24]
	add	r4, r4, #40
	bne	.L74
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	rand
	.word	1616928865
	.word	balls
	.size	initBalls, .-initBalls
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #2
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r5, #20
	mov	r9, #125
	mov	r8, #118
	mov	r7, #16
	mov	r6, #24
	mov	ip, #4
	mvn	r2, #1
	mov	r4, #0
	mvn	r0, #3
	ldr	r1, .L85
	mov	lr, r3
	str	r3, [r1, #8]
	ldr	r3, .L85+4
	str	r9, [r1]
	str	r8, [r1, #4]
	str	r7, [r1, #12]
	str	r6, [r1, #16]
	str	r5, [r1, #24]
	str	r5, [r1, #28]
	sub	sp, sp, #20
	add	r1, r3, #320
.L80:
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	str	r2, [r3, #8]
	str	r4, [r3, #12]
	strb	r0, [r3, #24]
	str	r4, [r3, #28]
	stm	r3, {r2, r4}
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L80
	mov	r5, sp
	bl	initBalls
	mov	lr, #15
	ldr	r3, .L85+8
	ldm	r3, {r0, r1, r2, r3}
	ldr	ip, .L85+12
	stm	r5, {r0, r1, r2, r3}
	ldr	r2, .L85+16
	ldr	r0, .L85+20
	mov	r3, #256
	str	r4, [r0]
	str	lr, [r2]
	mov	r0, #3
	mov	r2, #83886080
	str	r4, [ip]
	ldr	r1, .L85+24
	ldr	r4, .L85+28
	mov	lr, pc
	bx	r4
	mov	r2, r5
	ldr	r3, .L85+32
	ldr	r0, .L85+36
.L81:
	ldrh	r1, [r2], #2
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r0
	bne	.L81
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	player
	.word	bullets
	.word	.LANCHOR0
	.word	j
	.word	health
	.word	hearts
	.word	catcherPal
	.word	DMANow
	.word	83886576
	.word	83886592
	.size	initGame, .-initGame
	.align	2
	.global	reInitBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	reInitBall, %function
reInitBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, fp, lr}
	ldr	r6, .L93
	mov	r3, #0
	mov	r2, r6
	b	.L90
.L88:
	cmp	r5, #45
	mov	r3, r5
	add	r2, r2, #40
	beq	.L87
.L90:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	add	r5, r3, #1
	bne	.L88
	add	r3, r3, r3, lsl #2
	lsl	r4, r3, #3
	str	r1, [r6, r4]
	ldr	r7, .L93+4
	mov	lr, pc
	bx	r7
	mov	r8, #1
	ldr	r9, .L93+8
	smull	fp, ip, r0, r9
	asr	r2, r0, #31
	rsb	r3, r2, ip, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl r8
	add	r4, r6, r4
	add	r0, r0, #10
	str	r0, [r4, #4]
	str	r8, [r4, #32]
	mov	lr, pc
	bx	r7
	ldr	r1, .L93+12
	smull	r3, r4, r0, r1
	asr	r2, r0, #31
	rsb	r3, r2, r4, asr #3
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	add	r5, r5, r5, lsl #2
	lsl	r5, r5, #3
	add	r0, r0, #5
	str	r0, [r6, r5]
	mov	lr, pc
	bx	r7
	add	r4, r6, r5
	smull	r6, r7, r0, r9
	asr	r3, r0, #31
	ldr	r1, .L93+16
	rsb	r3, r3, r7, asr #6
	add	r3, r3, r3, lsl #6
	ldr	r2, [r1]
	sub	r0, r0, r3, lsl r8
	add	r0, r0, #10
	add	r3, r2, r8
	str	r8, [r4, #32]
	str	r0, [r4, #4]
	str	r3, [r1]
.L87:
	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	balls
	.word	rand
	.word	2114445439
	.word	1717986919
	.word	j
	.size	reInitBall, .-reInitBall
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
	ldr	r3, .L109
	ldrh	r3, [r3, #48]
	tst	r3, #32
	push	{r4, lr}
	ldr	r4, .L109+4
	bne	.L96
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #8]
	cmp	r3, r2
	subge	r3, r3, r2
	strge	r3, [r4, #4]
	blt	.L96
.L97:
	ldr	r3, .L109+8
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r4, #24]
	beq	.L108
	ldr	r2, .L109+12
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L100
.L108:
	add	r2, r3, #1
.L99:
	ldr	r3, [r4, #28]
	cmp	r3, #19
	str	r2, [r4, #24]
	addle	r3, r3, #1
	ble	.L103
	bl	reInitBall
	mov	r3, #1
.L103:
	str	r3, [r4, #28]
	pop	{r4, lr}
	bx	lr
.L96:
	ldr	r3, .L109
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L97
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #8]
	ldr	r3, [r4, #16]
	rsb	r0, r1, #240
	add	r3, r2, r3
	cmp	r3, r0
	addle	r2, r2, r1
	strle	r2, [r4, #4]
	b	.L97
.L100:
	cmp	r3, #14
	ble	.L108
	bl	fireBullet
	mov	r2, #1
	b	.L99
.L110:
	.align	2
.L109:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.size	updatePlayer, .-updatePlayer
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
	ldr	r4, .L127
	bl	updatePlayer
	add	r5, r4, #320
	b	.L113
.L112:
	add	r4, r4, #32
	cmp	r4, r5
	beq	.L125
.L113:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L112
	mov	r0, r4
	add	r4, r4, #32
	bl	updateBullet.part.0
	cmp	r4, r5
	bne	.L113
.L125:
	ldr	r4, .L127+4
	add	r5, r4, #1792
	add	r5, r5, #8
	b	.L115
.L114:
	add	r4, r4, #40
	cmp	r5, r4
	beq	.L126
.L115:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L114
	mov	r0, r4
	add	r4, r4, #40
	bl	updateBall.part.2
	cmp	r5, r4
	bne	.L115
.L126:
	pop	{r4, r5, r6, lr}
	bx	lr
.L128:
	.align	2
.L127:
	.word	bullets
	.word	balls
	.size	updateGame, .-updateGame
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
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	updateBall.part.2
	.size	updateBall, .-updateBall
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
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	mov	ip, r0
	push	{r4, lr}
	ldr	r3, [r0, #24]
	add	r2, ip, #16
	cmp	r3, #0
	sub	sp, sp, #8
	ldm	r0, {r0, r1}
	ldm	r2, {r2, r3}
	bne	.L142
	ldr	ip, [ip, #28]
	cmp	ip, #0
	ldrne	ip, .L143
	ldreq	ip, .L143+4
	ldr	r4, .L143+8
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L142:
	ldr	ip, .L143+12
	ldr	r4, .L143+8
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L144:
	.align	2
.L143:
	.word	blueBoiBitmap
	.word	goodBoiBitmap
	.word	drawImage4
	.word	badBoiBitmap
	.size	drawBall, .-drawBall
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
	ldr	r4, .L156
	sub	sp, sp, #8
	mov	r0, #248
	ldr	r3, .L156+4
	mov	lr, pc
	bx	r3
	ldr	r6, .L156+8
	bl	drawPlayer
	add	r5, r4, #320
	b	.L147
.L146:
	add	r4, r4, #32
	cmp	r4, r5
	beq	.L155
.L147:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L146
	ldrb	ip, [r4, #24]	@ zero_extendqisi2
	add	r2, r4, #16
	ldm	r4, {r0, r1}
	ldm	r2, {r2, r3}
	add	r4, r4, #32
	str	ip, [sp]
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L147
.L155:
	ldr	r4, .L156+12
	add	r5, r4, #1792
	add	r5, r5, #8
.L148:
	mov	r0, r4
	add	r4, r4, #40
	bl	drawBall
	cmp	r4, r5
	bne	.L148
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L157:
	.align	2
.L156:
	.word	bullets
	.word	fillScreen4
	.word	drawRect4
	.word	balls
	.size	drawGame, .-drawGame
	.comm	j,4,4
	.comm	health,4,4
	.comm	hearts,4,4
	.comm	balls,1800,4
	.comm	bullets,320,4
	.comm	player,32,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.short	0
	.short	31744
	.short	992
	.short	31
	.short	32767
	.short	16912
	.short	1023
	.short	17392
	.ident	"GCC: (devkitARM release 47) 7.1.0"
