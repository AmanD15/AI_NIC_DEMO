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
.LC1:
	.asciz	"Received a layer\n"
	.align 8
.LC2:
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
	 sethi	%hi(.LC1), %o0
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
	 or	%o0, %lo(.LC1), %o0
	mov	0, %o0
	call	writeACCLReg, 0
	 mov	0, %o1
	call	cortos_get_clock_time, 0
	 sethi	%hi(.LC2), %i0
	mov	%o0, %i1
	or	%i0, %lo(.LC2), %i0
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
.LC3:
	.asciz	"value at buffer addr[0x%lx] = 0x%lx%lx\n"
	.section	".text"
	.align 4
	.global printBuffer
	.type	printBuffer, #function
	.proc	020
printBuffer:
	save	%sp, -96, %sp
	sethi	%hi(.LC3), %i3
	sra	%i1, 31, %i4
	mov	0, %i5
	and	%i4, 3, %i4
	add	%i4, %i1, %i4
	sra	%i4, 2, %i4
	cmp	%i4, 0
	ble	.L75
	 or	%i3, %lo(.LC3), %i3
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
.L113:
	add	%fp, -8, %o1
	call	cortos_readMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L113
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
.L114:
	add	%fp, -8, %o1
	call	cortos_writeMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L114
	 mov	%i3, %o0
	mov	%i1, %o0
.L115:
	add	%fp, -8, %o1
	call	cortos_writeMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be,a	.L115
	 mov	%i1, %o0
	ld	[%i5+32], %g1
	andcc	%g1, %l0, %g0
	be	.L113
	 mov	%i2, %o0
	jmp	%i7+8
	 restore
	.size	getConfigData, .-getConfigData
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
	bleu	.L117
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
.L164:
	mov	%i4, %o1
	call	cortos_readMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L164
	 mov	%i1, %o0
	ld	[%fp-4], %g1
	add	%i5, 1496, %g3
	st	%l4, [%g1+4]
	st	%l3, [%g1+24]
	st	%l2, [%g1+28]
	st	%l5, [%g1+32]
	st	%l1, [%g1+36]
	add	%g1, 40, %g1
.L119:
	ld	[%i5], %g2
	st	%g2, [%g1]
	ld	[%i5+4], %g2
	st	%g2, [%g1+4]
	add	%i5, 8, %i5
	cmp	%i5, %g3
	bne	.L119
	 add	%g1, 8, %g1
	add	%l0, 374, %l0
	mov	%i2, %o0
.L165:
	mov	%i4, %o1
	call	cortos_writeMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L165
	 mov	%i2, %o0
	add	%i3, -1496, %i3
	cmp	%i3, 1495
	bg	.L164
	 mov	%i1, %o0
	add	%i3, 32, %l4
.L166:
	mov	%i4, %o1
	call	cortos_readMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be,a	.L166
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
	ble	.L132
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
.L124:
	ld	[%g2-4], %g3
	st	%g3, [%g1]
	ld	[%g2], %g3
	st	%g3, [%g1+4]
	add	%g1, 8, %g1
	cmp	%g1, %g4
	bne	.L124
	 add	%g2, 8, %g2
	add	%i1, 6, %g1
	add	%l0, 2, %l0
	add	%i1, %i1, %g3
	sll	%i1, 3, %g2
	add	%g1, %g1, %g1
	add	%l0, %g3, %l0
	add	%g2, 4, %g2
.L123:
	cmp	%i3, %g2
	be	.L146
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
.L146:
	mov	%i2, %o0
.L167:
	mov	%i4, %o1
	call	cortos_writeMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L167
	 mov	%i2, %o0
	jmp	%i7+8
	 restore %g0, 0, %o0
.L117:
	mov	%i1, %o0
.L168:
	mov	%i4, %o1
	call	cortos_readMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be,a	.L168
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
	bleu	.L133
	 st	%l1, [%i1+36]
	add	%i1, 40, %g2
	mov	6, %g1
	mov	6, %g3
.L128:
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
	blu	.L128
	 mov	%g1, %g3
	add	%g4, -1, %g2
	sll	%g2, 2, %g2
.L127:
	cmp	%i3, %g2
	be	.L155
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
.L155:
	mov	%i2, %o0
