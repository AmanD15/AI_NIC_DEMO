	.file	"main.c"
	.section	".text"
	.align 4
	.global generateNicQueue
	.type	generateNicQueue, #function
	.proc	020
generateNicQueue:
	save	%sp, -96, %sp
	mov	1, %o2
	mov	%i2, %o1
	call	cortos_reserveQueue, 0
	 mov	%i1, %o0
	mov	%i2, %o1
	st	%o0, [%i0]
	mov	1, %o2
	call	cortos_reserveQueue, 0
	 mov	%i1, %o0
	mov	%i2, %o1
	st	%o0, [%i0+4]
	mov	1, %o2
	call	cortos_reserveQueue, 0
	 mov	%i1, %o0
	st	%o0, [%i0+8]
	jmp	%i7+8
	 restore
	.size	generateNicQueue, .-generateNicQueue
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
	.global nicRegConfig
	.type	nicRegConfig, #function
	.proc	020
nicRegConfig:
	save	%sp, -96, %sp
	mov	1, %o0
	call	writeNicReg, 0
	 mov	1, %o1
	ld	[%i0+4], %o1
	call	writeNicReg, 0
	 mov	2, %o0
	ld	[%i0+8], %o1
	call	writeNicReg, 0
	 mov	10, %o0
	ld	[%i0], %o1
	mov	18, %o0
	call	writeNicReg, 0
	 mov	0, %i0
	call	writeNicReg, 0
	 restore %g0, 1, %o1
	.size	nicRegConfig, .-nicRegConfig
	.align 4
	.global readACCLReg
	.type	readACCLReg, #function
	.proc	016
readACCLReg:
	sll	%o0, 2, %o0
	sethi	%hi(ACCL_REG), %g1
	ld	[%g1+%lo(ACCL_REG)], %o1
	add	%o1, %o0, %o1
	sra	%o1, 31, %o0
	or	%o7, %g0, %g1
	call	__ajit_load_word_from_physical_address__, 0
	 or	%g1, %g0, %o7
	.size	readACCLReg, .-readACCLReg
	.align 4
	.global writeACCLReg
	.type	writeACCLReg, #function
	.proc	020
writeACCLReg:
	sll	%o0, 2, %g1
	sethi	%hi(ACCL_REG), %g2
	mov	%o1, %o0
	ld	[%g2+%lo(ACCL_REG)], %o2
	add	%o2, %g1, %o2
	sra	%o2, 31, %o1
	or	%o7, %g0, %g1
	call	__ajit_store_word_to_physical_address__, 0
	 or	%g1, %g0, %o7
	.size	writeACCLReg, .-writeACCLReg
	.align 4
	.global accessAcceleratorRegisters
	.type	accessAcceleratorRegisters, #function
	.proc	016
accessAcceleratorRegisters:
	save	%sp, -96, %sp
	cmp	%i0, 0
	bne	.L10
	 mov	%i1, %o0
	call	writeACCLReg, 0
	 mov	%i2, %o1
	jmp	%i7+8
	 restore
.L10:
	call	readACCLReg, 0
	 restore %g0, %i1, %o0
	.size	accessAcceleratorRegisters, .-accessAcceleratorRegisters
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"Received a layer\n"
	.align 8
.LC1:
	.asciz	"Time taken = %u %u\n"
	.section	".text"
	.align 4
	.global execute_layer
	.type	execute_layer, #function
	.proc	020
execute_layer:
	save	%sp, -96, %sp
	mov	0, %o0
	call	writeACCLReg, 0
	 mov	7, %o1
	call	readACCLReg, 0
	 mov	0, %o0
	mov	%o0, %i3
	andcc	%i3, 16, %g0
.L29:
	bne,a	.L28
	 sethi	%hi(.LC0), %o0
	call	readACCLReg, 0
	 mov	0, %o0
	mov	%o0, %i3
	call	readACCLReg, 0
	 mov	15, %o0
	call	cortos_get_clock_time, 0
	 nop
	addcc	%o1, 1000, %i5
	addx	%o0, 0, %i4
	cmp	%i4, %o0
	bgu	.L23
	 nop
.L30:
	bne	.L29
	 andcc	%i3, 16, %g0
	cmp	%i5, %o1
	bleu	.L29
	 andcc	%i3, 16, %g0
.L23:
	call	cortos_get_clock_time, 0
	 nop
	cmp	%i4, %o0
	bleu	.L30
	 nop
	call	cortos_get_clock_time, 0
	 nop
	cmp	%i4, %o0
	bleu	.L30
	 nop
	b,a	.L23
.L28:
	call	cortos_printf, 0
	 or	%o0, %lo(.LC0), %o0
	mov	0, %o0
	call	writeACCLReg, 0
	 mov	0, %o1
	call	cortos_get_clock_time, 0
	 sethi	%hi(.LC1), %i0
	mov	%o0, %i1
	or	%i0, %lo(.LC1), %i0
	call	cortos_printf, 0
	 restore %g0, %o1, %o2
	.size	execute_layer, .-execute_layer
	.align 4
	.global payloadAddressFromNetworkAddress
	.type	payloadAddressFromNetworkAddress, #function
	.proc	020
payloadAddressFromNetworkAddress:
	cmp	%o3, 0
	be	.L37
	 sll	%o2, 2, %o2
	sll	%o3, 2, %o3
	mov	0, %g1
	ld	[%o1+%g1], %g2
.L36:
	add	%g2, %o2, %g2
	st	%g2, [%o0+%g1]
	add	%g1, 4, %g1
	cmp	%g1, %o3
	bne,a	.L36
	 ld	[%o1+%g1], %g2
