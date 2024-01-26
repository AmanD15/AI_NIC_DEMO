	.file	"main.c"
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
	.asciz	"DEBUG"
	.align 8
.LC1:
	.asciz	"../decl.h"
	.align 8
.LC2:
	.asciz	"NIC_REG[%d] = 0x%x\n"
	.section	".text"
	.align 4
	.global readNicRegs
	.type	readNicRegs, #function
	.proc	020
readNicRegs:
	save	%sp, -104, %sp
	sethi	%hi(.LC0), %i1
	sethi	%hi(.LC1), %i2
	sethi	%hi(__func__.2246), %i3
	sethi	%hi(.LC2), %i4
	mov	0, %i5
	or	%i1, %lo(.LC0), %i1
	or	%i2, %lo(.LC1), %i2
	or	%i3, %lo(__func__.2246), %i3
	or	%i4, %lo(.LC2), %i4
.L5:
	call	readNicReg, 0
	 mov	%i5, %o0
	mov	%i5, %o5
	st	%o0, [%sp+92]
	mov	%i2, %o1
	mov	%i1, %o0
	mov	%i3, %o2
	mov	117, %o3
	call	__cortos_log_printf, 0
	 mov	%i4, %o4
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
.LC3:
	.asciz	"NIC_REG[22]=0x%x\n"
	.align 8
.LC4:
	.asciz	"NIC reg 2 = 0x%x\t NQ.rx_queue = 0x%lx\n"
	.align 8
.LC5:
	.asciz	"NIC config done\n"
	.section	".text"
	.align 4
	.global nicRegConfig
	.type	nicRegConfig, #function
	.proc	020
nicRegConfig:
	save	%sp, -104, %sp
	call	readNicReg, 0
	 mov	22, %o0
	sethi	%hi(.LC0), %i3
	mov	%o0, %o5
	sethi	%hi(.LC1), %i4
	sethi	%hi(__func__.2240), %i5
	or	%i4, %lo(.LC1), %o1
	or	%i5, %lo(__func__.2240), %o2
	mov	90, %o3
	or	%i3, %lo(.LC0), %o0
	sethi	%hi(.LC3), %o4
	call	__cortos_log_printf, 0
	 or	%o4, %lo(.LC3), %o4
	call	readNicReg, 0
	 mov	2, %o0
	or	%i5, %lo(__func__.2240), %o2
	mov	%o0, %o5
	mov	93, %o3
	or	%i4, %lo(.LC1), %o1
	sethi	%hi(.LC4), %l0
	st	%i1, [%sp+92]
	or	%l0, %lo(.LC4), %o4
	call	__cortos_log_printf, 0
	 or	%i3, %lo(.LC0), %o0
	mov	1, %o0
	call	writeNicReg, 0
	 mov	1, %o1
	mov	2, %o0
	call	writeNicReg, 0
	 mov	%i1, %o1
	mov	%i2, %o1
	call	writeNicReg, 0
	 mov	10, %o0
	mov	%i0, %o1
	call	writeNicReg, 0
	 mov	18, %o0
	call	readNicReg, 0
	 mov	2, %o0
	or	%i4, %lo(.LC1), %o1
	mov	%o0, %i2
	st	%i1, [%sp+92]
	or	%i3, %lo(.LC0), %o0
	or	%i5, %lo(__func__.2240), %o2
	mov	102, %o3
	or	%l0, %lo(.LC4), %o4
	call	__cortos_log_printf, 0
	 mov	%i2, %o5
	cmp	%i1, %i2
	be	.L10
	 mov	0, %o0
.L12:
	b,a	.L12
.L10:
	mov	0, %o1
	or	%i3, %lo(.LC0), %i0
	call	writeNicReg, 0
	 or	%i4, %lo(.LC1), %i1
	sethi	%hi(.LC5), %i4
	or	%i5, %lo(__func__.2240), %i2
	mov	108, %i3
	call	__cortos_log_printf, 0
	 restore %i4, %lo(.LC5), %o4
	.size	nicRegConfig, .-nicRegConfig
	.section	.rodata.str1.8
	.align 8
.LC6:
	.asciz	"data at addr = 0x%lx%lx is 0x%x\n"
	.section	".text"
	.align 4
	.global readMemory
	.type	readMemory, #function
	.proc	020
readMemory:
	save	%sp, -120, %sp
	mov	%i1, %o1
	call	__ajit_load_word_from_physical_address__, 0
	 mov	%i0, %o0
	mov	%i0, %o5
	st	%o0, [%sp+104]
	st	%i0, [%sp+96]
	st	%i1, [%sp+100]
	std	%i0, [%fp-8]
	st	%i1, [%sp+92]
	sethi	%hi(.LC0), %o0
	sethi	%hi(.LC1), %o1
	sethi	%hi(__func__.2262), %o2
	or	%o1, %lo(.LC1), %o1
	or	%o2, %lo(__func__.2262), %o2
	mov	141, %o3
	sethi	%hi(.LC6), %o4
	or	%o0, %lo(.LC0), %o0
	call	__cortos_log_printf, 0
	 or	%o4, %lo(.LC6), %o4
	jmp	%i7+8
	 restore
	.size	readMemory, .-readMemory
	.section	.rodata.str1.8
	.align 8