.L169:
	mov	%i4, %o1
	call	cortos_writeMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L169
	 mov	%i2, %o0
	jmp	%i7+8
	 restore %g0, 0, %o0
.L133:
	mov	36, %g2
	mov	6, %g1
	b	.L127
	 mov	10, %g4
.L132:
	mov	-4, %g2
	b	.L123
	 mov	10, %g1
	.size	sendFile, .-sendFile
	.section	.rodata.str1.8
	.align 8
.LC4:
	.asciz	"Programmed a layer\n"
	.align 8
.LC5:
	.asciz	"Sending file\n"
	.section	".text"
	.align 4
	.global execute_convolution_layer
	.type	execute_convolution_layer, #function
	.proc	020
execute_convolution_layer:
	save	%sp, -96, %sp
	mov	1, %o0
	ld	[%fp+112], %l1
	lduh	[%fp+94], %l7
	lduh	[%fp+98], %l6
	lduh	[%fp+126], %l5
	lduh	[%fp+130], %l4
	ldub	[%fp+135], %l3
	ldub	[%fp+139], %l2
	ld	[%fp+140], %l0
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
	mov	4, %o0
	sll	%l7, 16, %o1
	call	writeACCLReg, 0
	 add	%l6, %o1, %o1
	mov	5, %o0
	sll	%l5, 16, %o1
	call	writeACCLReg, 0
	 add	%l4, %o1, %o1
	mov	6, %o0
	sll	%l3, 8, %o1
	call	writeACCLReg, 0
	 add	%o1, %l2, %o1
	mov	7, %o0
	call	writeACCLReg, 0
	 ld	[%fp+100], %o1
	mov	8, %o0
	call	writeACCLReg, 0
	 ld	[%fp+104], %o1
	mov	%l1, %o1
	call	writeACCLReg, 0
	 mov	9, %o0
	mov	10, %o0
	call	writeACCLReg, 0
	 ld	[%fp+116], %o1
	mov	11, %o0
	call	writeACCLReg, 0
	 ld	[%fp+108], %o1
	ld	[%fp+120], %o1
	call	writeACCLReg, 0
	 mov	12, %o0
	sethi	%hi(.LC4), %o0
	smul	%i0, %i1, %i1
	or	%o0, %lo(.LC4), %o0
	call	cortos_printf, 0
	 smul	%i1, %i4, %i4
	sll	%l1, 3, %l1
	add	%i4, 24, %i3
	call	execute_layer, 0
	 sethi	%hi(.LC5), %i5
	add	%l1, -24, %i4
	or	%i5, %lo(.LC5), %i5
.L171:
	call	__ajit_serial_getchar_via_bypass__, 0
	 nop
	call	cortos_printf, 0
	 mov	%i5, %o0
	mov	%i4, %o0
	ld	[%l0], %o1
	ld	[%l0+8], %o2
	call	sendFile, 0
	 mov	%i3, %o3
	b,a	.L171
	.size	execute_convolution_layer, .-execute_convolution_layer
	.align 4
	.global process_image
	.type	process_image, #function
	.proc	020
process_image:
	save	%sp, -152, %sp
	mov	1, %g1
	mov	3, %g2
	ld	[%i1], %g3
	ld	[%i1+4], %g4
	ld	[%i0], %i5
	st	%g2, [%sp+92]
	st	%g2, [%sp+96]
	st	%g3, [%sp+100]
	st	%g0, [%sp+104]
	st	%i5, [%sp+108]
	st	%g4, [%sp+112]
	st	%g0, [%sp+116]
	st	%g1, [%sp+120]
	st	%g0, [%sp+124]
	st	%g1, [%sp+128]
	st	%g0, [%sp+132]
	st	%g1, [%sp+136]
	st	%i2, [%sp+140]
	mov	224, %o0
	mov	224, %o1
	mov	224, %o2
	mov	224, %o3
	mov	64, %o4
	call	execute_convolution_layer, 0
	 mov	3, %o5
	nop
	.size	process_image, .-process_image
	.section	.rodata.str1.8
	.align 8
.LC6:
	.asciz	"File %u received\n"
	.align 8
.LC7:
	.asciz	"free_queue[%d] = 0x%lx\n"
	.section	".text"
	.align 4
	.global getFilesThroughEthernet
	.type	getFilesThroughEthernet, #function
	.proc	016