.L37:
	jmp	%o7+8
	 nop
	.size	payloadAddressFromNetworkAddress, .-payloadAddressFromNetworkAddress
	.align 4
	.global networkAddressFromPayloadAddress
	.type	networkAddressFromPayloadAddress, #function
	.proc	020
networkAddressFromPayloadAddress:
	cmp	%o3, 0
	be	.L44
	 sll	%o2, 2, %o2
	sll	%o3, 2, %o3
	sub	%g0, %o2, %o2
	mov	0, %g1
	ld	[%o0+%g1], %g2
.L43:
	add	%g2, %o2, %g2
	st	%g2, [%o1+%g1]
	add	%g1, 4, %g1
	cmp	%g1, %o3
	bne,a	.L43
	 ld	[%o0+%g1], %g2
.L44:
	jmp	%o7+8
	 nop
	.size	networkAddressFromPayloadAddress, .-networkAddressFromPayloadAddress
	.align 4
	.global byteToDoubleWord
	.type	byteToDoubleWord, #function
	.proc	020
byteToDoubleWord:
	sll	%o2, 2, %g3
	cmp	%o2, 0
	be	.L52
	 mov	0, %g1
	ld	[%o0+%g1], %g2
.L51:
	srl	%g2, 3, %g2
	st	%g2, [%o1+%g1]
	add	%g1, 4, %g1
	cmp	%g1, %g3
	bne,a	.L51
	 ld	[%o0+%g1], %g2
.L52:
	jmp	%o7+8
	 nop
	.size	byteToDoubleWord, .-byteToDoubleWord
	.align 4
	.global initialiseSpace
	.type	initialiseSpace, #function
	.proc	016
initialiseSpace:
	save	%sp, -96, %sp
	mov	0, %i5
	cmp	%i2, 0
	bne	.L62
	 mov	0, %i4
	b	.L67
	 mov	%i2, %i4
.L65:
	call	cortos_bget_ncram, 0
	 ld	[%i1+%i5], %o0
	cmp	%o0, 0
	be	.L55
	 st	%o0, [%i0+%i5]
.L66:
	add	%i4, 1, %i4
	cmp	%i4, %i2
	be	.L58
	 add	%i5, 4, %i5
.L62:
	cmp	%i3, 0
	bne	.L65
	 nop
	call	cortos_bget_ncram, 0
	 ld	[%i1], %o0
	cmp	%o0, 0
	bne	.L66
	 st	%o0, [%i0+%i5]
.L55:
	jmp	%i7+8
	 restore %g0, %i4, %o0
.L58:
	mov	%i2, %i4
.L67:
	jmp	%i7+8
	 restore %g0, %i4, %o0
	.size	initialiseSpace, .-initialiseSpace
	.align 4
	.global readNicRegs
	.type	readNicRegs, #function
	.proc	020
readNicRegs:
	jmp	%o7+8
	 nop
	.size	readNicRegs, .-readNicRegs
	.section	.rodata.str1.8
	.align 8
.LC2:
	.asciz	"value at buffer addr[0x%lx] = 0x%lx%lx\n"
	.section	".text"
	.align 4
	.global printBuffer
	.type	printBuffer, #function
	.proc	020
printBuffer:
	save	%sp, -96, %sp
	sethi	%hi(.LC2), %i3
	sra	%i1, 31, %i4
	mov	0, %i5
	and	%i4, 3, %i4
	add	%i4, %i1, %i4
	sra	%i4, 2, %i4
	cmp	%i4, 0
	ble	.L75
	 or	%i3, %lo(.LC2), %i3
.L73:
	mov	%i0, %o1
	ld	[%i0], %o2
	ld	[%i0+4], %o3
	call	cortos_printf, 0
	 mov	%i3, %o0
	add	%i5, 2, %i5
	cmp	%i5, %i4
	bl	.L73
	 add	%i0, 8, %i0
.L75:
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
	be	.L77
	 and	%o7, 2047, %o7
	st	%g1, [%i1+4]
.L77:
	ld	[%i0], %g1
	cmp	%g1, 1
	be,a	.L88
	 ld	[%i2+24], %g1
	ld	[%i3], %i4
	add	%i4, 1, %i4
.L79:
	sra	%o7, 2, %i0
	cmp	%i0, 10
	ble	.L83
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
.L81:
	ld	[%g1], %g4
	st	%g4, [%g2-4]
	ld	[%g1+4], %g4
	st	%g4, [%g2]
	st	%g3, [%i3]
	add	%g1, 8, %g1
	add	%g2, 8, %g2
	cmp	%g1, %i5
	bne	.L81
	 add	%g3, 2, %g3
	add	%i0, %i0, %g1
	add	%i4, 2, %i4
	add	%i0, 6, %i0
	add	%i4, %g1, %i4
	add	%i0, %i0, %i0
	add	%i0, -1, %g1
	sll	%g1, 2, %g1
.L80:
	cmp	%o7, %g1
	be	.L89
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
.L89:
	jmp	%i7+8
	 restore
.L88:
	st	%g1, [%i1+8]
	ld	[%i2+28], %g1
	st	%g1, [%i1+12]
	ld	[%i2+32], %g1
	st	%g1, [%i1+16]
	ld	[%i2+36], %g1
	st	%g1, [%i1+20]
	st	%g0, [%i0]
	b	.L79
	 mov	6, %i4
.L83:
	b	.L80
	 mov	10, %i0
	.size	storeFile, .-storeFile
	.align 4
	.global sendFile
	.type	sendFile, #function
	.proc	04
