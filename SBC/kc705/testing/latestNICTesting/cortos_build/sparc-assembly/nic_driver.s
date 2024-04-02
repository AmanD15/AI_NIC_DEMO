	.file	"nic_driver.c"
	.section	".text"
	.align 4
	.global getGlobalNicRegisterBasePointer
	.type	getGlobalNicRegisterBasePointer, #function
	.proc	016
getGlobalNicRegisterBasePointer:
	sethi	%hi(global_nic_register_base_pointer), %g1
	jmp	%o7+8
	 ld	[%g1+%lo(global_nic_register_base_pointer)], %o0
	.size	getGlobalNicRegisterBasePointer, .-getGlobalNicRegisterBasePointer
	.align 4
	.global setGlobalNicRegisterBasePointer
	.type	setGlobalNicRegisterBasePointer, #function
	.proc	04
setGlobalNicRegisterBasePointer:
	andcc	%o0, 0xff, %g0
	bne	.L6
	 sethi	%hi(global_nic_register_base_pointer), %g1
	st	%o0, [%g1+%lo(global_nic_register_base_pointer)]
.L6:
	jmp	%o7+8
	 nop
	.size	setGlobalNicRegisterBasePointer, .-setGlobalNicRegisterBasePointer
	.align 4
	.global accessNicReg
	.type	accessNicReg, #function
	.proc	016
accessNicReg:
	sll	%o1, 6, %o1
	sethi	%hi(global_nic_register_base_pointer), %g1
	add	%o2, %o1, %o2
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g1
	cmp	%o0, 0
	bne	.L10
	 sll	%o2, 2, %o1
	st	%o3, [%o1+%g1]
	jmp	%o7+8
	 mov	0, %o0
.L10:
	jmp	%o7+8
	 ld	[%o1+%g1], %o0
	.size	accessNicReg, .-accessNicReg
	.align 4
	.global writeToNicReg
	.type	writeToNicReg, #function
	.proc	020
writeToNicReg:
	sll	%o0, 6, %o0
	sethi	%hi(global_nic_register_base_pointer), %g1
	add	%o0, %o1, %o1
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g1
	sll	%o1, 2, %o0
	jmp	%o7+8
	 st	%o2, [%g1+%o0]
	.size	writeToNicReg, .-writeToNicReg
	.align 4
	.global readFromNicReg
	.type	readFromNicReg, #function
	.proc	016
readFromNicReg:
	sll	%o0, 6, %o0
	sethi	%hi(global_nic_register_base_pointer), %g1
	add	%o0, %o1, %o1
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g1
	sll	%o1, 2, %o0
	jmp	%o7+8
	 ld	[%g1+%o0], %o0
	.size	readFromNicReg, .-readFromNicReg
	.align 4
	.global setPhysicalAddressInNicRegPair
	.type	setPhysicalAddressInNicRegPair, #function
	.proc	020
setPhysicalAddressInNicRegPair:
	sethi	%hi(global_nic_register_base_pointer), %g1
	sll	%o0, 6, %o0
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g2
	add	%o0, %o1, %o1
	sll	%o1, 2, %g3
	st	%o2, [%g2+%g3]
	add	%o1, 1, %o1
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g1
	sll	%o1, 2, %o1
	jmp	%o7+8
	 st	%o3, [%g1+%o1]
	.size	setPhysicalAddressInNicRegPair, .-setPhysicalAddressInNicRegPair
	.align 4
	.global getPhysicalAddressInNicRegPair
	.type	getPhysicalAddressInNicRegPair, #function
	.proc	017
getPhysicalAddressInNicRegPair:
	sll	%o0, 6, %o0
	sethi	%hi(global_nic_register_base_pointer), %g1
	add	%o0, %o1, %o1
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g1
	sll	%o1, 2, %g4
	add	%o1, 1, %o1
	sll	%o1, 2, %o1
	ld	[%g1+%o1], %o4
	ld	[%g1+%g4], %g2
	mov	%o4, %o5
	mov	0, %g3
	mov	0, %o4
	or	%o5, %g3, %g3
	or	%o4, %g2, %g2
	mov	%g3, %o1
	jmp	%o7+8
	 mov	%g2, %o0
	.size	getPhysicalAddressInNicRegPair, .-getPhysicalAddressInNicRegPair
	.align 4
	.global setNumberOfServersInNic
	.type	setNumberOfServersInNic, #function
	.proc	020
setNumberOfServersInNic:
	sll	%o0, 8, %o0
	sethi	%hi(global_nic_register_base_pointer), %g1
	add	%o0, 4, %o0
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g1
	jmp	%o7+8
	 st	%o1, [%g1+%o0]
	.size	setNumberOfServersInNic, .-setNumberOfServersInNic
	.align 4
	.global getNumberOfServersInNic
	.type	getNumberOfServersInNic, #function
	.proc	016
getNumberOfServersInNic:
	sll	%o0, 8, %o0
	sethi	%hi(global_nic_register_base_pointer), %g1
	add	%o0, 4, %o0
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g1
	jmp	%o7+8
	 ld	[%g1+%o0], %o0
	.size	getNumberOfServersInNic, .-getNumberOfServersInNic
	.align 4
	.global probeNic
	.type	probeNic, #function
	.proc	020
