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
	mov	ip, #0
	ldr	r3, [r0, #40]
	ldr	r1, .L3
	lsl	r3, r3, #3
	ldrh	r2, [r1, r3]
	orr	r2, r2, #512
	str	ip, [r0, #20]
	str	ip, [r0, #32]
	strh	r2, [r1, r3]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	shadowOAM
	.size	updateBullet.part.0, .-updateBullet.part.0
	.set	updateSpecial.part.1,updateBullet.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateScore.part.3, %function
updateScore.part.3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #2
	beq	.L36
	cmp	r0, #3
	bxne	lr
	ldr	r2, .L44
	ldr	r3, [r2, #28]
	cmp	r3, #6
	ble	.L37
	cmp	r3, #7
	beq	.L38
	cmp	r3, #8
	beq	.L39
	cmp	r3, #9
	bxne	lr
	mov	r0, #2
	ldr	r3, .L44+4
	add	r1, r3, #28
	ldm	r1, {r1, ip}
	cmp	r1, ip
	str	r0, [r2, #28]
	bge	.L22
.L25:
	add	r1, r1, #1
	str	r1, [r3, #28]
	bx	lr
.L36:
	ldr	r1, .L44
	ldr	r2, [r1, #32]
	ldr	r3, [r1, #28]
	sub	r2, r2, #1
	cmp	r3, r2
	blt	.L40
	cmp	r3, #8
	beq	.L41
	cmp	r3, #9
	bxne	lr
	mov	r0, #1
	ldr	r3, .L44+4
	add	r2, r3, #28
	ldm	r2, {r2, ip}
	cmp	r2, ip
	str	r0, [r1, #28]
	blt	.L42
.L22:
	mov	r0, #0
.L34:
	ldr	r2, .L44+8
	add	r1, r2, #28
	ldm	r1, {r1, ip}
	cmp	r1, ip
	str	r0, [r3, #28]
	blt	.L43
	ldr	r3, .L44+12
	add	r1, r3, #28
	ldm	r1, {r1, ip}
	cmp	r1, ip
	str	r0, [r2, #28]
	blt	.L25
	mov	r2, #0
	str	r2, [r3, #28]
	bx	lr
.L40:
	add	r3, r3, #2
	str	r3, [r1, #28]
	bx	lr
.L37:
	add	r3, r3, #3
	str	r3, [r2, #28]
	bx	lr
.L41:
	mov	r0, #0
	ldr	r3, .L44+4
	add	r2, r3, #28
	ldm	r2, {r2, ip}
	cmp	r2, ip
	str	r0, [r1, #28]
	bge	.L34
	add	r2, r2, #1
	str	r2, [r3, #28]
	bx	lr
.L43:
	add	r1, r1, #1
	str	r1, [r2, #28]
	bx	lr
.L38:
	mov	r0, #0
	ldr	r3, .L44+4
	add	r1, r3, #28
	ldm	r1, {r1, ip}
	cmp	r1, ip
	str	r0, [r2, #28]
	bge	.L34
	b	.L25
.L39:
	mov	r0, #1
	ldr	r3, .L44+4
	add	r1, r3, #28
	ldm	r1, {r1, ip}
	cmp	r1, ip
	str	r0, [r2, #28]
	bge	.L22
	add	r1, r1, r0
	str	r1, [r3, #28]
	bx	lr
.L42:
	add	r2, r2, r0
	str	r2, [r3, #28]
	bx	lr
.L45:
	.align	2
.L44:
	.word	ones
	.word	tens
	.word	hunds
	.word	thous
	.size	updateScore.part.3, .-updateScore.part.3
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	lr, .L88
	ldr	r1, [lr, #72]
	ldrb	r5, [lr]	@ zero_extendqisi2
	ldr	r3, .L88+4
	lsl	r1, r1, #3
	ldr	r8, [lr, #64]
	orr	r5, r5, #16384
	ldr	r0, [lr, #56]
	ldr	r6, .L88+8
	strh	r5, [r3, r1]	@ movhi
	mov	r4, r3
	add	r1, r3, r1
	mov	ip, r3
	mov	r2, r3
	ldr	r3, [lr, #4]
	add	r0, r0, r8, lsl #4
	and	lr, r3, r6
	lsl	r0, r0, #1
	ldr	r3, .L88+12
	mov	r7, r6
	strh	lr, [r1, #2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	ldr	r6, .L88+16
	add	r5, r3, #1200
.L48:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	beq	.L47
	ldr	r1, [r3, #4]
	ldrb	lr, [r3]	@ zero_extendqisi2
	ldr	r8, [r3, #44]
	ldr	r0, [r3, #36]
	and	r1, r1, r7
	orr	r1, r1, r6
	orr	lr, lr, #16384
	add	r0, r0, r8, lsl #6
	strh	r1, [r2, #10]	@ movhi
	strh	lr, [r2, #8]	@ movhi
	strh	r0, [r2, #12]	@ movhi
.L47:
	add	r3, r3, #60
	cmp	r3, r5
	add	r2, r2, #8
	bne	.L48
	ldr	r3, .L88+20
	ldr	r6, .L88+8
	add	r0, r3, #440
.L50:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L49
	add	r2, r3, #28
	ldr	r1, [r3, #4]
	ldm	r2, {r2, r5}
	ldrb	lr, [r3]	@ zero_extendqisi2
	and	r1, r1, r6
	add	r2, r2, r5, lsl #5
	strh	r1, [r4, #170]	@ movhi
	strh	r2, [r4, #172]	@ movhi
	strh	lr, [r4, #168]	@ movhi
.L49:
	add	r3, r3, #44
	cmp	r3, r0
	add	r4, r4, #8
	bne	.L50
	mov	r2, #0
	ldr	r3, .L88+24
	ldr	r6, .L88+8
.L52:
	ldr	r1, [r3, #16]
	cmp	r1, #0
	beq	.L51
	add	r0, r3, #24
	ldr	lr, [r3, #4]
	ldm	r0, {r0, r5}
	ldrb	r4, [r3]	@ zero_extendqisi2
	add	r1, ip, r2
	and	lr, lr, r6
	add	r0, r0, r5, lsl #5
	strh	lr, [r1, #250]	@ movhi
	strh	r4, [r1, #248]	@ movhi
	strh	r0, [r1, #252]	@ movhi
.L51:
	add	r2, r2, #8
	cmp	r2, #24
	add	r3, r3, #40
	bne	.L52
	ldr	r3, .L88+28
	ldr	r2, .L88+32
	ldr	r6, .L88+8
	add	lr, r3, #1200
.L54:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	beq	.L53
	ldr	r1, [r3, #4]
	ldr	r5, [r3, #44]
	ldr	r0, [r3, #36]
	and	r1, r1, r6
	ldrb	r4, [r3]	@ zero_extendqisi2
	orr	r1, r1, #16384
	add	r0, r0, r5, lsl #6
	strh	r1, [r2, #2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	strh	r4, [r2]	@ movhi
.L53:
	add	r3, r3, #60
	cmp	r3, lr
	add	r2, r2, #8
	bne	.L54
	ldr	r3, .L88+36
	ldr	r2, .L88+40
	ldr	r6, .L88+8
	ldr	r5, .L88+16
	add	r4, r3, #1200
.L56:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	beq	.L55
	ldr	r0, [r3, #4]
	ldr	r7, [r3, #44]
	ldr	r1, [r3, #36]
	ldrb	lr, [r3]	@ zero_extendqisi2
	and	r0, r0, r6
	add	r1, r1, r7, lsl #6
	orr	r0, r0, r5
	orr	r1, r1, #4096
	orr	lr, lr, #16384
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	strh	lr, [r2]	@ movhi
.L55:
	add	r3, r3, #60
	cmp	r3, r4
	add	r2, r2, #8
	bne	.L56
	ldr	r2, .L88+44
	ldr	r3, [r2, #36]
	ldrb	r4, [r2]	@ zero_extendqisi2
	lsl	r3, r3, #3
	strh	r4, [ip, r3]	@ movhi
	ldr	r5, [r2, #4]
	ldr	r4, .L88+8
	add	r3, ip, r3
	and	r5, r5, r4
	add	r2, r2, #24
	strh	r5, [r3, #2]	@ movhi
	ldm	r2, {r2, r5}
	ldr	lr, .L88+48
	add	r2, r2, r5, lsl #5
	strh	r2, [r3, #4]	@ movhi
	ldr	r3, [lr, #36]
	ldrb	r5, [lr]	@ zero_extendqisi2
	lsl	r3, r3, #3
	strh	r5, [ip, r3]	@ movhi
	ldr	r5, [lr, #4]
	add	r3, ip, r3
	and	r5, r5, r4
	ldr	r0, .L88+52
	strh	r5, [r3, #2]	@ movhi
	ldr	r5, [lr, #28]
	ldr	lr, [lr, #24]
	ldr	r2, [r0, #36]
	add	lr, lr, r5, lsl #5
	strh	lr, [r3, #4]	@ movhi
	ldrb	lr, [r0]	@ zero_extendqisi2
	lsl	r2, r2, #3
	strh	lr, [ip, r2]	@ movhi
	ldr	lr, [r0, #4]
	add	r2, ip, r2
	and	lr, lr, r4
	ldr	r1, .L88+56
	strh	lr, [r2, #2]	@ movhi
	ldr	r5, [r0, #28]
	ldr	lr, [r0, #24]
	ldr	r3, [r1, #36]
	add	lr, lr, r5, lsl #5
	ldr	r0, [r1, #4]
	strh	lr, [r2, #4]	@ movhi
	add	r1, r1, #24
	ldrb	r2, [r1, #-24]	@ zero_extendqisi2
	lsl	r3, r3, #3
	ldm	r1, {r1, lr}
	strh	r2, [ip, r3]	@ movhi
	ldr	r2, .L88+60
	add	r3, ip, r3
	and	r0, r0, r4
	add	r1, r1, lr, lsl #5
	strh	r0, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, [r2, #20]
	cmp	r3, #0
	beq	.L57
	ldr	r1, [r2, #4]
	ldr	r3, [r2, #40]
	ldrb	r0, [r2]	@ zero_extendqisi2
	and	r4, r4, r1
	ldr	r1, [r2, #32]
	ldr	r2, [r2, #28]
	lsl	r3, r3, #3
	add	r2, r2, r1, lsl #5
	add	r1, ip, r3
	strh	r0, [ip, r3]	@ movhi
	strh	r4, [r1, #2]	@ movhi
	strh	r2, [r1, #4]	@ movhi
.L57:
	ldr	r3, .L88+64
	ldr	r7, .L88+8
	add	r4, r3, #264
.L59:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L58
	ldr	r2, [r3, #40]
	add	r1, r3, #28
	ldr	r0, [r3, #4]
	ldm	r1, {r1, r6}
	lsl	r2, r2, #3
	ldrb	r5, [r3]	@ zero_extendqisi2
	add	lr, ip, r2
	and	r0, r0, r7
	add	r1, r1, r6, lsl #5
	strh	r5, [ip, r2]	@ movhi
	strh	r0, [lr, #2]	@ movhi
	strh	r1, [lr, #4]	@ movhi
.L58:
	add	r3, r3, #44
	cmp	r4, r3
	bne	.L59
	ldr	r3, .L88+68
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	player
	.word	shadowOAM
	.word	511
	.word	enemy1
	.word	-32768
	.word	bullet
	.word	lives
	.word	enemy2
	.word	shadowOAM+280
	.word	enemy3
	.word	shadowOAM+440
	.word	ones
	.word	tens
	.word	hunds
	.word	thous
	.word	icon
	.word	special
	.word	waitForVBlank
	.size	drawGame, .-drawGame
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
	push	{r4, r5, r6, lr}
	mov	r2, #0
	mov	r6, #16
	mov	r5, #8
	mov	r4, #125
	mov	lr, #118
	mov	r1, #2
	mov	ip, #20
	mov	r0, #1
	ldr	r3, .L92
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	stm	r3, {r4, lr}
	str	ip, [r3, #36]
	str	r0, [r3, #68]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #64]
	str	r2, [r3, #72]
	str	r2, [r3, #76]
	str	r2, [r3, #80]
	str	r2, [r3, #56]
	str	r2, [r3, #84]
	str	r2, [r3, #88]
	pop	{r4, r5, r6, lr}
	bx	lr
.L93:
	.align	2
.L92:
	.word	player
	.size	initPlayer, .-initPlayer
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
	push	{r4, r5, r6, r7, lr}
	mov	r6, #1
	mov	r1, #21
	mvn	r7, #1
	mov	ip, #8
	mov	r0, #0
	mov	r5, #13
	ldr	r4, .L98
	ldr	r3, [r4, #16]
	ldr	lr, [r4, #4]
	add	r2, r3, r3, lsr #31
	ldr	r4, [r4]
	ldr	r3, .L98+4
	add	lr, lr, r2, asr r6
.L95:
	ldr	r2, [r3, #16]
	str	r1, [r3, #40]
	add	r2, r2, r2, lsr #31
	add	r1, r1, #1
	sub	r2, lr, r2, asr #1
	cmp	r1, #31
	str	r4, [r3]
	str	r7, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #20]
	str	r0, [r3, #24]
	str	r0, [r3, #32]
	str	r6, [r3, #36]
	str	r5, [r3, #28]
	str	r2, [r3, #4]
	str	ip, [r3, #16]
	add	r3, r3, #44
	bne	.L95
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L99:
	.align	2
.L98:
	.word	player
	.word	bullet
	.size	initBullet, .-initBullet
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
	ldr	r0, .L110
	mov	r3, #0
	mov	r2, r0
	b	.L103
.L101:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #44
	bxeq	lr
.L103:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L101
	push	{r4, r5, r6, lr}
	mov	r4, #1
	ldr	r5, .L110+4
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl r4
	lsl	r3, r3, #2
	ldr	r2, [r5, #16]
	ldr	r6, [r5]
	add	ip, r0, r3
	add	lr, r2, r2, lsr #31
	str	r6, [r0, r3]
	ldr	r2, [r5, #4]
	ldr	r3, [ip, #16]
	add	r2, r2, lr, asr r4
	add	r3, r3, r3, lsr #31
	sub	r3, r2, r3, asr r4
	str	r4, [ip, #20]
	str	r1, [ip, #32]
	str	r3, [ip, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L111:
	.align	2
.L110:
	.word	bullet
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
	ldr	r2, [r0, #20]
	cmp	r2, #0
	bxeq	lr
	ldr	r2, [r0]
	cmp	r2, #5
	ble	updateBullet.part.0
.L118:
	ldr	r1, [r0, #8]
	add	r2, r1, r2
	str	r2, [r0]
	bx	lr
	.size	updateBullet, .-updateBullet
	.align	2
	.global	initSpecial
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSpecial, %function
initSpecial:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r6, #1
	mov	r1, #82
	mvn	r7, #1
	mov	ip, #8
	mov	r0, #0
	mov	r5, #15
	ldr	r4, .L123
	ldr	r3, [r4, #16]
	ldr	lr, [r4, #4]
	add	r2, r3, r3, lsr #31
	ldr	r4, [r4]
	ldr	r3, .L123+4
	add	lr, lr, r2, asr r6
.L120:
	ldr	r2, [r3, #16]
	str	r1, [r3, #40]
	add	r2, r2, r2, lsr #31
	add	r1, r1, #1
	sub	r2, lr, r2, asr #1
	cmp	r1, #88
	str	r4, [r3]
	str	r7, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #20]
	str	r0, [r3, #24]
	str	r0, [r3, #32]
	str	r6, [r3, #36]
	str	r5, [r3, #28]
	str	r2, [r3, #4]
	str	ip, [r3, #16]
	add	r3, r3, #44
	bne	.L120
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L124:
	.align	2
.L123:
	.word	player
	.word	special
	.size	initSpecial, .-initSpecial
	.align	2
	.global	fireSpecial
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireSpecial, %function
fireSpecial:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L136
	mov	r2, r0
	ldr	r1, [r2, #20]
	cmp	r1, #0
	mov	r3, #0
	beq	.L135
.L126:
	add	r3, r3, #1
	cmp	r3, #6
	add	r2, r2, #44
	bxeq	lr
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L126
.L135:
	push	{r4, r5, lr}
	mov	r4, #1
	ldr	lr, .L136+4
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl r4
	ldr	r2, [lr, #16]
	lsl	r3, r3, #2
	add	r1, r2, r2, lsr #31
	ldr	r2, [lr, #4]
	add	ip, r0, r3
	add	r2, r2, r1, asr r4
	ldr	r1, [ip, #16]
	ldr	r5, [lr]
	add	r1, r1, r1, lsr #31
	sub	r2, r2, r1, asr r4
	str	r5, [r0, r3]
	str	r4, [ip, #20]
	str	r2, [ip, #4]
	pop	{r4, r5, lr}
	bx	lr
.L137:
	.align	2
.L136:
	.word	special
	.word	player
	.size	fireSpecial, .-fireSpecial
	.align	2
	.global	updateSpecial
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSpecial, %function
updateSpecial:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #20]
	cmp	r2, #0
	bxeq	lr
	ldr	r2, [r0]
	cmp	r2, #5
	ble	updateSpecial.part.1
.L144:
	ldr	r1, [r0, #8]
	add	r2, r1, r2
	str	r2, [r0]
	bx	lr
	.size	updateSpecial, .-updateSpecial
	.align	2
	.global	initIcon
	.syntax unified
	.arm
	.fpu softvfp
	.type	initIcon, %function
initIcon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	lr, #1
	mov	r0, #0
	mov	r6, #82
	mov	r4, #14
	mov	ip, #8
	ldr	r1, .L147
	ldr	r3, [r1, #16]
	ldr	r2, [r1, #4]
	add	r3, r3, r3, lsr #31
	add	r2, r2, r3, asr lr
	ldr	r3, .L147+4
	ldr	r5, [r1]
	ldr	r1, [r3, #16]
	add	r1, r1, r1, lsr #31
	sub	r2, r2, r1, asr lr
	str	r6, [r3, #40]
	str	r5, [r3]
	str	r4, [r3, #28]
	str	lr, [r3, #8]
	str	lr, [r3, #36]
	str	r2, [r3, #4]
	str	ip, [r3, #12]
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	str	r0, [r3, #24]
	str	r0, [r3, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L148:
	.align	2
.L147:
	.word	player
	.word	icon
	.size	initIcon, .-initIcon
	.align	2
	.global	updateIcon
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateIcon, %function
updateIcon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L157
	ldr	r3, [r5, #44]
	ldr	r4, .L157+4
	tst	r3, #1
	ldreq	r3, [r4, #8]
	ldr	r0, [r4]
	ldr	lr, [r5, #16]
	ldr	ip, [r5, #20]
	sub	sp, sp, #16
	add	r2, r4, #12
	addeq	r0, r0, r3
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r5, #4]
	ldr	ip, [r5]
	ldr	r1, [r4, #4]
	stm	sp, {ip, lr}
	ldr	r6, .L157+8
	streq	r0, [r4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L151
	mov	lr, #0
	mov	ip, #1
	mov	r0, #10
	ldr	r3, [r4, #40]
	ldr	r1, .L157+12
	lsl	r3, r3, #3
	ldrh	r2, [r1, r3]
	orr	r2, r2, #512
	strh	r2, [r1, r3]	@ movhi
	str	lr, [r4, #20]
	str	ip, [r5, #76]
	str	r0, [r5, #80]
.L151:
	ldr	r3, [r4]
	ldr	r2, [r4, #12]
	add	r3, r3, r2
	cmp	r3, #149
	ble	.L149
	mov	r0, #0
	ldr	r3, [r4, #40]
	ldr	r1, .L157+12
	lsl	r3, r3, #3
	ldrh	r2, [r1, r3]
	orr	r2, r2, #512
	strh	r2, [r1, r3]	@ movhi
	str	r0, [r4, #20]
.L149:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L158:
	.align	2
.L157:
	.word	player
	.word	icon
	.word	collision
	.word	shadowOAM
	.size	updateIcon, .-updateIcon
	.align	2
	.global	spawnIcon
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnIcon, %function
spawnIcon:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldr	ip, .L161
	add	r3, r3, r3, lsr #31
	add	r3, r0, r3, asr lr
	add	r2, r2, r2, lsr #31
	ldr	r0, [sp, #4]
	add	r2, r1, r2, asr lr
	str	lr, [ip, #20]
	ldr	lr, [sp], #4
	str	r3, [ip]
	str	r2, [ip, #4]
	str	r0, [ip, #8]
	b	updateIcon
.L162:
	.align	2
.L161:
	.word	icon
	.size	spawnIcon, .-spawnIcon
	.align	2
	.global	initEnemies1
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies1, %function
initEnemies1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, fp, lr}
	mov	r8, #0
	mov	r9, #1
	mov	r7, #230
	ldr	r4, .L167
	ldr	r6, .L167+4
	ldr	r5, .L167+8
.L164:
	str	r9, [r4]
	mov	lr, pc
	bx	r6
	smull	fp, ip, r0, r5
	asr	r2, r0, #31
	rsb	r2, r2, ip, asr #6
	mul	r3, r7, r2
	mov	lr, #32
	sub	r0, r0, r3
	mov	ip, #16
	mov	r3, #0
	mov	r1, #3
	mov	r2, #2
	cmp	r0, #0
	add	r8, r8, #1
	rsblt	r0, r0, #0
	cmp	r8, #20
	str	r8, [r4, #52]
	stmib	r4, {r0, r9}
	str	lr, [r4, #16]
	str	ip, [r4, #20]
	str	r3, [r4, #24]
	str	r3, [r4, #32]
	str	r3, [r4, #40]
	str	r3, [r4, #44]
	str	r3, [r4, #56]
	str	r1, [r4, #48]
	str	r2, [r4, #36]
	add	r4, r4, #60
	bne	.L164
	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
	bx	lr
.L168:
	.align	2
.L167:
	.word	enemy1
	.word	rand
	.word	1195121335
	.size	initEnemies1, .-initEnemies1
	.align	2
	.global	spawnEnemy1
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnEnemy1, %function
spawnEnemy1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L183
	mov	r3, #0
	mov	r2, r0
	b	.L174
.L170:
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #60
	bxeq	lr
.L174:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	bne	.L170
	push	{r4, r5, r6, r7, r8, lr}
	ldr	ip, .L183+4
	ldr	lr, .L183+8
	ldr	r2, [ip]
	ldr	r1, [lr]
	cmp	r2, r1
	moveq	r5, #1
	lsleq	r2, r3, #4
	lslne	r2, r3, #4
	subeq	r4, r2, r3
	sub	r3, r2, r3
	addeq	r4, r0, r4, lsl #2
	lsl	r3, r3, #2
	streq	r5, [r4, #56]
	ldr	ip, [ip]
	add	r4, r0, r3
	ldr	r2, [r4, #20]
	cmp	r1, ip
	addlt	r1, r1, #20
	rsb	r2, r2, #0
	strlt	r1, [lr]
	str	r2, [r0, r3]
	ldr	r1, .L183+12
	mov	lr, pc
	bx	r1
	mov	r1, #1
	ldr	r3, .L183+16
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #3
	add	r2, r3, r3, lsl #3
	add	r2, r2, r2, lsl #3
	add	r3, r3, r2, lsl #1
	ldr	r2, .L183+20
	sub	r0, r0, r3
	add	r0, r0, #24
	ldr	r3, [r2]
	cmp	r0, #0
	rsblt	r0, r0, #0
	add	r3, r3, r1
	str	r0, [r4, #4]
	str	r1, [r4, #24]
	str	r3, [r2]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L184:
	.align	2
.L183:
	.word	enemy1
	.word	score
	.word	cheatcnt
	.word	rand
	.word	210795941
	.word	enemy1onscrn
	.size	spawnEnemy1, .-spawnEnemy1
	.align	2
	.global	initEnemies2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies2, %function
initEnemies2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #35
	mov	r10, #1
	mov	r8, #230
	ldr	r4, .L189
	ldr	r7, .L189+4
	ldr	r6, .L189+8
	add	r5, r4, #1200
.L186:
	str	r10, [r4]
	mov	lr, pc
	bx	r7
	smull	fp, ip, r0, r6
	asr	r2, r0, #31
	rsb	r2, r2, ip, asr #6
	mul	r3, r8, r2
	mov	lr, #2
	sub	r0, r0, r3
	mov	r2, #16
	mov	r3, #0
	mov	ip, #3
	mov	r1, #6
	cmp	r0, #0
	rsblt	r0, r0, #0
	str	r9, [r4, #52]
	str	r10, [r4, #8]
	str	r0, [r4, #4]
	str	r2, [r4, #16]
	str	r2, [r4, #20]
	str	r3, [r4, #24]
	str	r3, [r4, #32]
	str	r3, [r4, #40]
	str	r3, [r4, #44]
	str	lr, [r4, #28]
	str	ip, [r4, #48]
	str	r1, [r4, #36]
	add	r4, r4, #60
	cmp	r4, r5
	add	r9, r9, #1
	bne	.L186
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L190:
	.align	2
.L189:
	.word	enemy2
	.word	rand
	.word	1195121335
	.size	initEnemies2, .-initEnemies2
	.align	2
	.global	spawnEnemy2
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnEnemy2, %function
spawnEnemy2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L201
	mov	r3, #0
	mov	r2, r0
	b	.L194
.L192:
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #60
	bxeq	lr
.L194:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	bne	.L192
	rsb	r3, r3, r3, lsl #4
	lsl	r3, r3, #2
	push	{r4, r6, r7, lr}
	add	r4, r0, r3
	ldr	r2, [r4, #20]
	rsb	r2, r2, #0
	str	r2, [r0, r3]
	ldr	r1, .L201+4
	mov	lr, pc
	bx	r1
	ldr	r3, .L201+8
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	sub	r0, r0, r3, lsl #4
	mov	r2, #1
	mov	r3, #2
	add	r0, r0, #24
	cmp	r0, #0
	rsblt	r0, r0, #0
	str	r0, [r4, #4]
	str	r2, [r4, #24]
	str	r3, [r4, #28]
	pop	{r4, r6, r7, lr}
	bx	lr
.L202:
	.align	2
.L201:
	.word	enemy2
	.word	rand
	.word	780903145
	.size	spawnEnemy2, .-spawnEnemy2
	.align	2
	.global	updateEnemy2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy2, %function
updateEnemy2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, [r0, #24]
	cmp	r3, #0
	sub	sp, sp, #16
	mov	r5, r0
	ldr	r1, .L234
	beq	.L205
	ldr	r0, [r1, #44]
	tst	r0, #1
	ldr	r3, .L234+4
	ldr	r2, [r5]
	beq	.L206
	ldr	ip, [r3]
	cmp	ip, #99
	bgt	.L206
	ldr	r3, [r5, #8]
	add	r2, r2, r3
	str	r2, [r5]
.L207:
	ldr	r3, .L234+8
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r0, r3, lsl #2
	ldr	r3, [r5, #44]
	addeq	r3, r3, #1
	streq	r3, [r5, #44]
	cmp	r3, #3
	moveq	r3, #0
	streq	r3, [r5, #44]
	ldr	r3, [r5, #20]
	add	r2, r2, r3
	cmp	r2, #147
	ble	.L205
	mov	ip, #0
	ldr	r3, [r5, #52]
	ldr	r0, .L234+12
	lsl	r3, r3, #3
	ldrh	r2, [r0, r3]
	orr	r2, r2, #512
	str	ip, [r5, #24]
	strh	r2, [r0, r3]	@ movhi
.L205:
	ldr	r3, [r1, #76]
	cmp	r3, #0
	bne	.L211
	ldr	r4, .L234+16
	ldr	r8, .L234+20
	ldr	r7, .L234+12
	ldr	r9, .L234+4
	add	r6, r4, #440
	b	.L216
.L213:
	add	r4, r4, #44
	cmp	r4, r6
	beq	.L203
.L216:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L213
	ldr	lr, [r5, #16]
	add	r2, r4, #12
	ldr	ip, [r5, #20]
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	str	lr, [sp, #12]
	ldr	lr, [r5, #4]
	str	ip, [sp, #8]
	ldr	ip, [r5]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L213
	ldr	r3, [r5, #28]
	cmp	r3, #1
	mov	r0, #0
	ble	.L233
	ldr	r2, [r4, #40]
	lsl	r2, r2, #3
	ldrh	r1, [r7, r2]
	str	r0, [r4, #20]
	add	r4, r4, #44
	sub	r3, r3, #1
	orr	r1, r1, #512
	cmp	r4, r6
	strh	r1, [r7, r2]	@ movhi
	str	r3, [r5, #28]
	bne	.L216
.L203:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L211:
	ldr	r4, .L234+24
	mov	r9, #0
	ldr	r8, .L234+20
	ldr	r10, .L234+4
	ldr	r6, .L234+12
	add	r7, r4, #264
	b	.L219
.L218:
	add	r4, r4, #44
	cmp	r4, r7
	beq	.L203
.L219:
	ldr	lr, [r5, #16]
	add	r2, r4, #12
	ldr	ip, [r5, #20]
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	str	lr, [sp, #12]
	ldr	lr, [r5, #4]
	str	ip, [sp, #8]
	ldr	ip, [r5]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L218
	str	r9, [r4, #20]
	ldr	r2, [r5, #52]
	lsl	r2, r2, #3
	str	r9, [r5, #24]
	ldrh	r1, [r6, r2]
	ldr	r3, [r4, #40]
	orr	r1, r1, #512
	strh	r1, [r6, r2]	@ movhi
	lsl	r3, r3, #3
	ldrh	r1, [r6, r3]
	ldr	r2, [r10]
	orr	r1, r1, #512
	add	r2, r2, #2
	str	r9, [r4, #32]
	strh	r1, [r6, r3]	@ movhi
	mov	r0, #2
	str	r2, [r10]
	bl	updateScore.part.3
	b	.L218
.L206:
	ldr	r3, [r3]
	cmp	r3, #50
	ldrgt	r3, [r5, #8]
	addgt	r2, r2, r3
	strgt	r2, [r5]
	b	.L207
.L233:
	str	r0, [r4, #20]
	ldr	r3, [r5, #52]
	lsl	r3, r3, #3
	ldrh	r2, [r7, r3]
	str	r0, [r5, #24]
	orr	r2, r2, #512
	strh	r2, [r7, r3]	@ movhi
	ldr	r3, [r4, #40]
	lsl	r3, r3, #3
	ldrh	r1, [r7, r3]
	ldr	r2, [r9]
	orr	r1, r1, #512
	add	r2, r2, #2
	str	r0, [r4, #32]
	strh	r1, [r7, r3]	@ movhi
	mov	r0, #2
	str	r2, [r9]
	bl	updateScore.part.3
	b	.L213
.L235:
	.align	2
.L234:
	.word	player
	.word	score
	.word	1717986919
	.word	shadowOAM
	.word	bullet
	.word	collision
	.word	special
	.size	updateEnemy2, .-updateEnemy2
	.align	2
	.global	initEnemies3
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies3, %function
initEnemies3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #55
	mov	r10, #1
	mov	r8, #230
	ldr	r4, .L240
	ldr	r7, .L240+4
	ldr	r6, .L240+8
	add	r5, r4, #1200
.L237:
	str	r10, [r4]
	mov	lr, pc
	bx	r7
	smull	fp, ip, r0, r6
	asr	r2, r0, #31
	rsb	r2, r2, ip, asr #6
	mul	r3, r8, r2
	mov	r1, #16
	sub	r0, r0, r3
	mov	r2, #3
	mov	r3, #0
	mov	ip, #32
	cmp	r0, #0
	rsblt	r0, r0, #0
	str	r9, [r4, #52]
	str	r10, [r4, #8]
	str	r0, [r4, #4]
	str	ip, [r4, #16]
	str	r1, [r4, #20]
	str	r1, [r4, #36]
	str	r3, [r4, #24]
	str	r3, [r4, #32]
	str	r3, [r4, #40]
	str	r3, [r4, #44]
	str	r2, [r4, #28]
	str	r2, [r4, #48]
	add	r4, r4, #60
	cmp	r4, r5
	add	r9, r9, #1
	bne	.L237
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L241:
	.align	2
.L240:
	.word	enemy3
	.word	rand
	.word	1195121335
	.size	initEnemies3, .-initEnemies3
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #5
	mov	r3, #0
	mov	r1, #35
	mov	lr, #3
	mov	r5, #20
	ldr	r2, .L246
	ldr	r0, .L246+4
	str	r4, [r2]
	ldr	ip, .L246+8
	ldr	r2, .L246+12
	ldr	r6, .L246+16
	ldr	r4, .L246+20
	str	r3, [r6]
	str	r1, [r2]
	str	r5, [r4]
	str	lr, [ip]
	mov	r5, r3
	str	r3, [r0]
	mov	r7, #150
	bl	initPlayer
	mov	r4, #8
	bl	initBullet
	mov	r6, #1
	mov	r1, #31
	mov	r2, #190
	mov	r0, #12
	ldr	r3, .L246+24
.L243:
	str	r2, [r3, #4]
	add	r2, r2, #10
	cmp	r2, #220
	str	r1, [r3, #36]
	str	r7, [r3]
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	r5, [r3, #28]
	str	r6, [r3, #32]
	str	r0, [r3, #24]
	add	r1, r1, #1
	add	r3, r3, #40
	bne	.L243
	bl	initEnemies1
	mov	fp, #48
	bl	initEnemies2
	mov	r10, #78
	bl	initEnemies3
	mov	r9, #11
	mov	r2, #9
	mov	lr, #79
	mov	r8, #40
	mov	ip, #10
	mov	r1, #80
	ldr	r3, .L246+28
	stm	r3, {r7, fp}
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	r5, [r3, #28]
	str	r10, [r3, #36]
	str	r9, [r3, #24]
	str	r2, [r3, #32]
	ldr	r3, .L246+32
	mov	r0, #32
	str	r7, [r3]
	str	r8, [r3, #4]
	str	lr, [r3, #36]
	str	r2, [r3, #32]
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	r5, [r3, #28]
	str	ip, [r3, #24]
	ldr	r3, .L246+36
	str	r1, [r3, #36]
	mov	r1, #24
	str	r7, [r3]
	str	r0, [r3, #4]
	str	r2, [r3, #32]
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	r5, [r3, #28]
	str	r2, [r3, #24]
	ldr	r3, .L246+40
	str	r1, [r3, #4]
	str	r7, [r3]
	str	r4, [r3, #8]
	str	r2, [r3, #32]
	mov	r2, #81
	str	r4, [r3, #12]
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	r5, [r3, #28]
	str	r4, [r3, #24]
	str	r2, [r3, #36]
	bl	initIcon
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	initSpecial
.L247:
	.align	2
.L246:
	.word	maxEnemy1
	.word	score
	.word	livesLeft
	.word	bulletReg
	.word	enemy1onscrn
	.word	cheatcnt
	.word	lives
	.word	ones
	.word	tens
	.word	hunds
	.word	thous
	.size	initGame, .-initGame
	.align	2
	.global	spawnEnemy3
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnEnemy3, %function
spawnEnemy3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L258
	mov	r3, #0
	mov	r2, r0
	b	.L251
.L249:
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #60
	bxeq	lr
.L251:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	bne	.L249
	rsb	r3, r3, r3, lsl #4
	lsl	r3, r3, #2
	push	{r4, r6, r7, lr}
	add	r4, r0, r3
	ldr	r2, [r4, #20]
	rsb	r2, r2, #0
	str	r2, [r0, r3]
	ldr	r1, .L258+4
	mov	lr, pc
	bx	r1
	ldr	r3, .L258+8
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r2, r3, r7, asr #5
	add	r3, r2, r2, lsl #2
	add	r3, r3, r3, lsl #5
	add	r3, r3, r2
	sub	r0, r0, r3
	mov	r2, #1
	mov	r3, #3
	add	r0, r0, #24
	cmp	r0, #0
	rsblt	r0, r0, #0
	str	r0, [r4, #4]
	str	r2, [r4, #24]
	str	r3, [r4, #28]
	pop	{r4, r6, r7, lr}
	bx	lr
.L259:
	.align	2
.L258:
	.word	enemy3
	.word	rand
	.word	827945503
	.size	spawnEnemy3, .-spawnEnemy3
	.align	2
	.global	regulate
	.syntax unified
	.arm
	.fpu softvfp
	.type	regulate, %function
regulate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L301
	ldr	r2, [r3]
	cmp	r2, #14
	push	{r4, r6, r7, lr}
	bgt	.L261
	ldr	r4, .L301+4
	ldr	r3, [r4, #44]
	cmp	r3, #85
	ble	.L260
	ldr	r2, .L301+8
	smull	r0, r1, r3, r2
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #5
	add	r2, r2, r2, lsl #2
	add	r2, r2, r2, lsl #4
	cmp	r3, r2
	beq	.L294
.L263:
	cmp	r3, #300
	ble	.L260
	ldr	r2, .L301+12
	smull	r0, r1, r3, r2
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #5
	add	r2, r2, r2, lsl #2
	rsb	r2, r2, r2, lsl #4
	cmp	r3, r2, lsl #2
	bne	.L260
.L291:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bne	.L295
.L260:
	pop	{r4, r6, r7, lr}
	bx	lr
.L261:
	ldr	r2, [r3]
	cmp	r2, #14
	ble	.L266
	ldr	r2, [r3]
	cmp	r2, #34
	bgt	.L266
	ldr	r4, .L301+4
	ldr	r3, .L301+12
	ldr	r1, [r4, #44]
	smull	r6, r7, r1, r3
	asr	r3, r1, #31
	rsb	r2, r3, r7, asr #3
	add	r2, r2, r2, lsl #2
	rsb	r2, r2, r2, lsl #4
	cmp	r1, r2
	beq	.L296
.L267:
	ldr	r2, .L301+16
	smull	r6, r7, r1, r2
	rsb	r3, r3, r7, asr #7
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	add	r3, r3, r3, lsl #2
	cmp	r1, r3
	beq	.L291
	b	.L260
.L266:
	ldr	r2, [r3]
	cmp	r2, #34
	ble	.L269
	ldr	r2, [r3]
	cmp	r2, #54
	bgt	.L269
	ldr	r4, .L301+4
	ldr	r3, .L301+20
	ldr	r2, [r4, #44]
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #1
	rsb	r1, r3, r3, lsl #3
	rsb	r3, r3, r1, lsl #3
	cmp	r2, r3
	beq	.L297
.L270:
	cmp	r2, #200
	ble	.L260
	ldr	r3, .L301+24
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #6
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #3
	beq	.L291
	b	.L260
.L269:
	ldr	r2, [r3]
	cmp	r2, #54
	ble	.L271
	ldr	r2, [r3]
	cmp	r2, #74
	bgt	.L271
	ldr	r4, .L301+4
	ldr	r3, .L301+20
	ldr	r2, [r4, #44]
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #1
	rsb	r1, r3, r3, lsl #3
	rsb	r3, r3, r1, lsl #3
	cmp	r2, r3
	beq	.L298
.L272:
	ldr	r2, [r4, #44]
	cmp	r2, #200
	ble	.L260
	ldr	r3, .L301+12
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r1, r3, r1, asr #4
	add	r1, r1, r1, lsl #2
	rsb	r1, r1, r1, lsl #4
	cmp	r2, r1, lsl #1
	bne	.L273
	ldr	r1, [r4, #48]
	cmp	r1, #0
	bne	.L299
.L273:
	ldr	ip, .L301+12
	smull	r0, r1, r2, ip
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	cmp	r2, r3, lsl #2
	bne	.L260
.L293:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L260
	pop	{r4, r6, r7, lr}
	b	spawnEnemy3
.L271:
	ldr	r3, [r3]
	cmp	r3, #74
	ble	.L260
	ldr	r4, .L301+4
	ldr	r3, .L301+20
	ldr	r2, [r4, #44]
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #1
	rsb	r1, r3, r3, lsl #3
	rsb	r3, r3, r1, lsl #3
	cmp	r2, r3
	beq	.L300
.L274:
	ldr	r2, [r4, #44]
	cmp	r2, #200
	ble	.L260
	ldr	r3, .L301+24
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r1, r3, r1, asr #5
	add	r1, r1, r1, lsl #2
	add	r1, r1, r1, lsl #2
	cmp	r2, r1, lsl #2
	bne	.L275
	ldr	r1, [r4, #48]
	cmp	r1, #0
	beq	.L275
	bl	spawnEnemy2
	ldr	r2, [r4, #44]
	cmp	r2, #200
	ble	.L260
	asr	r3, r2, #31
.L275:
	ldr	ip, .L301+16
	smull	r0, r1, r2, ip
	rsb	r3, r3, r1, asr #7
	rsb	r1, r3, r3, lsl #3
	rsb	r3, r3, r1, lsl #3
	add	r3, r3, r3, lsl #2
	cmp	r2, r3
	beq	.L293
	b	.L260
.L294:
	bl	spawnEnemy1
	ldr	r3, [r4, #44]
	b	.L263
.L295:
	pop	{r4, r6, r7, lr}
	b	spawnEnemy2
.L298:
	bl	spawnEnemy1
	b	.L272
.L296:
	bl	spawnEnemy1
	ldr	r1, [r4, #44]
	asr	r3, r1, #31
	b	.L267
.L300:
	bl	spawnEnemy1
	b	.L274
.L297:
	bl	spawnEnemy1
	ldr	r2, [r4, #44]
	b	.L270
.L299:
	bl	spawnEnemy2
	ldr	r2, [r4, #44]
	cmp	r2, #200
	ble	.L260
	asr	r3, r2, #31
	b	.L273
.L302:
	.align	2
.L301:
	.word	score
	.word	player
	.word	1616928865
	.word	458129845
	.word	1999112051
	.word	156180629
	.word	1374389535
	.size	regulate, .-regulate
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r5, .L382
	ldr	r3, [r5, #44]
	ldr	r1, [r5, #24]
	add	r3, r3, #1
	cmp	r1, #0
	sub	sp, sp, #20
	str	r3, [r5, #44]
	bne	.L305
	ldr	r2, .L382+4
	smull	r6, r7, r3, r2
	asr	r2, r3, #31
	rsb	r2, r2, r7, asr #3
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #2
	ldr	r3, [r5, #64]
	addeq	r3, r3, #1
	streq	r3, [r5, #64]
	cmp	r3, #3
	beq	.L377
.L305:
	ldr	r3, .L382+8
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	bne	.L307
	ldr	r0, [r5, #4]
	ldr	r2, .L382+12
	lsl	ip, r0, #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	beq	.L307
	ldr	ip, [r5, #8]
	cmp	r0, ip
	blt	.L307
	ldr	lr, [r5, #88]
	sub	r0, r0, ip
	cmp	lr, #0
	str	r0, [r5, #4]
	beq	.L308
	ldr	ip, [r5, #16]
	add	ip, r0, ip
	lsl	ip, ip, #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	strne	r3, [r5, #88]
.L308:
	lsl	r0, r0, #1
	ldrh	r3, [r2, r0]
	cmp	r3, #0
	bne	.L310
	ldr	r3, [r5, #84]
	orrs	r1, r1, r3
	beq	.L378
.L310:
	ldr	r3, .L382+16
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r5, #36]
	beq	.L315
	ldr	r2, .L382+20
	ldrh	r2, [r2]
	ands	ip, r2, #1
	beq	.L379
.L315:
	ldr	r8, .L382+24
	add	r3, r3, #1
	str	r3, [r5, #36]
	mov	r6, #0
	bl	regulate
	mov	r4, r8
	ldr	r9, .L382+28
	ldr	r7, [r5, #24]
	b	.L323
.L320:
	add	r6, r6, #1
	cmp	r6, #20
	add	r4, r4, #60
	beq	.L322
.L323:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L320
	cmp	r7, #0
	bne	.L320
	ldr	lr, [r5, #16]
	ldr	ip, [r5, #20]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r5, #4]
	ldr	ip, [r5]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L321
	add	r6, r6, #1
	cmp	r6, #20
	ldr	r7, [r5, #24]
	add	r4, r4, #60
	bne	.L323
.L322:
	ldr	r8, .L382+32
	mov	r6, #0
	mov	r4, r8
	ldr	r9, .L382+28
	b	.L327
.L324:
	add	r6, r6, #1
	cmp	r6, #20
	add	r4, r4, #60
	beq	.L326
.L327:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L324
	cmp	r7, #0
	bne	.L324
	ldr	lr, [r5, #16]
	ldr	ip, [r5, #20]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r5, #4]
	ldr	ip, [r5]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L325
	add	r6, r6, #1
	cmp	r6, #20
	ldr	r7, [r5, #24]
	add	r4, r4, #60
	bne	.L327
.L326:
	ldr	r8, .L382+36
	mov	r6, #0
	mov	r4, r8
	ldr	r9, .L382+28
	b	.L331
.L328:
	add	r6, r6, #1
	cmp	r6, #20
	add	r4, r4, #60
	beq	.L380
.L331:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L328
	cmp	r7, #0
	bne	.L328
	ldr	lr, [r5, #16]
	ldr	ip, [r5, #20]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r5, #4]
	ldr	ip, [r5]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L329
	add	r6, r6, #1
	cmp	r6, #20
	ldr	r7, [r5, #24]
	add	r4, r4, #60
	bne	.L331
.L380:
	cmp	r7, #1
	ldr	r3, [r5, #28]
	beq	.L381
.L332:
	cmp	r3, #99
	movgt	r3, #0
	strgt	r3, [r5, #64]
	strgt	r3, [r5, #24]
	strgt	r3, [r5, #28]
.L303:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L307:
	ldr	r3, .L382+8
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	bne	.L312
	ldr	ip, [r5, #4]
	ldr	r0, [r5, #16]
	ldr	r2, .L382+12
	add	lr, ip, r0
	lsl	r4, lr, #1
	ldrh	r4, [r2, r4]
	cmp	r4, #0
	beq	.L312
	ldr	r4, [r5, #8]
	rsb	r6, r4, #240
	cmp	lr, r6
	bge	.L312
	ldr	lr, [r5, #84]
	add	ip, ip, r4
	cmp	lr, #0
	str	ip, [r5, #4]
	beq	.L313
	lsl	lr, ip, #1
	ldrh	lr, [r2, lr]
	cmp	lr, #0
	strne	r3, [r5, #84]
.L313:
	add	r3, r0, ip
	lsl	r3, r3, #1
	ldrh	r3, [r2, r3]
	cmp	r3, #0
	bne	.L310
	ldr	r3, [r5, #88]
	orrs	r1, r1, r3
	bne	.L310
	mov	r6, #3
	mov	r4, #1
	ldr	lr, .L382+40
	ldr	r2, [lr]
	ldr	r3, [lr]
	ldr	ip, .L382+44
	sub	r3, r3, #1
	add	r3, r3, r3, lsl #2
	add	r3, ip, r3, lsl r6
	ldr	r0, [r3, #36]
	sub	r3, r2, #1
	add	r3, r3, r3, lsl #2
	ldr	r2, [lr]
	add	r3, ip, r3, lsl r6
	ldr	ip, .L382+48
	lsl	r0, r0, r6
	sub	r2, r2, #1
	str	r2, [lr]
	ldrh	r2, [ip, r0]
	orr	r2, r2, #512
	str	r1, [r3, #16]
	strh	r2, [ip, r0]	@ movhi
	str	r4, [r5, #88]
	str	r4, [r5, #24]
	str	r6, [r5, #64]
	b	.L310
.L312:
	ldr	r3, .L382+8
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L314
	ldr	r3, [r5]
	ldr	r2, [r5, #12]
	cmp	r3, r2
	blt	.L314
	ldr	r1, [r5, #32]
	cmp	r1, #0
	subeq	r3, r3, r2
	streq	r3, [r5]
	beq	.L310
.L314:
	ldr	r3, .L382+8
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L310
	ldr	r2, [r5]
	ldr	r3, [r5, #20]
	add	r3, r2, r3
	cmp	r3, #145
	ldrle	r3, [r5, #12]
	addle	r2, r3, r2
	strle	r2, [r5]
	b	.L310
.L379:
	ldr	r2, .L382+52
	ldr	r2, [r2]
	cmp	r2, r3
	bgt	.L315
	mov	r3, ip
	ldr	r2, .L382+56
	mov	r1, #23040
	ldr	r0, .L382+60
	ldr	r4, .L382+64
	str	ip, [r5, #36]
	mov	lr, pc
	bx	r4
	ldr	r3, [r5, #76]
	cmp	r3, #0
	beq	.L375
	bl	fireSpecial
	ldr	r2, [r5, #80]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r5, #80]
	bne	.L376
	mov	lr, r2
	ldr	r3, .L382+68
	str	r2, [r5, #76]
	ldr	ip, .L382+48
	add	r0, r3, #264
.L319:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L318
	ldr	r2, [r3, #40]
	lsl	r2, r2, #3
	ldrh	r1, [ip, r2]
	orr	r1, r1, #512
	str	lr, [r3, #20]
	strh	r1, [ip, r2]	@ movhi
.L318:
	add	r3, r3, #44
	cmp	r3, r0
	bne	.L319
.L375:
	bl	fireBullet
.L376:
	ldr	r3, [r5, #36]
	b	.L315
.L321:
	mov	r0, #3
	mov	r1, #1
	ldr	ip, .L382+40
	rsb	r6, r6, r6, lsl #4
	ldr	lr, [ip]
	ldr	r2, [ip]
	add	r3, r8, r6, lsl #2
	ldr	r8, [r3, #52]
	ldr	r6, .L382+44
	sub	r2, r2, #1
	ldr	r4, .L382+48
	add	r2, r2, r2, lsl #2
	lsl	r8, r8, r0
	add	r2, r6, r2, lsl r0
	ldr	r9, [r2, #36]
	ldrh	r2, [r4, r8]
	orr	r2, r2, #512
	strh	r2, [r4, r8]	@ movhi
	lsl	r9, r9, r0
	sub	r2, lr, #1
	str	r7, [r3, #24]
	ldrh	lr, [r4, r9]
	ldr	r3, [ip]
	add	r2, r2, r2, lsl #2
	add	r2, r6, r2, lsl r0
	orr	lr, lr, #512
	sub	r3, r3, #1
	str	r7, [r2, #16]
	strh	lr, [r4, r9]	@ movhi
	str	r3, [ip]
	str	r1, [r5, #24]
	mov	r7, r1
	str	r0, [r5, #64]
	b	.L322
.L329:
	mov	r1, #3
	ldr	ip, .L382+40
	rsb	r6, r6, r6, lsl #4
	ldr	r4, [ip]
	ldr	r2, [ip]
	add	r3, r8, r6, lsl #2
	ldr	r8, [r3, #52]
	ldr	r6, .L382+44
	sub	r2, r2, #1
	ldr	lr, .L382+48
	add	r2, r2, r2, lsl #2
	lsl	r8, r8, r1
	add	r2, r6, r2, lsl r1
	ldr	r9, [r2, #36]
	ldrh	r2, [lr, r8]
	orr	r2, r2, #512
	strh	r2, [lr, r8]	@ movhi
	sub	r2, r4, #1
	add	r2, r2, r2, lsl #2
	add	r2, r6, r2, lsl r1
	mov	r0, #1
	str	r7, [r2, #16]
	ldr	r2, [ip]
	sub	r2, r2, #1
	str	r2, [ip]
	mov	r2, r1
	lsl	r9, r9, r1
	ldrh	r4, [lr, r9]
	str	r7, [r3, #24]
	ldr	r3, [r5, #28]
	orr	r4, r4, #512
	add	r3, r3, r0
	strh	r4, [lr, r9]	@ movhi
	str	r3, [r5, #28]
	str	r0, [r5, #24]
	str	r1, [r5, #64]
.L330:
	ldr	r0, [r5, #44]
	ldr	r1, .L382+4
	smull	r6, r7, r0, r1
	asr	r1, r0, #31
	rsb	r1, r1, r7, asr #3
	add	r1, r1, r1, lsl #2
	cmp	r0, r1, lsl #2
	addeq	r2, r2, #1
	streq	r2, [r5, #64]
	b	.L332
.L325:
	mov	r0, #3
	mov	r1, #1
	ldr	ip, .L382+40
	rsb	r6, r6, r6, lsl #4
	ldr	lr, [ip]
	ldr	r2, [ip]
	add	r3, r8, r6, lsl #2
	ldr	r8, [r3, #52]
	ldr	r6, .L382+44
	sub	r2, r2, #1
	ldr	r4, .L382+48
	add	r2, r2, r2, lsl #2
	lsl	r8, r8, r0
	add	r2, r6, r2, lsl r0
	ldr	r9, [r2, #36]
	ldrh	r2, [r4, r8]
	orr	r2, r2, #512
	strh	r2, [r4, r8]	@ movhi
	lsl	r9, r9, r0
	sub	r2, lr, #1
	str	r7, [r3, #24]
	ldrh	lr, [r4, r9]
	ldr	r3, [ip]
	add	r2, r2, r2, lsl #2
	add	r2, r6, r2, lsl r0
	orr	lr, lr, #512
	sub	r3, r3, #1
	str	r7, [r2, #16]
	strh	lr, [r4, r9]	@ movhi
	str	r3, [ip]
	str	r1, [r5, #24]
	mov	r7, r1
	str	r0, [r5, #64]
	b	.L326
.L377:
	mov	r3, #0
	str	r3, [r5, #64]
	b	.L305
.L381:
	ldr	r2, [r5, #64]
	add	r3, r3, #1
	cmp	r2, #5
	str	r3, [r5, #28]
	ble	.L330
	cmp	r2, #6
	moveq	r2, #3
	streq	r2, [r5, #64]
	b	.L332
.L378:
	mov	r6, #3
	mov	r4, #1
	ldr	lr, .L382+40
	ldr	r2, [lr]
	ldr	r3, [lr]
	ldr	ip, .L382+44
	sub	r3, r3, #1
	add	r3, r3, r3, lsl #2
	add	r3, ip, r3, lsl r6
	ldr	r0, [r3, #36]
	sub	r3, r2, #1
	add	r3, r3, r3, lsl #2
	ldr	r2, [lr]
	add	r3, ip, r3, lsl r6
	ldr	ip, .L382+48
	lsl	r0, r0, r6
	sub	r2, r2, #1
	str	r2, [lr]
	ldrh	r2, [ip, r0]
	orr	r2, r2, #512
	str	r1, [r3, #16]
	strh	r2, [ip, r0]	@ movhi
	str	r4, [r5, #84]
	str	r4, [r5, #24]
	str	r6, [r5, #64]
	b	.L310
.L383:
	.align	2
.L382:
	.word	player
	.word	1717986919
	.word	67109120
	.word	collisionBitmap
	.word	oldButtons
	.word	buttons
	.word	enemy1
	.word	collision
	.word	enemy2
	.word	enemy3
	.word	livesLeft
	.word	lives
	.word	shadowOAM
	.word	bulletReg
	.word	11025
	.word	shoot
	.word	playSoundB
	.word	special
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateEnemy3
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy3, %function
updateEnemy3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, [r0, #24]
	cmp	r3, #0
	sub	sp, sp, #16
	mov	r5, r0
	ldr	r1, .L410
	beq	.L386
	ldr	r0, [r1, #44]
	ldr	ip, .L410+4
	smull	r3, r4, r0, ip
	asr	r2, r0, #31
	rsb	r2, r2, r4, asr #3
	add	r2, r2, r2, lsl #2
	cmp	r0, r2, lsl #2
	ldr	r2, [r5, #44]
	addeq	r2, r2, #1
	streq	r2, [r5, #44]
	cmp	r2, #3
	moveq	r2, #0
	ldr	r3, [r5]
	ldr	ip, [r5, #8]
	streq	r2, [r5, #44]
	ldr	r2, [r5, #20]
	add	r3, r3, ip
	str	r3, [r5]
	add	r3, r3, r2
	cmp	r3, #147
	bgt	.L408
.L386:
	ldr	r3, [r1, #76]
	cmp	r3, #0
	bne	.L390
	ldr	r4, .L410+8
	ldr	r8, .L410+12
	ldr	r7, .L410+16
	ldr	r9, .L410+20
	add	r6, r4, #440
	b	.L395
.L392:
	add	r4, r4, #44
	cmp	r4, r6
	beq	.L384
.L395:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L392
	ldr	lr, [r5, #16]
	add	r2, r4, #12
	ldr	ip, [r5, #20]
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	str	lr, [sp, #12]
	ldr	lr, [r5, #4]
	str	ip, [sp, #8]
	ldr	ip, [r5]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L392
	ldr	r3, [r5, #28]
	cmp	r3, #1
	mov	r0, #0
	ble	.L409
	ldr	r2, [r4, #40]
	lsl	r2, r2, #3
	ldrh	r1, [r7, r2]
	str	r0, [r4, #20]
	add	r4, r4, #44
	sub	r3, r3, #1
	orr	r1, r1, #512
	cmp	r4, r6
	strh	r1, [r7, r2]	@ movhi
	str	r3, [r5, #28]
	bne	.L395
.L384:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L390:
	ldr	r4, .L410+24
	mov	r9, #0
	ldr	r8, .L410+12
	ldr	r10, .L410+20
	ldr	r6, .L410+16
	add	r7, r4, #264
	b	.L398
.L397:
	add	r4, r4, #44
	cmp	r4, r7
	beq	.L384
.L398:
	ldr	lr, [r5, #16]
	add	r2, r4, #12
	ldr	ip, [r5, #20]
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	str	lr, [sp, #12]
	ldr	lr, [r5, #4]
	str	ip, [sp, #8]
	ldr	ip, [r5]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L397
	str	r9, [r4, #20]
	ldr	r2, [r5, #52]
	lsl	r2, r2, #3
	str	r9, [r5, #24]
	ldrh	r1, [r6, r2]
	ldr	r3, [r4, #40]
	orr	r1, r1, #512
	strh	r1, [r6, r2]	@ movhi
	lsl	r3, r3, #3
	ldrh	r1, [r6, r3]
	ldr	r2, [r10]
	orr	r1, r1, #512
	add	r2, r2, #2
	str	r9, [r4, #32]
	strh	r1, [r6, r3]	@ movhi
	mov	r0, #2
	str	r2, [r10]
	bl	updateScore.part.3
	b	.L397
.L408:
	mov	ip, #0
	ldr	r3, [r5, #52]
	ldr	r0, .L410+16
	lsl	r3, r3, #3
	ldrh	r2, [r0, r3]
	orr	r2, r2, #512
	str	ip, [r5, #24]
	strh	r2, [r0, r3]	@ movhi
	b	.L386
.L409:
	str	r0, [r4, #20]
	ldr	r3, [r5, #52]
	lsl	r3, r3, #3
	ldrh	r2, [r7, r3]
	str	r0, [r5, #24]
	orr	r2, r2, #512
	strh	r2, [r7, r3]	@ movhi
	ldr	r3, [r4, #40]
	lsl	r3, r3, #3
	ldrh	r1, [r7, r3]
	ldr	r2, [r9]
	orr	r1, r1, #512
	add	r2, r2, #2
	str	r0, [r4, #32]
	strh	r1, [r7, r3]	@ movhi
	mov	r0, #2
	str	r2, [r9]
	bl	updateScore.part.3
	b	.L392
.L411:
	.align	2
.L410:
	.word	player
	.word	1717986919
	.word	bullet
	.word	collision
	.word	shadowOAM
	.word	score
	.word	special
	.size	updateEnemy3, .-updateEnemy3
	.align	2
	.global	initLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLives, %function
initLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #31
	mov	r2, #190
	mov	r5, #150
	mov	lr, #8
	mov	ip, #1
	mov	r0, #0
	mov	r4, #12
	ldr	r3, .L416
.L413:
	str	r2, [r3, #4]
	add	r2, r2, #10
	cmp	r2, #220
	str	r1, [r3, #36]
	str	r5, [r3]
	str	lr, [r3, #8]
	str	lr, [r3, #12]
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	str	r0, [r3, #28]
	str	ip, [r3, #32]
	str	r4, [r3, #24]
	add	r1, r1, #1
	add	r3, r3, #40
	bne	.L413
	pop	{r4, r5, lr}
	bx	lr
.L417:
	.align	2
.L416:
	.word	lives
	.size	initLives, .-initLives
	.align	2
	.global	updateLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLives, %function
updateLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	lr, #0
	ldr	ip, .L420
	ldr	r2, [ip]
	ldr	r3, [ip]
	ldr	r1, .L420+4
	sub	r3, r3, #1
	add	r3, r3, r3, lsl #2
	add	r3, r1, r3, lsl #3
	ldr	r0, [r3, #36]
	ldr	r5, .L420+8
	lsl	r0, r0, #3
	sub	r3, r2, #1
	ldr	r4, [ip]
	ldrh	r2, [r5, r0]
	add	r3, r3, r3, lsl #2
	sub	r4, r4, #1
	add	r3, r1, r3, lsl #3
	orr	r2, r2, #512
	str	r4, [ip]
	strh	r2, [r5, r0]	@ movhi
	str	lr, [r3, #16]
	pop	{r4, r5, lr}
	bx	lr
.L421:
	.align	2
.L420:
	.word	livesLeft
	.word	lives
	.word	shadowOAM
	.size	updateLives, .-updateLives
	.align	2
	.global	initScoreOnes
	.syntax unified
	.arm
	.fpu softvfp
	.type	initScoreOnes, %function
initScoreOnes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #8
	mov	r6, #150
	mov	r5, #48
	mov	r4, #1
	mov	lr, #9
	mov	r2, #0
	mov	ip, #78
	mov	r0, #11
	ldr	r3, .L424
	str	r6, [r3]
	str	r5, [r3, #4]
	str	r4, [r3, #16]
	str	lr, [r3, #32]
	str	ip, [r3, #36]
	str	r0, [r3, #24]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r3, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L425:
	.align	2
.L424:
	.word	ones
	.size	initScoreOnes, .-initScoreOnes
	.align	2
	.global	initScoreTens
	.syntax unified
	.arm
	.fpu softvfp
	.type	initScoreTens, %function
initScoreTens:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #8
	mov	r6, #150
	mov	r5, #40
	mov	r4, #1
	mov	lr, #9
	mov	r2, #0
	mov	ip, #79
	mov	r0, #10
	ldr	r3, .L428
	str	r6, [r3]
	str	r5, [r3, #4]
	str	r4, [r3, #16]
	str	lr, [r3, #32]
	str	ip, [r3, #36]
	str	r0, [r3, #24]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r3, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L429:
	.align	2
.L428:
	.word	tens
	.size	initScoreTens, .-initScoreTens
	.align	2
	.global	initScoreHunds
	.syntax unified
	.arm
	.fpu softvfp
	.type	initScoreHunds, %function
initScoreHunds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r0, #8
	mov	r5, #150
	mov	r4, #32
	mov	lr, #1
	mov	r1, #0
	mov	r2, #9
	mov	ip, #80
	ldr	r3, .L432
	str	r5, [r3]
	str	r4, [r3, #4]
	str	lr, [r3, #16]
	str	ip, [r3, #36]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #20]
	str	r1, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #24]
	pop	{r4, r5, lr}
	bx	lr
.L433:
	.align	2
.L432:
	.word	hunds
	.size	initScoreHunds, .-initScoreHunds
	.align	2
	.global	initScoreThous
	.syntax unified
	.arm
	.fpu softvfp
	.type	initScoreThous, %function
initScoreThous:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #8
	mov	r5, #150
	mov	r4, #24
	mov	lr, #1
	mov	r1, #0
	mov	ip, #9
	mov	r0, #81
	ldr	r3, .L436
	str	r5, [r3]
	str	r4, [r3, #4]
	str	lr, [r3, #16]
	str	ip, [r3, #32]
	str	r0, [r3, #36]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #24]
	str	r1, [r3, #20]
	str	r1, [r3, #28]
	pop	{r4, r5, lr}
	bx	lr
.L437:
	.align	2
.L436:
	.word	thous
	.size	initScoreThous, .-initScoreThous
	.align	2
	.global	updateScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateScore, %function
updateScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #1
	bne	updateScore.part.3
.L446:
	ldr	r3, .L449
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #32]
	cmp	r2, r1
	blt	.L447
	mov	r0, #0
	ldr	r2, .L449+4
	add	r1, r2, #28
	ldm	r1, {r1, ip}
	cmp	r1, ip
	str	r0, [r3, #28]
	blt	.L445
	ldr	r3, .L449+8
	add	r1, r3, #28
	ldm	r1, {r1, ip}
	cmp	r1, ip
	str	r0, [r2, #28]
	blt	.L448
	ldr	r2, .L449+12
	add	r1, r2, #28
	ldm	r1, {r1, ip}
	cmp	r1, ip
	str	r0, [r3, #28]
	bge	.L444
.L445:
	add	r1, r1, #1
	str	r1, [r2, #28]
	bx	lr
.L447:
	add	r2, r2, #1
	str	r2, [r3, #28]
	bx	lr
.L444:
	str	r0, [r2, #28]
	bx	lr
.L448:
	add	r1, r1, #1
	str	r1, [r3, #28]
	bx	lr
.L450:
	.align	2
.L449:
	.word	ones
	.word	tens
	.word	hunds
	.word	thous
	.size	updateScore, .-updateScore
	.align	2
	.global	updateEnemy1
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy1, %function
updateEnemy1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, [r0, #24]
	cmp	r3, #0
	sub	sp, sp, #20
	mov	r5, r0
	ldr	r1, .L486
	beq	.L453
	ldr	r0, [r1, #44]
	tst	r0, #1
	ldr	r2, [r5]
	ldrne	r3, [r5, #8]
	addne	r2, r2, r3
	ldr	r3, .L486+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #3
	add	r3, r3, r3, lsl #2
	strne	r2, [r5]
	cmp	r0, r3, lsl #2
	ldr	r3, [r5, #44]
	addeq	r3, r3, #1
	streq	r3, [r5, #44]
	cmp	r3, #3
	moveq	r3, #0
	streq	r3, [r5, #44]
	ldr	r3, [r5, #20]
	add	r2, r2, r3
	cmp	r2, #149
	bgt	.L484
.L453:
	ldr	r6, [r1, #76]
	cmp	r6, #0
	bne	.L458
	ldr	r4, .L486+8
	ldr	fp, .L486+12
	ldr	r8, .L486+16
	ldr	r10, .L486+20
	ldr	r9, .L486+24
	add	r7, r4, #440
	b	.L463
.L460:
	add	r4, r4, #44
	cmp	r4, r7
	beq	.L451
.L463:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L460
	ldr	lr, [r5, #16]
	add	r2, r4, #12
	ldr	ip, [r5, #20]
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	str	lr, [sp, #12]
	ldr	lr, [r5, #4]
	str	ip, [sp, #8]
	ldr	ip, [r5]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	beq	.L460
	str	r6, [r4, #20]
	ldr	r2, [r5, #52]
	lsl	r2, r2, #3
	str	r6, [r5, #24]
	ldrh	r1, [r8, r2]
	str	r6, [r4, #32]
	orr	r1, r1, #512
	ldr	r3, [r4, #40]
	strh	r1, [r8, r2]	@ movhi
	ldr	r2, [r5, #56]
	lsl	r3, r3, #3
	ldrh	r1, [r8, r3]
	cmp	r2, #0
	ldr	r2, [r10]
	orr	r1, r1, #512
	sub	r2, r2, #1
	strh	r1, [r8, r3]	@ movhi
	str	r2, [r10]
	bne	.L485
.L462:
	mov	r2, #2
	ldr	r3, [r9]
	str	r2, [r5, #36]
	add	r3, r3, #1
	mov	r0, #1
	add	r4, r4, #44
	str	r3, [r9]
	bl	updateScore
	cmp	r4, r7
	bne	.L463
.L451:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L458:
	ldr	r4, .L486+28
	mov	r9, #0
	ldr	r8, .L486+12
	ldr	r7, .L486+16
	ldr	fp, .L486+20
	ldr	r10, .L486+24
	add	r6, r4, #264
	b	.L468
.L466:
	add	r4, r4, #44
	cmp	r4, r6
	beq	.L451
.L468:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L466
	ldr	lr, [r5, #16]
	add	r2, r4, #12
	ldr	ip, [r5, #20]
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	str	lr, [sp, #12]
	ldr	lr, [r5, #4]
	str	ip, [sp, #8]
	ldr	ip, [r5]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L466
	str	r9, [r4, #20]
	ldr	r3, [r5, #52]
	lsl	r3, r3, #3
	ldrh	r1, [r7, r3]
	str	r9, [r5, #24]
	ldr	r2, [fp]
	orr	r1, r1, #512
	strh	r1, [r7, r3]	@ movhi
	ldr	r3, [r4, #40]
	sub	r2, r2, #1
	lsl	r3, r3, #3
	str	r2, [fp]
	ldrh	r1, [r7, r3]
	ldr	r2, [r10]
	orr	r1, r1, #512
	strh	r1, [r7, r3]	@ movhi
	add	r3, r2, #1
	mov	r2, #2
	str	r9, [r4, #32]
	mov	r0, #1
	str	r2, [r5, #36]
	str	r3, [r10]
	bl	updateScore
	b	.L466
.L484:
	mov	r4, #0
	ldr	r3, [r5, #52]
	ldr	ip, .L486+16
	ldr	lr, .L486+20
	lsl	r3, r3, #3
	ldrh	r2, [ip, r3]
	ldr	r0, [lr]
	orr	r2, r2, #512
	sub	r0, r0, #1
	str	r4, [r5, #24]
	str	r0, [lr]
	strh	r2, [ip, r3]	@ movhi
	b	.L453
.L485:
	mov	r1, #1
	ldr	r2, [r5, #16]
	ldr	r0, [r5, #4]
	ldr	r3, [r5, #20]
	add	r2, r2, r2, lsr #31
	add	r2, r0, r2, asr r1
	ldr	r0, [r5]
	add	r3, r3, r3, lsr #31
	add	r3, r0, r3, asr r1
	ldr	r0, .L486+32
	str	r2, [r0, #4]
	ldr	r2, [r5, #8]
	str	r3, [r0]
	str	r1, [r0, #20]
	str	r2, [r0, #8]
	bl	updateIcon
	str	r6, [r5, #56]
	b	.L462
.L487:
	.align	2
.L486:
	.word	player
	.word	1717986919
	.word	bullet
	.word	collision
	.word	shadowOAM
	.word	enemy1onscrn
	.word	score
	.word	special
	.word	icon
	.size	updateEnemy1, .-updateEnemy1
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
	ldr	r6, .L545
	ldr	r3, [r6, #44]
	cmp	r3, #1000
	ble	.L490
	mov	r2, #1
	cmp	r3, #2000
	str	r2, [r6, #48]
	strgt	r2, [r6, #52]
.L490:
	ldr	r4, .L545+4
	bl	updatePlayer
	add	r5, r4, #440
	b	.L494
.L542:
	ldr	r3, [r4, #8]
	add	r3, r3, r2
	str	r3, [r4]
.L492:
	add	r4, r4, #44
	cmp	r4, r5
	beq	.L541
.L494:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L492
	ldr	r2, [r4]
	cmp	r2, #5
	bgt	.L542
	mov	r0, r4
	add	r4, r4, #44
	bl	updateBullet.part.0
	cmp	r4, r5
	bne	.L494
.L541:
	ldr	r4, .L545+8
	add	r5, r4, #1200
	b	.L496
.L495:
	add	r4, r4, #60
	cmp	r4, r5
	beq	.L543
.L496:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L495
	mov	r0, r4
	add	r4, r4, #60
	bl	updateEnemy1
	cmp	r4, r5
	bne	.L496
.L543:
	ldr	r3, [r6, #48]
	cmp	r3, #0
	beq	.L497
	ldr	r4, .L545+12
	add	r5, r4, #1200
	b	.L499
.L498:
	add	r4, r4, #60
	cmp	r4, r5
	beq	.L497
.L499:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L498
	mov	r0, r4
	add	r4, r4, #60
	bl	updateEnemy2
	cmp	r4, r5
	bne	.L499
.L497:
	ldr	r3, [r6, #52]
	cmp	r3, #0
	beq	.L500
	ldr	r4, .L545+16
	add	r5, r4, #1200
	b	.L502
.L501:
	add	r4, r4, #60
	cmp	r4, r5
	beq	.L500
.L502:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L501
	mov	r0, r4
	add	r4, r4, #60
	bl	updateEnemy3
	cmp	r4, r5
	bne	.L502
.L500:
	ldr	r3, .L545+20
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bne	.L544
.L503:
	ldr	r3, [r6, #76]
	cmp	r3, #0
	beq	.L488
	ldr	r4, .L545+24
	add	r5, r4, #264
.L507:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L505
	ldr	r3, [r4]
	cmp	r3, #5
	ble	.L506
	ldr	r2, [r4, #8]
	add	r3, r2, r3
	str	r3, [r4]
.L505:
	add	r4, r4, #44
	cmp	r4, r5
	bne	.L507
.L488:
	pop	{r4, r5, r6, lr}
	bx	lr
.L506:
	mov	r0, r4
	bl	updateSpecial.part.1
	b	.L505
.L544:
	bl	updateIcon
	b	.L503
.L546:
	.align	2
.L545:
	.word	player
	.word	bullet
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	icon
	.word	special
	.size	updateGame, .-updateGame
	.align	2
	.global	hideSpecial
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideSpecial, %function
hideSpecial:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	ldr	r3, .L555
	ldr	ip, .L555+4
	add	r0, r3, #264
.L549:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L548
	ldr	r2, [r3, #40]
	lsl	r2, r2, #3
	ldrh	r1, [ip, r2]
	orr	r1, r1, #512
	str	lr, [r3, #20]
	strh	r1, [ip, r2]	@ movhi
.L548:
	add	r3, r3, #44
	cmp	r3, r0
	bne	.L549
	ldr	lr, [sp], #4
	bx	lr
.L556:
	.align	2
.L555:
	.word	special
	.word	shadowOAM
	.size	hideSpecial, .-hideSpecial
	.comm	thous,40,4
	.comm	ones,40,4
	.comm	tens,40,4
	.comm	hunds,40,4
	.comm	enemy3,1200,4
	.comm	enemy2,1200,4
	.comm	enemy1,1200,4
	.comm	special,264,4
	.comm	bullet,440,4
	.comm	lives,120,4
	.comm	icon,44,4
	.comm	player,92,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	shadowOAM,1024,4
	.comm	spE3,4,4
	.comm	spE2,4,4
	.comm	spE1,4,4
	.comm	bulletReg,4,4
	.comm	cheatcnt,4,4
	.comm	cheatEnemy,4,4
	.comm	score,4,4
	.comm	enemy1onscrn,4,4
	.comm	maxEnemy1,4,4
	.comm	livesLeft,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