sendFile:
	save	%sp, -104, %sp
	ld	[%i0+4], %l7
	ld	[%i0+8], %l3
	ld	[%i0+12], %l2
	ld	[%i0+16], %l6
	ld	[%i0+20], %l1
	cmp	%i3, 1512
	bleu	.L91
	 add	%fp, -4, %i4
	sethi	%hi(33554432), %l5
	sethi	%hi(391168), %l4
	add	%i3, -24, %i3
	andn	%l6, %l5, %l5
	add	%i0, 24, %i5
	mov	6, %l0
	add	%fp, -4, %i4
	or	%l4, 255, %l4
	mov	%i1, %o0
.L138:
	mov	%i4, %o1
	call	cortos_readMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L138
	 mov	%i1, %o0
	ld	[%fp-4], %g1
	add	%i5, 1496, %g3
	st	%l4, [%g1+4]
	st	%l3, [%g1+24]
	st	%l2, [%g1+28]
	st	%l5, [%g1+32]
	st	%l1, [%g1+36]
	add	%g1, 40, %g1
.L93:
	ld	[%i5], %g2
	st	%g2, [%g1]
	ld	[%i5+4], %g2
	st	%g2, [%g1+4]
	add	%i5, 8, %i5
	cmp	%i5, %g3
	bne	.L93
	 add	%g1, 8, %g1
	add	%l0, 374, %l0
	mov	%i2, %o0
.L139:
	mov	%i4, %o1
	call	cortos_writeMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L139
	 mov	%i2, %o0
	add	%i3, -1496, %i3
	cmp	%i3, 1495
	bg	.L138
	 mov	%i1, %o0
	add	%i3, 32, %l4
.L140:
	mov	%i4, %o1
	call	cortos_readMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be,a	.L140
	 mov	%i1, %o0
	ld	[%fp-4], %i5
	sll	%l4, 16, %g1
	and	%l7, 255, %l7
	srl	%g1, 8, %g1
	sethi	%hi(33554432), %g2
	or	%g1, %l7, %g1
	or	%l6, %g2, %l6
	st	%g1, [%i5+4]
	st	%l3, [%i5+24]
	st	%l2, [%i5+28]
	st	%l6, [%i5+32]
	sra	%i3, 31, %g1
	and	%g1, 3, %g1
	add	%g1, %i3, %g1
	sra	%g1, 2, %g1
	cmp	%g1, 0
	ble	.L106
	 st	%l1, [%i5+36]
	add	%g1, -1, %g1
	add	%l0, 1, %g2
	srl	%g1, 1, %i1
	sll	%g2, 2, %g2
	add	%i5, 48, %g4
	sll	%i1, 3, %g3
	add	%i5, 40, %g1
	add	%i0, %g2, %g2
	add	%g4, %g3, %g4
.L98:
	ld	[%g2-4], %g3
	st	%g3, [%g1]
	ld	[%g2], %g3
	st	%g3, [%g1+4]
	add	%g1, 8, %g1
	cmp	%g1, %g4
	bne	.L98
	 add	%g2, 8, %g2
	add	%i1, 6, %g1
	add	%l0, 2, %l0
	add	%i1, %i1, %g3
	sll	%i1, 3, %g2
	add	%g1, %g1, %g1
	add	%l0, %g3, %l0
	add	%g2, 4, %g2
.L97:
	cmp	%i3, %g2
	be	.L120
	 sll	%g1, 2, %g2
	sll	%l0, 2, %g3
	ld	[%i0+%g3], %g3
	st	%g3, [%i5+%g2]
	add	%g1, 1, %g1
	add	%l0, 1, %g2
	sll	%g1, 2, %g1
	sll	%g2, 2, %g2
	ld	[%i0+%g2], %g2
	st	%g2, [%i5+%g1]
.L120:
	mov	%i2, %o0
.L141:
	mov	%i4, %o1
	call	cortos_writeMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L141
	 mov	%i2, %o0
	jmp	%i7+8
	 restore %g0, 0, %o0
.L91:
	mov	%i1, %o0
.L142:
	mov	%i4, %o1
	call	cortos_readMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be,a	.L142
	 mov	%i1, %o0
	ld	[%fp-4], %i1
	add	%i3, 8, %g1
	and	%l7, 255, %l7
	sll	%g1, 16, %g1
	st	%l3, [%i1+24]
	srl	%g1, 8, %g1
	st	%l2, [%i1+28]
	or	%g1, %l7, %g1
	st	%l6, [%i1+32]
	st	%g1, [%i1+4]
	srl	%i3, 2, %i5
	cmp	%i5, 6
	bleu	.L107
	 st	%l1, [%i1+36]
	add	%i1, 40, %g2
	mov	6, %g1
	mov	6, %g3
.L102:
	sll	%g1, 2, %g4
	add	%g1, 1, %g1
	ld	[%i0+%g4], %g4
	sll	%g1, 2, %g1
	st	%g4, [%g2]
	ld	[%i0+%g1], %g1
	st	%g1, [%g2+4]
	add	%g3, 6, %g4
	add	%g3, 2, %g1
	add	%g2, 8, %g2
	cmp	%g1, %i5
	blu	.L102
	 mov	%g1, %g3
	add	%g4, -1, %g2
	sll	%g2, 2, %g2