.LC7:
	.asciz	"i = %u"
	.align 8
.LC8:
	.asciz	"Data at location 0x%x is = 0x%08x%08x\n"
	.section	".text"
	.align 4
	.global printMemory
	.type	printMemory, #function
	.proc	020
printMemory:
	save	%sp, -104, %sp
	sethi	%hi(.LC0), %i1
	sethi	%hi(.LC1), %i2
	sethi	%hi(__func__.2266), %i3
	sethi	%hi(.LC7), %l0
	or	%i1, %lo(.LC0), %o0
	or	%i2, %lo(.LC1), %o1
	or	%i3, %lo(__func__.2266), %o2
	or	%l0, %lo(.LC7), %o4
	mov	147, %o3
	mov	0, %o5
	sethi	%hi(MEM), %l1
	sethi	%hi(.LC8), %i0
	call	__cortos_log_printf, 0
	 mov	0, %i4
	mov	0, %i5
	or	%l1, %lo(MEM), %l1
	or	%i1, %lo(.LC0), %i1
	or	%i2, %lo(.LC1), %i2
	or	%i3, %lo(__func__.2266), %i3
	or	%l0, %lo(.LC7), %l0
	or	%i0, %lo(.LC8), %i0
.L15:
	mov	%i5, %o5
	mov	%i2, %o1
	mov	%i3, %o2
	mov	150, %o3
	mov	%l0, %o4
	call	__cortos_log_printf, 0
	 mov	%i1, %o0
	ld	[%l1], %g1
	add	%g1, %i4, %o5
	ld	[%g1+%i4], %g1
	st	%g1, [%sp+92]
	ld	[%o5+4], %g1
	mov	%i1, %o0
	mov	%i2, %o1
	mov	%i3, %o2
	mov	151, %o3
	mov	%i0, %o4
	call	__cortos_log_printf, 0
	 st	%g1, [%sp+96]
	add	%i5, 2, %i5
	cmp	%i5, 512
	bne	.L15
	 add	%i4, 8, %i4
	jmp	%i7+8
	 restore
	.size	printMemory, .-printMemory
	.section	.rodata.str1.8
	.align 8
.LC9:
	.asciz	"value at buffer addr[0x%lx] = 0x%lx%lx\n"
	.section	".text"
	.align 4
	.global printBuffer
	.type	printBuffer, #function
	.proc	020
printBuffer:
	save	%sp, -104, %sp
	sra	%i1, 31, %i4
	and	%i4, 3, %i4
	add	%i4, %i1, %i4
	sra	%i4, 2, %i4
	cmp	%i4, 0
	ble	.L22
	 sethi	%hi(.LC0), %l0
	sethi	%hi(.LC1), %i1
	sethi	%hi(__func__.2275), %i2
	sethi	%hi(.LC9), %i3
	mov	0, %i5
	or	%l0, %lo(.LC0), %l0
	or	%i1, %lo(.LC1), %i1
	or	%i2, %lo(__func__.2275), %i2
	or	%i3, %lo(.LC9), %i3
.L19:
	ld	[%i0], %g1
	st	%g1, [%sp+92]
	ld	[%i0+4], %g1
	mov	%i0, %o5
	mov	%l0, %o0
	mov	%i1, %o1
	st	%g1, [%sp+96]
	mov	%i2, %o2
	mov	160, %o3
	call	__cortos_log_printf, 0
	 mov	%i3, %o4
	add	%i5, 2, %i5
	cmp	%i5, %i4
	bl	.L19
	 add	%i0, 8, %i0
.L22:
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
	be	.L24
	 and	%o7, 2047, %o7
	st	%g1, [%i1+4]
.L24:
	ld	[%i0], %g1
	cmp	%g1, 1
	be,a	.L35
	 ld	[%i2+24], %g1
	ld	[%i3], %i4
	add	%i4, 1, %i4
.L26:
	sra	%o7, 2, %i0
	cmp	%i0, 10
	ble	.L30
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
.L28:
	ld	[%g1], %g4
	st	%g4, [%g2-4]
	ld	[%g1+4], %g4
	st	%g4, [%g2]
	st	%g3, [%i3]
	add	%g1, 8, %g1
	add	%g2, 8, %g2
	cmp	%g1, %i5
	bne	.L28
	 add	%g3, 2, %g3
	add	%i0, %i0, %g1
	add	%i4, 2, %i4
	add	%i0, 6, %i0
	add	%i4, %g1, %i4
	add	%i0, %i0, %i0
	add	%i0, -1, %g1
	sll	%g1, 2, %g1
