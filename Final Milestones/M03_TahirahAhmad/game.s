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
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L34
	push	{r4, r5, r6, lr}
	mov	r2, r1
	mov	lr, r1
	ldr	r3, .L34+4
	ldr	ip, [r3, #64]
	ldr	r0, [r3, #56]
	add	r0, r0, ip, lsl #5
	ldm	r3, {r4, ip}
	ldr	r3, .L34+8
	strh	r4, [r1]	@ movhi
	strh	ip, [r1, #2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	add	r0, r3, #1120
.L3:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	beq	.L2
	ldr	r5, [r3, #44]
	ldr	r1, [r3, #36]
	ldm	r3, {r4, ip}
	add	r1, r1, r5, lsl #5
	strh	r1, [r2, #12]	@ movhi
	strh	r4, [r2, #8]	@ movhi
	strh	ip, [r2, #10]	@ movhi
.L2:
	add	r3, r3, #56
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L3
	ldr	r3, .L34+12
	ldr	r2, .L34
	add	r0, r3, #440
.L5:
	ldr	r1, [r3, #20]
	cmp	r1, #0
	beq	.L4
	add	r1, r3, #28
	ldm	r1, {r1, r5}
	ldm	r3, {r4, ip}
	add	r1, r1, r5, lsl #5
	strh	r1, [r2, #172]	@ movhi
	strh	r4, [r2, #168]	@ movhi
	strh	ip, [r2, #170]	@ movhi
.L4:
	add	r3, r3, #44
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L5
	ldr	r3, .L34+16
	add	r1, r3, #160
.L7:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L6
	add	r2, r3, #24
	ldm	r2, {r2, r4}
	ldr	ip, [r3]
	ldr	r0, [r3, #4]
	add	r2, r2, r4, lsl #5
	strh	r2, [lr, #252]	@ movhi
	strh	ip, [lr, #248]	@ movhi
	strh	r0, [lr, #250]	@ movhi
.L6:
	add	r3, r3, #40
	cmp	r3, r1
	add	lr, lr, #8
	bne	.L7
	ldr	r3, .L34+20
	ldr	r2, .L34+24
	add	r0, r3, #1120
.L9:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	beq	.L8
	ldr	r4, [r3, #44]
	ldr	r1, [r3, #36]
	ldr	lr, [r3]
	ldr	ip, [r3, #4]
	add	r1, r1, r4, lsl #5
	strh	r1, [r2, #4]	@ movhi
	strh	lr, [r2]	@ movhi
	strh	ip, [r2, #2]	@ movhi
.L8:
	add	r3, r3, #56
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L9
	ldr	r3, .L34+28
	ldr	r2, .L34+32
	add	r0, r3, #1120
.L11:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	beq	.L10
	ldr	r4, [r3, #44]
	ldr	r1, [r3, #36]
	ldr	lr, [r3]
	ldr	ip, [r3, #4]
	add	r1, r1, r4, lsl #5
	strh	r1, [r2, #4]	@ movhi
	strh	lr, [r2]	@ movhi
	strh	ip, [r2, #2]	@ movhi
.L10:
	add	r3, r3, #56
	cmp	r0, r3
	add	r2, r2, #8
	bne	.L11
	ldr	r3, .L34+36
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	shadowOAM
	.word	player
	.word	enemy1
	.word	bullet
	.word	lives
	.word	enemy2
	.word	shadowOAM+280
	.word	enemy3
	.word	shadowOAM+440
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
	push	{r4, r5, lr}
	mov	r2, #0
	mov	r0, #8
	mov	r5, #125
	mov	r4, #118
	mov	lr, #20
	mov	r1, #2
	mov	ip, #1
	ldr	r3, .L38
	str	r5, [r3]
	str	r4, [r3, #4]
	str	lr, [r3, #36]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	ip, [r3, #68]
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
	str	r2, [r3, #56]
	pop	{r4, r5, lr}
	bx	lr
.L39:
	.align	2
.L38:
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
	mov	r5, #5
	ldr	r4, .L44
	ldr	r3, [r4, #16]
	ldr	lr, [r4, #4]
	add	r2, r3, r3, lsr #31
	ldr	r4, [r4]
	ldr	r3, .L44+4
	add	lr, lr, r2, asr r6
.L41:
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
	bne	.L41
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L45:
	.align	2
.L44:
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
	ldr	r0, .L56
	mov	r3, #0
	mov	r2, r0
	b	.L49
.L47:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #44
	bxeq	lr
.L49:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L47
	push	{r4, r5, lr}
	mov	r4, #1
	ldr	lr, .L56+4
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl r4
	ldr	r2, [lr, #16]
	lsl	r3, r3, #2
	add	ip, r2, r2, lsr #31
	ldr	r2, [lr, #4]
	add	r1, r0, r3
	add	r2, r2, ip, asr r4
	ldr	ip, [r1, #16]
	ldr	r5, [lr]
	add	ip, ip, ip, lsr #31
	sub	r2, r2, ip, asr r4
	str	r5, [r0, r3]
	str	r4, [r1, #32]
	str	r4, [r1, #20]
	str	r2, [r1, #4]
	pop	{r4, r5, lr}
	bx	lr
.L57:
	.align	2
.L56:
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
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0]
	cmp	r3, #5
	bgt	.L64
	mov	ip, #0
	ldr	r3, [r0, #40]
	ldr	r1, .L65
	lsl	r3, r3, #3
	ldrh	r2, [r1, r3]
	orr	r2, r2, #512
	str	ip, [r0, #20]
	str	ip, [r0, #32]
	strh	r2, [r1, r3]	@ movhi
	bx	lr
.L64:
	ldr	r2, [r0, #8]
	add	r3, r2, r3
	str	r3, [r0]
	bx	lr
.L66:
	.align	2
.L65:
	.word	shadowOAM
	.size	updateBullet, .-updateBullet
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
	ldr	r4, .L71
	ldr	r6, .L71+4
	ldr	r5, .L71+8
.L68:
	str	r9, [r4]
	mov	lr, pc
	bx	r6
	smull	fp, ip, r0, r5
	asr	r2, r0, #31
	rsb	r2, r2, ip, asr #6
	mul	r3, r7, r2
	mov	r1, #4
	sub	r0, r0, r3
	mov	r2, #8
	mov	r3, #0
	cmp	r0, #0
	add	r8, r8, #1
	rsblt	r0, r0, #0
	cmp	r8, #20
	str	r8, [r4, #52]
	str	r9, [r4, #8]
	str	r9, [r4, #48]
	str	r0, [r4, #4]
	str	r2, [r4, #16]
	str	r2, [r4, #20]
	str	r3, [r4, #24]
	str	r3, [r4, #32]
	str	r3, [r4, #40]
	str	r3, [r4, #44]
	str	r1, [r4, #36]
	add	r4, r4, #56
	bne	.L68
	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
	bx	lr
.L72:
	.align	2
.L71:
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
	ldr	r0, .L83
	mov	r3, #0
	mov	r2, r0
	b	.L76
.L74:
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #56
	bxeq	lr
.L76:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	bne	.L74
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #1
	rsb	r3, r3, r3, lsl #3
	lsl	r3, r3, #3
	str	r4, [r0, r3]
	ldr	r2, .L83+4
	add	r5, r0, r3
	mov	lr, pc
	bx	r2
	mov	r2, #230
	ldr	r3, .L83+8
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r1, r3, r7, asr #6
	mul	r3, r2, r1
	ldr	r2, .L83+12
	sub	r0, r0, r3
	ldr	r3, [r2]
	cmp	r0, #0
	add	r3, r3, r4
	rsblt	r0, r0, #0
	str	r4, [r5, #24]
	str	r0, [r5, #4]
	str	r3, [r2]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L84:
	.align	2
.L83:
	.word	enemy1
	.word	rand
	.word	1195121335
	.word	enemy1onscrn
	.size	spawnEnemy1, .-spawnEnemy1
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
	beq	.L87
	ldr	r2, .L104
	ldr	r3, .L104+4
	ldr	r1, [r2, #44]
	cmp	r1, r3
	movgt	r3, #2
	movgt	r2, r3
	strgt	r3, [r0, #8]
	ldr	r3, .L104+8
	smull	r6, r7, r1, r3
	asr	r3, r1, #31
	ldrle	r2, [r0, #8]
	rsb	r3, r3, r7, asr #4
	ldr	r0, [r0]
	add	r3, r3, r3, lsl #2
	cmp	r1, r3, lsl #3
	add	r3, r2, r0
	ldr	r2, [r5, #44]
	addeq	r2, r2, #1
	streq	r2, [r5, #44]
	cmp	r2, #2
	moveq	r2, #0
	streq	r2, [r5, #44]
	ldr	r2, [r5, #20]
	str	r3, [r5]
	add	r3, r3, r2
	cmp	r3, #147
	bgt	.L102
.L87:
	ldr	r4, .L104+12
	mov	r8, #0
	ldr	fp, .L104+16
	ldr	r10, .L104+20
	ldr	r7, .L104+24
	ldr	r9, .L104+28
	add	r6, r4, #440
	b	.L96
.L94:
	add	r4, r4, #44
	cmp	r4, r6
	beq	.L103
.L96:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L94
	ldr	lr, [r5, #16]
	add	r2, r4, #12
	ldr	ip, [r5, #20]
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	ldr	lr, [r5, #4]
	str	ip, [sp, #8]
	ldr	ip, [r5]
	ldm	r4, {r0, r1}
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	beq	.L94
	str	r8, [r4, #20]
	ldr	r3, [r5, #52]
	lsl	r3, r3, #3
	ldrh	r1, [r7, r3]
	str	r8, [r5, #24]
	orr	r1, r1, #512
	strh	r1, [r7, r3]	@ movhi
	ldr	r3, [r4, #40]
	lsl	r3, r3, #3
	ldrh	r1, [r7, r3]
	orr	r1, r1, #512
	strh	r1, [r7, r3]	@ movhi
	mov	r3, #4
	ldr	r2, [r10]
	add	r2, r2, #5
	str	r2, [r10]
	ldr	r2, [r9]
	str	r8, [r4, #32]
	add	r4, r4, #44
	sub	r2, r2, #1
	cmp	r4, r6
	str	r2, [r9]
	str	r3, [r5, #36]
	bne	.L96
.L103:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L102:
	mov	lr, #0
	ldr	r3, [r5, #52]
	ldr	r0, .L104+24
	ldr	ip, .L104+28
	lsl	r3, r3, #3
	ldrh	r2, [r0, r3]
	ldr	r1, [ip]
	orr	r2, r2, #512
	sub	r1, r1, #1
	str	lr, [r5, #24]
	str	r1, [ip]
	strh	r2, [r0, r3]	@ movhi
	b	.L87
.L105:
	.align	2
.L104:
	.word	player
	.word	2500
	.word	1717986919
	.word	bullet
	.word	collision
	.word	score
	.word	shadowOAM
	.word	enemy1onscrn
	.size	updateEnemy1, .-updateEnemy1
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
	mov	r10, #35
	mov	r9, #1
	mov	r8, #230
	ldr	r4, .L110
	ldr	r7, .L110+4
	ldr	r6, .L110+8
	add	r5, r4, #1120
.L107:
	str	r9, [r4]
	mov	lr, pc
	bx	r7
	smull	fp, ip, r0, r6
	asr	r2, r0, #31
	rsb	r2, r2, ip, asr #6
	mul	r3, r8, r2
	mov	ip, #2
	sub	r0, r0, r3
	mov	r2, #8
	mov	r3, #0
	mov	r1, #3
	cmp	r0, #0
	rsblt	r0, r0, #0
	str	r10, [r4, #52]
	str	r9, [r4, #8]
	str	r9, [r4, #48]
	str	r0, [r4, #4]
	str	r2, [r4, #16]
	str	r2, [r4, #20]
	str	r3, [r4, #24]
	str	r3, [r4, #32]
	str	r3, [r4, #40]
	str	r3, [r4, #44]
	str	ip, [r4, #28]
	str	r1, [r4, #36]
	add	r4, r4, #56
	cmp	r4, r5
	add	r10, r10, #1
	bne	.L107
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L111:
	.align	2
.L110:
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
	ldr	r0, .L122
	mov	r3, #0
	mov	r2, r0
	b	.L115
.L113:
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #56
	bxeq	lr
.L115:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	bne	.L113
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #1
	rsb	r3, r3, r3, lsl #3
	lsl	r3, r3, #3
	str	r4, [r0, r3]
	ldr	r2, .L122+4
	add	r5, r0, r3
	mov	lr, pc
	bx	r2
	mov	r2, #230
	ldr	r3, .L122+8
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r1, r3, r7, asr #6
	mul	r3, r2, r1
	sub	r0, r0, r3
	mov	r3, #2
	cmp	r0, #0
	rsblt	r0, r0, #0
	str	r4, [r5, #24]
	str	r0, [r5, #4]
	str	r3, [r5, #28]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L123:
	.align	2
.L122:
	.word	enemy2
	.word	rand
	.word	1195121335
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, [r0, #24]
	cmp	r3, #0
	sub	sp, sp, #20
	mov	r5, r0
	beq	.L126
	ldr	r2, .L145
	ldr	r3, .L145+4
	ldr	r1, [r2, #44]
	cmp	r1, r3
	movgt	r3, #2
	movgt	r2, r3
	strgt	r3, [r0, #8]
	ldr	r3, .L145+8
	smull	r6, r7, r1, r3
	asr	r3, r1, #31
	ldrle	r2, [r0, #8]
	rsb	r3, r3, r7, asr #4
	ldr	r0, [r0]
	add	r3, r3, r3, lsl #2
	cmp	r1, r3, lsl #3
	add	r3, r2, r0
	ldr	r2, [r5, #44]
	addeq	r2, r2, #1
	streq	r2, [r5, #44]
	cmp	r2, #2
	moveq	r2, #0
	streq	r2, [r5, #44]
	ldr	r2, [r5, #20]
	str	r3, [r5]
	add	r3, r3, r2
	cmp	r3, #147
	bgt	.L142
.L126:
	ldr	r4, .L145+12
	ldr	r8, .L145+16
	ldr	r7, .L145+20
	ldr	r9, .L145+24
	add	r6, r4, #440
	b	.L136
.L133:
	add	r4, r4, #44
	cmp	r4, r6
	beq	.L143
.L136:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L133
	ldr	lr, [r5, #16]
	add	r2, r4, #12
	ldr	ip, [r5, #20]
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	ldr	lr, [r5, #4]
	str	ip, [sp, #8]
	ldr	ip, [r5]
	ldm	r4, {r0, r1}
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L133
	ldr	r3, [r5, #28]
	cmp	r3, #1
	mov	r0, #0
	ble	.L144
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
	bne	.L136
.L143:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L144:
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
	add	r2, r2, #10
	str	r0, [r4, #32]
	strh	r1, [r7, r3]	@ movhi
	str	r2, [r9]
	b	.L133
.L142:
	mov	r0, #0
	ldr	r3, [r5, #52]
	ldr	r1, .L145+20
	lsl	r3, r3, #3
	ldrh	r2, [r1, r3]
	orr	r2, r2, #512
	str	r0, [r5, #24]
	strh	r2, [r1, r3]	@ movhi
	b	.L126
.L146:
	.align	2
.L145:
	.word	player
	.word	3500
	.word	1717986919
	.word	bullet
	.word	collision
	.word	shadowOAM
	.word	score
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
	mov	r10, #55
	mov	r9, #1
	mov	r8, #230
	ldr	r4, .L151
	ldr	r7, .L151+4
	ldr	r6, .L151+8
	add	r5, r4, #1120
.L148:
	str	r9, [r4]
	mov	lr, pc
	bx	r7
	smull	fp, ip, r0, r6
	asr	r2, r0, #31
	rsb	r2, r2, ip, asr #6
	mul	r3, r8, r2
	mov	ip, #3
	sub	r0, r0, r3
	mov	r2, #8
	mov	r3, #0
	mov	r1, #2
	cmp	r0, #0
	rsblt	r0, r0, #0
	str	r10, [r4, #52]
	str	r9, [r4, #8]
	str	r9, [r4, #48]
	str	r0, [r4, #4]
	str	r2, [r4, #16]
	str	r2, [r4, #20]
	str	r3, [r4, #24]
	str	r3, [r4, #32]
	str	r3, [r4, #40]
	str	r3, [r4, #44]
	str	ip, [r4, #28]
	str	r1, [r4, #36]
	add	r4, r4, #56
	cmp	r4, r5
	add	r10, r10, #1
	bne	.L148
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L152:
	.align	2
.L151:
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
	push	{r4, r5, r6, lr}
	mov	r1, #4
	mov	lr, #5
	mov	r4, #0
	ldr	ip, .L157
	ldr	r0, .L157+4
	ldr	r2, .L157+8
	ldr	r3, .L157+12
	str	lr, [ip]
	mov	r5, #150
	str	r4, [r0]
	str	r1, [r2]
	str	r4, [r3]
	bl	initPlayer
	bl	initBullet
	mov	r0, r4
	mov	r1, #31
	mov	r2, #190
	mov	lr, #8
	mov	ip, #1
	mov	r4, #6
	ldr	r3, .L157+16
.L154:
	str	r2, [r3, #4]
	add	r2, r2, #10
	cmp	r2, #230
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
	bne	.L154
	bl	initEnemies1
	bl	initEnemies2
	pop	{r4, r5, r6, lr}
	b	initEnemies3
.L158:
	.align	2
.L157:
	.word	maxEnemy1
	.word	enemy1onscrn
	.word	livesLeft
	.word	score
	.word	lives
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
	ldr	r0, .L169
	mov	r3, #0
	mov	r2, r0
	b	.L162
.L160:
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #56
	bxeq	lr
.L162:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	bne	.L160
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #1
	rsb	r3, r3, r3, lsl #3
	lsl	r3, r3, #3
	str	r4, [r0, r3]
	ldr	r2, .L169+4
	add	r5, r0, r3
	mov	lr, pc
	bx	r2
	mov	r2, #230
	ldr	r3, .L169+8
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r1, r3, r7, asr #6
	mul	r3, r2, r1
	sub	r0, r0, r3
	mov	r3, #3
	cmp	r0, #0
	rsblt	r0, r0, #0
	str	r4, [r5, #24]
	str	r0, [r5, #4]
	str	r3, [r5, #28]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L170:
	.align	2
.L169:
	.word	enemy3
	.word	rand
	.word	1195121335
	.size	spawnEnemy3, .-spawnEnemy3
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
	ldr	r3, .L214
	ldrh	r3, [r3, #48]
	tst	r3, #32
	sub	sp, sp, #20
	ldr	r6, .L214+4
	bne	.L172
	ldr	r3, [r6, #4]
	ldr	r2, [r6, #8]
	cmp	r3, r2
	subge	r3, r3, r2
	strge	r3, [r6, #4]
	blt	.L172
.L173:
	ldr	r3, .L214+8
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r6, #36]
	beq	.L208
	ldr	r2, .L214+12
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L178
.L208:
	add	r1, r3, #1
.L177:
	ldr	r3, [r6, #44]
	ldr	r2, .L214+16
	smull	r4, r5, r3, r2
	asr	r2, r3, #31
	rsb	r2, r2, r5, asr #3
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #2
	str	r1, [r6, #36]
	beq	.L210
.L180:
	ldr	r8, .L214+20
	add	r3, r3, #1
	mov	r5, #0
	mov	r4, r8
	str	r3, [r6, #44]
	ldr	r7, [r6, #24]
	ldr	r9, .L214+24
	b	.L186
.L183:
	add	r5, r5, #1
	cmp	r5, #20
	add	r4, r4, #56
	beq	.L185
.L186:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L183
	cmp	r7, #0
	bne	.L183
	ldr	lr, [r6, #16]
	ldr	ip, [r6, #20]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r6, #4]
	ldr	ip, [r6]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L184
	add	r5, r5, #1
	cmp	r5, #20
	ldr	r7, [r6, #24]
	add	r4, r4, #56
	bne	.L186
.L185:
	ldr	r8, .L214+28
	mov	r5, #0
	mov	r4, r8
	ldr	r9, .L214+24
	b	.L190
.L187:
	add	r5, r5, #1
	cmp	r5, #20
	add	r4, r4, #56
	beq	.L211
.L190:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L187
	cmp	r7, #0
	bne	.L187
	ldr	lr, [r6, #16]
	ldr	ip, [r6, #20]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r6, #4]
	ldr	ip, [r6]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L188
	add	r5, r5, #1
	cmp	r5, #20
	ldr	r7, [r6, #24]
	add	r4, r4, #56
	bne	.L190
.L211:
	cmp	r7, #1
	ldr	r3, [r6, #28]
	beq	.L189
.L191:
	cmp	r3, #99
	movgt	r3, #0
	strgt	r3, [r6, #64]
	strgt	r3, [r6, #24]
	strgt	r3, [r6, #28]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L172:
	ldr	r3, .L214
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L174
	ldr	r2, [r6, #4]
	ldr	r1, [r6, #8]
	ldr	r3, [r6, #16]
	rsb	r0, r1, #240
	add	r3, r2, r3
	cmp	r3, r0
	addlt	r2, r2, r1
	strlt	r2, [r6, #4]
	blt	.L173
.L174:
	ldr	r3, .L214
	ldrh	r3, [r3, #48]
	tst	r3, #64
	beq	.L212
.L175:
	ldr	r3, .L214
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L173
	ldr	r2, [r6]
	ldr	r3, [r6, #20]
	add	r3, r2, r3
	cmp	r3, #148
	ldrle	r3, [r6, #12]
	addle	r2, r3, r2
	strle	r2, [r6]
	b	.L173
.L212:
	ldr	r3, [r6]
	ldr	r2, [r6, #12]
	cmp	r3, r2
	blt	.L175
	ldr	r1, [r6, #32]
	cmp	r1, #0
	subeq	r3, r3, r2
	streq	r3, [r6]
	beq	.L173
	b	.L175
.L178:
	cmp	r3, #24
	ble	.L208
	bl	fireBullet
	mov	r1, #1
	b	.L177
.L188:
	mov	r0, #1
	ldr	ip, .L214+32
	rsb	r5, r5, r5, lsl #3
	ldr	r1, [ip]
	ldr	r2, [ip]
	add	r3, r8, r5, lsl #3
	ldr	r8, [r3, #52]
	ldr	r5, .L214+36
	sub	r2, r2, #1
	ldr	r4, .L214+40
	add	r2, r2, r2, lsl #2
	lsl	r8, r8, #3
	add	r2, r5, r2, lsl #3
	ldr	lr, [r2, #36]
	ldrh	r2, [r4, r8]
	orr	r2, r2, #512
	strh	r2, [r4, r8]	@ movhi
	lsl	lr, lr, #3
	sub	r2, r1, #1
	str	r7, [r3, #24]
	ldrh	r1, [r4, lr]
	ldr	r3, [ip]
	add	r2, r2, r2, lsl #2
	sub	r3, r3, #1
	add	r2, r5, r2, lsl #3
	orr	r1, r1, #512
	str	r3, [ip]
	str	r7, [r2, #16]
	strh	r1, [r4, lr]	@ movhi
	str	r0, [r6, #24]
	str	r0, [r6, #64]
	ldr	r3, [r6, #28]
.L189:
	add	r3, r3, #1
	str	r3, [r6, #28]
	b	.L191
.L210:
	bl	spawnEnemy1
	ldr	r3, [r6, #48]
	cmp	r3, #0
	bne	.L213
.L181:
	ldr	r3, [r6, #52]
	cmp	r3, #0
	bne	.L182
.L209:
	ldr	r3, [r6, #44]
	b	.L180
.L184:
	mov	r0, #1
	ldr	ip, .L214+32
	rsb	r5, r5, r5, lsl #3
	ldr	r1, [ip]
	ldr	r2, [ip]
	add	r3, r8, r5, lsl #3
	ldr	r8, [r3, #52]
	ldr	r5, .L214+36
	sub	r2, r2, #1
	ldr	r4, .L214+40
	add	r2, r2, r2, lsl #2
	lsl	r8, r8, #3
	add	r2, r5, r2, lsl #3
	ldr	lr, [r2, #36]
	ldrh	r2, [r4, r8]
	orr	r2, r2, #512
	strh	r2, [r4, r8]	@ movhi
	lsl	lr, lr, #3
	sub	r2, r1, #1
	str	r7, [r3, #24]
	ldrh	r1, [r4, lr]
	ldr	r3, [ip]
	add	r2, r2, r2, lsl #2
	add	r2, r5, r2, lsl #3
	orr	r1, r1, #512
	sub	r3, r3, #1
	str	r7, [r2, #16]
	strh	r1, [r4, lr]	@ movhi
	str	r3, [ip]
	str	r0, [r6, #24]
	str	r0, [r6, #64]
	mov	r7, r0
	b	.L185
.L182:
	bl	spawnEnemy3
	b	.L209
.L213:
	bl	spawnEnemy2
	b	.L181
.L215:
	.align	2
.L214:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	1717986919
	.word	enemy1
	.word	collision
	.word	enemy2
	.word	livesLeft
	.word	lives
	.word	shadowOAM
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, [r0, #24]
	cmp	r3, #0
	sub	sp, sp, #20
	mov	r5, r0
	beq	.L218
	ldr	r3, .L235
	ldr	r0, .L235+4
	ldr	r1, [r3, #44]
	smull	r3, r4, r1, r0
	asr	r2, r1, #31
	rsb	r2, r2, r4, asr #4
	add	r2, r2, r2, lsl #2
	cmp	r1, r2, lsl #3
	ldr	r2, [r5, #44]
	addeq	r2, r2, #1
	streq	r2, [r5, #44]
	cmp	r2, #2
	moveq	r2, #0
	ldr	r3, [r5]
	ldr	r0, [r5, #8]
	streq	r2, [r5, #44]
	ldr	r2, [r5, #20]
	add	r3, r3, r0
	str	r3, [r5]
	add	r3, r3, r2
	cmp	r3, #147
	bgt	.L232
.L218:
	ldr	r4, .L235+8
	ldr	r8, .L235+12
	ldr	r7, .L235+16
	ldr	r9, .L235+20
	add	r6, r4, #440
	b	.L226
.L223:
	add	r4, r4, #44
	cmp	r4, r6
	beq	.L233
.L226:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L223
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
	beq	.L223
	ldr	r3, [r5, #28]
	cmp	r3, #1
	mov	r0, #0
	ble	.L234
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
	bne	.L226
.L233:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L234:
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
	add	r2, r2, #20
	str	r0, [r4, #32]
	strh	r1, [r7, r3]	@ movhi
	str	r2, [r9]
	b	.L223
.L232:
	mov	r0, #0
	ldr	r3, [r5, #52]
	ldr	r1, .L235+16
	lsl	r3, r3, #3
	ldrh	r2, [r1, r3]
	orr	r2, r2, #512
	str	r0, [r5, #24]
	strh	r2, [r1, r3]	@ movhi
	b	.L218
.L236:
	.align	2
.L235:
	.word	player
	.word	1717986919
	.word	bullet
	.word	collision
	.word	shadowOAM
	.word	score
	.size	updateEnemy3, .-updateEnemy3
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
	ldr	r6, .L276
	ldr	r3, [r6, #44]
	cmp	r3, #1000
	ble	.L239
	mov	r2, #1
	cmp	r3, #2000
	str	r2, [r6, #48]
	strgt	r2, [r6, #52]
.L239:
	bl	updatePlayer
	mov	lr, #0
	ldr	r3, .L276+4
	ldr	ip, .L276+8
	add	r0, r3, #440
.L243:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L241
	ldr	r1, [r3]
	cmp	r1, #5
	ldrle	r2, [r3, #40]
	lslle	r2, r2, #3
	ldrgt	r2, [r3, #8]
	ldrhle	r1, [ip, r2]
	addgt	r2, r2, r1
	orrle	r1, r1, #512
	strgt	r2, [r3]
	strle	lr, [r3, #20]
	strle	lr, [r3, #32]
	strhle	r1, [ip, r2]	@ movhi
.L241:
	add	r3, r3, #44
	cmp	r3, r0
	bne	.L243
	ldr	r4, .L276+12
	add	r5, r4, #1120
	b	.L245
.L244:
	add	r4, r4, #56
	cmp	r4, r5
	beq	.L275
.L245:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L244
	mov	r0, r4
	add	r4, r4, #56
	bl	updateEnemy1
	cmp	r4, r5
	bne	.L245
.L275:
	ldr	r3, [r6, #48]
	cmp	r3, #0
	beq	.L246
	ldr	r4, .L276+16
	add	r5, r4, #1120
	b	.L248
.L247:
	add	r4, r4, #56
	cmp	r4, r5
	beq	.L246
.L248:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L247
	mov	r0, r4
	add	r4, r4, #56
	bl	updateEnemy2
	cmp	r4, r5
	bne	.L248
.L246:
	ldr	r3, [r6, #52]
	cmp	r3, #0
	beq	.L237
	ldr	r4, .L276+20
	add	r5, r4, #1120
	b	.L251
.L250:
	add	r4, r4, #56
	cmp	r4, r5
	beq	.L237
.L251:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L250
	mov	r0, r4
	add	r4, r4, #56
	bl	updateEnemy3
	cmp	r4, r5
	bne	.L251
.L237:
	pop	{r4, r5, r6, lr}
	bx	lr
.L277:
	.align	2
.L276:
	.word	player
	.word	bullet
	.word	shadowOAM
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.size	updateGame, .-updateGame
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
	mov	r4, #6
	ldr	r3, .L282
.L279:
	str	r2, [r3, #4]
	add	r2, r2, #10
	cmp	r2, #230
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
	bne	.L279
	pop	{r4, r5, lr}
	bx	lr
.L283:
	.align	2
.L282:
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
	ldr	ip, .L286
	ldr	r2, [ip]
	ldr	r3, [ip]
	ldr	r1, .L286+4
	sub	r3, r3, #1
	add	r3, r3, r3, lsl #2
	add	r3, r1, r3, lsl #3
	ldr	r0, [r3, #36]
	ldr	r5, .L286+8
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
.L287:
	.align	2
.L286:
	.word	livesLeft
	.word	lives
	.word	shadowOAM
	.size	updateLives, .-updateLives
	.comm	enemy3,1120,4
	.comm	enemy2,1120,4
	.comm	enemy1,1120,4
	.comm	bullet,440,4
	.comm	lives,160,4
	.comm	player,76,4
	.comm	shadowOAM,1024,4
	.comm	score,4,4
	.comm	enemy1onscrn,4,4
	.comm	maxEnemy1,4,4
	.comm	livesLeft,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
