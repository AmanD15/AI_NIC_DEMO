	.file	"main.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"Allocated %u to %u\n"
	.section	".text"
	.align 4
	.global cortos_bget_ncram1
	.type	cortos_bget_ncram1, #function
	.proc	0120
cortos_bget_ncram1:
	save	%sp, -96, %sp
	call	cortos_bget_ncram, 0
	 mov	%i0, %o0
	mov	%o0, %i5
	mov	%o0, %o1
	add	%i5, %i0, %o2
	sethi	%hi(.LC0), %o0
	mov	%i5, %i0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC0), %o0
	jmp	%i7+8
	 restore
	.size	cortos_bget_ncram1, .-cortos_bget_ncram1
	.section	.rodata.str1.8
	.align 8
.LC1:
	.asciz	"Entering %d %d\n"
	.align 8
.LC2:
	.asciz	"hdr %d\n"
	.align 8
.LC3:
	.asciz	"msgSizeInBytes %d\n"
	.align 8
.LC4:
	.asciz	"totalMsgs %d\n"
	.align 8
.LC5:
	.asciz	"readIndex %d\n"
	.align 8
.LC6:
	.asciz	"writeIndex %d\n"
	.align 8
.LC7:
	.asciz	"lock addr %d\n"
	.align 8
.LC8:
	.asciz	"lock val %d\n"
	.align 8
.LC9:
	.asciz	"length %d\n"
	.align 8
.LC10:
	.asciz	"bget_addr %d\n"
	.align 8
.LC11:
	.asciz	"misc %d\n"
	.section	".text"
	.align 4
	.global cortos_reserveQueue2
	.type	cortos_reserveQueue2, #function
	.proc	0110
cortos_reserveQueue2:
	save	%sp, -96, %sp
	smul	%i1, %i0, %o0
	cmp	%i2, 0
	be	.L3
	 add	%o0, 48, %o0
	call	cortos_bget_ncram, 0
	 nop
	mov	%o0, %i4
.L4:
	cmp	%i4, 0
	be	.L6
	 mov	%i0, %o1
	ld	[%g0+16], %o2
	sethi	%hi(.LC1), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC1), %o0
	and	%i4, 15, %g1
	mov	1, %o0
	mov	16, %i3
	sub	%i3, %g1, %i3
	add	%i4, %i3, %i5
	st	%g0, [%i4+%i3]
	st	%g0, [%i5+4]
	st	%g0, [%i5+8]
	st	%i0, [%i5+16]
	call	cortos_reserveLock, 0
	 st	%i1, [%i5+12]
	mov	%i5, %o1
	st	%o0, [%i5+20]
	st	%i4, [%i5+24]
	st	%g0, [%i5+28]
	sethi	%hi(.LC2), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC2), %o0
	ld	[%i5+16], %o1
	sethi	%hi(.LC3), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC3), %o0
	ld	[%i4+%i3], %o1
	sethi	%hi(.LC4), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC4), %o0
	ld	[%i5+4], %o1
	sethi	%hi(.LC5), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC5), %o0
	ld	[%i5+8], %o1
	sethi	%hi(.LC6), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC6), %o0
	ld	[%i5+20], %o1
	sethi	%hi(.LC7), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC7), %o0
	ld	[%i5+20], %g1
	sethi	%hi(.LC8), %o0
	ldub	[%g1], %o1
	call	cortos_printf, 0
	 or	%o0, %lo(.LC8), %o0
	ld	[%i5+12], %o1
	sethi	%hi(.LC9), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC9), %o0
	ld	[%i5+24], %o1
	sethi	%hi(.LC10), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC10), %o0
	sethi	%hi(.LC11), %o0
	ld	[%i5+28], %o1
	call	cortos_printf, 0
	 or	%o0, %lo(.LC11), %o0
.L5:
	jmp	%i7+8
	 restore %g0, %i5, %o0
.L3:
	call	cortos_bget, 0
	 nop
	b	.L4
	 mov	%o0, %i4
.L6:
	b	.L5
	 mov	0, %i5
	.size	cortos_reserveQueue2, .-cortos_reserveQueue2
	.section	.rodata.str1.8
	.align 8
.LC12:
	.asciz	"%x\n"
	.align 8
.LC13:
	.asciz	"Entered loop %d %d %d\n"
	.align 8
.LC14:
	.asciz	"Entering for loop %d\n"
	.align 8
.LC15:
	.asciz	"Writing %lx at %lx from %lx\n"
	.section	".text"
	.align 4
	.global cortos_writeMessages2
	.type	cortos_writeMessages2, #function
	.proc	016
cortos_writeMessages2:
	save	%sp, -96, %sp
	sethi	%hi(.LC12), %i5
	mov	%i0, %o1
	call	cortos_printf, 0
	 or	%i5, %lo(.LC12), %o0
	or	%i5, %lo(.LC12), %o0
	call	cortos_printf, 0
	 ld	[%i1], %o1
	st	%i2, [%fp+76]
	ld	[%i0+28], %g1
	andcc	%g1, 1, %g0
	be	.L26
	 nop
	ld	[%i0], %g1
	cmp	%g1, 0
	bne	.L19
	 mov	0, %l1