.L27:
	cmp	%o7, %g1
	be	.L36
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
.L36:
	jmp	%i7+8
	 restore
.L35:
	st	%g1, [%i1+8]
	ld	[%i2+28], %g1
	st	%g1, [%i1+12]
	ld	[%i2+32], %g1
	st	%g1, [%i1+16]
	ld	[%i2+36], %g1
	st	%g1, [%i1+20]
	st	%g0, [%i0]
	b	.L26
	 mov	6, %i4
.L30:
	b	.L27
	 mov	10, %i0
	.size	storeFile, .-storeFile
	.section	.rodata.str1.8
	.align 8
.LC10:
	.asciz	"free_queue empty\n"
	.align 8
.LC11:
	.asciz	"tx_queue full\n"
	.align 8
.LC12:
	.asciz	"free_queue empty!\n"
	.align 8
.LC13:
	.asciz	"tx_queue full!\n"
	.section	".text"
	.align 4
	.global sendFile
	.type	sendFile, #function
	.proc	04
sendFile:
	save	%sp, -120, %sp
	ld	[%i0+4], %g1
	ld	[%i0+16], %g2
	ld	[%i0+20], %g3
	st	%g1, [%fp-24]
	st	%g2, [%fp-20]
	st	%g3, [%fp-12]
	add	%i3, 1, %l2
	ld	[%i0+8], %l7
	sll	%l2, 2, %l4
	cmp	%l4, 1512
	bg	.L67
	 ld	[%i0+12], %l6
	sethi	%hi(.LC0), %l3
	sethi	%hi(.LC1), %l1
	sethi	%hi(__func__.2315), %l0
	sethi	%hi(.LC12), %i4
	add	%fp, -4, %i5
	or	%l3, %lo(.LC0), %l3
	or	%l1, %lo(.LC1), %l1
	or	%l0, %lo(__func__.2315), %l0
	b	.L38
	 or	%i4, %lo(.LC12), %i4
.L70:
	mov	%l1, %o1
	mov	%l0, %o2
	mov	316, %o3
	call	__cortos_log_printf, 0
	 mov	%i4, %o4
.L38:
	mov	%i5, %o1
	mov	%i1, %o0
	call	cortos_readMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L70
	 mov	%l3, %o0
	ld	[%fp-24], %g3
	add	%i3, 3, %g2
	sll	%g2, 18, %g2
	srl	%g2, 8, %g2
	ld	[%fp-4], %o0
	and	%g3, 255, %g1
	st	%l7, [%o0+24]
	or	%g2, %g1, %g1
	ld	[%fp-12], %g3
	ld	[%fp-20], %g2
	st	%l6, [%o0+28]
	st	%g2, [%o0+32]
	st	%g1, [%o0+4]
	cmp	%l2, 6
	ble	.L58
	 st	%g3, [%o0+36]
	add	%i3, -6, %i3
	add	%i0, 24, %g2
	srl	%i3, 1, %i3
	add	%o0, 40, %g1
	add	%i3, 6, %i4
	mov	10, %g3
	add	%i4, %i4, %i4
.L54:
	ld	[%g2], %g4
	st	%g4, [%g1]
	ld	[%g2+4], %g4
	st	%g4, [%g1+4]
	add	%g3, 2, %g3
	add	%g2, 8, %g2
	cmp	%g3, %i4
	bne	.L54
	 add	%g1, 8, %g1
	add	%i3, 4, %g1
	add	%g3, -1, %g2
	add	%g1, %g1, %g1
	sll	%g2, 2, %g2
.L53:
	cmp	%l4, %g2
	be	.L55
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
.L55:
	mov	1700, %o1
	sethi	%hi(.LC0), %i0
	sethi	%hi(.LC1), %i1
	sethi	%hi(__func__.2315), %i3
	call	printBuffer, 0
	 sethi	%hi(.LC13), %i4
	or	%i0, %lo(.LC0), %i0
	or	%i1, %lo(.LC1), %i1
	or	%i3, %lo(__func__.2315), %i3
	b	.L56
	 or	%i4, %lo(.LC13), %i4
.L71:
	mov	%i1, %o1
	mov	%i3, %o2
	mov	347, %o3
	call	__cortos_log_printf, 0
	 mov	%i4, %o4
.L56:
	mov	%i5, %o1
	mov	%i2, %o0
	call	cortos_writeMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L71
	 mov	%i0, %o0
	jmp	%i7+8
	 restore
