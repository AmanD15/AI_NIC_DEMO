	.file	"decl.c"
	.section	".text"
	.align 4
	.global generateNicQueue
	.type	generateNicQueue, #function
	.proc	010
generateNicQueue:
	save	%sp, -96, %sp
	mov	1, %o2
	ld	[%fp+64], %i5
	mov	%i1, %o1
	call	cortos_reserveQueue, 0
	 mov	%i0, %o0
	mov	%i1, %o1
	mov	%o0, %i4
	mov	1, %o2
	call	cortos_reserveQueue, 0
	 mov	%i0, %o0
	mov	%i1, %o1
	mov	%o0, %i3
	mov	1, %o2
	mov	%i0, %o0
	call	cortos_reserveQueue, 0
	 mov	%i5, %i0
	st	%i3, [%i5+4]
	st	%o0, [%i5]
	st	%i4, [%i5+8]
	jmp	%i7+12
	 restore
	.size	generateNicQueue, .-generateNicQueue
	.align 4
	.global loadEthernetHeader
	.type	loadEthernetHeader, #function
	.proc	020
loadEthernetHeader:
	sethi	%hi(167779328), %g1
	or	%g1, 782, %g1
	st	%g1, [%o0+24]
	sethi	%hi(359784448), %g1
	or	%g1, 304, %g1
	st	%g1, [%o0+28]
	sethi	%hi(1750335488), %g1
	or	%g1, 8, %g1
	st	%g1, [%o0+32]
	sethi	%hi(175506432), %g1
	or	%g1, 309, %g1
	jmp	%o7+8
	 st	%g1, [%o0+36]
	.size	loadEthernetHeader, .-loadEthernetHeader
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
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"NIC_REG[%d] = 0x%x\n"
	.section	".text"
	.align 4
	.global readNicRegs
	.type	readNicRegs, #function
	.proc	020
readNicRegs:
	save	%sp, -96, %sp
	sethi	%hi(.LC0), %i4
	mov	0, %i5
	or	%i4, %lo(.LC0), %i4
.L5:
	call	readNicReg, 0
	 mov	%i5, %o0
	mov	%i5, %o1
	mov	%o0, %o2
	call	ee_printf, 0
	 mov	%i4, %o0
	add	%i5, 1, %i5
	cmp	%i5, 64
	bne	.L5
	 nop
	jmp	%i7+8
	 restore
	.size	readNicRegs, .-readNicRegs
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
	.section	.rodata.str1.8
	.align 8
.LC1:
	.asciz	"NIC_REG[22]=0x%x\n"
	.align 8
.LC2:
	.asciz	"NIC reg 2 = 0x%x\t NQ.rx_queue = 0x%lx\n"
	.align 8
.LC3:
	.asciz	"NIC config done\n"
	.section	".text"
	.align 4
	.global nicRegConfig
	.type	nicRegConfig, #function
	.proc	020
nicRegConfig:
	save	%sp, -96, %sp
	call	readNicReg, 0
	 mov	22, %o0
	mov	%o0, %o1
	sethi	%hi(.LC1), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC1), %o0
	call	readNicReg, 0
	 mov	2, %o0
	mov	%i1, %o2
	mov	%o0, %o1
	sethi	%hi(.LC2), %i5
	call	cortos_printf, 0
	 or	%i5, %lo(.LC2), %o0
	mov	1, %o0
	call	writeNicReg, 0
	 mov	1, %o1
	mov	2, %o0
	call	writeNicReg, 0
	 mov	%i1, %o1
	mov	10, %o0
	call	writeNicReg, 0
	 mov	%i2, %o1
	mov	%i0, %o1
	call	writeNicReg, 0
	 mov	18, %o0
	call	readNicReg, 0
	 mov	2, %o0
	mov	%i1, %o2
	mov	%o0, %i4
	or	%i5, %lo(.LC2), %o0
	call	cortos_printf, 0
	 mov	%i4, %o1
	cmp	%i1, %i4
	be	.L10
	 mov	0, %o0
.L12:
	b,a	.L12
.L10:
	mov	0, %o1
	call	writeNicReg, 0
	 sethi	%hi(.LC3), %i0
	call	cortos_printf, 0
	 restore %i0, %lo(.LC3), %o0
	.size	nicRegConfig, .-nicRegConfig
	.section	.rodata.str1.8
	.align 8
