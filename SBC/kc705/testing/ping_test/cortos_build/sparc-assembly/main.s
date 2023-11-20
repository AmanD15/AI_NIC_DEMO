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
.L3:
	call	readNicReg, 0
	 mov	%i5, %o0
	mov	%i5, %o1
	mov	%o0, %o2
	call	cortos_printf, 0
	 mov	%i4, %o0
	add	%i5, 1, %i5
	cmp	%i5, 64
	bne	.L3
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
	.asciz	"NIC_regs: [1]=0x%x,[2]=0x%x,[10]=0x%x,[18]=0x%x,[0]=0x%x,[21]=0x%x,[22]=0x%x\n"
	.section	".text"
	.align 4
	.global nicRegConfig
	.type	nicRegConfig, #function
	.proc	020
nicRegConfig:
	save	%sp, -104, %sp
	call	readNicReg, 0
	 mov	22, %o0
	mov	%o0, %o1
	sethi	%hi(.LC1), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC1), %o0
	mov	1, %o0
	call	writeNicReg, 0
	 mov	1, %o1
	mov	%i1, %o1
	call	writeNicReg, 0
	 mov	2, %o0
	mov	%i2, %o1
	call	writeNicReg, 0
	 mov	10, %o0
	mov	%i0, %o1
	call	writeNicReg, 0
	 mov	18, %o0
	mov	21, %o0
	call	writeNicReg, 0
	 mov	0, %o1
	mov	1, %o1
	call	writeNicReg, 0
	 mov	0, %o0
	call	readNicReg, 0
	 mov	1, %o0
	mov	%o0, %i0
	call	readNicReg, 0
	 mov	2, %o0
	mov	%o0, %i2
	call	readNicReg, 0
	 mov	10, %o0
	mov	%o0, %i3
	call	readNicReg, 0
	 mov	18, %o0
	mov	%o0, %i4
	call	readNicReg, 0
	 mov	0, %o0
	mov	%o0, %i5
	call	readNicReg, 0
	 mov	21, %o0
	mov	%o0, %i1
	call	readNicReg, 0
	 mov	22, %o0
	mov	%i0, %o1
	st	%o0, [%sp+96]
	st	%i1, [%sp+92]
	sethi	%hi(.LC2), %o0
	mov	%i2, %o2
	mov	%i3, %o3
	mov	%i4, %o4
	mov	%i5, %o5
	call	cortos_printf, 0
	 or	%o0, %lo(.LC2), %o0
	jmp	%i7+8
	 restore
	.size	nicRegConfig, .-nicRegConfig
	.section	.rodata.str1.8
	.align 8
.LC3:
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
	sethi	%hi(.LC3), %i0
	mov	%o0, %i5
	call	cortos_printf, 0
	 restore %i0, %lo(.LC3), %o0
	.size	readMemory, .-readMemory
	.section	.rodata.str1.8
	.align 8
.LC4:
	.asciz	"i = %u"
	.align 8
.LC5:
	.asciz	"Data at location 0x%x is = 0x%08x%08x\n"
	.section	".text"
	.align 4
	.global printMemory
	.type	printMemory, #function
	.proc	020
printMemory:
	save	%sp, -96, %sp
	sethi	%hi(.LC4), %i2
	mov	0, %o1
	or	%i2, %lo(.LC4), %o0
	sethi	%hi(MEM), %i1
	sethi	%hi(.LC5), %i3
	call	cortos_printf, 0
	 mov	0, %i5
	mov	0, %i4
	or	%i1, %lo(MEM), %i1
	or	%i2, %lo(.LC4), %i2
	or	%i3, %lo(.LC5), %i3
.L10:
	mov	%i4, %o1
	call	cortos_printf, 0
	 mov	%i2, %o0
	ld	[%i1], %g1
	mov	%i3, %o0
	add	%g1, %i5, %o1
	ld	[%g1+%i5], %o2
	call	cortos_printf, 0
	 ld	[%o1+4], %o3
	add	%i4, 2, %i4
	cmp	%i4, 512
	bne	.L10
	 add	%i5, 8, %i5
	jmp	%i7+8
	 restore
	.size	printMemory, .-printMemory
	.align 4
	.global swapMacAddress
	.type	swapMacAddress, #function
	.proc	020