.L67:
	add	%i3, -5, %i3
	sethi	%hi(33554432), %g1
	ld	[%fp-20], %g2
	sll	%i3, 2, %l3
	andn	%g2, %g1, %g1
	sethi	%hi(.LC0), %l0
	sethi	%hi(.LC1), %i3
	sethi	%hi(__func__.2315), %i4
	sethi	%hi(.LC10), %l2
	sethi	%hi(.LC11), %l1
	st	%g1, [%fp-16]
	add	%i0, 24, %l5
	mov	6, %l4
	add	%fp, -4, %i5
	or	%l0, %lo(.LC0), %l0
	or	%i3, %lo(.LC1), %i3
	or	%i4, %lo(__func__.2315), %i4
	or	%l2, %lo(.LC10), %l2
	b	.L66
	 or	%l1, %lo(.LC11), %l1
.L72:
	mov	%i3, %o1
	mov	%i4, %o2
	mov	244, %o3
	call	__cortos_log_printf, 0
	 mov	%l2, %o4
.L66:
	mov	%i1, %o0
.L76:
	mov	%i5, %o1
	call	cortos_readMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L72
	 mov	%l0, %o0
	sethi	%hi(391168), %g3
	or	%g3, 255, %g3
	ld	[%fp-4], %g2
	ld	[%fp-12], %g1
	st	%g3, [%g2+4]
	st	%l7, [%g2+24]
	st	%l6, [%g2+28]
	ld	[%fp-16], %g3
	st	%g1, [%g2+36]
	st	%g3, [%g2+32]
	add	%l5, 1496, %g4
	add	%g2, 40, %g2
.L41:
	ld	[%l5], %g3
	st	%g3, [%g2]
	ld	[%l5+4], %g3
	st	%g3, [%g2+4]
	add	%l5, 8, %l5
	cmp	%l5, %g4
	bne	.L41
	 add	%g2, 8, %g2
	b	.L43
	 add	%l4, 374, %l4
.L73:
	mov	%i3, %o1
	mov	%i4, %o2
	mov	263, %o3
	call	__cortos_log_printf, 0
	 mov	%l1, %o4
.L43:
	mov	%i5, %o1
	mov	%i2, %o0
	call	cortos_writeMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L73
	 mov	%l0, %o0
	add	%l3, -1496, %l3
	cmp	%l3, 1495
	bg	.L76
	 mov	%i1, %o0
	sethi	%hi(.LC0), %l1
	sethi	%hi(.LC1), %l0
	sethi	%hi(__func__.2315), %i3
	sethi	%hi(.LC12), %i4
	add	%l3, 32, %l2
	or	%l1, %lo(.LC0), %l1
	or	%l0, %lo(.LC1), %l0
	or	%i3, %lo(__func__.2315), %i3
	b	.L46
	 or	%i4, %lo(.LC12), %i4
.L74:
	mov	%l0, %o1
	mov	%i3, %o2
	mov	275, %o3
	call	__cortos_log_printf, 0
	 mov	%i4, %o4
.L46:
	mov	%i5, %o1
	mov	%i1, %o0
	call	cortos_readMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be,a	.L74
	 mov	%l1, %o0
	ld	[%fp-24], %g3
	and	%g3, 255, %g1
	sll	%l2, 16, %g2
	ld	[%fp-20], %g3
	srl	%g2, 8, %g2
	or	%g2, %g1, %g2
	sethi	%hi(33554432), %g1
	or	%g3, %g1, %g1
	ld	[%fp-4], %i4
	st	%g1, [%i4+32]
	st	%g2, [%i4+4]
	ld	[%fp-12], %g1
	st	%l7, [%i4+24]
	st	%g1, [%i4+36]
	sra	%l3, 31, %g1
	and	%g1, 3, %g1
	add	%g1, %l3, %g1
	sra	%g1, 2, %g1
	cmp	%g1, 0
	ble	.L57
	 st	%l6, [%i4+28]
	add	%g1, -1, %g1
	add	%l4, 1, %g2
	srl	%g1, 1, %i3
	sll	%g2, 2, %g2
	add	%i4, 48, %g4
	sll	%i3, 3, %g3
	add	%i4, 40, %g1
	add	%i0, %g2, %g2
	add	%g4, %g3, %g4
.L48:
	ld	[%g2-4], %g3
	st	%g3, [%g1]
	ld	[%g2], %g3
	st	%g3, [%g1+4]
	add	%g1, 8, %g1
	cmp	%g1, %g4
	bne	.L48
	 add	%g2, 8, %g2
	add	%i3, 6, %g1
	add	%l4, 2, %l4
	add	%i3, %i3, %g3
	sll	%i3, 3, %g2
	add	%g1, %g1, %g1
	add	%l4, %g3, %l4
	add	%g2, 4, %g2
.L47:
	cmp	%g2, %l3
	be	.L51
	 sll	%g1, 2, %g2
	sll	%l4, 2, %g3
	ld	[%i0+%g3], %g3
	st	%g3, [%i4+%g2]
	add	%g1, 1, %g1
	add	%l4, 1, %g2
	sll	%g1, 2, %g1
	sll	%g2, 2, %g2
	ld	[%i0+%g2], %g2
	st	%g2, [%i4+%g1]