.LC4:
	.asciz	"data at addr = 0x%lx%lx is 0x%x\n"
	.section	".text"
	.align 4
	.global readMemory
	.type	readMemory, #function
	.proc	020
readMemory:
	save	%sp, -96, %sp
	mov	%i0, %o0
	mov	%i1, %o1
	call	__ajit_load_word_from_physical_address__, 0
	 mov	%i1, %i2
	mov	%i0, %i1
	mov	%i0, %i3
	mov	%i2, %i4
	sethi	%hi(.LC4), %i0
	mov	%o0, %i5
	call	ee_printf, 0
	 restore %i0, %lo(.LC4), %o0
	.size	readMemory, .-readMemory
	.section	.rodata.str1.8
	.align 8
.LC5:
	.asciz	"value at buffer addr[0x%lx] = 0x%lx%lx\n"
	.section	".text"
	.align 4
	.global printBuffer
	.type	printBuffer, #function
	.proc	020
printBuffer:
	save	%sp, -96, %sp
	sethi	%hi(.LC5), %i3
	sra	%i1, 31, %i4
	mov	0, %i5
	and	%i4, 3, %i4
	add	%i4, %i1, %i4
	sra	%i4, 2, %i4
	cmp	%i4, 0
	ble	.L20
	 or	%i3, %lo(.LC5), %i3
.L18:
	mov	%i0, %o1
	ld	[%i0], %o2
	ld	[%i0+4], %o3
	call	cortos_printf, 0
	 mov	%i3, %o0
	add	%i5, 2, %i5
	cmp	%i5, %i4
	bl	.L18
	 add	%i0, 8, %i0
.L20:
	jmp	%i7+8
	 restore
	.size	printBuffer, .-printBuffer
	.align 4
	.global storeFile
	.type	storeFile, #function
	.proc	020
storeFile:
	save	%sp, -96, %sp
	sethi	%hi(33554432), %g3
	ld	[%i2+4], %g1
	ld	[%i2+32], %g2
	sra	%g1, 8, %o7
	andcc	%g2, %g3, %g0
	be	.L22
	 and	%o7, 2047, %o7
	st	%g1, [%i1+4]
.L22:
	ld	[%i0], %g1
	cmp	%g1, 1
	be,a	.L33
	 ld	[%i2+24], %g1
	ld	[%i3], %i4
	add	%i4, 1, %i4
.L24:
	sra	%o7, 2, %i0
	cmp	%i0, 10
	ble	.L28
	 mov	36, %g1
	add	%i4, 1, %g3
	add	%i0, -11, %i0
	sll	%g3, 2, %g2
	srl	%i0, 1, %i0
	add	%i2, 48, %i5
	sll	%i0, 3, %g4
	add	%i2, 40, %g1
	add	%i1, %g2, %g2
	add	%i5, %g4, %i5
.L26:
	ld	[%g1], %g4
	st	%g4, [%g2-4]
	ld	[%g1+4], %g4
	st	%g4, [%g2]
	st	%g3, [%i3]
	add	%g1, 8, %g1
	add	%g2, 8, %g2
	cmp	%g1, %i5
	bne	.L26
	 add	%g3, 2, %g3
	add	%i0, %i0, %g1
	add	%i4, 2, %i4
	add	%i0, 6, %i0
	add	%i4, %g1, %i4
	add	%i0, %i0, %i0
	add	%i0, -1, %g1
	sll	%g1, 2, %g1
.L25:
	cmp	%o7, %g1
	be	.L34
	 sll	%i4, 2, %g1
	sll	%i0, 2, %g2
	ld	[%i2+%g2], %g2
	st	%g2, [%i1+%g1]
	add	%i4, 1, %i4
	add	%i0, 1, %i0
	sll	%i4, 2, %g1
	sll	%i0, 2, %i0
	ld	[%i2+%i0], %g2
	st	%g2, [%i1+%g1]
	st	%i4, [%i3]
.L34:
	jmp	%i7+8
	 restore