swapMacAddress:
	save	%sp, -96, %sp
	ld	[%i0], %g1
	ldub	[%g1+9], %g2
	ldub	[%g1+15], %i3
	stb	%g2, [%g1+31]
	ldub	[%g1+14], %i4
	ldub	[%g1+10], %g2
	ldub	[%g1+13], %i5
	ldub	[%g1+12], %g4
	ldub	[%g1+8], %o4
	ldub	[%g1+23], %o5
	ldub	[%g1+22], %o7
	ldub	[%g1+21], %i1
	ldub	[%g1+20], %i2
	ldub	[%g1+11], %g3
	ld	[%i0], %g1
	stb	%o4, [%g1+30]
	ld	[%i0], %g1
	stb	%o5, [%g1+29]
	ld	[%i0], %g1
	stb	%o7, [%g1+28]
	ld	[%i0], %g1
	stb	%i1, [%g1+27]
	ld	[%i0], %g1
	stb	%i2, [%g1+26]
	ld	[%i0], %g1
	stb	%i3, [%g1+25]
	ld	[%i0], %g1
	stb	%i4, [%g1+24]
	ld	[%i0], %g1
	stb	%i5, [%g1+39]
	ld	[%i0], %g1
	stb	%g4, [%g1+38]
	ld	[%i0], %g1
	stb	%g3, [%g1+37]
	ld	[%i0], %g1
	stb	%g2, [%g1+36]
	jmp	%i7+8
	 restore
	.size	swapMacAddress, .-swapMacAddress
	.section	.rodata.str1.8
	.align 8
.LC6:
	.asciz	"Started\n"
	.align 8
.LC7:
	.asciz	"Reserved queues: free=0x%lx, rx=0x%lx, tx=0x%lx\n"
	.align 8
.LC8:
	.asciz	"Allocated Buffer[%d] = 0x%lx\n"
	.align 8
.LC9:
	.asciz	"Configuration Done. NIC has started\n"
	.align 8
.LC10:
	.asciz	"message_counter:%d\n"
	.align 8
.LC11:
	.asciz	"Info: NIC has transmitted %d packets.\n"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -136, %sp
	call	__ajit_write_serial_control_register_via_bypass__, 0
	 mov	1, %o0
	sethi	%hi(.LC6), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC6), %o0
	mov	8, %o1
	mov	1, %o2
	call	cortos_reserveQueue, 0
	 mov	4, %o0
	mov	8, %o1
	mov	%o0, %i0
	mov	1, %o2
	call	cortos_reserveQueue, 0
	 mov	4, %o0
	mov	8, %o1
	mov	%o0, %i3
	mov	1, %o2
	call	cortos_reserveQueue, 0
	 mov	4, %o0
	mov	%i0, %o1
	mov	%o0, %i1
	mov	%i3, %o2
	sethi	%hi(.LC7), %o0
	mov	%i1, %o3
	or	%o0, %lo(.LC7), %o0
	sethi	%hi(.LC8), %i4
	call	cortos_printf, 0
	 mov	0, %i5
	add	%fp, -32, %i2
	or	%i4, %lo(.LC8), %i4
.L14:
	call	cortos_bget_ncram, 0
	 mov	180, %o0
	sll	%i5, 2, %g1
	mov	%o0, %o2
	mov	%i5, %o1
	st	%o0, [%g1+%i2]
	call	cortos_printf, 0
	 mov	%i4, %o0
	add	%i5, 1, %i5
	cmp	%i5, 8
	bne	.L14
	 mov	%i2, %o1
	mov	4, %o2
	call	cortos_writeMessages, 0
	 mov	%i0, %o0
	mov	%i0, %o0
	mov	%i3, %o1
	call	nicRegConfig, 0
	 mov	%i1, %o2
	sethi	%hi(.LC9), %o0
	sethi	%hi(.LC10), %i5
	or	%o0, %lo(.LC9), %o0
	call	cortos_printf, 0
	 mov	0, %i4
	b	.L18
	 or	%i5, %lo(.LC10), %i5
.L23:
	call	swapMacAddress, 0
	 add	%i4, 1, %i4
	add	%fp, -36, %o1
	mov	1, %o2
	call	cortos_writeMessages, 0
	 mov	%i1, %o0
	mov	%i5, %o0
	call	cortos_printf, 0
	 mov	%i4, %o1
	cmp	%i4, 20
	be	.L22
	 nop
.L18:
	add	%fp, -36, %o1
