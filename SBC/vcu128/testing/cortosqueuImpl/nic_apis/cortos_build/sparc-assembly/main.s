	.file	"main.c"
	.section	".text"
	.align 4
	.global readNicReg
	.type	readNicReg, #function
	.proc	016
readNicReg:
	sll	%o0, 2, %o0
	sethi	%hi(NIC_REG), %g1
	ld	[%g1+%lo(NIC_REG)], %o1
	add	%o1, %o0, %o1
	sra	%o1, 31, %o0
	or	%o7, %g0, %g1
	call	__ajit_load_word_from_physical_address__, 0
	 or	%g1, %g0, %o7
	.size	readNicReg, .-readNicReg
	.align 4
	.global writeNicReg
	.type	writeNicReg, #function
	.proc	020
writeNicReg:
	sll	%o0, 2, %g1
	sethi	%hi(NIC_REG), %g2
	mov	%o1, %o0
	ld	[%g2+%lo(NIC_REG)], %o2
	add	%o2, %g1, %o2
	sra	%o2, 31, %o1
	or	%o7, %g0, %g1
	call	__ajit_store_word_to_physical_address__, 0
	 or	%g1, %g0, %o7
	.size	writeNicReg, .-writeNicReg
	.align 4
	.global nicRegInit
	.type	nicRegInit, #function
	.proc	020
nicRegInit:
	save	%sp, -96, %sp
	mov	1, %o0
	call	writeNicReg, 0
	 mov	1, %o1
	mov	%i1, %o1
	call	writeNicReg, 0
	 mov	2, %o0
	mov	10, %o0
	call	writeNicReg, 0
	 mov	%i2, %o1
	mov	%i0, %o1
	mov	18, %o0
	call	writeNicReg, 0
	 mov	0, %i0
	call	writeNicReg, 0
	 restore %g0, 1, %o1
	.size	nicRegInit, .-nicRegInit
	.align 4
	.global loadEthernetHeader
	.type	loadEthernetHeader, #function
	.proc	020
loadEthernetHeader:
	ld	[%o0+8], %g1
	st	%g1, [%o1]
	ld	[%o0+12], %g1
	st	%g1, [%o1+4]
	ld	[%o0+16], %g1
	st	%g1, [%o1+8]
	ld	[%o0+20], %g1
	jmp	%o7+8
	 st	%g1, [%o1+12]
	.size	loadEthernetHeader, .-loadEthernetHeader
	.align 4
	.global readBufControlData
	.type	readBufControlData, #function
	.proc	020
readBufControlData:
	ld	[%o0+4], %g1
	srl	%g1, 8, %g2
	sth	%g2, [%o1]
	jmp	%o7+8
	 stb	%g1, [%o2]
	.size	readBufControlData, .-readBufControlData
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"control data = 0x%08x\n"
	.section	".text"
	.align 4
	.global writeBufControlData
	.type	writeBufControlData, #function
	.proc	020
writeBufControlData:
	save	%sp, -96, %sp
	sethi	%hi(.LC0), %o0
	sll	%i1, 8, %i1
	or	%o0, %lo(.LC0), %o0
	or	%i2, %i1, %i2
	call	ee_printf, 0
	 mov	%i2, %o1
	st	%i2, [%i0+4]
	jmp	%i7+8
	 restore
	.size	writeBufControlData, .-writeBufControlData
	.section	.rodata.str1.8
	.align 8
.LC1:
	.asciz	"Started\n"
	.align 8
.LC2:
	.asciz	"eth_hdr[0] = 0x%x\n"
	.align 8
.LC3:
	.asciz	"eth_hdr[1] = 0x%x\n"
	.align 8
.LC4:
	.asciz	"eth_hdr[2] = 0x%x\n"
	.align 8
.LC5:
	.asciz	"eth_hdr[3] = 0x%x\n"
	.align 8
.LC6:
	.asciz	"Number of Packets transmitted = %d\n"
	.align 8
