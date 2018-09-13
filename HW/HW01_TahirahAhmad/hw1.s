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
	.file	"hw1.c"
	.text
	.align	2
	.global	drawEyeLiner
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEyeLiner, %function
drawEyeLiner:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L6
	rsb	r0, r0, r0, lsl #4
	ldr	r3, [r3]
	add	r1, r1, r0, lsl #4
	lsl	r1, r1, #1
	add	r0, r3, #10
	add	r3, r3, r1
	add	r1, r1, r0
.L2:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L2
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LANCHOR0
	.size	drawEyeLiner, .-drawEyeLiner
	.align	2
	.global	fullEye
	.syntax unified
	.arm
	.fpu softvfp
	.type	fullEye, %function
fullEye:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, r1
	ldr	ip, .L16
	add	r1, r2, r0
	rsb	r1, r1, r1, lsl #4
	add	r1, fp, r1, lsl #4
	ldr	r10, [ip]
	lsl	r1, r1, #1
	cmp	r2, #0
	sub	sp, sp, #20
	strh	r3, [r10, r1]	@ movhi
	ble	.L8
	mov	r9, #0
	rsb	r1, r0, r0, lsl #4
	add	r1, fp, r1, lsl #4
	add	r1, r1, r2
	lsl	r1, r1, #1
	strh	r3, [r10, r1]	@ movhi
	rsb	r1, r2, #1
	str	r1, [sp, #4]
.L12:
	ldr	r1, [sp, #4]
	add	r9, r9, #1
	cmp	r1, #0
	subgt	r2, r2, #1
	add	r1, r1, r9, lsl #1
	subgt	r1, r1, r2, lsl #1
	add	r1, r1, #1
	str	r1, [sp, #4]
	sub	r4, r0, r2
	add	r1, r2, r0
	rsb	r1, r1, r1, lsl #4
	rsb	r4, r4, r4, lsl #4
	lsl	r4, r4, #4
	add	r8, fp, r9
	lsl	r1, r1, #4
	add	ip, r0, r9
	sub	lr, r0, r9
	add	r5, r1, r8
	rsb	ip, ip, ip, lsl #4
	add	r8, r4, r8
	rsb	lr, lr, lr, lsl #4
	lsl	lr, lr, #4
	add	r7, r2, fp
	lsl	ip, ip, #4
	sub	r6, fp, r2
	str	r5, [sp, #8]
	str	r8, [sp, #12]
	sub	r5, fp, r9
	add	r8, ip, r7
	add	r1, r1, r5
	add	r7, r7, lr
	add	r5, r4, r5
	add	ip, ip, r6
	ldr	r4, [sp, #12]
	add	r6, r6, lr
	ldr	lr, [sp, #8]
	cmp	r2, r9
	lsl	lr, lr, #1
	lsl	r4, r4, #1
	lsl	r1, r1, #1
	lsl	r5, r5, #1
	lsl	r8, r8, #1
	lsl	r7, r7, #1
	lsl	ip, ip, #1
	lsl	r6, r6, #1
	blt	.L8
	strh	r3, [r10, lr]	@ movhi
	strh	r3, [r10, r4]	@ movhi
	strh	r3, [r10, r1]	@ movhi
	strh	r3, [r10, r5]	@ movhi
	beq	.L8
	strh	r3, [r10, r8]	@ movhi
	strh	r3, [r10, r7]	@ movhi
	strh	r3, [r10, ip]	@ movhi
	strh	r3, [r10, r6]	@ movhi
	bgt	.L12
.L8:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	.LANCHOR0
	.size	fullEye, .-fullEye
	.align	2
	.global	drawFullEyes
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullEyes, %function
drawFullEyes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, r1
	mov	r2, #25
	mov	r5, r1
	mov	r1, #77
	bl	fullEye
	mov	r2, #25
	mov	r1, #167
	bl	fullEye
	mov	r4, #10
.L19:
	mov	r2, r4
	mov	r3, r5
	mov	r1, #77
	add	r4, r4, #1
	mov	r0, #70
	bl	fullEye
	cmp	r4, #15
	bne	.L19
	mov	r4, #10
.L20:
	mov	r2, r4
	mov	r3, r5
	mov	r1, #167
	add	r4, r4, #1
	mov	r0, #70
	bl	fullEye
	cmp	r4, #15
	bne	.L20
	mov	r4, #1
.L21:
	mov	r2, r4
	mov	r3, r5
	mov	r1, #77
	add	r4, r4, #1
	mov	r0, #70
	bl	fullEye
	cmp	r4, #5
	bne	.L21
	mov	r4, #1
.L22:
	mov	r2, r4
	mov	r3, r5
	mov	r1, #167
	add	r4, r4, #1
	mov	r0, #70
	bl	fullEye
	cmp	r4, #5
	bne	.L22
	pop	{r4, r5, r6, lr}
	bx	lr
	.size	drawFullEyes, .-drawFullEyes
	.align	2
	.global	fullCycle
	.syntax unified
	.arm
	.fpu softvfp
	.type	fullCycle, %function
fullCycle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r0
	mov	r5, r1
	mov	r0, #70
	sub	sp, sp, #12
	bl	drawFullEyes
	ldr	r3, .L33
	rsb	r1, r4, r4, lsl #5
	ldr	r3, [r3]
	add	r4, r4, r1, lsl #2
	add	r4, r4, r4, lsl #2
	add	r3, r3, #32768
	lsl	r1, r4, #5
	add	r0, r3, #928
	add	r2, r3, #932
	add	ip, r3, #924
	cmp	r1, #0
	add	r3, r3, #1216
	strh	r5, [ip, #2]	@ movhi
	strh	r5, [r0]	@ movhi
	strh	r5, [r0, #2]	@ movhi
	strh	r5, [r2]	@ movhi
	strh	r5, [r2, #2]	@ movhi
	strh	r5, [r3]	@ movhi
	strh	r5, [r3, #2]	@ movhi
	strh	r5, [r3, #4]	@ movhi
	strh	r5, [r3, #6]	@ movhi
	strh	r5, [r3, #8]	@ movhi
	ble	.L28
	mov	r2, #0
.L30:
	ldr	r3, [sp, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, r1
	str	r3, [sp, #4]
	bne	.L30
.L28:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.size	fullCycle, .-fullCycle
	.align	2
	.global	halfEye
	.syntax unified
	.arm
	.fpu softvfp
	.type	halfEye, %function
halfEye:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	add	ip, r2, r0
	ldr	lr, .L43
	rsb	ip, ip, ip, lsl #4
	add	ip, r1, ip, lsl #4
	ldr	r7, [lr]
	lsl	ip, ip, #1
	cmp	r2, #0
	strh	r3, [r7, ip]	@ movhi
	ble	.L35
	mov	r5, #0
	rsb	ip, r0, r0, lsl #4
	add	ip, r1, ip, lsl #4
	add	ip, ip, r2
	lsl	ip, ip, #1
	strh	r3, [r7, ip]	@ movhi
	rsb	r6, r2, #1
.L39:
	cmp	r6, #0
	add	r5, r5, #1
	subgt	r2, r2, #1
	add	lr, r2, r0
	add	ip, r0, r5
	rsb	lr, lr, lr, lsl #4
	rsb	ip, ip, ip, lsl #4
	lsl	lr, lr, #4
	lsl	ip, ip, #4
	add	r6, r6, r5, lsl #1
	add	r9, r1, lr
	add	r10, ip, r1
	sub	r8, r1, r5
	sub	r4, r1, r2
	subgt	r6, r6, r2, lsl #1
	add	r9, r9, r5
	add	lr, r8, lr
	add	r10, r10, r2
	add	ip, r4, ip
	cmp	r2, r5
	add	r6, r6, #1
	lsl	r9, r9, #1
	lsl	lr, lr, #1
	lsl	r10, r10, #1
	lsl	ip, ip, #1
	blt	.L35
	strh	r3, [r7, r9]	@ movhi
	strh	r3, [r7, lr]	@ movhi
	beq	.L35
	strh	r3, [r7, r10]	@ movhi
	strh	r3, [r7, ip]	@ movhi
	bgt	.L39
.L35:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	.LANCHOR0
	.size	halfEye, .-halfEye
	.align	2
	.global	drawHalfEyes
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHalfEyes, %function
drawHalfEyes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L59
	rsb	r0, r0, r0, lsl #4
	push	{r4, r5, r6, lr}
	ldr	r3, [r3]
	lsl	lr, r0, #4
	add	ip, r1, lr
	mov	r4, r2
	add	r0, r3, #98
	sub	r2, ip, #-2147483647
	lsl	ip, ip, #1
	add	r2, r3, r2, lsl #1
	add	r0, r0, ip
.L46:
	strh	r4, [r2, #2]!	@ movhi
	cmp	r2, r0
	bne	.L46
	add	r1, r1, lr
	add	r2, r3, #276
	add	r1, r1, #-2147483648
	add	r1, r1, #89
	add	r2, r2, #2
	add	r3, r3, r1, lsl #1
	add	r2, r2, ip
.L47:
	strh	r4, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L47
	mov	r3, r4
	mov	r2, #25
	mov	r1, #77
	mov	r0, #70
	bl	halfEye
	mov	r2, #25
	mov	r1, #167
	mov	r0, #70
	bl	halfEye
	mov	r5, #10
.L48:
	mov	r2, r5
	mov	r3, r4
	mov	r1, #77
	add	r5, r5, #1
	mov	r0, #70
	bl	halfEye
	cmp	r5, #15
	bne	.L48
	mov	r5, #10
.L49:
	mov	r2, r5
	mov	r3, r4
	mov	r1, #167
	add	r5, r5, #1
	mov	r0, #70
	bl	halfEye
	cmp	r5, #15
	bne	.L49
	mov	r5, #1
.L50:
	mov	r2, r5
	mov	r3, r4
	mov	r1, #77
	add	r5, r5, #1
	mov	r0, #70
	bl	halfEye
	cmp	r5, #5
	bne	.L50
	mov	r5, #1
.L51:
	mov	r2, r5
	mov	r3, r4
	mov	r1, #167
	add	r5, r5, #1
	mov	r0, #70
	bl	halfEye
	cmp	r5, #5
	bne	.L51
	pop	{r4, r5, r6, lr}
	bx	lr
.L60:
	.align	2
.L59:
	.word	.LANCHOR0
	.size	drawHalfEyes, .-drawHalfEyes
	.align	2
	.global	halfCycle
	.syntax unified
	.arm
	.fpu softvfp
	.type	halfCycle, %function
halfCycle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r0
	mov	r5, r1
	mov	r2, r1
	mov	r0, #70
	mov	r1, #52
	sub	sp, sp, #12
	bl	drawHalfEyes
	ldr	r3, .L66
	rsb	r1, r4, r4, lsl #5
	ldr	r3, [r3]
	add	r4, r4, r1, lsl #2
	add	r4, r4, r4, lsl #2
	add	r3, r3, #32768
	lsl	r1, r4, #5
	add	r0, r3, #928
	add	r2, r3, #932
	add	ip, r3, #924
	cmp	r1, #0
	add	r3, r3, #1216
	strh	r5, [ip, #2]	@ movhi
	strh	r5, [r0]	@ movhi
	strh	r5, [r0, #2]	@ movhi
	strh	r5, [r2]	@ movhi
	strh	r5, [r2, #2]	@ movhi
	strh	r5, [r3]	@ movhi
	strh	r5, [r3, #2]	@ movhi
	strh	r5, [r3, #4]	@ movhi
	strh	r5, [r3, #6]	@ movhi
	strh	r5, [r3, #8]	@ movhi
	ble	.L61
	mov	r2, #0
.L63:
	ldr	r3, [sp, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, r1
	str	r3, [sp, #4]
	bne	.L63
.L61:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	.LANCHOR0
	.size	halfCycle, .-halfCycle
	.align	2
	.global	drawClosedEyes
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawClosedEyes, %function
drawClosedEyes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #25
	mov	r3, r0
	mov	r1, #77
	mov	r0, #70
	bl	halfEye
	mov	r2, #25
	mov	r1, #167
	mov	r0, #70
	pop	{r4, lr}
	b	halfEye
	.size	drawClosedEyes, .-drawClosedEyes
	.align	2
	.global	closedCycle
	.syntax unified
	.arm
	.fpu softvfp
	.type	closedCycle, %function
closedCycle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r0
	mov	r5, r1
	mov	r0, r1
	sub	sp, sp, #12
	bl	drawClosedEyes
	ldr	r3, .L75
	rsb	r0, r4, r4, lsl #5
	ldr	r3, [r3]
	add	r4, r4, r0, lsl #2
	add	r4, r4, r4, lsl #2
	add	r3, r3, #32768
	lsl	r0, r4, #5
	add	r1, r3, #928
	add	r2, r3, #932
	add	ip, r3, #924
	cmp	r0, #0
	add	r3, r3, #1216
	strh	r5, [ip, #2]	@ movhi
	strh	r5, [r1]	@ movhi
	strh	r5, [r1, #2]	@ movhi
	strh	r5, [r2]	@ movhi
	strh	r5, [r2, #2]	@ movhi
	strh	r5, [r3]	@ movhi
	strh	r5, [r3, #2]	@ movhi
	strh	r5, [r3, #4]	@ movhi
	strh	r5, [r3, #6]	@ movhi
	strh	r5, [r3, #8]	@ movhi
	ble	.L70
	mov	r2, #0
.L72:
	ldr	r3, [sp, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, r0
	str	r3, [sp, #4]
	bne	.L72
.L70:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L76:
	.align	2
.L75:
	.word	.LANCHOR0
	.size	closedCycle, .-closedCycle
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
	ldr	r2, .L80
	push	{r7, lr}
	ldr	r6, .L80+4
	strh	r2, [r3]	@ movhi
	ldr	r4, .L80+8
	ldr	r5, .L80+12
	ldr	r9, .L80+16
	ldr	r8, .L80+20
	ldr	r7, .L80+24
.L78:
	mov	r1, r9
	mov	r0, #6
	mov	lr, pc
	bx	r6
	mov	r1, #0
	mov	r0, #1
	mov	lr, pc
	bx	r6
	mov	r1, r9
	mov	r0, #6
	mov	lr, pc
	bx	r4
	mov	r1, #0
	mov	r0, #1
	mov	lr, pc
	bx	r4
	mov	r1, r9
	mov	r0, #9
	mov	lr, pc
	bx	r5
	mov	r1, #0
	mov	r0, #1
	mov	lr, pc
	bx	r5
	mov	r1, r9
	mov	r0, #6
	mov	lr, pc
	bx	r4
	mov	r1, #0
	mov	r0, #1
	mov	lr, pc
	bx	r4
	mov	r1, r8
	mov	r0, #6
	mov	lr, pc
	bx	r6
	mov	r1, #0
	mov	r0, #1
	mov	lr, pc
	bx	r6
	mov	r1, r8
	mov	r0, #6
	mov	lr, pc
	bx	r4
	mov	r1, #0
	mov	r0, #1
	mov	lr, pc
	bx	r4
	mov	r1, r8
	mov	r0, #9
	mov	lr, pc
	bx	r5
	mov	r1, #0
	mov	r0, #1
	mov	lr, pc
	bx	r5
	mov	r1, r8
	mov	r0, #6
	mov	lr, pc
	bx	r4
	mov	r1, #0
	mov	r0, #1
	mov	lr, pc
	bx	r4
	mov	r1, r7
	mov	r0, #6
	mov	lr, pc
	bx	r6
	mov	r1, #0
	mov	r0, #1
	mov	lr, pc
	bx	r6
	mov	r1, r7
	mov	r0, #6
	mov	lr, pc
	bx	r4
	mov	r1, #0
	mov	r0, #1
	mov	lr, pc
	bx	r4
	mov	r1, r7
	mov	r0, #9
	mov	lr, pc
	bx	r5
	mov	r1, #0
	mov	r0, #1
	mov	lr, pc
	bx	r5
	mov	r1, r7
	mov	r0, #6
	mov	lr, pc
	bx	r4
	mov	r1, #0
	mov	r0, #1
	mov	lr, pc
	bx	r4
	b	.L78
.L81:
	.align	2
.L80:
	.word	1027
	.word	closedCycle
	.word	halfCycle
	.word	fullCycle
	.word	32272
	.word	32089
	.word	16735
	.size	main, .-main
	.text
	.align	2
	.global	setPixel
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L83
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3]
	lsl	r1, r1, #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L84:
	.align	2
.L83:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	delay
	.syntax unified
	.arm
	.fpu softvfp
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r3, r0, r0, lsl #5
	add	r0, r0, r3, lsl #2
	add	r0, r0, r0, lsl #2
	lsl	r0, r0, #5
	cmp	r0, #0
	bxle	lr
	mov	r2, #0
	sub	sp, sp, #8
.L87:
	ldr	r3, [sp, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, r0
	str	r3, [sp, #4]
	bne	.L87
	add	sp, sp, #8
	@ sp needed
	bx	lr
	.size	delay, .-delay
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 47) 7.1.0"