.L10:
	ld	[%i0+16], %l0
	ld	[%i0+8], %l3
	ld	[%i0+12], %l4
	mov	%l0, %o1
	sethi	%hi(.LC1), %o0
	mov	%l0, %o2
	call	cortos_printf, 0
	 or	%o0, %lo(.LC1), %o0
	ld	[%fp+76], %g1
	cmp	%g1, 0
	be	.L12
	 add	%i0, 32, %l5
	ld	[%i0+12], %o3
	cmp	%o3, %l1
	bleu	.L20
	 mov	%g1, %l2
	sethi	%hi(.LC13), %l7
	sethi	%hi(.LC14), %l6
	sethi	%hi(.LC15), %i3
	or	%l7, %lo(.LC13), %l7
	or	%l6, %lo(.LC14), %l6
	or	%i3, %lo(.LC15), %i3
.L17:
	mov	%l2, %o1
	mov	%l1, %o2
	call	cortos_printf, 0
	 mov	%l7, %o0
	mov	%l6, %o0
	smul	%l3, %l0, %i5
	mov	%l0, %o1
	call	cortos_printf, 0
	 add	%l5, %i5, %i5
	mov	%i5, %i2
	add	%i1, %l0, %i4
	cmp	%l0, 0
	be	.L16
	 mov	%i1, %i5
.L15:
	ldub	[%i5], %o1
	mov	%i2, %o2
	mov	%i5, %o3
	call	cortos_printf, 0
	 mov	%i3, %o0
	ldub	[%i5], %g2
	stb	%g2, [%i2]
	add	%i5, 1, %i5
	cmp	%i5, %i4
	bne	.L15
	 add	%i2, 1, %i2
.L16:
	add	%l3, 1, %l3
	add	%l1, 1, %l1
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%l3, %l4, %g1
	addcc	%l2, -1, %l2
	smul	%g1, %l4, %g1
	be	.L12
	 sub	%l3, %g1, %l3
	ld	[%i0+12], %o3
	cmp	%o3, %l1
	bgu	.L17
	 add	%i1, %l0, %i1
	ld	[%fp+76], %g1
	sub	%g1, %l2, %g1
	st	%g1, [%fp+76]
.L12:
	st	%l3, [%i0+8]
	st	%l1, [%i0]
	ld	[%i0+28], %g1
	andcc	%g1, 1, %g0
	be	.L27
	 nop
	ld	[%fp+76], %i0
	jmp	%i7+8
	 restore
.L19:
	st	%g0, [%fp+76]
	ld	[%fp+76], %i0
	jmp	%i7+8
	 restore
.L26:
	call	cortos_lock_acquire_buzy, 0
	 ld	[%i0+20], %o0
	b	.L10
	 ld	[%i0], %l1
.L27:
	call	cortos_lock_release, 0
	 ld	[%i0+20], %o0
	ld	[%fp+76], %i0
	jmp	%i7+8
	 restore
.L20:
	b	.L12
	 st	%g0, [%fp+76]
	.size	cortos_writeMessages2, .-cortos_writeMessages2
	.section	.rodata.str1.8
	.align 8
.LC16:
	.asciz	"Free = 0x%lx and size is %d(in bytes)\n"
	.align 8
.LC17:
	.asciz	"tx = 0x%lx and size is %d(in bytes)\n"
	.align 8
.LC18:
	.asciz	"rx = 0x%lx and size is %d(in bytes)\n"
	.align 8
.LC19:
	.asciz	"Free->msgSizeInBYtes = %d\n"
	.align 8
.LC20:
	.asciz	"file_buf addr = 0x%lx and its size is %di(in bytes)\n"
	.align 8
.LC21:
	.asciz	"Buffers[%d] = 0x%lx and size is %d(in bytes)\n"
	.align 8
.LC22:
	.asciz	"Unable to push all msgs to free queue.\n"
	.align 8
.LC23:
	.asciz	"free_queue[%d] = 0x%lx\n"
	.align 8
.LC24:
	.asciz	"free_queue : \n\treadIndex = %d\n\twriteIndex = %d\n\ttotalmMsgs = %d\n\n"
	.align 8
.LC25:
	.asciz	"Free = 0x%lx\n"
	.align 8
.LC26:
	.asciz	"Tx = 0x%lx\n"
	.align 8
.LC27:
	.asciz	"Rx = 0x%lx\n"
	.align 8
.LC28:
	.asciz	"Configuration Done. NIC has started\n"
	.align 8
.LC29:
	.asciz	"sending file out\n"
	.align 8
