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
	.file	"text.c"
	.text
	.align	2
	.global	drawChar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar, %function
drawChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, r1
	mov	r8, r3
	mov	fp, r0
	ldr	r6, .L13
	add	r2, r2, r2, lsl #1
	lsl	r2, r2, #4
	add	r10, r6, #48
	ldr	r7, .L13+4
	add	r6, r2, r6
	add	r10, r10, r2
.L2:
	mov	r5, r6
	mov	r4, #0
	b	.L4
.L3:
	add	r4, r4, #1
	cmp	r4, #6
	beq	.L12
.L4:
	ldrb	r3, [r5], #1	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3
	add	r1, r9, r4
	mov	r2, r8
	mov	r0, fp
	add	r4, r4, #1
	mov	lr, pc
	bx	r7
	cmp	r4, #6
	bne	.L4
.L12:
	add	r6, r6, #6
	cmp	r6, r10
	add	fp, fp, #1
	bne	.L2
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	fontdata_6x8
	.word	setPixel
	.size	drawChar, .-drawChar
	.align	2
	.global	drawString
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString, %function
drawString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L15
	mov	r7, r0
	mov	r4, r1
	mov	r6, r3
.L17:
	mov	r1, r4
	mov	r3, r6
	mov	r0, r7
	bl	drawChar
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L17
.L15:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
	.size	drawString, .-drawString
	.ident	"GCC: (devkitARM release 47) 7.1.0"