.L101:
	cmp	%i3, %g2
	be	.L129
	 sll	%g4, 2, %g2
	sll	%g1, 2, %g3
	add	%g1, 1, %g1
	ld	[%i0+%g3], %g3
	st	%g3, [%i1+%g2]
	add	%g4, 1, %g4
	sll	%g1, 2, %g2
	sll	%g4, 2, %g1
	ld	[%i0+%g2], %g2
	st	%g2, [%i1+%g1]
.L129:
	mov	%i2, %o0
.L143:
	mov	%i4, %o1
	call	cortos_writeMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L143
	 mov	%i2, %o0
	jmp	%i7+8
	 restore %g0, 0, %o0
.L107:
	mov	36, %g2
	mov	6, %g1
	b	.L101
	 mov	10, %g4
.L106:
	mov	-4, %g2
	b	.L97
	 mov	10, %g1
	.size	sendFile, .-sendFile
	.section	.rodata.str1.8
	.align 8
.LC3:
	.asciz	"Programmed a layer\n"
	.section	".text"
	.align 4
	.global execute_convolution_layer
	.type	execute_convolution_layer, #function
	.proc	020
execute_convolution_layer:
	save	%sp, -120, %sp
	ldub	[%fp+139], %g1
	lduh	[%fp+126], %g3
	lduh	[%fp+130], %g2
	lduh	[%fp+94], %o5
	lduh	[%fp+98], %g4
	st	%g1, [%fp-4]
	std	%g2, [%fp-16]
	st	%g4, [%fp-20]
	st	%o5, [%fp-24]
	ld	[%fp+112], %l2
	ld	[%fp+140], %l0
	ldub	[%fp+135], %l1
	ld	[%fp+100], %l7
	ld	[%fp+104], %l6
	ld	[%fp+108], %l5
	ld	[%fp+116], %l3
	ld	[%fp+120], %l4
	mov	1, %o0
	sll	%i0, 16, %o1
	call	writeACCLReg, 0
	 add	%i1, %o1, %o1
	mov	2, %o0
	sll	%i2, 16, %o1
	call	writeACCLReg, 0
	 add	%i3, %o1, %o1
	mov	3, %o0
	sll	%i4, 16, %o1
	call	writeACCLReg, 0
	 add	%i5, %o1, %o1
	ld	[%fp-24], %o5
	ld	[%fp-20], %g4
	sll	%o5, 16, %o1
	mov	4, %o0
	call	writeACCLReg, 0
	 add	%g4, %o1, %o1
	ld	[%fp-12], %g3
	ld	[%fp-16], %g2
	sll	%g3, 16, %o1
	mov	5, %o0
	call	writeACCLReg, 0
	 add	%g2, %o1, %o1
	ld	[%fp-4], %g1
	mov	6, %o0
	sll	%l1, 8, %o1
	call	writeACCLReg, 0
	 add	%o1, %g1, %o1
	mov	7, %o0
	call	writeACCLReg, 0
	 mov	%l7, %o1
	mov	8, %o0
	call	writeACCLReg, 0
	 mov	%l6, %o1
	mov	9, %o0
	call	writeACCLReg, 0
	 mov	%l2, %o1
	mov	10, %o0
	call	writeACCLReg, 0
	 mov	%l3, %o1
	mov	11, %o0
	call	writeACCLReg, 0
	 mov	%l5, %o1
	mov	%l4, %o1
	call	writeACCLReg, 0
	 mov	12, %o0
	sethi	%hi(.LC3), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC3), %o0
	call	execute_layer, 0
	 smul	%i0, %i1, %i0
	call	__ajit_serial_getchar_via_bypass__, 0
	 smul	%i0, %i4, %i4
	ld	[%l0], %o1
	sll	%l2, 3, %o0
	ld	[%l0+8], %o2
	add	%o0, -24, %o0
	call	sendFile, 0
	 add	%i4, 24, %o3
	cmp	%l1, 3
	be	.L146
	 sra	%i4, 31, %i3
	jmp	%i7+8
	 restore
.L146:
	call	__ajit_serial_getchar_via_bypass__, 0
	 and	%i3, 3, %i3
	sll	%l3, 3, %i0
	add	%i3, %i4, %i4
	add	%i0, -24, %i0
	sra	%i4, 2, %i3
	ld	[%l0], %i1
	ld	[%l0+8], %i2
	call	sendFile, 0
	 restore %i3, 24, %o3
	.size	execute_convolution_layer, .-execute_convolution_layer
	.align 4
	.global process_image
	.type	process_image, #function
	.proc	020