.L33:
	st	%g1, [%i1+8]
	ld	[%i2+28], %g1
	st	%g1, [%i1+12]
	ld	[%i2+32], %g1
	st	%g1, [%i1+16]
	ld	[%i2+36], %g1
	st	%g1, [%i1+20]
	st	%g0, [%i0]
	b	.L24
	 mov	6, %i4
.L28:
	b	.L25
	 mov	10, %i0
	.size	storeFile, .-storeFile
	.section	.rodata.str1.8
	.align 8
.LC6:
	.asciz	"free_queue empty\n"
	.align 8
.LC7:
	.asciz	"tx_queue full\n"
	.align 8
.LC8:
	.asciz	"free_queue empty!\n"
	.align 8
.LC9:
	.asciz	"tx_queue full!\n"
	.section	".text"
	.align 4
	.global sendFile
	.type	sendFile, #function
	.proc	04
sendFile:
	save	%sp, -112, %sp
	ld	[%i0+4], %g1
	ld	[%i0+16], %g2
	st	%g1, [%fp-16]
	st	%g2, [%fp-12]
	add	%i3, 1, %l1
	ld	[%i0+8], %l4
	sll	%l1, 2, %i4
	ld	[%i0+12], %l3
	cmp	%i4, 1512
	bg	.L65
	 ld	[%i0+20], %l2
	sethi	%hi(.LC8), %l0
	add	%fp, -4, %i5
	b	.L36
	 or	%l0, %lo(.LC8), %l0
.L68:
	call	cortos_printf, 0
	 mov	%l0, %o0
.L36:
	mov	%i5, %o1
	mov	1, %o2
	call	cortos_readMessages, 0
	 mov	%i1, %o0
	cmp	%o0, 0
	be	.L68
	 add	%i3, 3, %g2
	sll	%g2, 18, %g2
	srl	%g2, 8, %g2
	ld	[%fp-4], %o0
	ld	[%fp-16], %g3
	st	%l4, [%o0+24]
	and	%g3, 255, %g1
	st	%l3, [%o0+28]
	or	%g2, %g1, %g1
	st	%l2, [%o0+36]
	ld	[%fp-12], %g2
	st	%g1, [%o0+4]
	cmp	%l1, 6
	ble	.L56
	 st	%g2, [%o0+32]
	add	%i3, -6, %i3
	add	%i0, 24, %g2
	srl	%i3, 1, %i1
	add	%o0, 40, %g1
	add	%i1, 6, %i3
	mov	10, %g3
	add	%i3, %i3, %i3
.L52:
	ld	[%g2], %g4
	st	%g4, [%g1]
	ld	[%g2+4], %g4
	st	%g4, [%g1+4]
	add	%g3, 2, %g3
	add	%g2, 8, %g2
	cmp	%g3, %i3
	bne	.L52
	 add	%g1, 8, %g1
	add	%i1, 4, %g1
	add	%g3, -1, %g2
	add	%g1, %g1, %g1
	sll	%g2, 2, %g2
.L51:
	cmp	%i4, %g2
	be	.L53
	 sll	%g3, 2, %g2
	sll	%g1, 2, %g4
	add	%g1, 1, %g1
	ld	[%i0+%g4], %g4
	st	%g4, [%o0+%g2]
	add	%g3, 1, %g3
	sll	%g1, 2, %g2
	sll	%g3, 2, %g1
	ld	[%i0+%g2], %g2
	st	%g2, [%o0+%g1]
.L53:
	mov	1700, %o1
	call	printBuffer, 0
	 sethi	%hi(.LC9), %i4
	b	.L54
	 or	%i4, %lo(.LC9), %i4
.L69:
	call	cortos_printf, 0
	 mov	%i4, %o0
.L54:
	mov	%i5, %o1
	mov	1, %o2
	call	cortos_writeMessages, 0
	 mov	%i2, %o0
	cmp	%o0, 0
	be	.L69
	 nop
	jmp	%i7+8
	 restore
.L65:
	add	%i3, -5, %i3
	sethi	%hi(33554432), %l6
	ld	[%fp-12], %g3
	sll	%i3, 2, %l0
	sethi	%hi(391168), %l5
	sethi	%hi(.LC6), %i3
	sethi	%hi(.LC7), %i4
	andn	%g3, %l6, %l6
	add	%i0, 24, %l7
	mov	6, %l1
	add	%fp, -4, %i5
	or	%i3, %lo(.LC6), %i3
	or	%l5, 255, %l5
	b	.L64
	 or	%i4, %lo(.LC7), %i4