.L51:
	sethi	%hi(.LC0), %i0
	sethi	%hi(.LC1), %i1
	sethi	%hi(__func__.2315), %i3
	sethi	%hi(.LC11), %i4
	or	%i0, %lo(.LC0), %i0
	or	%i1, %lo(.LC1), %i1
	or	%i3, %lo(__func__.2315), %i3
	b	.L68
	 or	%i4, %lo(.LC11), %i4
.L75:
	mov	%i1, %o1
	mov	%i3, %o2
	mov	303, %o3
	call	__cortos_log_printf, 0
	 mov	%i4, %o4
.L68:
	mov	%i5, %o1
	mov	%i2, %o0
	call	cortos_writeMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L75
	 mov	%i0, %o0
	jmp	%i7+8
	 restore
.L58:
	mov	36, %g2
	mov	6, %g1
	b	.L53
	 mov	10, %g3
.L57:
	mov	-4, %g2
	b	.L47
	 mov	10, %g1
	.size	sendFile, .-sendFile
	.section	.rodata.str1.8
	.align 8
.LC14:
	.asciz	"rx_queue = 0x%lx\n"
	.align 8
.LC15:
	.asciz	"free_queue : \n\treadIndex = %d\n\twriteIndex = %d\n\ttotalmMsgs = %d\n\n"
	.align 8
.LC16:
	.asciz	"rx_queue : \n\treadIndex = %d\n\twriteIndex = %d\n\ttotalmMsgs = %d\n\n"
	.align 8
.LC17:
	.asciz	"Got RX packet\n"
	.align 8
.LC18:
	.asciz	"rx queue pop data = 0x%lx\n"
	.align 8
.LC19:
	.asciz	"Unable to push to free queue.\n"
	.align 8
.LC20:
	.asciz	"Not last packet of file\n"
	.align 8
.LC21:
	.asciz	"No packet found empty rx_queue\n"
	.section	".text"
	.align 4
	.global getConfigData
	.type	getConfigData, #function
	.proc	020
getConfigData:
	save	%sp, -112, %sp
	sethi	%hi(.LC0), %l2
	sethi	%hi(.LC1), %l1
	sethi	%hi(__func__.2353), %l0
	st	%i0, [%fp+68]
	mov	1, %g1
	sethi	%hi(.LC19), %i0
	st	%i3, [%fp+80]
	st	%g1, [%fp-4]
	sethi	%hi(.LC14), %l7
	or	%l2, %lo(.LC0), %l6
	or	%l1, %lo(.LC1), %l5
	or	%l0, %lo(__func__.2353), %l4
	or	%i0, %lo(.LC19), %i0
	or	%l1, %lo(.LC1), %o1
.L86:
	or	%l0, %lo(__func__.2353), %o2
	mov	360, %o3
	or	%l7, %lo(.LC14), %o4
	mov	%i2, %o5
	call	__cortos_log_printf, 0
	 or	%l2, %lo(.LC0), %o0
	sethi	%hi(.LC15), %g3
	ld	[%i1+8], %g2
	ld	[%i1], %g1
	or	%g3, %lo(.LC15), %o4
	or	%l1, %lo(.LC1), %o1
	or	%l0, %lo(__func__.2353), %o2
	mov	361, %o3
	ld	[%i1+4], %o5
	st	%g2, [%sp+92]
	st	%g1, [%sp+96]
	call	__cortos_log_printf, 0
	 or	%l2, %lo(.LC0), %o0
	sethi	%hi(.LC16), %g1
	ld	[%i2+8], %g2
	or	%g1, %lo(.LC16), %o4
	ld	[%i2], %g1
	or	%l0, %lo(__func__.2353), %o2
	mov	362, %o3
	ld	[%i2+4], %o5
	st	%g2, [%sp+92]
	st	%g1, [%sp+96]
	or	%l1, %lo(.LC1), %o1
	call	__cortos_log_printf, 0
	 or	%l2, %lo(.LC0), %o0
	mov	%i2, %o0
	call	printBuffer, 0
	 mov	305, %o1
	mov	%i2, %o0
	add	%fp, -8, %o1
	call	cortos_readMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be	.L79
	 sethi	%hi(.LC17), %g3
	mov	%l5, %o1
	or	%g3, %lo(.LC17), %o4
	mov	%l4, %o2
	mov	366, %o3
	call	__cortos_log_printf, 0
	 mov	%l6, %o0
	ld	[%fp+80], %o3
	ld	[%fp-8], %l3
	add	%fp, -4, %o0
	ld	[%fp+68], %o1
	call	storeFile, 0
	 mov	%l3, %o2
	sethi	%hi(.LC18), %g1
	mov	%l5, %o1
	mov	%l4, %o2
	mov	369, %o3
	or	%g1, %lo(.LC18), %o4
	mov	%l3, %o5
	call	__cortos_log_printf, 0
	 mov	%l6, %o0
	mov	%l3, %o0
	mov	1700, %o1
	call	printBuffer, 0
	 mov	%l6, %i3
	mov	%l5, %i4
	b	.L81
	 mov	%l4, %i5