process_image:
	save	%sp, -152, %sp
	ld	[%i1], %g3
	ld	[%i0], %g2
	ld	[%i1+4], %g1
	mov	1, %i5
	mov	3, %i4
	st	%g3, [%sp+100]
	st	%g2, [%sp+108]
	st	%g1, [%sp+112]
	mov	224, %o0
	mov	224, %o1
	mov	224, %o2
	mov	224, %o3
	mov	64, %o4
	mov	3, %o5
	st	%i4, [%sp+92]
	st	%i4, [%sp+96]
	st	%g0, [%sp+104]
	st	%g0, [%sp+116]
	st	%i5, [%sp+120]
	st	%g0, [%sp+124]
	st	%i5, [%sp+128]
	st	%g0, [%sp+132]
	st	%i5, [%sp+136]
	call	execute_convolution_layer, 0
	 st	%i2, [%sp+140]
	ld	[%i1+4], %g4
	ld	[%i0+4], %g3
	ld	[%i1+8], %g2
	ld	[%i1], %g1
	st	%g4, [%sp+100]
	st	%g3, [%sp+108]
	st	%g2, [%sp+112]
	st	%g1, [%sp+116]
	mov	224, %o0
	mov	224, %o1
	mov	224, %o2
	mov	224, %o3
	mov	64, %o4
	mov	64, %o5
	st	%i4, [%sp+92]
	st	%i4, [%sp+96]
	st	%g0, [%sp+104]
	st	%i5, [%sp+120]
	st	%g0, [%sp+124]
	st	%i5, [%sp+128]
	st	%i4, [%sp+132]
	st	%i5, [%sp+136]
	call	execute_convolution_layer, 0
	 st	%i2, [%sp+140]
	ld	[%i1], %g3
	ld	[%i0+8], %g2
	ld	[%i1+4], %g1
	st	%g3, [%sp+100]
	st	%g2, [%sp+108]
	st	%g1, [%sp+112]
	mov	112, %o0
	mov	112, %o1
	mov	112, %o2
	mov	112, %o3
	mov	128, %o4
	mov	64, %o5
	st	%i4, [%sp+92]
	st	%i4, [%sp+96]
	st	%g0, [%sp+104]
	st	%g0, [%sp+116]
	st	%i5, [%sp+120]
	st	%g0, [%sp+124]
	st	%i5, [%sp+128]
	st	%g0, [%sp+132]
	st	%i5, [%sp+136]
	call	execute_convolution_layer, 0
	 st	%i2, [%sp+140]
	ld	[%i1+4], %g4
	ld	[%i0+12], %g3
	ld	[%i1+12], %g2
	ld	[%i1], %g1
	st	%g4, [%sp+100]
	st	%g3, [%sp+108]
	st	%g2, [%sp+112]
	st	%g1, [%sp+116]
	mov	112, %o0
	mov	112, %o1
	mov	112, %o2
	mov	112, %o3
	mov	128, %o4
	mov	128, %o5
	st	%i4, [%sp+92]
	st	%i4, [%sp+96]
	st	%g0, [%sp+104]
	st	%i5, [%sp+120]
	st	%g0, [%sp+124]
	st	%i5, [%sp+128]
	st	%i4, [%sp+132]
	st	%i5, [%sp+136]
	call	execute_convolution_layer, 0
	 st	%i2, [%sp+140]
	ld	[%i1], %g3
	ld	[%i0+16], %g2
	ld	[%i1+4], %g1
	st	%g3, [%sp+100]
	st	%g2, [%sp+108]
	st	%g1, [%sp+112]
	mov	56, %o0
	mov	56, %o1
	mov	56, %o2
	mov	56, %o3
	mov	256, %o4
	mov	128, %o5
	st	%i4, [%sp+92]
	st	%i4, [%sp+96]
	st	%g0, [%sp+104]
	st	%g0, [%sp+116]
	st	%i5, [%sp+120]
	st	%g0, [%sp+124]
	st	%i5, [%sp+128]
	st	%g0, [%sp+132]
	st	%i5, [%sp+136]
	call	execute_convolution_layer, 0
	 st	%i2, [%sp+140]
	ld	[%i1+4], %g4
	ld	[%i0+20], %g3
	ld	[%i1+16], %g2
	ld	[%i1], %g1
	st	%g4, [%sp+100]
	st	%g3, [%sp+108]
	st	%g2, [%sp+112]
	st	%g1, [%sp+116]
	mov	56, %o0
	mov	56, %o1
	mov	56, %o2
	mov	56, %o3
	mov	256, %o4
	mov	256, %o5
	st	%i4, [%sp+92]
	st	%i4, [%sp+96]
	st	%g0, [%sp+104]
	st	%i5, [%sp+120]
	st	%g0, [%sp+124]
	st	%i5, [%sp+128]
	st	%i4, [%sp+132]
	st	%i5, [%sp+136]
	call	execute_convolution_layer, 0
	 st	%i2, [%sp+140]
	ld	[%i1], %g3
	ld	[%i0+24], %g2
	ld	[%i1+4], %g1
	st	%g3, [%sp+100]
	st	%g2, [%sp+108]
	st	%g1, [%sp+112]
	mov	28, %o0
	mov	28, %o1
	mov	28, %o2
	mov	28, %o3
	mov	512, %o4
	mov	256, %o5
	st	%i4, [%sp+92]
	st	%i4, [%sp+96]
	st	%g0, [%sp+104]
	st	%g0, [%sp+116]
	st	%i5, [%sp+120]
	st	%g0, [%sp+124]
	st	%i5, [%sp+128]
	st	%g0, [%sp+132]
	st	%i5, [%sp+136]
	call	execute_convolution_layer, 0
	 st	%i2, [%sp+140]
	ld	[%i1+4], %g3
	ld	[%i0+28], %g2
	ld	[%i1], %g1
	st	%g3, [%sp+100]
	st	%g2, [%sp+108]
	st	%g1, [%sp+112]
	mov	28, %o0
	mov	28, %o1
	mov	28, %o2
	mov	28, %o3
	mov	512, %o4
	mov	512, %o5
	st	%i4, [%sp+92]
	st	%i4, [%sp+96]
	st	%g0, [%sp+104]
	st	%g0, [%sp+116]
	st	%i5, [%sp+120]
	st	%g0, [%sp+124]
	st	%i5, [%sp+128]
	st	%g0, [%sp+132]
	st	%i5, [%sp+136]
	call	execute_convolution_layer, 0
	 st	%i2, [%sp+140]
	ld	[%i1], %g3
	ld	[%i0+32], %g2
	ld	[%i1+4], %g1
	mov	2, %i3
	st	%g3, [%sp+100]
	st	%g2, [%sp+108]
	st	%g1, [%sp+112]
	mov	56, %o0
	mov	56, %o1
	mov	28, %o2
	mov	28, %o3
	mov	256, %o4
	mov	512, %o5
	st	%i3, [%sp+92]
	st	%i3, [%sp+96]
	st	%g0, [%sp+104]
	st	%g0, [%sp+116]
	st	%i5, [%sp+120]
	st	%g0, [%sp+124]
	st	%g0, [%sp+128]
	st	%g0, [%sp+132]
	st	%i5, [%sp+136]
	call	execute_convolution_layer, 0
	 st	%i2, [%sp+140]
	ld	[%i1+4], %g4
	ld	[%i0+36], %g2
	ld	[%i1], %g1
	sethi	%hi(-2147483648), %l0
	ld	[%i1+16], %g3
	add	%g3, %l0, %g3
	st	%g4, [%sp+100]
	st	%g3, [%sp+104]
	st	%g2, [%sp+108]
	st	%g1, [%sp+112]
	mov	56, %o0
	mov	56, %o1
	mov	56, %o2
	mov	56, %o3
	mov	256, %o4
	mov	512, %o5
	st	%i4, [%sp+92]
	st	%i4, [%sp+96]
	st	%g0, [%sp+116]
	st	%i5, [%sp+120]
	st	%g0, [%sp+124]
	st	%i5, [%sp+128]
	st	%g0, [%sp+132]
	st	%i5, [%sp+136]
	call	execute_convolution_layer, 0
	 st	%i2, [%sp+140]
	ld	[%i1], %g3
	ld	[%i0+40], %g2
	ld	[%i1+4], %g1
	st	%g3, [%sp+100]
	st	%g2, [%sp+108]
	st	%g1, [%sp+112]
	mov	56, %o0
	mov	56, %o1
	mov	56, %o2
	mov	56, %o3
	mov	256, %o4
	mov	256, %o5
	st	%i4, [%sp+92]
	st	%i4, [%sp+96]
	st	%g0, [%sp+104]
	st	%g0, [%sp+116]
	st	%i5, [%sp+120]
	st	%g0, [%sp+124]
	st	%i5, [%sp+128]
	st	%g0, [%sp+132]
	st	%i5, [%sp+136]
	call	execute_convolution_layer, 0
	 st	%i2, [%sp+140]
	ld	[%i1+4], %g3
	ld	[%i0+44], %g2
	ld	[%i1], %g1
	st	%g3, [%sp+100]
	st	%g2, [%sp+108]
	st	%g1, [%sp+112]
	mov	112, %o0
	mov	112, %o1
	mov	56, %o2
	mov	56, %o3
	mov	128, %o4
	mov	256, %o5
	st	%i3, [%sp+92]
	st	%i3, [%sp+96]
	st	%g0, [%sp+104]
	st	%g0, [%sp+116]
	st	%i5, [%sp+120]
	st	%g0, [%sp+124]
	st	%g0, [%sp+128]
	st	%g0, [%sp+132]
	st	%i5, [%sp+136]
	call	execute_convolution_layer, 0
	 st	%i2, [%sp+140]
	ld	[%i1], %g4
	ld	[%i0+48], %g2
	ld	[%i1+4], %g1
	ld	[%i1+12], %g3
	add	%g3, %l0, %g3
	st	%g4, [%sp+100]
	st	%g3, [%sp+104]
	st	%g2, [%sp+108]
	st	%g1, [%sp+112]
	mov	112, %o0
	mov	112, %o1
	mov	112, %o2
	mov	112, %o3
	mov	128, %o4
	mov	256, %o5
	st	%i4, [%sp+92]
	st	%i4, [%sp+96]
	st	%g0, [%sp+116]
	st	%i5, [%sp+120]
	st	%g0, [%sp+124]
	st	%i5, [%sp+128]
	st	%g0, [%sp+132]
	st	%i5, [%sp+136]
	call	execute_convolution_layer, 0
	 st	%i2, [%sp+140]
	ld	[%i1+4], %g3
	ld	[%i0+52], %g2
	ld	[%i1], %g1
	st	%g3, [%sp+100]
	st	%g2, [%sp+108]
	st	%g1, [%sp+112]
	mov	112, %o0
	mov	112, %o1
	mov	112, %o2
	mov	112, %o3
	mov	128, %o4
	mov	128, %o5
	st	%i4, [%sp+92]
	st	%i4, [%sp+96]
	st	%g0, [%sp+104]
	st	%g0, [%sp+116]
	st	%i5, [%sp+120]
	st	%g0, [%sp+124]
	st	%i5, [%sp+128]
	st	%g0, [%sp+132]
	st	%i5, [%sp+136]
	call	execute_convolution_layer, 0
	 st	%i2, [%sp+140]
	ld	[%i1], %g3
	ld	[%i0+56], %g2
	ld	[%i1+4], %g1
	st	%g3, [%sp+100]
	st	%g2, [%sp+108]
	st	%g1, [%sp+112]
	mov	224, %o0
	mov	224, %o1
	mov	112, %o2
	mov	112, %o3
	mov	64, %o4
	mov	128, %o5
	st	%i3, [%sp+92]
	st	%i3, [%sp+96]
	st	%g0, [%sp+104]
	st	%g0, [%sp+116]
	st	%i5, [%sp+120]
	st	%g0, [%sp+124]
	st	%g0, [%sp+128]
	st	%g0, [%sp+132]
	st	%i5, [%sp+136]
	call	execute_convolution_layer, 0
	 st	%i2, [%sp+140]
	ld	[%i1+8], %g1
	ld	[%i1+4], %g3
	ld	[%i0+60], %g2
	add	%g1, %l0, %l0
	ld	[%i1], %g1
	st	%g3, [%sp+100]
	st	%g2, [%sp+108]
	st	%g1, [%sp+112]
	mov	224, %o0
	mov	224, %o1
	mov	224, %o2
	mov	224, %o3
	mov	64, %o4
	mov	128, %o5
	st	%i4, [%sp+92]
	st	%i4, [%sp+96]
	st	%l0, [%sp+104]
	st	%g0, [%sp+116]
	st	%i5, [%sp+120]
	st	%g0, [%sp+124]
	st	%i5, [%sp+128]
	st	%g0, [%sp+132]
	st	%i5, [%sp+136]
	call	execute_convolution_layer, 0
	 st	%i2, [%sp+140]
	ld	[%i1], %g3
	ld	[%i0+64], %g2
	ld	[%i1+4], %g1
	st	%g3, [%sp+100]
	st	%g2, [%sp+108]
	st	%g1, [%sp+112]
	mov	224, %o0
	mov	224, %o1
	mov	224, %o2
	mov	224, %o3
	mov	64, %o4
	mov	64, %o5
	st	%i4, [%sp+92]
	st	%i4, [%sp+96]
	st	%g0, [%sp+104]
	st	%g0, [%sp+116]
	st	%i5, [%sp+120]
	st	%g0, [%sp+124]
	st	%i5, [%sp+128]
	st	%g0, [%sp+132]
	st	%i5, [%sp+136]
	call	execute_convolution_layer, 0
	 st	%i2, [%sp+140]
	ld	[%i1+4], %g3
	ld	[%i0+68], %g2
	ld	[%i1], %g1
	mov	224, %o0
	st	%i4, [%sp+92]
	st	%i4, [%sp+96]
	st	%g3, [%sp+100]
	st	%g0, [%sp+104]
	st	%g2, [%sp+108]
	st	%g1, [%sp+112]
	st	%g0, [%sp+116]
	st	%i5, [%sp+120]
	st	%g0, [%sp+124]
	st	%i5, [%sp+128]
	st	%g0, [%sp+132]
	st	%g0, [%sp+136]
	st	%i2, [%sp+140]
	mov	224, %o1
	mov	224, %o2
	mov	224, %o3
	mov	3, %o4
	call	execute_convolution_layer, 0
	 mov	64, %o5
	jmp	%i7+8
	 restore
	.size	process_image, .-process_image
	.align 4
	.global getConfigData
	.type	getConfigData, #function
	.proc	020
