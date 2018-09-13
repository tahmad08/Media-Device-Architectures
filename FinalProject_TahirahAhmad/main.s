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
	ldr	lr, .L4+8
	ldr	ip, .L4+12
	mov	r3, #1
	ldr	r2, .L4+16
	ldr	r4, .L4+20
	ldr	r1, .L4+24
	ldr	r0, .L4+28
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	waitForVBlank
	.word	flipPage
	.word	start
	.word	state
	.word	11025
	.word	playSoundA
	.word	1531584
	.word	Lorn
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
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L8
	ldr	r2, .L8+4
	ldr	r1, .L8+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L8+12
	ldr	r1, .L8+16
	mov	r0, #3
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+20
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	ip, #0
	mov	r0, #7296
	mov	r1, #4352
	ldr	r2, .L8+24
	str	ip, [r2]
	ldr	r2, .L8+28
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r2, .L8+32
	ldr	r3, .L8+36
	ldrh	r2, [r2, #48]
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	b	goToStart
.L9:
	.align	2
.L8:
	.word	DMANow
	.word	83886592
	.word	spriteshtPal
	.word	100728832
	.word	spriteshtTiles
	.word	hideSprites
	.word	pauseToGame
	.word	initGame
	.word	67109120
	.word	buttons
	.size	initialize, .-initialize
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
	push	{r7, lr}
	ldr	r3, .L13
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+12
	mov	lr, pc
	bx	r3
	ldr	r7, .L13+16
	ldr	r4, .L13+20
	ldr	r6, .L13+24
	ldr	r5, .L13+28
.L11:
	ldrh	r3, [r4]
	strh	r3, [r7]	@ movhi
	ldrh	r2, [r5, #48]
	ldr	r3, [r6]
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	b	.L11
.L14:
	.align	2
.L13:
	.word	hideSprites
	.word	setupSounds
	.word	setupInterrupts
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	state
	.word	67109120
	.size	main, .-main
	.text
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
	ldr	r3, .L22
	mov	lr, pc
	bx	r3
	ldr	r4, .L22+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L22+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #416
	mov	r2, #100663296
	ldr	r1, .L22+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L22+16
	ldr	r1, .L22+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7168
	mov	r2, #256
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r3, .L22+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L15
	ldr	r3, .L22+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L21
.L15:
	pop	{r4, lr}
	bx	lr
.L21:
	ldr	r3, .L22+36
	mov	lr, pc
	bx	r3
.L23:
	.align	2
.L22:
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
	ldr	r3, .L32
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L32+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L32+8
	mov	lr, pc
	bx	r3
.L33:
	.align	2
.L32:
	.word	oldButtons
	.word	buttons
	.word	main
	.size	lose, .-lose
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
	push	{r4, lr}
	ldr	r3, .L41
	mov	lr, pc
	bx	r3
	ldr	r4, .L41+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L41+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #8512
	mov	r2, #100663296
	ldr	r1, .L41+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L41+16
	ldr	r1, .L41+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7296
	mov	r2, #256
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r3, .L41+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L41+28
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L34
	ldr	r3, .L41+32
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L40
.L34:
	pop	{r4, lr}
	bx	lr
.L40:
	pop	{r4, lr}
	b	goToStart
.L42:
	.align	2
.L41:
	.word	hideSprites
	.word	DMANow
	.word	instrscrnPal
	.word	instrscrnTiles
	.word	100720640
	.word	instrscrnMap
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	instr, .-instr
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
	ldr	r3, .L45
	mov	lr, pc
	bx	r3
	ldr	r3, .L45+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L45+8
	ldr	r2, .L45+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L46:
	.align	2
.L45:
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	instr
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
	push	{r4, r5, r6, lr}
	mov	r2, #5888
	mov	r5, #67108864
	ldr	r4, .L50
	mov	r3, #256
	strh	r2, [r5]	@ movhi
	ldr	r1, .L50+4
	mov	r2, #83886080
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L50+8
	mov	r3, #1408
	strh	r2, [r5, #12]	@ movhi
	ldr	r1, .L50+12
	mov	r2, #100663296
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L50+16
	ldr	r1, .L50+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L50+24
	ldr	r3, .L50+28
	strh	r2, [r5, #10]	@ movhi
	ldr	r1, .L50+32
	ldr	r2, .L50+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L50+40
	ldr	r1, .L50+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L50+48
	mov	r3, #128
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L50+52
	ldr	r2, .L50+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L50+60
	ldr	r1, .L50+64
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L50+68
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L48
	ldr	r3, .L50+72
	mov	lr, pc
	bx	r3
	ldr	r4, .L50+76
	mov	r3, #1
	ldr	r2, .L50+80
	ldr	r1, .L50+84
	ldr	r0, .L50+88
	mov	lr, pc
	bx	r4
.L48:
	ldr	r3, .L50+92
	ldr	r2, .L50+96
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L51:
	.align	2
.L50:
	.word	DMANow
	.word	topScrnPal
	.word	-26240
	.word	gamescrnTiles
	.word	100714496
	.word	gamescrnMap
	.word	7300
	.word	12320
	.word	topScrnTiles
	.word	100679680
	.word	100720640
	.word	topScrnMap
	.word	8072
	.word	bgoTiles
	.word	100696064
	.word	100726784
	.word	bgoMap
	.word	pauseToGame
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	979776
	.word	gameSong
	.word	state
	.word	game
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
	ldr	r4, .L64
	mov	r2, #83886080
	ldr	r1, .L64+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L64+8
	mov	r2, #100663296
	ldr	r1, .L64+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L64+16
	ldr	r1, .L64+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r3, #256
	mov	r2, #7296
	ldr	r4, .L64+24
	strh	r3, [r5]	@ movhi
	ldr	r3, [r4]
	ldr	r7, .L64+28
	add	r3, r3, #1
	strh	r2, [r5, #8]	@ movhi
	ldr	r6, .L64+32
	str	r3, [r4]
	mov	lr, pc
	bx	r6
	ldrh	r3, [r7]
	tst	r3, #8
	beq	.L53
	ldr	r2, .L64+36
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L62
.L53:
	tst	r3, #4
	beq	.L52
	ldr	r3, .L64+36
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L63
.L52:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L63:
	mov	lr, pc
	bx	r6
	ldr	r3, .L64+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L64+44
	ldr	r2, .L64+48
	pop	{r4, r5, r6, r7, r8, lr}
	str	r2, [r3]
	bx	lr
.L62:
	mov	r3, #4096
	ldr	r0, [r4]
	strh	r3, [r5]	@ movhi
	ldr	r3, .L64+52
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r7]
	b	.L53
.L65:
	.align	2
.L64:
	.word	DMANow
	.word	startscrnPal
	.word	7840
	.word	startscrnTiles
	.word	100720640
	.word	startscrnMap
	.word	seed
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	flipPage
	.word	state
	.word	instr
	.word	srand
	.size	start, .-start
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
	ldr	r3, .L78
	mov	lr, pc
	bx	r3
	ldr	r4, .L78+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L78+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1728
	mov	r2, #100663296
	ldr	r1, .L78+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L78+16
	ldr	r1, .L78+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r4, #67108864
	mov	r2, #7168
	mov	r3, #256
	strh	r2, [r4, #8]	@ movhi
	strh	r3, [r4]	@ movhi
	ldr	r3, .L78+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L78+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L67
	ldr	r2, .L78+32
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L76
.L67:
	tst	r3, #4
	beq	.L66
	ldr	r3, .L78+32
	ldrh	r3, [r3]
	ands	r3, r3, #4
	beq	.L77
.L66:
	pop	{r4, lr}
	bx	lr
.L76:
	mov	r1, #4096
	mov	r2, #1
	ldr	r3, .L78+36
	strh	r1, [r4]	@ movhi
	pop	{r4, lr}
	str	r2, [r3]
	b	goToGame
.L77:
	ldr	r1, .L78+36
	ldr	r2, .L78+40
	str	r3, [r1]
	mov	lr, pc
	bx	r2
.L79:
	.align	2
.L78:
	.word	hideSprites
	.word	DMANow
	.word	pausescrnPal
	.word	pausescrnTiles
	.word	100720640
	.word	pausescrnMap
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	pauseToGame
	.word	main
	.size	pause, .-pause
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
	ldr	r3, .L82
	mov	lr, pc
	bx	r3
	ldr	r3, .L82+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L82+8
	ldr	r2, .L82+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L83:
	.align	2
.L82:
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	pause
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
	ldr	r3, .L86
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+8
	ldr	r2, .L86+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L87:
	.align	2
.L86:
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	win
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	fp, .L90
	mov	lr, pc
	bx	fp
	ldr	r3, .L90+4
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L90+8
	mov	r0, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, .L90+12
	mov	lr, pc
	bx	r3
	ldr	r6, .L90+16
	ldr	r10, .L90+20
	ldr	r2, .L90+24
	ldr	r5, .L90+28
	ldr	r9, .L90+32
	ldr	ip, .L90+36
	mov	r1, r10
	ldr	r2, [r2]
	mov	r0, r6
	mov	lr, pc
	bx	ip
	ldr	r4, .L90+40
	mov	r3, r5
	mov	r2, r9
	ldr	r8, .L90+44
	mov	r1, #90
	mov	r0, #40
	mov	lr, pc
	bx	r4
	ldr	r7, .L90+48
	mov	r3, r5
	mov	r2, r6
	mov	r1, #90
	mov	r0, #50
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, r8
	mov	r1, #85
	mov	r0, #60
	mov	lr, pc
	bx	r4
	mov	r1, #85
	mov	r3, r5
	mov	r2, r7
	mov	r0, #70
	mov	lr, pc
	bx	r4
	ldr	r2, .L90+52
	ldr	r3, .L90+56
	str	r2, [r3]
	mov	lr, pc
	bx	fp
	ldr	r3, .L90+12
	mov	r0, #0
	mov	lr, pc
	bx	r3
	ldr	r2, .L90+24
	ldr	ip, .L90+36
	mov	r1, r10
	ldr	r2, [r2]
	mov	r0, r6
	mov	lr, pc
	bx	ip
	mov	r3, r5
	mov	r2, r9
	mov	r1, #90
	mov	r0, #40
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, r6
	mov	r1, #90
	mov	r0, #50
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, r8
	mov	r1, #85
	mov	r0, #60
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, r7
	mov	r1, #85
	mov	r0, #70
	mov	lr, pc
	bx	r4
	ldr	r3, .L90+60
	mov	lr, pc
	bx	r3
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	flipPage
	.word	hideSprites
	.word	1027
	.word	fillScreen3
	.word	buffer
	.word	.LC0
	.word	score
	.word	32767
	.word	.LC1
	.word	sprintf
	.word	drawString3
	.word	.LC2
	.word	.LC3
	.word	lose
	.word	state
	.word	waitForVBlank
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
	ldr	r3, .L101
	mov	lr, pc
	bx	r3
	ldr	r3, .L101+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L101+8
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L101+12
	mov	r0, #3
	ldr	r4, .L101+16
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	ldr	r3, .L101+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L93
	ldr	r3, .L101+24
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L99
.L93:
	ldr	r3, .L101+28
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L100
.L94:
	mov	r0, #67108864
	ldr	ip, .L101+32
	ldr	r2, [ip]
	sub	r2, r2, #1
	add	r3, r2, r2, lsr #31
	asr	r3, r3, #1
	lsl	r3, r3, #16
	lsl	r1, r2, #17
	lsr	r3, r3, #16
	lsr	r1, r1, #16
	str	r2, [ip]
	pop	{r4, r5, r6, lr}
	strh	r1, [r0, #26]	@ movhi
	strh	r3, [r0, #22]	@ movhi
	bx	lr
.L100:
	bl	goToLose
	b	.L94
.L99:
	ldr	r3, .L101+36
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	ldr	r3, .L101+40
	ldr	r2, .L101+44
	str	r2, [r3]
	b	.L94
.L102:
	.align	2
.L101:
	.word	updateGame
	.word	drawGame
	.word	DMANow
	.word	shadowOAM
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	livesLeft
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	state
	.word	pause
	.size	game, .-game
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	pauseToGame,4,4
	.comm	arr,140,4
	.global	vOff
	.global	hOff
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
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Score: %d\000"
	.space	2
.LC1:
	.ascii	"GAME OVER!\000"
	.space	1
.LC2:
	.ascii	"Press START to\000"
	.space	1
.LC3:
	.ascii	"return to menu\000"
	.ident	"GCC: (devkitARM release 47) 7.1.0"
