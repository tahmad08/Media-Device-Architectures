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
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L4+8
	ldr	r2, .L4+12
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
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
	push	{r4, r5, r6, lr}
	mov	r3, #256
	ldr	r4, .L13
	mov	r2, #83886080
	ldr	r1, .L13+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1248
	mov	r2, #100663296
	ldr	r1, .L13+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L13+12
	ldr	r1, .L13+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r3, #256
	mov	r2, #7168
	ldr	r4, .L13+20
	strh	r3, [r5]	@ movhi
	ldr	r3, [r4]
	strh	r2, [r5, #8]	@ movhi
	add	r3, r3, #1
	ldr	r2, .L13+24
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L13+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L6
	ldr	r3, .L13+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L12
.L6:
	pop	{r4, r5, r6, lr}
	bx	lr
.L12:
	mov	r3, #4096
	ldr	r0, [r4]
	strh	r3, [r5]	@ movhi
	ldr	r3, .L13+36
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L13+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L14:
	.align	2
.L13:
	.word	DMANow
	.word	startscrnPal
	.word	startscrnTiles
	.word	100720640
	.word	startscrnMap
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	state
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
	ldr	r3, .L16
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
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
	ldr	r3, .L20
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+4
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L20+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L34
	mov	lr, pc
	bx	r3
	ldr	r4, .L34+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L34+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2112
	mov	r2, #100663296
	ldr	r1, .L34+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L34+16
	ldr	r1, .L34+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r4, #67108864
	mov	r2, #7168
	strh	r3, [r4]	@ movhi
	strh	r2, [r4, #8]	@ movhi
	ldr	r5, .L34+24
	mov	lr, pc
	bx	r5
	ldr	r3, .L34+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L23
	ldr	r2, .L34+32
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L32
.L23:
	tst	r3, #4
	beq	.L22
	ldr	r3, .L34+32
	ldrh	r3, [r3]
	ands	r4, r3, #4
	beq	.L33
.L22:
	pop	{r4, r5, r6, lr}
	bx	lr
.L32:
	mov	r1, #4096
	mov	r2, #1
	ldr	r3, .L34+36
	strh	r1, [r4]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L33:
	mov	lr, pc
	bx	r5
	ldr	r3, .L34+40
	mov	lr, pc
	bx	r3
	ldr	r2, .L34+36
	ldr	r3, .L34+44
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	hideSprites
	.word	DMANow
	.word	pausescrnPal
	.word	pausescrnTiles
	.word	100720640
	.word	pausescrnMap
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.word	flipPage
	.word	seed
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
	ldr	r3, .L38
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+4
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L38+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L39:
	.align	2
.L38:
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
	ldr	r3, .L42
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+4
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L42+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L43:
	.align	2
.L42:
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
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
	mov	r2, #0
	mov	r1, #8
	mov	r4, #2
	mov	lr, #125
	mov	ip, #118
	mov	r0, #1
	ldr	r3, .L46
	str	r4, [r3, #8]
	str	lr, [r3]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	ip, [r3, #4]
	str	r0, [r3, #40]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #28]
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
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
	push	{r4, lr}
	mov	ip, #2
	mov	lr, #8
	mov	r4, #5
	mov	r0, #0
	ldr	r1, .L50
	ldr	r3, [r1, #12]
	ldr	r2, [r1, #4]
	add	r3, r3, r3, lsr #31
	add	r2, r2, r3, asr #1
	ldr	r1, [r1]
	ldr	r3, .L50+4
	sub	r2, r2, #4
	str	r4, [r3, #28]
	str	lr, [r3, #16]
	str	lr, [r3, #12]
	stm	r3, {r1, r2}
	str	ip, [r3, #8]
	str	ip, [r3, #36]
	str	r0, [r3, #20]
	str	r0, [r3, #32]
	pop	{r4, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	player
	.word	bullet
	.size	initBullet, .-initBullet
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
	mov	r2, #200
	mov	r5, #140
	mov	r1, #8
	mov	r4, #1
	mov	lr, #6
	mov	ip, #0
	mov	r0, #2
	ldr	r3, .L56
.L53:
	str	r2, [r3, #4]
	add	r2, r2, #10
	cmp	r2, #230
	str	r5, [r3]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3, #24]
	str	r0, [r3, #28]
	add	r3, r3, #32
	bne	.L53
	pop	{r4, r5, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	lives
	.size	initLives, .-initLives
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mvn	r1, #7
	mov	r6, #5
	mov	lr, r2
	mov	r8, #4
	mov	r5, #2
	mov	r9, #3
	mov	ip, #8
	mov	r0, #10
	mov	r7, #1
	ldr	r3, .L80
	b	.L72
.L59:
	sub	r4, r2, #7
	cmp	r4, #6
	bls	.L76
	sub	r4, r2, #14
	cmp	r4, #6
	bls	.L77
	sub	r4, r2, #21
	cmp	r4, #6
	bls	.L78
	cmp	r2, #28
	beq	.L75
.L70:
	add	r1, r1, #13
.L71:
	str	r8, [r3, #32]
.L60:
	add	r2, r2, #1
	cmp	r2, #35
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r6, [r3]
	str	r1, [r3, #4]
	str	r7, [r3, #24]
	str	lr, [r3, #28]
	str	lr, [r3, #40]
	str	r5, [r3, #44]
	add	r3, r3, #48
	beq	.L79
.L72:
	cmp	r2, #6
	bgt	.L59
.L68:
	add	r1, r1, #13
.L69:
	str	r5, [r3, #32]
	b	.L60
.L79:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L77:
	cmp	r2, #14
	bne	.L70
.L75:
	add	r6, r6, #13
	mov	r1, #5
	b	.L71
.L78:
	cmp	r2, #21
	addeq	r6, r6, #13
	moveq	r1, #5
	bne	.L68
	b	.L69
.L76:
	cmp	r2, #7
	addeq	r6, r6, #13
	moveq	r1, #5
	addne	r1, r1, #13
	str	r9, [r3, #32]
	b	.L60
.L81:
	.align	2
.L80:
	.word	enemy
	.size	initEnemies, .-initEnemies
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #35
	mov	lr, #96
	mov	ip, #10
	mov	r5, #5
	mov	r6, #65
	ldr	r0, .L86
	ldr	r3, .L86+4
	str	r4, [r0]
	ldr	r2, .L86+8
	ldr	r1, .L86+12
	ldr	r0, .L86+16
	ldr	r4, .L86+20
	str	lr, [r3]
	ldr	lr, .L86+24
	str	r5, [r2]
	mov	r3, #256
	str	ip, [r1]
	mov	r2, #83886080
	str	ip, [r0]
	ldr	r1, .L86+28
	str	r6, [r4]
	mov	r0, #3
	ldr	r4, .L86+32
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	mov	r3, #1248
	mov	r2, #100663296
	ldr	r1, .L86+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L86+40
	ldr	r1, .L86+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L86+48
	ldr	r1, .L86+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L86+56
	ldr	r1, .L86+60
	mov	r0, #3
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L86+64
	mov	lr, pc
	bx	r3
	mov	r10, #67108864
	mov	r3, #7168	@ movhi
	mov	ip, #8
	strh	r3, [r10, #8]	@ movhi
	mov	r3, #4352	@ movhi
	ldr	r2, .L86+68
	str	r5, [r2, #28]
	ldr	r5, .L86+72
	strh	r3, [r10]	@ movhi
	mov	r0, ip
	str	ip, [r2, #16]
	str	ip, [r2, #12]
	str	ip, [r5, #12]
	str	ip, [r5, #16]
	mov	ip, #125
	mov	r1, #0
	mov	lr, #2
	mov	fp, #1
	str	ip, [r2]
	str	ip, [r5]
	mov	ip, #118
	mov	r9, lr
	mov	r4, r1
	mov	r8, fp
	mov	r7, #140
	mov	r6, #6
	mov	r3, #200
	str	lr, [r2, #8]
	str	lr, [r2, #36]
	str	ip, [r2, #4]
	str	r1, [r2, #20]
	str	r1, [r2, #32]
	str	lr, [r5, #8]
	str	ip, [r5, #4]
	str	r1, [r5, #20]
	str	r1, [r5, #24]
	str	r1, [r5, #36]
	str	r1, [r5, #28]
	str	fp, [r5, #40]
	ldr	r2, .L86+76
.L83:
	str	r3, [r2, #4]
	add	r3, r3, #10
	cmp	r3, #230
	str	r7, [r2]
	str	r0, [r2, #8]
	str	r0, [r2, #12]
	str	r8, [r2, #16]
	str	r6, [r2, #20]
	str	r4, [r2, #24]
	str	r9, [r2, #28]
	add	r2, r2, #32
	bne	.L83
	bl	initEnemies
	ldr	r3, .L86+80
	ldr	r2, .L86+84
	ldrh	r1, [r3, #48]
	ldr	r3, .L86+88
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+92
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+96
	ldr	r2, .L86+100
	str	r4, [r3]
	str	r4, [r2]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L87:
	.align	2
.L86:
	.word	remaining
	.word	endCol
	.word	startCol
	.word	endColDel
	.word	startColDel
	.word	bottomRow
	.word	bottomRowDel
	.word	startscrnPal
	.word	DMANow
	.word	startscrnTiles
	.word	100720640
	.word	startscrnMap
	.word	83886592
	.word	spriteshtPal
	.word	100728832
	.word	spriteshtTiles
	.word	hideSprites
	.word	bullet
	.word	player
	.word	lives
	.word	67109120
	.word	buttons
	.word	waitForVBlank
	.word	flipPage
	.word	seed
	.word	state
	.size	initialize, .-initialize
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
	ldr	r3, .L99
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L89
	ldr	r3, .L99+4
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #8]
	cmp	r2, r1
	subge	r2, r2, r1
	strge	r2, [r3, #4]
	blt	.L89
.L90:
	ldr	r3, .L99+8
	ldrh	r3, [r3]
	tst	r3, #1
	bxeq	lr
	ldr	r3, .L99+12
	ldrh	r3, [r3]
	tst	r3, #1
	bxne	lr
	ldr	r3, .L99+16
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bxne	lr
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldr	ip, .L99+4
	ldr	r0, [ip, #12]
	ldr	r2, [ip, #4]
	add	r0, r0, r0, lsr #31
	ldr	r1, [r3, #16]
	add	r2, r2, r0, asr lr
	ldr	r0, [r3, #32]
	add	r1, r1, r1, lsr #31
	ldr	ip, [ip]
	sub	r2, r2, r1, asr lr
	add	r1, r0, lr
	str	lr, [r3, #20]
	str	ip, [r3]
	str	r2, [r3, #4]
	str	r1, [r3, #32]
	ldr	lr, [sp], #4
	bx	lr
.L89:
	ldr	r3, .L99
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L90
	ldr	r3, .L99+4
	add	r0, r3, #8
	ldr	r1, [r3, #4]
	ldm	r0, {r0, r2}
	add	r2, r1, r2
	rsb	ip, r0, #240
	cmp	r2, ip
	addle	r1, r1, r0
	strle	r1, [r3, #4]
	b	.L90
.L100:
	.align	2
.L99:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	bullet
	.size	updatePlayer, .-updatePlayer
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
	ldr	r3, .L104
	ldr	r2, [r3]
	cmp	r2, #1
	movle	r2, #0
	ldrgt	r1, [r3, #8]
	subgt	r2, r2, r1
	strgt	r2, [r3]
	strle	r2, [r3, #32]
	strle	r2, [r3, #20]
	bx	lr
.L105:
	.align	2
.L104:
	.word	bullet
	.size	updateBullet, .-updateBullet
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L144
	ldr	r3, .L144+4
	ldr	r2, [r2, #24]
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	smull	r4, r5, r2, r3
	asr	r1, r2, #31
	rsb	r3, r1, r5, asr #4
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #3
	sub	sp, sp, #20
	bne	.L107
	ldr	ip, .L144+8
	ldr	r3, [ip]
	cmp	r3, #235
	ldr	r3, .L144+12
	ble	.L108
	add	r0, r3, #1680
.L110:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L109
	ldr	r1, [r3]
	ldr	r2, [r3, #12]
	ldr	lr, [r3, #8]
	rsb	r2, r2, #0
	add	r1, r1, lr
	str	r1, [r3]
	str	r2, [r3, #12]
.L109:
	add	r3, r3, #48
	cmp	r3, r0
	bne	.L110
	ldr	r3, .L144+16
	ldr	r2, [r3]
	rsb	r2, r2, #0
	str	r2, [r3]
	ldr	r2, .L144+20
	ldr	r1, [r2]
	rsb	r1, r1, #0
	str	r1, [r2]
	ldr	r0, .L144+24
	ldr	r1, .L144+28
	ldr	lr, [r1]
	ldr	r1, [r0]
	add	r1, r1, lr
	str	r1, [r0]
	ldr	r4, .L144+32
.L111:
	ldr	r1, [r3]
	ldr	r3, [ip]
	add	r3, r3, r1
	str	r3, [ip]
	ldr	r2, [r2]
	ldr	r3, [r4]
	add	r3, r3, r2
	str	r3, [r4]
.L107:
	mov	r5, #0
	ldr	r4, .L144+12
	mov	r7, r5
	ldr	r6, .L144+36
	ldr	r9, .L144+40
	ldr	fp, .L144+44
	ldr	r8, .L144+48
	ldr	r10, .L144+52
	b	.L122
.L120:
	add	r5, r5, #1
	cmp	r5, #35
	add	r4, r4, #48
	beq	.L143
.L122:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L120
	ldr	r3, [r6, #32]
	cmp	r3, #1
	bne	.L120
	ldr	r3, [r6, #20]
	cmp	r3, #0
	beq	.L120
	ldr	lr, [r4, #16]
	add	r2, r6, #12
	ldm	r2, {r2, r3}
	ldr	ip, [r4, #20]
	ldm	r6, {r0, r1}
	str	lr, [sp, #12]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	sub	r3, r3, #3
	sub	r2, r2, #2
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L120
	add	r1, r10, r5, lsl #3
	ldrh	r2, [r1, #16]
	ldr	r3, [r8]
	str	r5, [fp, r5, lsl #2]
	add	r5, r5, #1
	orr	r2, r2, #512
	sub	r3, r3, #1
	cmp	r5, #35
	str	r7, [r4, #24]
	str	r7, [r6, #20]
	str	r7, [r6, #32]
	strh	r2, [r1, #16]	@ movhi
	str	r3, [r8]
	add	r4, r4, #48
	bne	.L122
.L143:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L108:
	ldr	r0, [r3, #48]
	cmp	r0, #5
	ldr	r4, .L144+32
	bgt	.L141
.L112:
	ldr	r3, .L144+4
	smull	r6, r7, r2, r3
	ldr	r3, .L144+12
	rsb	r1, r1, r7, asr #3
	add	r1, r1, r1, lsl #2
	sub	r1, r2, r1, lsl #2
	add	r0, r3, #1680
.L118:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L116
	ldr	r2, [r3, #4]
	ldr	lr, [r3, #12]
	cmp	r1, #0
	add	r2, r2, lr
	str	r2, [r3, #4]
	bne	.L116
	ldr	r2, [r3, #32]
	sub	r2, r2, #3
	cmp	r2, #1
	bhi	.L116
	add	r2, r3, #40
	ldm	r2, {r2, lr}
	add	r2, r2, #1
	cmp	r2, lr
	str	r2, [r3, #40]
	strge	r1, [r3, #40]
.L116:
	add	r3, r3, #48
	cmp	r3, r0
	bne	.L118
	ldr	r3, .L144+16
	ldr	r2, .L144+20
	b	.L111
.L141:
	ldr	r0, [r4]
	cmp	r0, #2
	bgt	.L112
	add	r0, r3, #1680
.L114:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L113
	ldr	r1, [r3]
	ldr	r2, [r3, #12]
	ldr	lr, [r3, #8]
	rsb	r2, r2, #0
	add	r1, r1, lr
	str	r1, [r3]
	str	r2, [r3, #12]
.L113:
	add	r3, r3, #48
	cmp	r3, r0
	bne	.L114
	ldr	r3, .L144+16
	ldr	r2, [r3]
	rsb	r2, r2, #0
	str	r2, [r3]
	ldr	r2, .L144+20
	ldr	r1, [r2]
	rsb	r1, r1, #0
	str	r1, [r2]
	ldr	r0, .L144+24
	ldr	r1, .L144+28
	ldr	lr, [r1]
	ldr	r1, [r0]
	add	r1, r1, lr
	str	r1, [r0]
	b	.L111
.L145:
	.align	2
.L144:
	.word	player
	.word	1717986919
	.word	endCol
	.word	enemy
	.word	endColDel
	.word	startColDel
	.word	bottomRow
	.word	bottomRowDel
	.word	startCol
	.word	bullet
	.word	collision
	.word	arr
	.word	remaining
	.word	shadowOAM
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	bottomRowUpdate
	.syntax unified
	.arm
	.fpu softvfp
	.type	bottomRowUpdate, %function
bottomRowUpdate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	bottomRowUpdate, .-bottomRowUpdate
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
	ldr	r4, .L166
	bl	updatePlayer
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L148
	ldr	r3, [r4]
	cmp	r3, #1
	movle	r3, #0
	ldrgt	r2, [r4, #8]
	subgt	r3, r3, r2
	strgt	r3, [r4]
	strle	r3, [r4, #32]
	strle	r3, [r4, #20]
.L148:
	bl	updateEnemies
	ldr	r1, .L166+4
	mov	r5, r1
	mov	r2, r1
	ldr	r3, .L166+8
	add	r0, r3, #20
	ldm	r0, {r0, ip}
	add	ip, ip, #1
	ldr	lr, [r3, #36]
	add	r0, r0, #1
	str	ip, [r3, #24]
	ldr	ip, [r3, #28]
	str	r0, [r3, #20]
	ldm	r3, {r0, r3}
	add	ip, ip, lr, lsl #5
	strh	ip, [r1, #4]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	ldm	r4, {r3, ip}
	ldr	lr, [r4, #32]
	strh	r0, [r1]	@ movhi
	ldr	r0, [r4, #28]
	strh	r3, [r1, #8]	@ movhi
	ldr	r3, .L166+12
	add	r0, r0, lr, lsl #5
	strh	ip, [r1, #10]	@ movhi
	strh	r0, [r1, #12]	@ movhi
	add	r0, r3, #1680
.L151:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	beq	.L150
	ldr	r4, [r3, #40]
	ldr	r1, [r3, #32]
	ldr	lr, [r3]
	ldr	ip, [r3, #4]
	add	r1, r1, r4, lsl #5
	strh	r1, [r2, #20]	@ movhi
	strh	lr, [r2, #16]	@ movhi
	strh	ip, [r2, #18]	@ movhi
.L150:
	add	r3, r3, #48
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L151
	mov	r2, #0
	ldr	r3, .L166+16
.L153:
	ldr	r1, [r3, #16]
	cmp	r1, #0
	beq	.L152
	add	r0, r3, #20
	ldm	r0, {r0, r6}
	add	r1, r5, r2
	ldm	r3, {r4, lr}
	add	ip, r1, #304
	add	r0, r0, r6, lsl #5
	add	r1, r1, #308
	strh	r4, [ip]	@ movhi
	strh	lr, [ip, #2]	@ movhi
	strh	r0, [r1]	@ movhi
.L152:
	add	r2, r2, #8
	cmp	r2, #24
	add	r3, r3, #32
	bne	.L153
	ldr	r3, .L166+20
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L167:
	.align	2
.L166:
	.word	bullet
	.word	shadowOAM
	.word	player
	.word	enemy
	.word	lives
	.word	waitForVBlank
	.size	drawGame, .-drawGame
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
	bl	drawGame
	ldr	r4, .L179
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L179+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #336
	mov	r2, #100663296
	ldr	r1, .L179+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L179+12
	ldr	r1, .L179+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r2, #56320
	mov	r3, #512
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L179+20
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L179+24
	ldrh	r2, [r3]
	ldrh	r3, [r3, #4]
	ldr	r4, .L179+28
	strh	r2, [r5, #16]	@ movhi
	strh	r3, [r5, #18]	@ movhi
	mov	lr, pc
	bx	r4
	ldr	r3, .L179+32
	ldr	r2, .L179+36
	ldr	r3, [r3]
	ldr	r2, [r2]
	sub	r3, r3, #4
	cmp	r3, r2
	bgt	.L176
.L169:
	ldr	r3, .L179+40
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L177
.L170:
	ldr	r3, .L179+44
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L168
	ldr	r3, .L179+48
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L178
.L168:
	pop	{r4, r5, r6, lr}
	bx	lr
.L177:
	ldr	r3, .L179+52
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L179+56
	str	r2, [r3]
	b	.L170
.L176:
	ldr	r3, .L179+52
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L179+56
	str	r2, [r3]
	b	.L169
.L178:
	ldr	r3, .L179+52
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L179+56
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L180:
	.align	2
.L179:
	.word	DMANow
	.word	gamescrnPal
	.word	gamescrnTiles
	.word	100720640
	.word	gamescrnMap
	.word	shadowOAM
	.word	.LANCHOR0
	.word	flipPage
	.word	bottomRow
	.word	player
	.word	remaining
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
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
	push	{r4, r7, fp, lr}
	ldr	r3, .L193
	mov	lr, pc
	bx	r3
	ldr	r3, .L193+4
	mov	lr, pc
	bx	r3
	ldr	r6, .L193+8
	ldr	r7, .L193+12
	ldr	r5, .L193+16
	ldr	fp, .L193+20
	ldr	r10, .L193+24
	ldr	r9, .L193+28
	ldr	r8, .L193+32
	ldr	r4, .L193+36
.L182:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L183:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L183
.L185:
	.word	.L184
	.word	.L186
	.word	.L187
	.word	.L188
	.word	.L189
.L189:
	ldr	r3, .L193+40
	mov	lr, pc
	bx	r3
	b	.L182
.L188:
	mov	lr, pc
	bx	r8
	b	.L182
.L187:
	mov	lr, pc
	bx	r9
	b	.L182
.L186:
	mov	lr, pc
	bx	r10
	b	.L182
.L184:
	mov	lr, pc
	bx	fp
	b	.L182
.L194:
	.align	2
.L193:
	.word	hideSprites
	.word	initialize
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
	push	{r4, lr}
	ldr	r3, .L202
	mov	lr, pc
	bx	r3
	ldr	r4, .L202+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L202+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #640
	mov	r2, #100663296
	ldr	r1, .L202+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L202+16
	ldr	r1, .L202+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7168
	mov	r2, #256
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r3, .L202+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L202+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L195
	ldr	r3, .L202+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L201
.L195:
	pop	{r4, lr}
	bx	lr
.L201:
	ldr	r3, .L202+36
	mov	lr, pc
	bx	r3
.L203:
	.align	2
.L202:
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
	ldr	r3, .L211
	mov	lr, pc
	bx	r3
	ldr	r4, .L211+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L211+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #416
	mov	r2, #100663296
	ldr	r1, .L211+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L211+16
	ldr	r1, .L211+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7168
	mov	r2, #256
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r3, .L211+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L211+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L204
	ldr	r3, .L211+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L210
.L204:
	pop	{r4, lr}
	bx	lr
.L210:
	ldr	r3, .L211+36
	mov	lr, pc
	bx	r3
.L212:
	.align	2
.L211:
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
	.comm	bullet,40,4
	.comm	bottomRowDel,4,4
	.comm	bottomRow,4,4
	.comm	startColDel,4,4
	.comm	endColDel,4,4
	.comm	startCol,4,4
	.comm	endCol,4,4
	.comm	remaining,4,4
	.comm	enemy,1680,4
	.comm	lives,96,4
	.comm	player,44,4
	.comm	shadowOAM,1024,4
	.comm	arr,140,4
	.global	vOff
	.global	hOff
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