.L85:
	mov	%i4, %o1
	mov	%i5, %o2
	mov	382, %o3
	call	__cortos_log_printf, 0
	 mov	%i0, %o4
.L81:
	add	%fp, -8, %o1
	mov	%i1, %o0
	call	cortos_writeMessages, 0
	 mov	1, %o2
	cmp	%o0, 0
	be,a	.L85
	 mov	%i3, %o0
	ld	[%l3+32], %g2
	sethi	%hi(33554432), %g1
	andcc	%g2, %g1, %g0
	bne	.L87
	 or	%l2, %lo(.LC0), %o0
	or	%l1, %lo(.LC1), %o1
	or	%l0, %lo(__func__.2353), %o2
	mov	388, %o3
	sethi	%hi(.LC20), %o4
	call	__cortos_log_printf, 0
	 or	%o4, %lo(.LC20), %o4
	b	.L86
	 or	%l1, %lo(.LC1), %o1
.L79:
	mov	%l6, %o0
	mov	%l5, %o1
	mov	%l4, %o2
	mov	394, %o3
	sethi	%hi(.LC21), %o4
	call	__cortos_log_printf, 0
	 or	%o4, %lo(.LC21), %o4
	b	.L86
	 or	%l1, %lo(.LC1), %o1
.L87:
	jmp	%i7+8
	 restore
	.size	getConfigData, .-getConfigData
	.section	.rodata.str1.8
	.align 8
.LC22:
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
	sethi	%hi(.LC22), %o0
	mov	%i5, %i0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC22), %o0
	jmp	%i7+8
	 restore
	.size	cortos_bget_ncram1, .-cortos_bget_ncram1
	.section	.rodata.str1.8
	.align 8
.LC23:
	.asciz	"Entering %d %d\n"
	.align 8
.LC24:
	.asciz	"hdr %d\n"
	.align 8
.LC25:
	.asciz	"msgSizeInBytes %d\n"
	.align 8
.LC26:
	.asciz	"totalMsgs %d\n"
	.align 8
.LC27:
	.asciz	"readIndex %d\n"
	.align 8
.LC28:
	.asciz	"writeIndex %d\n"
	.align 8
.LC29:
	.asciz	"lock addr %d\n"
	.align 8
.LC30:
	.asciz	"lock val %d\n"
	.align 8
.LC31:
	.asciz	"length %d\n"
	.align 8
.LC32:
	.asciz	"bget_addr %d\n"
	.align 8
.LC33:
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
	be	.L90
	 add	%o0, 48, %o0
	call	cortos_bget_ncram, 0
	 nop
	mov	%o0, %i4
.L91:
	cmp	%i4, 0
	be	.L93
	 mov	%i0, %o1
	ld	[%g0+16], %o2
	sethi	%hi(.LC23), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC23), %o0
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
	sethi	%hi(.LC24), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC24), %o0
	ld	[%i5+16], %o1
	sethi	%hi(.LC25), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC25), %o0
	ld	[%i4+%i3], %o1
	sethi	%hi(.LC26), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC26), %o0
	ld	[%i5+4], %o1
	sethi	%hi(.LC27), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC27), %o0
	ld	[%i5+8], %o1
	sethi	%hi(.LC28), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC28), %o0
	ld	[%i5+20], %o1
	sethi	%hi(.LC29), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC29), %o0
	ld	[%i5+20], %g1
	sethi	%hi(.LC30), %o0
	ldub	[%g1], %o1
	call	cortos_printf, 0
	 or	%o0, %lo(.LC30), %o0
	ld	[%i5+12], %o1
	sethi	%hi(.LC31), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC31), %o0
	ld	[%i5+24], %o1
	sethi	%hi(.LC32), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC32), %o0
	sethi	%hi(.LC33), %o0
	ld	[%i5+28], %o1
	call	cortos_printf, 0
	 or	%o0, %lo(.LC33), %o0
.L92:
	jmp	%i7+8
	 restore %g0, %i5, %o0
.L90:
	call	cortos_bget, 0
	 nop
	b	.L91
	 mov	%o0, %i4
.L93:
	b	.L92
	 mov	0, %i5
	.size	cortos_reserveQueue2, .-cortos_reserveQueue2
	.section	.rodata.str1.8
	.align 8
.LC34:
	.asciz	"%x\n"
	.align 8
.LC35:
	.asciz	"Entered loop %d %d %d\n"
	.align 8
.LC36:
	.asciz	"Entering for loop %d\n"
	.align 8
.LC37:
	.asciz	"Writing %lx at %lx from %lx\n"
	.section	".text"
	.align 4
	.global cortos_writeMessages2
	.type	cortos_writeMessages2, #function
	.proc	016
