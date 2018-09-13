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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel3
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3]
	lsl	r1, r1, #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	setPixel4
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	rsb	r0, r0, r0, lsl #4
	add	r0, r1, r0, lsl #4
	ldr	ip, [r3]
	add	r0, r0, r0, lsr #31
	bic	r0, r0, #1
	ldrh	r3, [ip, r0]
	tst	r1, #1
	andne	r3, r3, #255
	andeq	r3, r3, #65280
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r0]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	cmpgt	r2, #0
	bxle	lr
	cmp	r1, #239
	cmple	r0, #159
	movgt	ip, #1
	movle	ip, #0
	bxgt	lr
	cmp	r0, #0
	push	{r4, r5, lr}
	add	lr, r2, r0
	movlt	r0, ip
	movlt	r2, lr
	cmp	lr, #159
	rsbgt	r2, r0, #160
	cmp	r1, #0
	add	ip, r3, r1
	movlt	r1, #0
	movlt	r3, ip
	cmp	ip, #239
	rsbgt	r3, r1, #240
	cmp	r3, #0
	cmpgt	r2, #0
	movle	lr, #1
	movgt	lr, #0
	bgt	.L19
.L10:
	pop	{r4, r5, lr}
	bx	lr
.L19:
	mov	r5, lr
	ldr	ip, .L24
	rsb	r0, r0, r0, lsl #4
	ldr	r4, [ip]
	add	r1, r1, r0, lsl #4
	ldr	ip, [ip, #4]
	orr	r3, r3, #-2130706432
	add	r1, r4, r1, lsl #1
.L16:
	add	lr, lr, #1
	add	r0, sp, #12
	cmp	r2, lr
	str	r5, [ip, #44]
	str	r0, [ip, #36]
	str	r1, [ip, #40]
	str	r3, [ip, #44]
	add	r1, r1, #480
	bgt	.L16
	b	.L10
.L25:
	.align	2
.L24:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	cmpgt	r2, #0
	bxle	lr
	cmp	r1, #239
	cmple	r0, #159
	movgt	ip, #1
	movle	ip, #0
	bxgt	lr
	cmp	r0, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	lr, r2, r0
	movlt	r0, ip
	movlt	r2, lr
	cmp	lr, #159
	rsbgt	r2, r0, #160
	cmp	r1, #0
	add	ip, r3, r1
	movlt	r1, #0
	movlt	r3, ip
	cmp	ip, #239
	rsbgt	r3, r1, #240
	cmp	r3, #0
	cmpgt	r2, #0
	sub	sp, sp, #20
	movle	ip, #1
	movgt	ip, #0
	bgt	.L52
.L26:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L52:
	ldrb	lr, [sp, #56]	@ zero_extendqisi2
	ldrb	r4, [sp, #56]	@ zero_extendqisi2
	asr	r8, r3, #1
	orr	lr, lr, r4, lsl #8
	add	fp, sp, #16
	rsb	r0, r0, r0, lsl #4
	strh	lr, [fp, #-2]!	@ movhi
	sub	lr, r8, #1
	add	r10, r1, r3
	orr	lr, lr, #-2130706432
	ldr	r5, .L61
	add	r0, r1, r0, lsl #4
	and	r1, r1, #1
	sub	r10, r10, #1
	str	lr, [sp, #4]
	cmp	r1, #0
	sub	lr, r3, #1
	ldm	r5, {r4, r5}
	orr	r8, r8, #-2130706432
	and	r10, r10, #1
	and	r9, r3, #1
	str	lr, [sp]
	bne	.L60
.L32:
	cmp	r9, #0
	beq	.L39
	cmp	r3, #1
	beq	.L40
	bic	lr, r0, #1
	add	lr, r4, lr
	str	r1, [r5, #44]
	str	fp, [r5, #36]
	str	lr, [r5, #40]
	str	r8, [r5, #44]
.L40:
	ldr	lr, [sp]
	add	lr, lr, r0
	bic	lr, lr, #1
	ldrh	r7, [r4, lr]
	ldrb	r6, [sp, #56]	@ zero_extendqisi2
	cmp	r10, #0
	and	r6, r6, #255
	andne	r7, r7, #255
	andeq	r7, r7, #65280
	orrne	r7, r7, r6, lsl #8
	orreq	r7, r7, r6
	strh	r7, [r4, lr]	@ movhi
.L37:
	add	ip, ip, #1
	cmp	r2, ip
	add	r0, r0, #240
	ble	.L26
	cmp	r1, #0
	beq	.L32
.L60:
	cmp	r9, #0
	bne	.L33
	cmp	r3, #2
	ble	.L34
	add	lr, r0, #1
	bic	lr, lr, #1
	add	lr, r4, lr
	str	r9, [r5, #44]
	str	fp, [r5, #36]
	str	lr, [r5, #40]
	ldr	lr, [sp, #4]
	str	lr, [r5, #44]
.L34:
	bic	r6, r0, #1
	ldrb	lr, [r4, r6]	@ zero_extendqisi2
	ldrb	r7, [sp, #56]	@ zero_extendqisi2
	orr	lr, lr, r7, lsl #8
	strh	lr, [r4, r6]	@ movhi
	b	.L40
.L33:
	cmp	r3, #1
	beq	.L38
	mov	r6, #0
	add	lr, r0, #1
	bic	lr, lr, #1
	add	lr, r4, lr
	str	r6, [r5, #44]
	str	fp, [r5, #36]
	str	lr, [r5, #40]
	str	r8, [r5, #44]
.L38:
	bic	r6, r0, #1
	ldrb	lr, [r4, r6]	@ zero_extendqisi2
	ldrb	r7, [sp, #56]	@ zero_extendqisi2
	orr	lr, lr, r7, lsl #8
	strh	lr, [r4, r6]	@ movhi
	b	.L37
.L39:
	bic	lr, r0, #1
	add	lr, r4, lr
	str	r9, [r5, #44]
	str	fp, [r5, #36]
	str	lr, [r5, #40]
	str	r8, [r5, #44]
	b	.L37
.L62:
	.align	2
.L61:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen3
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	sub	sp, sp, #8
	ldr	r1, .L65
	add	r2, sp, #8
	strh	r0, [r2, #-2]!	@ movhi
	ldm	r1, {r0, r3}
	ldr	r1, .L65+4
	str	ip, [r3, #44]
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L66:
	.align	2
.L65:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	sub	sp, sp, #16
	strb	r0, [sp, #7]
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	ldr	r1, .L69
	add	r2, sp, #16
	orr	r3, r3, r0, lsl #8
	strh	r3, [r2, #-2]!	@ movhi
	ldm	r1, {r0, r3}
	ldr	r1, .L69+4
	str	ip, [r3, #44]
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #16
	@ sp needed
	bx	lr
.L70:
	.align	2
.L69:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	cmpgt	r2, #0
	bxle	lr
	cmp	r1, #239
	cmple	r0, #159
	movgt	ip, #1
	movle	ip, #0
	bxgt	lr
	cmp	r0, #0
	push	{r4, r5, r6, lr}
	add	lr, r2, r0
	movlt	r0, ip
	movlt	r2, lr
	cmp	lr, #159
	rsbgt	r2, r0, #160
	cmp	r1, #0
	add	ip, r3, r1
	movlt	r1, #0
	movlt	r3, ip
	cmp	ip, #239
	rsbgt	r3, r1, #240
	cmp	r3, #0
	cmpgt	r2, #0
	movle	r4, #1
	movgt	r4, #0
	bgt	.L80
.L71:
	pop	{r4, r5, r6, lr}
	bx	lr
.L80:
	mov	r6, r4
	ldr	lr, .L85
	rsb	r0, r0, r0, lsl #4
	ldr	r5, [lr]
	add	r1, r1, r0, lsl #4
	ldr	ip, [sp, #16]
	ldr	lr, [lr, #4]
	orr	r0, r3, #-2147483648
	add	r1, r5, r1, lsl #1
	lsl	r3, r3, #1
.L77:
	add	r4, r4, #1
	cmp	r2, r4
	str	r6, [lr, #44]
	str	ip, [lr, #36]
	str	r1, [lr, #40]
	add	ip, ip, r3
	str	r0, [lr, #44]
	add	r1, r1, #480
	bgt	.L77
	b	.L71
.L86:
	.align	2
.L85:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	cmpgt	r2, #0
	bxle	lr
	cmp	r1, #239
	cmple	r0, #159
	movgt	ip, #1
	movle	ip, #0
	bxgt	lr
	cmp	r0, #0
	push	{r4, r5, r6, r7, r8, r9, lr}
	add	lr, r2, r0
	movlt	r0, ip
	movlt	r2, lr
	cmp	lr, #159
	rsbgt	r2, r0, #160
	cmp	r1, #0
	add	ip, r3, r1
	movlt	r1, #0
	movlt	r3, ip
	cmp	ip, #239
	rsbgt	r3, r1, #240
	cmp	r3, #0
	cmpgt	r2, #0
	movle	ip, #1
	movgt	ip, #0
	bgt	.L96
.L87:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L96:
	mov	r5, ip
	mov	r7, ip
	ldr	lr, .L101
	rsb	r0, r0, r0, lsl #4
	asr	r6, r3, #1
	ldm	lr, {r8, lr}
	add	r1, r1, r0, lsl #4
	orr	r6, r6, #-2147483648
.L93:
	ldr	r9, [sp, #28]
	bic	r4, ip, #1
	bic	r0, r1, #1
	add	r5, r5, #1
	add	r4, r9, r4
	add	r0, r8, r0
	cmp	r2, r5
	str	r7, [lr, #44]
	add	ip, ip, r3
	str	r4, [lr, #36]
	add	r1, r1, #240
	str	r0, [lr, #40]
	str	r6, [lr, #44]
	bgt	.L93
	b	.L87
.L102:
	.align	2
.L101:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage3, %function
drawFullscreenImage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L104
	ldr	r1, .L104+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L105:
	.align	2
.L104:
	.word	.LANCHOR0
	.word	-2147445248
	.size	drawFullscreenImage3, .-drawFullscreenImage3
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L107
	ldr	r1, .L107+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L108:
	.align	2
.L107:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L110:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L110
	mov	r2, #67108864
.L111:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L111
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r3, [r3]
	tst	r3, #16
	moveq	r1, #100663296
	ldrne	r2, .L118
	ldreq	r2, .L118
	ldrne	r1, .L118+4
	str	r1, [r2]
	mov	r2, #67108864
	eor	r3, r3, #16
	strh	r3, [r2]	@ movhi
	bx	lr
.L119:
	.align	2
.L118:
	.word	.LANCHOR0
	.word	100704256
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L122
	add	r0, r0, r0, lsl #1
	ldr	lr, [ip, #4]
	lsl	r0, r0, #2
	add	ip, lr, r0
	orr	r3, r3, #-2147483648
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L123:
	.align	2
.L122:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #4]
	ldr	ip, [sp, #12]
	add	ip, lr, ip
	sub	ip, ip, #1
	cmp	ip, r0
	ble	.L128
	add	r0, r0, r2
	sub	r0, r0, #1
	cmp	r0, lr
	bgt	.L130
.L128:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L130:
	ldr	r2, [sp, #8]
	ldr	r0, [sp, #16]
	add	r2, r2, r0
	sub	r2, r2, #1
	cmp	r2, r1
	ble	.L128
	add	r0, r1, r3
	ldr	r3, [sp, #8]
	sub	r0, r0, #1
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 47) 7.1.0"