.L70:
	call	cortos_printf, 0
	 mov	%i3, %o0
.L64:
	mov	%i1, %o0
.L74:
	mov	%i5, %o1
	call	cortos_readMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L70
	 ld	[%fp-4], %g2
	add	%l7, 1496, %g4
	st	%l5, [%g2+4]
	st	%l4, [%g2+24]
	st	%l3, [%g2+28]
	st	%l6, [%g2+32]
	st	%l2, [%g2+36]
	add	%g2, 40, %g2
.L39:
	ld	[%l7], %g3
	st	%g3, [%g2]
	ld	[%l7+4], %g3
	st	%g3, [%g2+4]
	add	%l7, 8, %l7
	cmp	%l7, %g4
	bne	.L39
	 add	%g2, 8, %g2
	b	.L41
	 add	%l1, 374, %l1
.L71:
	call	cortos_printf, 0
	 mov	%i4, %o0
.L41:
	mov	%i5, %o1
	mov	1, %o2
	call	cortos_writeMessages, 0
	 mov	%i2, %o0
	cmp	%o0, 0
	be	.L71
	 nop
	add	%l0, -1496, %l0
	cmp	%l0, 1495
	bg	.L74
	 mov	%i1, %o0
	sethi	%hi(.LC8), %i4
	add	%l0, 32, %i3
	b	.L44
	 or	%i4, %lo(.LC8), %i4
.L72:
	call	cortos_printf, 0
	 mov	%i4, %o0
.L44:
	mov	%i5, %o1
	mov	1, %o2
	call	cortos_readMessages, 0
	 mov	%i1, %o0
	cmp	%o0, 0
	be	.L72
	 ld	[%fp-16], %g3
	sll	%i3, 16, %g2
	srl	%g2, 8, %g2
	ld	[%fp-4], %i4
	and	%g3, 255, %g1
	st	%l4, [%i4+24]
	or	%g2, %g1, %g1
	ld	[%fp-12], %g3
	sethi	%hi(33554432), %g2
	st	%g1, [%i4+4]
	or	%g3, %g2, %l7
	st	%l3, [%i4+28]
	st	%l7, [%i4+32]
	sra	%l0, 31, %g1
	and	%g1, 3, %g1
	add	%g1, %l0, %g1
	sra	%g1, 2, %g1
	cmp	%g1, 0
	ble	.L55
	 st	%l2, [%i4+36]
	add	%g1, -1, %g1
	add	%l1, 1, %g2
	srl	%g1, 1, %i3
	sll	%g2, 2, %g2
	add	%i4, 48, %g4
	sll	%i3, 3, %g3
	add	%i4, 40, %g1
	add	%i0, %g2, %g2
	add	%g4, %g3, %g4
.L46:
	ld	[%g2-4], %g3
	st	%g3, [%g1]
	ld	[%g2], %g3
	st	%g3, [%g1+4]
	add	%g1, 8, %g1
	cmp	%g1, %g4
	bne	.L46
	 add	%g2, 8, %g2
	add	%i3, 6, %g1
	add	%l1, 2, %l1
	add	%i3, %i3, %g3
	sll	%i3, 3, %g2
	add	%g1, %g1, %g1
	add	%l1, %g3, %l1
	add	%g2, 4, %g2
.L45:
	cmp	%g2, %l0
	be	.L49
	 sll	%g1, 2, %g2
	sll	%l1, 2, %g3
	ld	[%i0+%g3], %g3
	st	%g3, [%i4+%g2]
	add	%g1, 1, %g1
	add	%l1, 1, %g2
	sll	%g1, 2, %g1
	sll	%g2, 2, %g2
	ld	[%i0+%g2], %g2
	st	%g2, [%i4+%g1]
.L49:
	sethi	%hi(.LC7), %i4
	b	.L66
	 or	%i4, %lo(.LC7), %i4
.L73:
	call	cortos_printf, 0
	 mov	%i4, %o0