getFilesThroughEthernet:
	save	%sp, -104, %sp
	cmp	%i2, 0
	be	.L176
	 mov	0, %i5
	sethi	%hi(.LC6), %i3
	or	%i3, %lo(.LC6), %i3
.L175:
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
	bne	.L175
	 add	%i1, 4, %i1
	mov	%i2, %i3
.L174:
	ld	[%i0], %g1
	sethi	%hi(.LC7), %i5
	mov	%i3, %o1
	ld	[%g1+8], %o2
	call	cortos_printf, 0
	 or	%i5, %lo(.LC7), %o0
	ld	[%i0], %g1
	mov	%i3, %o1
	ld	[%g1+4], %o2
	call	cortos_printf, 0
	 or	%i5, %lo(.LC7), %o0
	ld	[%i0], %g1
	or	%i5, %lo(.LC7), %o0
	mov	%i3, %o1
	ld	[%g1], %o2
	call	cortos_printf, 0
	 mov	%i2, %i0
	jmp	%i7+8
	 restore
.L176:
	b	.L174
	 mov	0, %i3
	.size	getFilesThroughEthernet, .-getFilesThroughEthernet
	.section	.rodata.str1.8
	.align 8
.LC8:
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
	sethi	%hi(.LC8), %i0
	cmp	%i3, 0
	be	.L184
	 or	%i0, %lo(.LC8), %i0
.L182:
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
	bne	.L182
	 add	%i4, 4, %i4
.L184:
	jmp	%i7+8
	 restore %g0, %i3, %o0
	.size	sendFilesThroughEthernet, .-sendFilesThroughEthernet
	.section	.rodata.str1.8
	.align 8
.LC9:
	.asciz	"Queues initialised\n"
	.align 8
.LC10:
	.asciz	"Kernel init error\n"
	.align 8
.LC11:
	.asciz	"Tensor init error\n"
	.align 8
.LC12:
	.asciz	"Packet init error\n"
	.align 8
.LC13:
	.asciz	"Memory spaces initialised\n"
	.align 8
.LC14:
	.asciz	"ERROR"
	.align 8
.LC15:
	.asciz	"../main.c"
	.align 8
.LC16:
	.asciz	"Free queue push failed\n"
	.align 8
.LC17:
	.asciz	"Free queues initialised\n"
	.align 8
.LC18:
	.asciz	"NIC started\n"
	.section	".rodata"
	.align 4
.LC0:
	.long	1760
	.long	36896
	.long	73760
	.long	147488
	.long	294324
	.long	589856
	.long	1179680
	.long	2359328
	.long	524320
	.long	1179680
	.long	589856
	.long	131104
	.long	294324
	.long	147488
	.long	32800
	.long	73760
	.long	36896
	.long	1760
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -792, %sp
	call	__ajit_write_serial_control_register_via_bypass__, 0
	 mov	3, %o0
	mov	4, %o1
	mov	64, %o2
	add	%fp, -636, %i4
	call	generateNicQueue, 0
	 mov	%i4, %o0
	sethi	%hi(.LC9), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC9), %o0
	mov	72, %o2
	add	%fp, -544, %o0
	sethi	%hi(.LC0), %o1
	call	memcpy, 0
	 or	%o1, %lo(.LC0), %o1
	sethi	%hi(3211264), %g1
	or	%g1, 32, %g1
	st	%g1, [%fp-624]
	st	%g1, [%fp-620]
	st	%g1, [%fp-616]
	sethi	%hi(1605632), %g1
	or	%g1, 32, %g1
	st	%g1, [%fp-612]
	mov	1600, %g1
	st	%g1, [%fp-640]
	sethi	%hi(802816), %g1
	or	%g1, 32, %g1
	add	%fp, -472, %i5
	st	%g1, [%fp-608]
	mov	%i5, %o0
	add	%fp, -544, %o1
	mov	18, %o2
	call	initialiseSpace, 0
	 mov	1, %o3
	cmp	%o0, 18
	be	.L186
	 sethi	%hi(.LC10), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC10), %o0