getConfigData:
	save	%sp, -104, %sp
	mov	1, %g1
	sethi	%hi(23552), %l1
	st	%g1, [%fp-4]
	sethi	%hi(33554432), %l0
	mov	%i2, %o0
.L173:
	add	%fp, -8, %o1
	call	cortos_readMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L173
	 mov	%i2, %o0
	ld	[%fp-8], %i5
	add	%fp, -4, %o0
	mov	%i0, %o1
	mov	%i5, %o2
	call	storeFile, 0
	 mov	%i4, %o3
	ld	[%i5+32], %g1
	st	%l1, [%i5+4]
	or	%g1, 1, %g1
	st	%g1, [%i5+32]
	mov	%i3, %o0
.L174:
	add	%fp, -8, %o1
	call	cortos_writeMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L174
	 mov	%i3, %o0
	mov	%i1, %o0
.L175:
	add	%fp, -8, %o1
	call	cortos_writeMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be,a	.L175
	 mov	%i1, %o0
	ld	[%i5+32], %g1
	andcc	%g1, %l0, %g0
	be	.L173
	 mov	%i2, %o0
	jmp	%i7+8
	 restore
	.size	getConfigData, .-getConfigData
	.section	.rodata.str1.8
	.align 8
.LC4:
	.asciz	"File %u received\n"
	.align 8