.L24:
	mov	1, %o2
	call	cortos_readMessages, 0
	 mov	%i3, %o0
	cmp	%o0, 0
	bne	.L23
	 add	%fp, -36, %o0
	call	__ajit_sleep__, 0
	 mov	1024, %o0
	cmp	%i4, 20
	bne	.L24
	 add	%fp, -36, %o1
.L22:
	call	readNicReg, 0
	 mov	21, %o0
	mov	%o0, %o1
	sethi	%hi(.LC11), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC11), %o0
	mov	0, %o1
	call	writeNicReg, 0
	 mov	0, %o0
	call	cortos_freeQueue, 0
	 mov	%i3, %o0
	call	cortos_freeQueue, 0
	 mov	%i1, %o0
	mov	%i2, %i5
	mov	%fp, %i4
	call	cortos_freeQueue, 0
	 mov	%i0, %o0
.L19:
	call	cortos_brel, 0
	 ld	[%i5], %o0
	add	%i5, 4, %i5
	cmp	%i5, %i4
	bne	.L19
	 nop
	jmp	%i7+8
	 restore %g0, 0, %o0
	.size	main, .-main
	.section	.rodata.str1.8
	.align 8
.LC12:
	.asciz	"content of header are: \n"
	.align 8
.LC13:
	.asciz	"%x %x %x %x %x %x %x %x  \n"
	.align 8
.LC14:
	.asciz	"content of payload are: \n"
	.align 8
.LC15:
	.asciz	"%x %x %x %x %x %x %x %x => %c %c %c %c %c %c %c %c \n"
	.section	".text"
	.align 4
	.global printFrame
	.type	printFrame, #function
	.proc	020
printFrame:
	save	%sp, -144, %sp
	sethi	%hi(.LC12), %o0
	sethi	%hi(.LC13), %i4
	or	%o0, %lo(.LC12), %o0
	call	cortos_printf, 0
	 mov	0, %i5
	or	%i4, %lo(.LC13), %i4
	ld	[%i0], %g2
.L30:
	add	%i5, %g2, %g1
	ldub	[%g1+7], %o1
	ldub	[%g1+6], %o2
	ldub	[%g1+5], %o3
	ldub	[%g1+4], %o4
	ldub	[%g1+3], %o5
	ldub	[%g1+2], %g3
	st	%g3, [%sp+92]
	ldub	[%g1+1], %g1
	st	%g1, [%sp+96]
	ldub	[%i5+%g2], %g1
	mov	%i4, %o0
	call	cortos_printf, 0
	 st	%g1, [%sp+100]
	add	%i5, 8, %i5
	cmp	%i5, 40
	bne,a	.L30
	 ld	[%i0], %g2
	sethi	%hi(.LC14), %o0
	sethi	%hi(.LC15), %i4
	or	%o0, %lo(.LC14), %o0
	call	cortos_printf, 0
	 or	%i4, %lo(.LC15), %i4
	ld	[%i0], %g1
.L31:
	ldub	[%i5+%g1], %g2
	add	%i5, %g1, %g1
	ldub	[%g1+7], %g4
	ldub	[%g1+6], %o2
	ldub	[%g1+5], %o3
	ldub	[%g1+4], %o4
	ldub	[%g1+3], %o5
	ldub	[%g1+2], %g3
	ldub	[%g1+1], %g1
	mov	%i4, %o0
	mov	%g4, %o1
	st	%g3, [%sp+92]
	st	%g1, [%sp+96]
	st	%g2, [%sp+100]
	st	%g4, [%sp+104]
	st	%o2, [%sp+108]
	st	%o3, [%sp+112]
	st	%o4, [%sp+116]
	st	%o5, [%sp+120]
	st	%g3, [%sp+124]
	st	%g1, [%sp+128]
	call	cortos_printf, 0
	 st	%g2, [%sp+132]
	add	%i5, 8, %i5
	cmp	%i5, 96
	bne,a	.L31
	 ld	[%i0], %g1
	jmp	%i7+8
	 restore
	.size	printFrame, .-printFrame
	.global NIC_REG
	.section	".data"
	.align 4
	.type	NIC_REG, #object
	.size	NIC_REG, 4
NIC_REG:
	.long	536870912
	.global MEM
	.align 4
	.type	MEM, #object
	.size	MEM, 4
MEM:
	.long	333824
	.ident	"GCC: (Buildroot 2014.08-g2ac7e17) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
