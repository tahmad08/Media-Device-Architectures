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
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L8+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L9:
	.align	2
.L8:
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToInstr, .-goToInstr
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
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L12+8
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L12+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #112
	mov	r2, #100663296
	ldr	r1, .L12+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L12+20
	ldr	r1, .L12+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r0, #56320
	mov	r2, #2
	ldr	r3, .L12+28
	strh	r0, [r1, #8]	@ movhi
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	waitForVBlank
	.word	flipPage
	.word	DMANow
	.word	gamescrnPal
	.word	gamescrnTiles
	.word	100720640
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
	ldr	r4, .L26
	mov	r2, #83886080
	ldr	r1, .L26+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1264
	mov	r2, #100663296
	ldr	r1, .L26+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L26+12
	ldr	r1, .L26+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r3, #256
	mov	r2, #7168
	ldr	r4, .L26+20
	strh	r3, [r5]	@ movhi
	ldr	r3, [r4]
	ldr	r7, .L26+24
	add	r3, r3, #1
	strh	r2, [r5, #8]	@ movhi
	ldr	r6, .L26+28
	str	r3, [r4]
	mov	lr, pc
	bx	r6
	ldrh	r3, [r7]
	tst	r3, #8
	beq	.L15
	ldr	r2, .L26+32
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L24
.L15:
	tst	r3, #4
	beq	.L14
	ldr	r3, .L26+32
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L25
.L14:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L25:
	mov	lr, pc
	bx	r6
	ldr	r3, .L26+36
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L26+40
	pop	{r4, r5, r6, r7, r8, lr}
	str	r2, [r3]
	bx	lr
.L24:
	mov	r3, #4096
	ldr	r0, [r4]
	strh	r3, [r5]	@ movhi
	ldr	r3, .L26+44
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r7]
	b	.L15
.L27:
	.align	2
.L26:
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
	ldr	r3, .L35
	mov	lr, pc
	bx	r3
	ldr	r4, .L35+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L35+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1760
	mov	r2, #100663296
	ldr	r1, .L35+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L35+16
	ldr	r1, .L35+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7168
	mov	r2, #256
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r5, .L35+24
	mov	lr, pc
	bx	r5
	ldr	r3, .L35+28
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L28
	ldr	r3, .L35+32
	ldrh	r3, [r3]
	ands	r4, r3, #4
	beq	.L34
.L28:
	pop	{r4, r5, r6, lr}
	bx	lr
.L34:
	mov	lr, pc
	bx	r5
	ldr	r3, .L35+36
	mov	lr, pc
	bx	r3
	ldr	r2, .L35+40
	ldr	r3, .L35+44
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L36:
	.align	2
.L35:
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
	ldr	r3, .L39
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+4
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L39+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L40:
	.align	2
.L39:
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
	ldr	r3, .L43
	mov	lr, pc
	bx	r3
	ldr	r3, .L43+4
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L43+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L44:
	.align	2
.L43:
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
	ldr	r3, .L47
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+4
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L47+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L48:
	.align	2
.L47:
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
	push	{r4, r5, lr}
	mov	r2, #0
	mov	r0, #8
	mov	r5, #125
	mov	r4, #118
	mov	lr, #20
	mov	r1, #2
	mov	ip, #1
	ldr	r3, .L51
	str	r5, [r3]
	str	r4, [r3, #4]
	str	lr, [r3, #24]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	ip, [r3, #48]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #52]
	str	r2, [r3, #36]
	pop	{r4, r5, lr}
	bx	lr
.L52:
	.align	2
.L51:
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
	mov	r1, #21
	mvn	r7, #1
	mov	ip, #8
	mov	r0, #0
	mov	r6, #2
	mov	r5, #5
	ldr	r4, .L57
	ldr	r3, [r4, #16]
	ldr	lr, [r4, #4]
	add	r2, r3, r3, lsr #31
	ldr	r4, [r4]
	ldr	r3, .L57+4
	add	lr, lr, r2, asr #1
.L54:
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
	bne	.L54
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L58:
	.align	2
.L57:
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
	ldr	r0, .L69
	mov	r3, #0
	mov	r2, r0
	b	.L62
.L60:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #44
	bxeq	lr
.L62:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L60
	push	{r4, r5, lr}
	mov	lr, #1
	ldr	r4, .L69+4
	add	r2, r3, r3, lsl #2
	ldr	r1, [r4, #16]
	add	r3, r3, r2, lsl lr
	add	ip, r1, r1, lsr #31
	lsl	r3, r3, #2
	ldr	r1, [r4, #4]
	add	r2, r0, r3
	add	r1, r1, ip, asr lr
	ldr	ip, [r2, #16]
	add	ip, ip, ip, lsr #31
	sub	r1, r1, ip, asr lr
	ldr	ip, [r2, #32]
	ldr	r5, [r4]
	add	ip, ip, lr
	str	r5, [r0, r3]
	str	lr, [r2, #20]
	str	r1, [r2, #4]
	str	ip, [r2, #32]
	pop	{r4, r5, lr}
	bx	lr
.L70:
	.align	2
.L69:
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
	bgt	.L77
	mov	ip, #0
	ldr	r3, [r0, #40]
	ldr	r1, .L78
	lsl	r3, r3, #3
	ldrh	r2, [r1, r3]
	orr	r2, r2, #512
	str	ip, [r0, #20]
	str	ip, [r0, #32]
	strh	r2, [r1, r3]	@ movhi
	bx	lr
.L77:
	ldr	r2, [r0, #8]
	add	r3, r2, r3
	str	r3, [r0]
	bx	lr
.L79:
	.align	2
.L78:
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, #0
	mov	r9, #1
	mov	r5, r8
	ldr	r4, .L84
	ldr	r7, .L84+4
	ldr	r6, .L84+8
.L81:
	str	r5, [r4]
	mov	lr, pc
	bx	r7
	mov	r1, #8
	mov	ip, #6
	smull	r10, fp, r0, r6
	asr	r2, r0, #31
	add	r3, r0, fp
	rsb	r3, r2, r3, asr #7
	add	r8, r8, #1
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	cmp	r8, #40
	str	r8, [r4, #48]
	str	r9, [r4, #8]
	str	r5, [r4, #24]
	str	r5, [r4, #28]
	str	r5, [r4, #36]
	str	r5, [r4, #40]
	str	r9, [r4, #44]
	str	r0, [r4, #4]
	str	r1, [r4, #16]
	str	r1, [r4, #20]
	str	ip, [r4, #32]
	add	r4, r4, #52
	bne	.L81
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	enemy1
	.word	rand
	.word	-2004318071
	.size	initEnemies1, .-initEnemies1
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	lr, #5
	mov	r4, #0
	ldr	r0, .L88
	ldr	ip, .L88+4
	str	lr, [r0]
	ldr	r5, .L88+8
	mov	r3, #256
	ldr	r2, .L88+12
	ldr	r1, .L88+16
	mov	r0, #3
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	ldr	r2, .L88+20
	ldr	r1, .L88+24
	mov	r0, #3
	mov	r3, #16384
	mov	lr, pc
	bx	r5
	ldr	r3, .L88+28
	mov	lr, pc
	bx	r3
	mov	r7, #7168
	mov	r3, #67108864
	mov	r6, #4352
	mov	lr, #118
	mov	ip, #20
	mov	r0, #1
	mov	r1, #8
	mov	r2, #2
	mov	r5, #125
	strh	r7, [r3, #8]	@ movhi
	strh	r6, [r3]	@ movhi
	ldr	r3, .L88+32
	stm	r3, {r5, lr}
	str	ip, [r3, #24]
	str	r0, [r3, #48]
	str	r4, [r3, #28]
	str	r4, [r3, #32]
	str	r4, [r3, #44]
	str	r4, [r3, #52]
	str	r4, [r3, #36]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	bl	initBullet
	bl	initEnemies1
	ldr	r3, .L88+36
	ldr	r2, .L88+40
	ldrh	r1, [r3, #48]
	ldr	r3, .L88+44
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L88+48
	mov	lr, pc
	bx	r3
	ldr	r2, .L88+52
	ldr	r3, .L88+56
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	maxEnemy1
	.word	enemy1onscrn
	.word	DMANow
	.word	83886592
	.word	spriteshtPal
	.word	100728832
	.word	spriteshtTiles
	.word	hideSprites
	.word	player
	.word	67109120
	.word	buttons
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	seed
	.size	initialize, .-initialize
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
	ldr	r0, .L100
	mov	r3, #0
	mov	r2, r0
	b	.L93
.L91:
	add	r3, r3, #1
	cmp	r3, #40
	add	r2, r2, #52
	bxeq	lr
.L93:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	bne	.L91
	add	r2, r3, r3, lsl #1
	add	r3, r3, r2, lsl #2
	lsl	r3, r3, #2
	push	{r4, lr}
	ldr	r2, .L100+4
	str	r1, [r0, r3]
	add	r4, r0, r3
	mov	lr, pc
	bx	r2
	mov	ip, #1
	ldr	r1, .L100+8
	smull	r2, r3, r0, r1
	ldr	r1, .L100+12
	add	r3, r0, r3
	asr	r2, r0, #31
	rsb	r2, r2, r3, asr #7
	ldr	r3, [r1]
	rsb	r2, r2, r2, lsl #4
	sub	r0, r0, r2, lsl #4
	add	r3, r3, ip
	str	r0, [r4, #4]
	str	ip, [r4, #24]
	str	r3, [r1]
	pop	{r4, lr}
	bx	lr
.L101:
	.align	2
.L100:
	.word	enemy1
	.word	rand
	.word	-2004318071
	.word	enemy1onscrn
	.size	spawnEnemy1, .-spawnEnemy1
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
	ldr	r3, .L118
	ldrh	r3, [r3, #48]
	tst	r3, #32
	push	{r4, r6, r7, lr}
	ldr	r4, .L118+4
	bne	.L103
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #8]
	cmp	r3, r2
	subge	r3, r3, r2
	strge	r3, [r4, #4]
	blt	.L103
.L104:
	ldr	r3, .L118+8
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r4, #24]
	beq	.L116
	ldr	r2, .L118+12
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L109
.L116:
	add	r1, r3, #1
.L108:
	ldr	r3, [r4, #32]
	ldr	r2, .L118+16
	smull	r6, r7, r3, r2
	asr	r2, r3, #31
	rsb	r2, r2, r7, asr #2
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #1
	str	r1, [r4, #24]
	bne	.L111
	bl	spawnEnemy1
	ldr	r3, [r4, #32]
.L111:
	add	r3, r3, #1
	str	r3, [r4, #32]
	pop	{r4, r6, r7, lr}
	bx	lr
.L103:
	ldr	r3, .L118
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L105
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #8]
	ldr	r3, [r4, #16]
	rsb	r0, r1, #240
	add	r3, r2, r3
	cmp	r3, r0
	addlt	r2, r2, r1
	strlt	r2, [r4, #4]
	blt	.L104
.L105:
	ldr	r3, .L118
	ldrh	r3, [r3, #48]
	tst	r3, #64
	beq	.L117
.L106:
	ldr	r3, .L118
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L104
	ldr	r2, [r4]
	ldr	r1, [r4, #12]
	ldr	r3, [r4, #20]
	rsb	r0, r1, #160
	add	r3, r2, r3
	cmp	r3, r0
	addle	r2, r2, r1
	strle	r2, [r4]
	b	.L104
.L117:
	ldr	r3, [r4]
	ldr	r2, [r4, #12]
	cmp	r3, r2
	subge	r3, r3, r2
	strge	r3, [r4]
	bge	.L104
	b	.L106
.L109:
	cmp	r3, #29
	ble	.L116
	bl	fireBullet
	mov	r1, #1
	b	.L108
.L119:
	.align	2
.L118:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	1717986919
	.size	updatePlayer, .-updatePlayer
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
	ldm	r0, {ip, lr}
	ldr	fp, [r0, #20]
	beq	.L121
	cmp	ip, #159
	bgt	.L122
	cmp	lr, #239
	bgt	.L122
	ldr	r3, [r0, #8]
	add	ip, ip, r3
	add	r3, ip, fp
	cmp	r3, #157
	str	ip, [r0]
	ble	.L123
	mov	r6, #0
	ldr	r3, [r0, #48]
	ldr	r4, .L132
	ldr	r0, .L132+4
	lsl	r3, r3, #3
	ldrh	r2, [r0, r3]
	ldr	r1, [r4]
	orr	r2, r2, #512
	sub	r1, r1, #1
	str	r6, [r5, #24]
	str	r1, [r4]
	strh	r2, [r0, r3]	@ movhi
	b	.L123
.L121:
	ldr	r3, [r0, #48]
	ldr	r1, .L132+4
	lsl	r3, r3, #3
	ldrh	r2, [r1, r3]
	orr	r2, r2, #512
	strh	r2, [r1, r3]	@ movhi
.L123:
	ldr	r4, .L132+8
	mov	r10, #0
	ldr	r8, .L132+12
	ldr	r9, .L132
	ldr	r6, .L132+4
	add	r7, r4, #440
	b	.L126
.L131:
	ldm	r5, {ip, lr}
	ldr	fp, [r5, #20]
.L126:
	add	r2, r4, #12
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	str	fp, [sp, #8]
	ldr	fp, [r5, #16]
	stm	sp, {ip, lr}
	str	fp, [sp, #12]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L124
	mov	r3, #2
	str	r10, [r4, #20]
	ldr	r2, [r5, #48]
	lsl	r2, r2, #3
	ldrh	r1, [r6, r2]
	str	r10, [r5, #24]
	str	r3, [r5, #32]
	orr	r1, r1, #512
	ldr	r3, [r4, #40]
	strh	r1, [r6, r2]	@ movhi
	lsl	r3, r3, #3
	ldrh	r1, [r6, r3]
	ldr	r2, [r9]
	orr	r1, r1, #512
	sub	r2, r2, #1
	strh	r1, [r6, r3]	@ movhi
	str	r2, [r9]
.L124:
	add	r4, r4, #44
	cmp	r4, r7
	bne	.L131
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L122:
	mov	r0, #0
	ldr	r3, [r5, #48]
	ldr	r1, .L132+4
	lsl	r3, r3, #3
	ldrh	r2, [r1, r3]
	orr	r2, r2, #512
	str	r0, [r5, #24]
	strh	r2, [r1, r3]	@ movhi
	b	.L123
.L133:
	.align	2
.L132:
	.word	enemy1onscrn
	.word	shadowOAM
	.word	bullet
	.word	collision
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
	bl	updatePlayer
	mov	lr, #0
	ldr	r3, .L150
	ldr	ip, .L150+4
	add	r0, r3, #440
.L137:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L135
	ldr	r2, [r3]
	cmp	r2, #5
	ldrle	r2, [r3, #40]
	lslle	r2, r2, #3
	ldrhle	r1, [ip, r2]
	ldrgt	r1, [r3, #8]
	orrle	r1, r1, #512
	addgt	r2, r1, r2
	strgt	r2, [r3]
	strle	lr, [r3, #20]
	strle	lr, [r3, #32]
	strhle	r1, [ip, r2]	@ movhi
.L135:
	add	r3, r3, #44
	cmp	r3, r0
	bne	.L137
	ldr	r4, .L150+8
	add	r5, r4, #2080
	b	.L139
.L138:
	add	r4, r4, #52
	cmp	r4, r5
	beq	.L149
.L139:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L138
	mov	r0, r4
	add	r4, r4, #52
	bl	updateEnemy1
	cmp	r4, r5
	bne	.L139
.L149:
	pop	{r4, r5, r6, lr}
	bx	lr
.L151:
	.align	2
.L150:
	.word	bullet
	.word	shadowOAM
	.word	enemy1
	.size	updateGame, .-updateGame
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
	ldr	r1, .L166
	push	{r4, r5, r6, lr}
	mov	r2, r1
	mov	r5, r1
	ldr	r3, .L166+4
	ldr	ip, [r3, #44]
	ldr	r0, [r3, #36]
	ldr	lr, [r3]
	add	r0, r0, ip, lsl #5
	ldr	ip, [r3, #4]
	ldr	r3, .L166+8
	strh	lr, [r1]	@ movhi
	strh	ip, [r1, #2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	add	r0, r3, #2080
.L154:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	beq	.L153
	ldr	r4, [r3, #40]
	ldr	r1, [r3, #32]
	ldr	lr, [r3]
	ldr	ip, [r3, #4]
	add	r1, r1, r4, lsl #5
	strh	r1, [r2, #12]	@ movhi
	strh	lr, [r2, #8]	@ movhi
	strh	ip, [r2, #10]	@ movhi
.L153:
	add	r3, r3, #52
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L154
	ldr	r3, .L166+12
	add	r1, r3, #440
.L156:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L155
	add	r2, r3, #28
	ldm	r2, {r2, lr}
	ldr	ip, [r3]
	ldr	r0, [r3, #4]
	add	r2, r2, lr, lsl #5
	strh	r2, [r5, #172]	@ movhi
	strh	ip, [r5, #168]	@ movhi
	strh	r0, [r5, #170]	@ movhi
.L155:
	add	r3, r3, #44
	cmp	r3, r1
	add	r5, r5, #8
	bne	.L156
	ldr	r3, .L166+16
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L167:
	.align	2
.L166:
	.word	shadowOAM
	.word	player
	.word	enemy1
	.word	bullet
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
	push	{r4, lr}
	bl	updateGame
	ldr	r4, .L180
	bl	drawGame
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L180+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L180+8
	ldrh	r1, [r2]
	ldrh	r2, [r2, #4]
	ldr	r4, .L180+12
	strh	r1, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r4
	ldr	r3, .L180+16
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L169
	ldr	r2, .L180+20
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L178
.L169:
	tst	r3, #2
	beq	.L168
	ldr	r3, .L180+20
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L179
.L168:
	pop	{r4, lr}
	bx	lr
.L179:
	ldr	r3, .L180+24
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L180+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L178:
	ldr	r3, .L180+24
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L180+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L181:
	.align	2
.L180:
	.word	DMANow
	.word	shadowOAM
	.word	.LANCHOR0
	.word	flipPage
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
	ldr	r3, .L195
	mov	lr, pc
	bx	r3
	ldr	r3, .L195+4
	mov	lr, pc
	bx	r3
	ldr	r6, .L195+8
	ldr	r7, .L195+12
	ldr	r5, .L195+16
	ldr	fp, .L195+20
	ldr	r10, .L195+24
	ldr	r9, .L195+28
	ldr	r8, .L195+32
	ldr	r4, .L195+36
.L183:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L184:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L184
.L186:
	.word	.L185
	.word	.L187
	.word	.L188
	.word	.L189
	.word	.L190
	.word	.L191
.L191:
	ldr	r3, .L195+40
	mov	lr, pc
	bx	r3
	b	.L183
.L190:
	ldr	r3, .L195+44
	mov	lr, pc
	bx	r3
	b	.L183
.L189:
	mov	lr, pc
	bx	r8
	b	.L183
.L188:
	mov	lr, pc
	bx	r9
	b	.L183
.L187:
	mov	lr, pc
	bx	r10
	b	.L183
.L185:
	mov	lr, pc
	bx	fp
	b	.L183
.L196:
	.align	2
.L195:
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
	ldr	r3, .L209
	mov	lr, pc
	bx	r3
	ldr	r4, .L209+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L209+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1728
	mov	r2, #100663296
	ldr	r1, .L209+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L209+16
	ldr	r1, .L209+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r4, #67108864
	mov	r2, #7168
	mov	r3, #256
	strh	r2, [r4, #8]	@ movhi
	strh	r3, [r4]	@ movhi
	ldr	r3, .L209+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L209+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L198
	ldr	r2, .L209+32
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L207
.L198:
	tst	r3, #4
	beq	.L197
	ldr	r3, .L209+32
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L208
.L197:
	pop	{r4, lr}
	bx	lr
.L207:
	mov	r3, #4096
	strh	r3, [r4]	@ movhi
	pop	{r4, lr}
	b	goToGame
.L208:
	ldr	r3, .L209+36
	mov	lr, pc
	bx	r3
.L210:
	.align	2
.L209:
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
	ldr	r3, .L218
	mov	lr, pc
	bx	r3
	ldr	r4, .L218+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L218+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #416
	mov	r2, #100663296
	ldr	r1, .L218+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L218+16
	ldr	r1, .L218+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7168
	mov	r2, #256
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r3, .L218+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L218+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L211
	ldr	r3, .L218+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L217
.L211:
	pop	{r4, lr}
	bx	lr
.L217:
	ldr	r3, .L218+36
	mov	lr, pc
	bx	r3
.L219:
	.align	2
.L218:
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
	ldr	r3, .L227
	mov	lr, pc
	bx	r3
	ldr	r4, .L227+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L227+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #640
	mov	r2, #100663296
	ldr	r1, .L227+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L227+16
	ldr	r1, .L227+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7168
	mov	r2, #256
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r3, .L227+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L227+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L220
	ldr	r3, .L227+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L226
.L220:
	pop	{r4, lr}
	bx	lr
.L226:
	ldr	r3, .L227+36
	mov	lr, pc
	bx	r3
.L228:
	.align	2
.L227:
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
	.comm	bullet,440,4
	.comm	enemy1onscrn,4,4
	.comm	maxEnemy1,4,4
	.comm	enemy1,2080,4
	.comm	player,56,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
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