.LC7:
	.asciz	"packet size = %d, lastTkeep = 0x%x\n"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -112, %sp
	call	__ajit_write_serial_control_register_via_bypass__, 0
	 mov	3, %o0
	sethi	%hi(.LC1), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC1), %o0
	mov	8, %o1
	mov	1, %o2
	call	cortos_reserveQueue, 0
	 mov	4, %o0
	mov	8, %o1
	mov	%o0, %i2
	mov	1, %o2
	call	cortos_reserveQueue, 0
	 mov	4, %o0
	mov	8, %o1
	mov	1, %o2
	mov	%o0, %i5
	call	cortos_reserveQueue, 0
	 mov	4, %o0
	mov	%o0, %i4
	call	cortos_bget_ncram, 0
	 mov	180, %o0
	st	%o0, [%fp-12]
	call	cortos_bget_ncram, 0
	 mov	180, %o0
	st	%o0, [%fp-8]
	call	cortos_bget_ncram, 0
	 mov	180, %o0
	add	%fp, -12, %o1
	st	%o0, [%fp-4]
	mov	3, %o2
	call	cortos_writeMessages, 0
	 mov	%i2, %o0
	mov	%i4, %o2
	mov	%i2, %o0
	call	nicRegInit, 0
	 mov	%i5, %o1
	ld	[%fp-12], %g1
	sethi	%hi(.LC2), %o0
	ld	[%g1+20], %i3
	ld	[%g1+12], %i0
	ld	[%g1+16], %i1
	ld	[%g1+8], %o1
	call	ee_printf, 0
	 or	%o0, %lo(.LC2), %o0
	mov	%i0, %o1
	sethi	%hi(.LC3), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC3), %o0
	mov	%i1, %o1
	sethi	%hi(.LC4), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC4), %o0
	mov	%i3, %o1
	sethi	%hi(.LC5), %o0
	sethi	%hi(.LC6), %i3
	or	%o0, %lo(.LC5), %o0
	call	ee_printf, 0
	 or	%i3, %lo(.LC6), %i3
	b	.L17
	 add	%fp, -16, %o1
.L8:
	call	readNicReg, 0
	 mov	21, %o0
	cmp	%o0, 1
	be	.L18
	 ld	[%fp-12], %o0
	add	%fp, -16, %o1
.L17:
	mov	1, %o2
	call	cortos_readMessages, 0
	 mov	%i5, %o0
	cmp	%o0, 0
	be	.L8
	 mov	1, %o2
	add	%fp, -16, %o1
	call	cortos_writeMessages, 0
	 mov	%i4, %o0
	call	readNicReg, 0
	 mov	21, %o0
	mov	%o0, %o1
	call	ee_printf, 0
	 mov	%i3, %o0
	call	readNicReg, 0
	 mov	21, %o0
	cmp	%o0, 1
	bne,a	.L17
	 add	%fp, -16, %o1
	ld	[%fp-12], %o0
.L18:
	ld	[%o0+4], %o2
	srl	%o2, 8, %o1
	and	%o2, 0xff, %o2
	add	%o1, 1, %o1
	sll	%o1, 16, %o1
	call	writeBufControlData, 0
	 srl	%o1, 16, %o1
	ld	[%fp-12], %g1
	ld	[%g1+4], %g1
	sethi	%hi(.LC7), %o0
	sll	%g1, 8, %o1
	and	%g1, 0xff, %o2
	srl	%o1, 16, %o1
	call	ee_printf, 0
	 or	%o0, %lo(.LC7), %o0
	mov	0, %o1
	call	writeNicReg, 0
	 mov	0, %o0
	call	cortos_freeQueue, 0
	 mov	%i5, %o0
	call	cortos_freeQueue, 0
	 mov	%i4, %o0
	call	cortos_freeQueue, 0
	 mov	%i2, %o0
	call	cortos_brel, 0
	 ld	[%fp-12], %o0
	call	cortos_brel, 0
	 ld	[%fp-8], %o0
	mov	0, %i0
	call	cortos_brel, 0
	 ld	[%fp-4], %o0
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
	.ident	"GCC: (Buildroot 2014.08-gc0f1a29) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