cortos_writeMessages2:
	save	%sp, -96, %sp
	sethi	%hi(.LC34), %i5
	mov	%i0, %o1
	call	cortos_printf, 0
	 or	%i5, %lo(.LC34), %o0
	or	%i5, %lo(.LC34), %o0
	call	cortos_printf, 0
	 ld	[%i1], %o1
	st	%i2, [%fp+76]
	ld	[%i0+28], %g1
	andcc	%g1, 1, %g0
	be	.L112
	 nop
	ld	[%i0], %g1
	cmp	%g1, 0
	bne	.L105
	 mov	0, %l1
.L96:
	ld	[%i0+16], %l0
	ld	[%i0+8], %l3
	ld	[%i0+12], %l4
	mov	%l0, %o1
	sethi	%hi(.LC23), %o0
	mov	%l0, %o2
	call	cortos_printf, 0
	 or	%o0, %lo(.LC23), %o0
	ld	[%fp+76], %g1
	cmp	%g1, 0
	be	.L98
	 add	%i0, 32, %l5
	ld	[%i0+12], %o3
	cmp	%o3, %l1
	bleu	.L106
	 mov	%g1, %l2
	sethi	%hi(.LC35), %l7
	sethi	%hi(.LC36), %l6
	sethi	%hi(.LC37), %i3
	or	%l7, %lo(.LC35), %l7
	or	%l6, %lo(.LC36), %l6
	or	%i3, %lo(.LC37), %i3
.L103:
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
	be	.L102
	 mov	%i1, %i5
.L101:
	ldub	[%i5], %o1
	mov	%i2, %o2
	mov	%i5, %o3
	call	cortos_printf, 0
	 mov	%i3, %o0
	ldub	[%i5], %g2
	stb	%g2, [%i2]
	add	%i5, 1, %i5
	cmp	%i5, %i4
	bne	.L101
	 add	%i2, 1, %i2
.L102:
	add	%l3, 1, %l3
	add	%l1, 1, %l1
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%l3, %l4, %g1
	addcc	%l2, -1, %l2
	smul	%g1, %l4, %g1
	be	.L98
	 sub	%l3, %g1, %l3
	ld	[%i0+12], %o3
	cmp	%o3, %l1
	bgu	.L103
	 add	%i1, %l0, %i1
	ld	[%fp+76], %g1
	sub	%g1, %l2, %g1
	st	%g1, [%fp+76]
.L98:
	st	%l3, [%i0+8]
	st	%l1, [%i0]
	ld	[%i0+28], %g1
	andcc	%g1, 1, %g0
	be	.L113
	 nop
	ld	[%fp+76], %i0
	jmp	%i7+8
	 restore
.L105:
	st	%g0, [%fp+76]
	ld	[%fp+76], %i0
	jmp	%i7+8
	 restore
.L112:
	call	cortos_lock_acquire_buzy, 0
	 ld	[%i0+20], %o0
	b	.L96
	 ld	[%i0], %l1
.L113:
	call	cortos_lock_release, 0
	 ld	[%i0+20], %o0
	ld	[%fp+76], %i0
	jmp	%i7+8
	 restore
.L106:
	b	.L98
	 st	%g0, [%fp+76]
	.size	cortos_writeMessages2, .-cortos_writeMessages2
	.section	.rodata.str1.8
	.align 8
.LC38:
	.asciz	"Free = 0x%lx and size is %d(in bytes)\n"
	.align 8
.LC39:
	.asciz	"tx = 0x%lx and size is %d(in bytes)\n"
	.align 8
.LC40:
	.asciz	"rx = 0x%lx and size is %d(in bytes)\n"
	.align 8
.LC41:
	.asciz	"Free->msgSizeInBYtes = %d\n"
	.align 8
.LC42:
	.asciz	"file_buf addr = 0x%lx and its size is %di(in bytes)\n"
	.align 8
.LC43:
	.asciz	"Buffers[%d] = 0x%lx and size is %d(in bytes)\n"
	.align 8
.LC44:
	.asciz	"Unable to push all msgs to free queue.\n"
	.align 8
.LC45:
	.asciz	"free_queue[%d] = 0x%lx\n"
	.align 8
.LC46:
	.asciz	"Free = 0x%lx\n"
	.align 8
.LC47:
	.asciz	"Tx = 0x%lx\n"
	.align 8
.LC48:
	.asciz	"Rx = 0x%lx\n"
	.align 8
.LC49:
	.asciz	"Configuration Done. NIC has started\n"
	.align 8
.LC50:
	.asciz	"sending file out\n"
	.align 8