probeNic:
	sll	%o0, 6, %o0
	sethi	%hi(global_nic_register_base_pointer), %g1
	add	%o0, 210, %g2
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g3
	sll	%g2, 2, %g2
	ld	[%g3+%g2], %g2
	st	%g2, [%o1]
	add	%o0, 211, %g2
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g3
	sll	%g2, 2, %g2
	ld	[%g3+%g2], %g2
	st	%g2, [%o2]
	add	%o0, 212, %o0
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g1
	sll	%o0, 2, %o0
	ld	[%g1+%o0], %g1
	jmp	%o7+8
	 st	%g1, [%o3]
	.size	probeNic, .-probeNic
	.align 4
	.global writeNicControlRegister
	.type	writeNicControlRegister, #function
	.proc	020
writeNicControlRegister:
	sll	%o0, 8, %o0
	sethi	%hi(global_nic_register_base_pointer), %g1
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g1
	jmp	%o7+8
	 st	%o1, [%g1+%o0]
	.size	writeNicControlRegister, .-writeNicControlRegister
	.align 4
	.global enableNic
	.type	enableNic, #function
	.proc	020
enableNic:
	sll	%o0, 8, %o0
	sethi	%hi(global_nic_register_base_pointer), %g1
	add	%o2, %o2, %o2
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g1
	sll	%o1, 2, %o1
	or	%o2, %o3, %o3
	or	%o3, %o1, %o1
	jmp	%o7+8
	 st	%o1, [%g1+%o0]
	.size	enableNic, .-enableNic
	.align 4
	.global disableNic
	.type	disableNic, #function
	.proc	020
disableNic:
	sll	%o0, 8, %o0
	sethi	%hi(global_nic_register_base_pointer), %g1
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g1
	jmp	%o7+8
	 st	%g0, [%g1+%o0]
	.size	disableNic, .-disableNic
	.align 4
	.global setNicQueuePhysicalAddresses
	.type	setNicQueuePhysicalAddresses, #function
	.proc	020
setNicQueuePhysicalAddresses:
	save	%sp, -96, %sp
	mov	200, %g2
	ld	[%fp+92], %o5
	ld	[%fp+96], %o7
	cmp	%i2, 0
	be	.L22
	 ld	[%fp+100], %g3
	add	%i1, 16, %g2
	cmp	%i2, 2
	be	.L26
	 sll	%g2, 3, %g2
.L22:
	sethi	%hi(global_nic_register_base_pointer), %g1
	sll	%i0, 6, %i0
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g4
	add	%g2, %i0, %i0
	sll	%i0, 2, %g2
	st	%i3, [%g4+%g2]
	add	%i0, 1, %g2
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g4
	sll	%g2, 2, %g2
	st	%i4, [%g4+%g2]
	add	%i0, 2, %g2
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g4
	sll	%g2, 2, %g2
	st	%i5, [%g4+%g2]
	add	%i0, 3, %g2
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g4
	sll	%g2, 2, %g2
	st	%o5, [%g4+%g2]
	add	%i0, 4, %g2
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g4
	sll	%g2, 2, %g2
	st	%o7, [%g4+%g2]
	add	%i0, 5, %i0
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g1
	sll	%i0, 2, %i0
	st	%g3, [%g1+%i0]
	jmp	%i7+8
	 restore
.L26:
	add	%i1, 1, %g2
	b	.L22
	 sll	%g2, 3, %g2
	.size	setNicQueuePhysicalAddresses, .-setNicQueuePhysicalAddresses
	.align 4
	.global getNicQueuePhysicalAddresses
	.type	getNicQueuePhysicalAddresses, #function
	.proc	020
getNicQueuePhysicalAddresses:
	save	%sp, -96, %sp
	mov	200, %g2
	mov	%i3, %g4
	cmp	%i2, 0
	be	.L28
	 mov	%i5, %o7
	add	%i1, 16, %g2
	cmp	%i2, 2
	be	.L32
	 sll	%g2, 3, %g2
.L28:
	sll	%i0, 6, %i0
	sethi	%hi(global_nic_register_base_pointer), %g1
	add	%g2, %i0, %i0
	ld	[%g1+%lo(global_nic_register_base_pointer)], %g1
	sll	%i0, 2, %i3
	add	%i0, 1, %i5
	sll	%i5, 2, %i5
	ld	[%g1+%i5], %i2
	ld	[%g1+%i3], %g2
	mov	%i2, %i3
	mov	0, %i2
	mov	0, %g3
	or	%g2, %i2, %g2
	or	%g3, %i3, %g3
	std	%g2, [%g4]
	add	%i0, 3, %g4
	sll	%g4, 2, %g4
	ld	[%g1+%g4], %i2
	add	%i0, 2, %i5
	mov	%i2, %i3
	sll	%i5, 2, %i5
	add	%i0, 4, %g4
	ld	[%g1+%i5], %g2
	mov	0, %g3
	mov	0, %i2
	or	%g3, %i3, %g3
	or	%g2, %i2, %g2
	add	%i0, 5, %i0
	std	%g2, [%i4]
	sll	%i0, 2, %i0
	ld	[%g1+%i0], %i4
	sll	%g4, 2, %g4
	mov	%i4, %i5
	ld	[%g1+%g4], %g2
	mov	0, %g3
	mov	0, %i4
	or	%g3, %i5, %g3
	or	%g2, %i4, %g2
	std	%g2, [%o7]
	jmp	%i7+8
	 restore