.L186:
	add	%fp, -624, %o1
	add	%fp, -604, %o0
	mov	5, %o2
	call	initialiseSpace, 0
	 mov	1, %o3
	cmp	%o0, 5
	be	.L187
	 sethi	%hi(.LC11), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC11), %o0
.L187:
	add	%fp, -640, %o1
	add	%fp, -256, %o0
	mov	64, %o2
	call	initialiseSpace, 0
	 mov	0, %o3
	cmp	%o0, 64
	be,a	.L206
	 sethi	%hi(.LC13), %o0
	sethi	%hi(.LC12), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC12), %o0
	sethi	%hi(.LC13), %o0
.L206:
	call	cortos_printf, 0
	 or	%o0, %lo(.LC13), %o0
	mov	0, %g1
	add	%fp, -400, %g2
	ld	[%i5+%g1], %g3
.L207:
	add	%g3, 24, %g3
	st	%g3, [%g2+%g1]
	add	%g1, 4, %g1
	cmp	%g1, 72
	bne,a	.L207
	 ld	[%i5+%g1], %g3
	mov	0, %g1
	add	%fp, -328, %g4
	ld	[%g2+%g1], %g3
.L208:
	srl	%g3, 3, %g3
	st	%g3, [%g4+%g1]
	add	%g1, 4, %g1
	cmp	%g1, 72
	bne,a	.L208
	 ld	[%g2+%g1], %g3
	ld	[%fp-604], %i5
	ld	[%fp-600], %g4
	add	%i5, 24, %i5
	add	%g4, 24, %g4
	ld	[%fp-596], %g3
	ld	[%fp-592], %g2
	add	%g3, 24, %g3
	add	%g2, 24, %g2
	srl	%i5, 3, %o7
	ld	[%fp-588], %g1
	add	%g1, 24, %g1
	srl	%g4, 3, %i0
	srl	%g3, 3, %i1
	srl	%g2, 3, %i2
	srl	%g1, 3, %i3
	st	%i5, [%fp-584]
	st	%g4, [%fp-580]
	st	%g3, [%fp-576]
	st	%g2, [%fp-572]
	st	%g1, [%fp-568]
	st	%o7, [%fp-564]
	st	%i0, [%fp-560]
	st	%i1, [%fp-556]
	st	%i2, [%fp-552]
	st	%i3, [%fp-548]
	ld	[%fp-636], %o0
	add	%fp, -256, %o1
	call	cortos_writeMessages, 0
	 mov	63, %o2
	cmp	%o0, 63
	be	.L191
	 sethi	%hi(.LC15), %o1
	sethi	%hi(.LC14), %o0
	sethi	%hi(__func__.2493), %o2
	sethi	%hi(.LC16), %o4
	or	%o0, %lo(.LC14), %o0
	or	%o1, %lo(.LC15), %o1
	or	%o2, %lo(__func__.2493), %o2
	mov	57, %o3
	call	__cortos_log_printf, 0
	 or	%o4, %lo(.LC16), %o4
.L191:
	sethi	%hi(.LC17), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC17), %o0
	call	nicRegConfig, 0
	 mov	%i4, %o0
	sethi	%hi(.LC18), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC18), %o0
	add	%fp, -604, %o1
	mov	3, %o2
	call	getFilesThroughEthernet, 0
	 mov	%i4, %o0
	mov	3, %g2
	st	%g2, [%sp+92]
	st	%g2, [%sp+96]
	ld	[%fp-564], %g2
	st	%g2, [%sp+100]
	ld	[%fp-560], %g2
	mov	1, %g1
	st	%g2, [%sp+108]
	ld	[%fp-556], %g2
	mov	16, %o0
	st	%g0, [%sp+104]
	st	%g2, [%sp+112]
	st	%g0, [%sp+116]
	st	%g1, [%sp+120]
	st	%g0, [%sp+124]
	st	%g1, [%sp+128]
	st	%g0, [%sp+132]
	st	%g1, [%sp+136]
	st	%i4, [%sp+140]
	mov	16, %o1
	mov	16, %o2
	mov	16, %o3
	mov	16, %o4
	call	execute_convolution_layer, 0
	 mov	16, %o5
	nop
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
	.type	__func__.2493, #object
	.size	__func__.2493, 5
__func__.2493:
	.asciz	"main"
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