.LC51:
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
	call	cortos_reserveQueue, 0
	 mov	4, %o0
	mov	64, %o1
	mov	%o0, %l0
	mov	1, %o2
	call	cortos_reserveQueue, 0
	 mov	4, %o0
	mov	64, %o1
	mov	%o0, %i0
	mov	1, %o2
	call	cortos_reserveQueue, 0
	 mov	4, %o0
	ld	[%o0+16], %g1
	ld	[%o0+12], %o2
	mov	%o0, %o1
	smul	%o2, %g1, %o2
	mov	%o0, %i4
	sethi	%hi(.LC38), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC38), %o0
	ld	[%i0+16], %g1
	mov	%i0, %o1
	ld	[%i0+12], %o2
	sethi	%hi(.LC39), %o0
	smul	%o2, %g1, %o2
	call	cortos_printf, 0
	 or	%o0, %lo(.LC39), %o0
	ld	[%l0+16], %g1
	mov	%l0, %o1
	ld	[%l0+12], %o2
	sethi	%hi(.LC40), %o0
	smul	%o2, %g1, %o2
	call	cortos_printf, 0
	 or	%o0, %lo(.LC40), %o0
	ld	[%i4+16], %o1
	sethi	%hi(.LC41), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC41), %o0
	sethi	%hi(9216), %i5
	call	cortos_bget_ncram, 0
	 or	%i5, 884, %o0
	or	%i5, 884, %o2
	mov	%o0, %o1
	mov	%o0, %i1
	sethi	%hi(.LC43), %i2
	sethi	%hi(.LC42), %o0
	mov	0, %i5
	or	%o0, %lo(.LC42), %o0
	call	cortos_printf, 0
	 add	%fp, -256, %i3
	or	%i2, %lo(.LC43), %i2
.L115:
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
	bne	.L115
	 mov	%i3, %o1
	mov	%i4, %o0
	call	cortos_writeMessages, 0
	 mov	44, %o2
	cmp	%o0, 44
	be	.L116
	 sethi	%hi(.LC44), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC44), %o0
.L116:
	sethi	%hi(.LC45), %i2
	mov	0, %g1
	mov	0, %i5
	or	%i2, %lo(.LC45), %i2
.L117:
	add	%g1, 8, %g1
	sll	%g1, 2, %g1
	mov	%i5, %o1
	ld	[%i4+%g1], %o2
	call	cortos_printf, 0
	 mov	%i2, %o0
	add	%i5, 1, %i5
	cmp	%i5, 64
	bne	.L117
	 mov	%i5, %g1
	ld	[%i4], %o3
	ld	[%i4+4], %o1
	ld	[%i4+8], %o2
	sethi	%hi(.LC15), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC15), %o0
	call	readNicRegs, 0
	 sethi	%hi(.LC50), %i2
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
	sethi	%hi(.LC46), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC46), %o0
	mov	%i0, %o1
	sethi	%hi(.LC47), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC47), %o0
	mov	%l0, %o1
	sethi	%hi(.LC48), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC48), %o0
	sethi	%hi(.LC49), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC49), %o0
	or	%i2, %lo(.LC50), %i2
	mov	%i1, %o0
.L129:
	mov	%i4, %o1
	mov	%l0, %o2
	call	getConfigData, 0
	 add	%fp, -260, %o3
	mov	%i4, %o1
	mov	%l0, %o2
	add	%fp, -260, %o3
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
	bne,a	.L129
	 mov	%i1, %o0
	call	cortos_freeQueue, 0
	 mov	%l0, %o0
	call	cortos_freeQueue, 0
	 mov	%i0, %o0
	mov	%i3, %i5
	mov	%i4, %o0
	call	cortos_freeQueue, 0
	 mov	%fp, %i3
.L119:
	call	cortos_brel, 0
	 ld	[%i5], %o0
	add	%i5, 4, %i5
	cmp	%i5, %i3
	bne	.L119
	 nop
	call	cortos_brel, 0
	 mov	%i1, %o0
	sethi	%hi(.LC51), %o0
	mov	0, %i0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC51), %o0
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
	.section	".rodata"
	.align 8
	.type	__func__.2240, #object
	.size	__func__.2240, 13
__func__.2240:
	.asciz	"nicRegConfig"
	.align 8
	.type	__func__.2246, #object
	.size	__func__.2246, 12
__func__.2246:
	.asciz	"readNicRegs"
	.align 8
	.type	__func__.2262, #object
	.size	__func__.2262, 11
__func__.2262:
	.asciz	"readMemory"
	.align 8
	.type	__func__.2266, #object
	.size	__func__.2266, 12
__func__.2266:
	.asciz	"printMemory"
	.align 8
	.type	__func__.2275, #object
	.size	__func__.2275, 12
__func__.2275:
	.asciz	"printBuffer"
	.align 8
	.type	__func__.2315, #object
	.size	__func__.2315, 9
__func__.2315:
	.asciz	"sendFile"
	.align 8
	.type	__func__.2353, #object
	.size	__func__.2353, 14
__func__.2353:
	.asciz	"getConfigData"
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