.L32:
	add	%i1, 1, %g2
	b	.L28
	 sll	%g2, 3, %g2
	.size	getNicQueuePhysicalAddresses, .-getNicQueuePhysicalAddresses
	.align 4
	.global configureNic
	.type	configureNic, #function
	.proc	020
configureNic:
	save	%sp, -112, %sp
	sethi	%hi(global_nic_register_base_pointer), %g4
	mov	0, %g1
	or	%g4, %lo(global_nic_register_base_pointer), %g4
.L34:
	ld	[%i0], %g2
	ld	[%g4], %g3
	sll	%g2, 6, %g2
	add	%g2, %g1, %g2
	sll	%g2, 2, %g2
	add	%g1, 1, %g1
	cmp	%g1, 256
	bne	.L34
	 st	%g0, [%g3+%g2]
	ld	[%i0], %g1
	ld	[%i0+4], %g3
	ld	[%g4], %g2
	sll	%g1, 8, %g1
	add	%g1, 4, %g1
	st	%g3, [%g2+%g1]
	ld	[%i0+20], %g1
	ld	[%i0+24], %g3
	ld	[%i0+28], %g2
	st	%g1, [%sp+92]
	st	%g3, [%sp+96]
	st	%g2, [%sp+100]
	ld	[%i0+16], %o5
	ld	[%i0], %o0
	mov	0, %o1
	mov	0, %o2
	ld	[%i0+8], %o3
	call	setNicQueuePhysicalAddresses, 0
	 ld	[%i0+12], %o4
	ld	[%i0+4], %g1
	mov	%i0, %i5
	mov	0, %i3
	cmp	%g1, 0
	be	.L41
	 mov	0, %i4
.L38:
	ld	[%i5+352], %g1
	st	%g1, [%sp+96]
	ld	[%i5+356], %g1
	st	%g1, [%sp+100]
	ld	[%i5+292], %g1
	mov	%i3, %o1
	st	%g1, [%sp+92]
	ld	[%i0], %o0
	ld	[%i5+288], %o5
	ld	[%i5+224], %o3
	ld	[%i5+228], %o4
	call	setNicQueuePhysicalAddresses, 0
	 mov	1, %o2
	ld	[%i5+160], %g1
	st	%g1, [%sp+96]
	ld	[%i5+164], %g1
	st	%g1, [%sp+100]
	ld	[%i5+100], %g1
	mov	%i3, %o1
	st	%g1, [%sp+92]
	ld	[%i0], %o0
	ld	[%i5+96], %o5
	ld	[%i5+32], %o3
	ld	[%i5+36], %o4
	call	setNicQueuePhysicalAddresses, 0
	 mov	2, %o2
	add	%i4, 1, %i4
	ld	[%i0+4], %g1
	mov	%i4, %i3
	cmp	%i4, %g1
	blu	.L38
	 add	%i5, 8, %i5
.L41:
	jmp	%i7+8
	 restore
	.size	configureNic, .-configureNic
	.align 4
	.global initNicCortosQueue
	.type	initNicCortosQueue, #function
	.proc	020
initNicCortosQueue:
	cmp	%o0, 0
	be	.L47
	 nop
	st	%g0, [%o0]
	st	%g0, [%o0+4]
	st	%g0, [%o0+8]
	st	%o1, [%o0+12]
	st	%o2, [%o0+16]
	st	%o3, [%o0+20]
	st	%o4, [%o0+24]
	st	%o5, [%o0+28]
.L47:
	jmp	%o7+8
	 nop
	.size	initNicCortosQueue, .-initNicCortosQueue
	.align 4
	.global translateVaToPa
	.type	translateVaToPa, #function
	.proc	04
translateVaToPa:
	save	%sp, -120, %sp
	call	__ajit_load_word_mmu_reg__, 0
	 mov	512, %o0
	mov	%o0, %i5
	call	__ajit_load_word_mmu_reg__, 0
	 mov	256, %o0
	add	%fp, -8, %g1
	st	%g1, [%sp+92]
	add	%fp, -12, %g1
	mov	%i0, %o3
	srl	%o0, 2, %o1
	st	%g1, [%sp+96]
	sll	%o1, 6, %o1
	and	%i5, 0xff, %o2
	add	%fp, -13, %o4
	mov	%i1, %o5
	call	ajit_lookup_mmap, 0
	 srl	%o0, 28, %o0
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	translateVaToPa, .-translateVaToPa
	.common	global_nic_register_base_pointer,4,4
	.ident	"GCC: (Buildroot 2014.08-g2ac7e17) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