.L66:
	mov	%i5, %o1
	mov	1, %o2
	call	cortos_writeMessages, 0
	 mov	%i2, %o0
	cmp	%o0, 0
	be	.L73
	 nop
	jmp	%i7+8
	 restore
.L56:
	mov	36, %g2
	mov	6, %g1
	b	.L51
	 mov	10, %g3
.L55:
	mov	-4, %g2
	b	.L45
	 mov	10, %g1
	.size	sendFile, .-sendFile
	.section	.rodata.str1.8
	.align 8
.LC10:
	.asciz	"rx_queue = 0x%lx\n"
	.align 8
.LC11:
	.asciz	"free_queue : \n\treadIndex = %d\n\twriteIndex = %d\n\ttotalmMsgs = %d\n\n"
	.align 8
.LC12:
	.asciz	"rx_queue : \n\treadIndex = %d\n\twriteIndex = %d\n\ttotalmMsgs = %d\n\n"
	.align 8
.LC13:
	.asciz	"Got RX packet\n"
	.align 8
.LC14:
	.asciz	"rx queue pop data = 0x%lx\n"
	.align 8
.LC15:
	.asciz	"Unable to push to free queue.\n"
	.align 8
.LC16:
	.asciz	"Not last packet of file\n"
	.align 8
.LC17:
	.asciz	"No packet found empty rx_queue\n"
	.section	".text"
	.align 4
	.global getConfigData
	.type	getConfigData, #function
	.proc	020
getConfigData:
	save	%sp, -104, %sp
	mov	1, %g1
	sethi	%hi(.LC10), %l2
	sethi	%hi(.LC11), %l1
	sethi	%hi(.LC12), %l0
	sethi	%hi(.LC13), %l3
	sethi	%hi(.LC15), %i5
	sethi	%hi(.LC16), %l5
	sethi	%hi(.LC17), %l6
	st	%g1, [%fp-4]
	sethi	%hi(.LC14), %l4
	or	%l2, %lo(.LC10), %l2
	or	%l1, %lo(.LC11), %l1
	or	%l0, %lo(.LC12), %l0
	or	%l3, %lo(.LC13), %l3
	or	%i5, %lo(.LC15), %i5
	or	%l5, %lo(.LC16), %l5
	or	%l6, %lo(.LC17), %l6
.L82:
	call	readNicRegs, 0
	 nop
	mov	%i2, %o1
	call	cortos_printf, 0
	 mov	%l2, %o0
	ld	[%i1+4], %o1
	ld	[%i1+8], %o2
	ld	[%i1], %o3
	call	cortos_printf, 0
	 mov	%l1, %o0
	ld	[%i2+8], %o2
	ld	[%i2], %o3
	ld	[%i2+4], %o1
	call	cortos_printf, 0
	 mov	%l0, %o0
	mov	%i2, %o0
	call	printBuffer, 0
	 mov	305, %o1
	mov	%i2, %o0
	add	%fp, -8, %o1
	call	cortos_readMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L77
	 nop
	call	cortos_printf, 0
	 mov	%l3, %o0
	add	%fp, -4, %o0
	ld	[%fp-8], %i4
	mov	%i0, %o1
	mov	%i4, %o2
	call	storeFile, 0
	 mov	%i3, %o3
	mov	%i4, %o1
	call	cortos_printf, 0
	 or	%l4, %lo(.LC14), %o0
	mov	%i4, %o0
	call	printBuffer, 0
	 mov	1700, %o1
	b	.L84
	 add	%fp, -8, %o1
.L83:
	call	cortos_printf, 0
	 mov	%i5, %o0
	add	%fp, -8, %o1
.L84:
	mov	1, %o2
	call	cortos_writeMessages, 0
	 mov	%i1, %o0
	cmp	%o0, 0
	be	.L83
	 sethi	%hi(33554432), %g1
	ld	[%i4+32], %g2
	andcc	%g2, %g1, %g0
	bne	.L85
	 nop
	call	cortos_printf, 0
	 mov	%l5, %o0
	b,a	.L82
.L77:
	call	cortos_printf, 0
	 mov	%l6, %o0
	b,a	.L82
.L85:
	jmp	%i7+8
	 restore
	.size	getConfigData, .-getConfigData
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