.LC5:
	.asciz	"free_queue[%d] = 0x%lx\n"
	.section	".text"
	.align 4
	.global getFilesThroughEthernet
	.type	getFilesThroughEthernet, #function
	.proc	016
getFilesThroughEthernet:
	save	%sp, -104, %sp
	cmp	%i2, 0
	be	.L179
	 mov	0, %i5
	sethi	%hi(.LC4), %i3
	or	%i3, %lo(.LC4), %i3
.L178:
	ld	[%i1], %o0
	ld	[%i0+4], %o2
	ld	[%i0+8], %o3
	add	%fp, -4, %o4
	call	getConfigData, 0
	 ld	[%i0], %o1
	mov	%i5, %o1
	call	cortos_printf, 0
	 mov	%i3, %o0
	add	%i5, 1, %i5
	cmp	%i5, %i2
	bne	.L178
	 add	%i1, 4, %i1
	mov	%i2, %i3
.L177:
	ld	[%i0], %g1
	sethi	%hi(.LC5), %i5
	mov	%i3, %o1
	ld	[%g1+8], %o2
	call	cortos_printf, 0
	 or	%i5, %lo(.LC5), %o0
	ld	[%i0], %g1
	mov	%i3, %o1
	ld	[%g1+4], %o2
	call	cortos_printf, 0
	 or	%i5, %lo(.LC5), %o0
	ld	[%i0], %g1
	or	%i5, %lo(.LC5), %o0
	mov	%i3, %o1
	ld	[%g1], %o2
	call	cortos_printf, 0
	 mov	%i2, %i0
	jmp	%i7+8
	 restore