.LC30:
	.asciz	"Done\n"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -360, %sp
	call	__ajit_write_serial_control_register_via_bypass__, 0
	 mov	3, %o0
	mov	64, %o1
	mov	1, %o2
	call	cortos_reserveQueue2, 0
	 mov	4, %o0
	mov	64, %o1
	mov	%o0, %l0
	mov	1, %o2
	call	cortos_reserveQueue2, 0
	 mov	4, %o0
	mov	64, %o1
	mov	%o0, %i0
	mov	1, %o2
	call	cortos_reserveQueue2, 0
	 mov	4, %o0
	ld	[%o0+16], %g1
	ld	[%o0+12], %o2
	mov	%o0, %o1
	smul	%o2, %g1, %o2
	mov	%o0, %i4
	sethi	%hi(.LC16), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC16), %o0
	ld	[%i0+16], %g1
	mov	%i0, %o1
	ld	[%i0+12], %o2
	sethi	%hi(.LC17), %o0
	smul	%o2, %g1, %o2
	call	cortos_printf, 0
	 or	%o0, %lo(.LC17), %o0
	ld	[%l0+16], %g1
	mov	%l0, %o1
	ld	[%l0+12], %o2
	sethi	%hi(.LC18), %o0
	smul	%o2, %g1, %o2
	call	cortos_printf, 0
	 or	%o0, %lo(.LC18), %o0
	ld	[%i4+16], %o1
	sethi	%hi(.LC19), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC19), %o0
	sethi	%hi(9216), %i5
	call	cortos_bget_ncram, 0
	 or	%i5, 884, %o0
	or	%i5, 884, %o2
	mov	%o0, %o1
	mov	%o0, %i1
	sethi	%hi(.LC21), %i2
	sethi	%hi(.LC20), %o0
	mov	0, %i5
	or	%o0, %lo(.LC20), %o0
	call	cortos_printf, 0
	 add	%fp, -256, %i3
	or	%i2, %lo(.LC21), %i2
.L29:
	call	cortos_bget_ncram, 0
	 mov	1700, %o0
	sll	%i5, 2, %g1
	mov	%o0, %o2
	mov	%i5, %o1
	st	%o0, [%g1+%i3]
	mov	1700, %o3
	call	cortos_printf, 0
	 mov	%i2, %o0
	add	%i5, 1, %i5
	cmp	%i5, 64
	bne	.L29
	 mov	%i3, %o1
	mov	%i4, %o0
	call	cortos_writeMessages2, 0
	 mov	44, %o2
	cmp	%o0, 44
	be	.L30
	 sethi	%hi(.LC22), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC22), %o0
.L30:
	sethi	%hi(.LC23), %i2
	mov	0, %g1
	mov	0, %i5
	or	%i2, %lo(.LC23), %i2
.L31:
	add	%g1, 8, %g1
	sll	%g1, 2, %g1
	mov	%i5, %o1
	ld	[%i4+%g1], %o2
	call	cortos_printf, 0
	 mov	%i2, %o0
	add	%i5, 1, %i5
	cmp	%i5, 64
	bne	.L31
	 mov	%i5, %g1
	ld	[%i4], %o3
	ld	[%i4+4], %o1
	ld	[%i4+8], %o2
	sethi	%hi(.LC24), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC24), %o0
	call	readNicRegs, 0
	 sethi	%hi(.LC29), %i2
	mov	%i0, %o2
	mov	%i4, %o0
	call	nicRegConfig, 0
	 mov	%l0, %o1
	mov	2, %o0
	call	writeNicReg, 0
	 mov	%l0, %o1
	mov	0, %o0
	call	writeNicReg, 0
	 mov	1, %o1
	call	readNicRegs, 0
	 mov	18, %i5
	mov	%i4, %o1
	sethi	%hi(.LC25), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC25), %o0
	mov	%i0, %o1
	sethi	%hi(.LC26), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC26), %o0
	mov	%l0, %o1
	sethi	%hi(.LC27), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC27), %o0
	sethi	%hi(.LC28), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC28), %o0
	or	%i2, %lo(.LC29), %i2
	add	%fp, -260, %o3
.L43:
	mov	%i4, %o1
	mov	%l0, %o2
	call	getConfigData, 0
	 mov	%i1, %o0
	call	cortos_printf, 0
	 mov	%i2, %o0
	mov	%i1, %o0
	mov	%i4, %o1
	mov	%i0, %o2
	call	sendFile, 0
	 ld	[%fp-260], %o3
	addcc	%i5, -1, %i5
	bne	.L43
	 add	%fp, -260, %o3
	call	cortos_freeQueue, 0
	 mov	%l0, %o0
	call	cortos_freeQueue, 0
	 mov	%i0, %o0
	mov	%i3, %i5
	mov	%i4, %o0
	call	cortos_freeQueue, 0
	 mov	%fp, %i3
.L33:
	call	cortos_brel, 0
	 ld	[%i5], %o0
	add	%i5, 4, %i5
	cmp	%i5, %i3
	bne	.L33
	 nop
	call	cortos_brel, 0
	 mov	%i1, %o0
	sethi	%hi(.LC30), %o0
	mov	0, %i0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC30), %o0
	jmp	%i7+8
	 restore
	.size	main, .-main
	.global NIC_REG
	.section	".data"
	.align 4
	.type	NIC_REG, #object
	.size	NIC_REG, 4
NIC_REG:
	.long	268435456
	.global MEM
	.align 4
	.type	MEM, #object
	.size	MEM, 4
MEM:
	.long	4192256
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
