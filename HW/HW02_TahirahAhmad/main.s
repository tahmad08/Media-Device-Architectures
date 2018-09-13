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
	mov	r1, #67108864
	mov	r3, #0
	ldr	r2, .L4
	ldr	r0, .L4+4
	push	{r4, r5, r6, lr}
	ldrh	lr, [r2, #48]
	ldr	r2, .L4+8
	strh	r0, [r1]	@ movhi
	ldr	ip, .L4+12
	ldr	r1, .L4+16
	mov	r0, r3
	strh	lr, [r2]	@ movhi
	ldr	r2, .L4+20
	strh	r3, [ip]	@ movhi
	strh	r3, [r1]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r1, #120
	mov	r3, #1
	mov	lr, #233
	mov	r2, #20
	mov	ip, #6
	mov	r0, #5
	ldr	r4, .L4+24
	ldr	r5, .L4+28
	ldr	r6, [r4]
	str	r6, [r5]
	ldr	r5, .L4+32
	str	r1, [r4]
	str	r1, [r5]
	ldr	r4, .L4+36
	ldr	r5, .L4+40
	str	r1, [r5]
	ldr	r5, [r4]
	str	r1, [r4]
	ldr	r1, .L4+44
	ldr	r4, .L4+48
	str	r5, [r4]
	ldr	r5, [r1]
	str	r3, [r1]
	ldr	r1, .L4+52
	str	r3, [r1]
	ldr	r1, .L4+56
	str	r3, [r1]
	ldr	r1, .L4+60
	str	r3, [r1]
	ldr	r1, .L4+64
	str	r3, [r1]
	ldr	r1, .L4+68
	str	r3, [r1]
	ldr	r1, .L4+72
	str	r3, [r1]
	ldr	r3, .L4+76
	ldr	r1, .L4+80
	str	lr, [r3]
	ldr	r3, .L4+84
	str	lr, [r1]
	str	r2, [r3]
	ldr	lr, .L4+88
	ldr	r1, .L4+92
	ldr	r3, .L4+96
	str	r2, [lr]
	str	r2, [r1]
	str	r2, [r3]
	ldr	r4, .L4+100
	ldr	lr, .L4+104
	ldr	r1, .L4+108
	ldr	r2, .L4+112
	ldr	r3, .L4+116
	str	r5, [r4]
	str	ip, [lr]
	str	ip, [r1]
	str	r0, [r2]
	str	r0, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	67109120
	.word	1027
	.word	buttons
	.word	oldButtons
	.word	bgColor
	.word	fillScreen
	.word	gRow
	.word	rRow
	.word	bRow
	.word	gOldRow
	.word	bOldRow
	.word	gRDel
	.word	rOldRow
	.word	rCDel
	.word	gCDel
	.word	bCol
	.word	bOldCol
	.word	bRDel
	.word	bCDel
	.word	rCol
	.word	rOldCol
	.word	rHeight
	.word	gCol
	.word	gOldCol
	.word	bHeight
	.word	rRDel
	.word	rWidth
	.word	bWidth
	.word	gHeight
	.word	gWidth
	.size	initialize, .-initialize
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L29
	ldrh	r3, [r3, #48]
	ldr	ip, .L29+4
	tst	r3, #64
	ldr	r3, .L29
	ldr	r2, [ip]
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldrh	r3, [r3, #48]
	ldr	r6, .L29+8
	subeq	r2, r2, #2
	streq	r2, [ip]
	ldr	r0, [r6]
	tst	r3, #128
	addeq	r2, r2, #2
	ldr	r10, .L29+12
	streq	r2, [ip]
	cmp	r0, #0
	sub	sp, sp, #28
	ldr	r8, .L29+16
	ldr	r9, [r10]
	ble	.L9
	add	r3, r0, r9
	cmp	r3, #159
	bgt	.L9
.L10:
	ldr	r5, .L29+20
	ldr	r1, [r5]
	ldr	fp, .L29+24
	cmp	r1, #0
	ldr	r7, .L29+28
	ldr	r3, [fp]
	ble	.L11
	add	lr, r1, r3
	cmp	lr, #234
	bgt	.L11
.L12:
	ldr	lr, .L29+32
	ldr	lr, [lr]
	cmp	r2, #0
	str	lr, [sp, #16]
	ble	.L13
	add	lr, r2, lr
	cmp	lr, #159
	bgt	.L13
.L14:
	ldr	r4, .L29+36
	ldr	ip, [r4]
	cmp	ip, #0
	ble	.L28
	ldr	lr, .L29+40
	str	lr, [sp, #20]
	ldr	lr, [lr]
	add	ip, ip, lr
	cmp	ip, #159
	bgt	.L15
.L16:
	ldr	ip, .L29+44
	ldr	lr, .L29+48
	ldr	ip, [ip]
	ldr	lr, [lr]
	str	ip, [sp, #4]
	ldr	ip, [sp, #16]
	str	r2, [sp]
	str	ip, [sp, #8]
	mov	r2, r9
	str	lr, [sp, #12]
	ldr	r9, .L29+52
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L17
	ldr	r1, .L29+56
	ldr	r3, [r7]
	ldr	r2, [r1]
	rsb	r3, r3, #0
	add	r2, r2, #1
	str	r2, [r1]
	str	r3, [r7]
.L17:
	ldr	lr, [fp]
	ldr	ip, [r10]
	ldr	r2, [sp, #20]
	ldr	r3, .L29+60
	ldr	r1, .L29+64
	ldr	r2, [r2]
	ldr	r3, [r3]
	ldr	r1, [r1]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r5]
	ldr	ip, [r6]
	ldr	r0, [r4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	ldrne	r3, [r7]
	rsbne	r0, r3, #0
	ldr	r3, .L29+68
	ldrne	r2, [r8]
	ldr	r1, [r4]
	ldr	r3, [r3]
	rsbne	ip, r2, #0
	add	r1, r1, r3
	ldr	r2, [r6]
	ldr	r3, [r5]
	ldreq	ip, [r8]
	ldreq	r0, [r7]
	add	r2, r2, ip, lsl #1
	add	r3, r3, r0, lsl #1
	strne	ip, [r8]
	strne	r0, [r7]
	str	r1, [r4]
	str	r2, [r6]
	str	r3, [r5]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L28:
	ldr	ip, .L29+40
	str	ip, [sp, #20]
.L15:
	ldr	ip, .L29+72
	ldr	ip, [ip]
	str	ip, [r4]
	b	.L16
.L13:
	ldr	r2, .L29+76
	ldr	r2, [r2]
	str	r2, [ip]
	b	.L14
.L11:
	ldr	lr, [r7]
	rsb	lr, lr, #0
	str	lr, [r7]
	b	.L12
.L9:
	ldr	r3, [r8]
	rsb	r3, r3, #0
	str	r3, [r8]
	b	.L10
.L30:
	.align	2
.L29:
	.word	67109120
	.word	bRow
	.word	gRow
	.word	gHeight
	.word	gRDel
	.word	gCol
	.word	gWidth
	.word	gCDel
	.word	bHeight
	.word	rRow
	.word	rHeight
	.word	bCol
	.word	bWidth
	.word	collision
	.word	score
	.word	rWidth
	.word	rCol
	.word	rRDel
	.word	rOldRow
	.word	bOldRow
	.size	update, .-update
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L33
	ldr	r5, .L33+4
	ldrh	ip, [r6]
	ldr	r8, .L33+8
	ldr	r7, .L33+12
	ldr	r1, .L33+16
	sub	sp, sp, #12
	ldr	r4, .L33+20
	ldr	r3, [r8]
	ldr	r2, [r7]
	ldr	r1, [r1]
	ldr	r0, [r5]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	ldr	fp, .L33+24
	ldr	lr, .L33+28
	ldrh	ip, [r6]
	ldr	r10, .L33+32
	ldr	r0, .L33+36
	ldr	r3, [fp]
	ldr	r2, [r10]
	ldr	r1, [r0]
	ldr	r0, [lr]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	ldrh	ip, [r6]
	ldr	r3, .L33+40
	ldr	r6, .L33+44
	ldr	r2, .L33+48
	ldr	r1, [r6]
	ldr	r0, [r5]
	ldr	r3, [r3]
	ldr	r2, [r2]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	mov	ip, #992
	ldr	r6, .L33+52
	ldr	r9, .L33+56
	ldr	r3, [r8]
	ldr	r2, [r7]
	ldr	r0, [r6]
	ldr	r1, [r9]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	mov	ip, #31744
	ldr	r7, .L33+60
	ldr	r8, .L33+64
	ldr	r3, [fp]
	ldr	r2, [r10]
	ldr	r1, [r7]
	ldr	r0, [r8]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	mov	ip, #31
	ldr	r10, .L33+68
	ldr	r3, .L33+40
	ldr	r2, .L33+48
	ldr	r0, [r6]
	ldr	r1, [r10]
	ldr	r3, [r3]
	ldr	r2, [r2]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	ldr	lr, [r9]
	ldr	r4, .L33+16
	ldr	ip, [r8]
	str	lr, [r4]
	ldr	lr, .L33+28
	ldr	r3, [r6]
	ldr	r0, [r7]
	ldr	r1, [r10]
	ldr	r2, .L33+72
	str	ip, [lr]
	ldr	r6, .L33+44
	ldr	ip, .L33+36
	str	r3, [r5]
	str	r0, [ip]
	str	r1, [r6]
	str	r3, [r2]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	bgColor
	.word	gOldRow
	.word	gWidth
	.word	gHeight
	.word	gOldCol
	.word	drawRect
	.word	bWidth
	.word	bOldRow
	.word	bHeight
	.word	bOldCol
	.word	rWidth
	.word	rOldCol
	.word	rHeight
	.word	gRow
	.word	gCol
	.word	bCol
	.word	bRow
	.word	rCol
	.word	rOldRow
	.size	draw, .-draw
	.align	2
	.global	endGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	endGame, %function
endGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L36
	ldr	r0, [r3]
	cmp	r0, #0
	movgt	r0, #0
	movle	r0, #1
	bx	lr
.L37:
	.align	2
.L36:
	.word	gCol
	.size	endGame, .-endGame
	.align	2
	.global	endScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	endScreen, %function
endScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, #31
	ldr	r5, .L40
	ldr	r3, .L40+4
	ldrh	ip, [r5]
	ldr	r2, .L40+8
	ldr	r1, .L40+12
	ldr	r0, .L40+16
	sub	sp, sp, #8
	ldr	r4, .L40+20
	ldr	r3, [r3]
	ldr	r2, [r2]
	ldr	r1, [r1]
	ldr	r0, [r0]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	ldrh	ip, [r5]
	ldr	r3, .L40+24
	ldr	r2, .L40+28
	ldr	r1, .L40+32
	ldr	r0, .L40+36
	ldr	r3, [r3]
	ldr	r2, [r2]
	ldr	r1, [r1]
	ldr	r0, [r0]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	ldrh	ip, [r5]
	ldr	r3, .L40+40
	ldr	r2, .L40+44
	ldr	r1, .L40+48
	ldr	r0, .L40+52
	ldr	r3, [r3]
	ldr	r2, [r2]
	ldr	r1, [r1]
	ldr	r0, [r0]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	str	r6, [sp]
	mov	r3, #30
	mov	r2, #85
	mov	r1, #80
	mov	r0, #35
	mov	lr, pc
	bx	r4
	str	r6, [sp]
	mov	r3, #40
	mov	r2, #20
	mov	r1, #110
	mov	r0, #100
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	bgColor
	.word	gWidth
	.word	gHeight
	.word	gOldCol
	.word	gOldRow
	.word	drawRect
	.word	bWidth
	.word	bHeight
	.word	bOldCol
	.word	bOldRow
	.word	rWidth
	.word	rHeight
	.word	rOldCol
	.word	rOldRow
	.size	endScreen, .-endScreen
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L49
	mov	lr, pc
	bx	r3
	ldr	r9, .L49+4
	ldr	r4, .L49+8
	ldr	r8, .L49+12
	ldr	r7, .L49+16
	ldr	r6, .L49+20
	ldr	r5, .L49+24
	ldr	r10, .L49+28
	b	.L44
.L48:
	mov	lr, pc
	bx	r10
.L44:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	ldr	r3, [r6]
	cmp	r3, #0
	bgt	.L48
	ldr	r3, .L49+32
	mov	lr, pc
	bx	r3
	mov	r0, #0
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	gCol
	.word	67109120
	.word	draw
	.word	endScreen
	.size	main, .-main
	.comm	bWidth,4,4
	.comm	bHeight,4,4
	.comm	bCDel,4,4
	.comm	bRDel,4,4
	.comm	bOldCol,4,4
	.comm	bOldRow,4,4
	.comm	bCol,4,4
	.comm	bRow,4,4
	.comm	gWidth,4,4
	.comm	gHeight,4,4
	.comm	gCDel,4,4
	.comm	gRDel,4,4
	.comm	gOldCol,4,4
	.comm	gOldRow,4,4
	.comm	gCol,4,4
	.comm	gRow,4,4
	.comm	rWidth,4,4
	.comm	rHeight,4,4
	.comm	rCDel,4,4
	.comm	rRDel,4,4
	.comm	rOldCol,4,4
	.comm	rOldRow,4,4
	.comm	rCol,4,4
	.comm	rRow,4,4
	.comm	score,4,4
	.comm	bgColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 47) 7.1.0"