.L179:
	b	.L177
	 mov	0, %i3
	.size	getFilesThroughEthernet, .-getFilesThroughEthernet
	.section	.rodata.str1.8
	.align 8
.LC6:
	.asciz	"File %u sent back\n"
	.section	".text"
	.align 4
	.global sendFilesThroughEthernet
	.type	sendFilesThroughEthernet, #function
	.proc	016
sendFilesThroughEthernet:
	save	%sp, -96, %sp
	mov	0, %i4
	mov	%i0, %l0
	mov	0, %i5
	sethi	%hi(.LC6), %i0
	cmp	%i3, 0
	be	.L187
	 or	%i0, %lo(.LC6), %i0
.L185:
	call	__ajit_serial_getchar_via_bypass__, 0
	 nop
	ld	[%i2+%i4], %o3
	ld	[%l0+8], %o2
	ld	[%i1+%i4], %o0
	call	sendFile, 0
	 ld	[%l0], %o1
	mov	%i5, %o1
	call	cortos_printf, 0
	 mov	%i0, %o0
	add	%i5, 1, %i5
	cmp	%i5, %i3
	bne	.L185
	 add	%i4, 4, %i4
.L187:
	jmp	%i7+8
	 restore %g0, %i3, %o0
	.size	sendFilesThroughEthernet, .-sendFilesThroughEthernet
	.section	.rodata.str1.8
	.align 8
.LC7:
	.asciz	"Queues initialised\n"
	.align 8
.LC8:
	.asciz	"Packet init error\n"
	.align 8
.LC9:
	.asciz	"Memory spaces initialised\n"
	.align 8
.LC10:
	.asciz	"%x %x %x\n"
	.align 8
.LC11:
	.asciz	"%x %x\n"
	.align 8
.LC12:
	.asciz	"ERROR"
	.align 8
.LC13:
	.asciz	"../main.c"
	.align 8
.LC14:
	.asciz	"Free queue push failed\n"
	.align 8
.LC15:
	.asciz	"Free queues initialised\n"
	.align 8
.LC16:
	.asciz	"NIC started\n"
	.align 8
.LC17:
	.asciz	"HI\n"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -376, %sp
	call	__ajit_write_serial_control_register_via_bypass__, 0
	 mov	3, %o0
	mov	4, %o1
	mov	64, %o2
	call	generateNicQueue, 0
	 add	%fp, -268, %o0
	sethi	%hi(.LC7), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC7), %o0
	mov	1600, %g1
	st	%g1, [%fp-276]
	sethi	%hi(999424), %g1
	or	%g1, 576, %g1
	add	%fp, -256, %o0
	st	%g1, [%fp-280]
	add	%fp, -276, %o1
	mov	64, %o2
	mov	0, %o3
	call	initialiseSpace, 0
	 sethi	%hi(.LC8), %i5
	cmp	%o0, 64
	be	.L202
	 add	%fp, -272, %o0
	call	cortos_printf, 0
	 or	%i5, %lo(.LC8), %o0
	add	%fp, -272, %o0
.L202:
	add	%fp, -280, %o1
	mov	1, %o2
	call	initialiseSpace, 0
	 mov	0, %o3
	cmp	%o0, 1
	be,a	.L203
	 sethi	%hi(.LC9), %o0
	call	cortos_printf, 0
	 or	%i5, %lo(.LC8), %o0
	sethi	%hi(.LC9), %o0
.L203:
	call	cortos_printf, 0
	 or	%o0, %lo(.LC9), %o0
	ld	[%fp-268], %o3
	ld	[%fp-264], %o1
	ld	[%fp-260], %o2
	sethi	%hi(.LC10), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC10), %o0
	ld	[%fp-272], %o1
	ld	[%fp-256], %o2
	sethi	%hi(.LC11), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC11), %o0
	ld	[%fp-268], %o0
	add	%fp, -256, %o1
	call	cortos_writeMessages, 0
	 mov	63, %o2
	cmp	%o0, 63
	be	.L191
	 sethi	%hi(.LC13), %o1
	sethi	%hi(.LC12), %o0
	sethi	%hi(__func__.2489), %o2
	sethi	%hi(.LC14), %o4
	or	%o0, %lo(.LC12), %o0
	or	%o1, %lo(.LC13), %o1
	or	%o2, %lo(__func__.2489), %o2
	mov	31, %o3
	call	__cortos_log_printf, 0
	 or	%o4, %lo(.LC14), %o4
.L191:
	sethi	%hi(.LC15), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC15), %o0
	call	nicRegConfig, 0
	 add	%fp, -268, %o0
	sethi	%hi(.LC16), %o0
	sethi	%hi(.LC17), %i5
	or	%o0, %lo(.LC16), %o0
	call	cortos_printf, 0
	 or	%i5, %lo(.LC17), %i5
.L192:
	call	__ajit_serial_getchar_via_bypass__, 0
	 nop
	call	cortos_printf, 0
	 mov	%i5, %o0
	b,a	.L192
	.size	main, .-main
	.global ACCL_REG
	.section	".data"
	.align 4
	.type	ACCL_REG, #object
	.size	ACCL_REG, 4
ACCL_REG:
	.long	268500992
	.global NIC_REG
	.align 4
	.type	NIC_REG, #object
	.size	NIC_REG, 4
NIC_REG:
	.long	268435456
	.section	".rodata"
	.align 8
	.type	__func__.2489, #object
	.size	__func__.2489, 5
__func__.2489:
	.asciz	"main"
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
