	.file	"main.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"length modfied to:%08lx\n"
	.align 8
.LC1:
	.asciz	"msgSizeInBytes modfied to:%08lx\n"
	.align 8
.LC2:
	.asciz	"Lock address modfied to:0x%08lx\n"
	.section	".text"
	.align 4
	.global cortos_readMessages2
	.type	cortos_readMessages2, #function
	.proc	016
cortos_readMessages2:
	save	%sp, -96, %sp
	ld	[%i0+28], %g1
	andcc	%g1, 1, %g0
	bne,a	.L2
	 ld	[%i0], %i5
	ld	[%i0+20], %o0
	sethi	%hi(1073823744), %g1
	or	%g1, 6, %g1
	cmp	%o0, %g1
	be	.L3
	 nop
	ld	[%i0+12], %o1
	sethi	%hi(.LC0), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC0), %o0
	ld	[%i0+16], %o1
	sethi	%hi(.LC1), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC1), %o0
	ld	[%i0+20], %o1
	sethi	%hi(.LC2), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC2), %o0
	call	cortos_exit, 0
	 mov	0, %o0
	ld	[%i0+20], %o0
.L3:
	call	cortos_lock_acquire_buzy, 0
	 nop
	ld	[%i0], %i5
.L4:
	ld	[%i0+4], %i4
	ld	[%i0+12], %o7
	ld	[%i0+16], %g3
	cmp	%i5, 0
	be	.L15
	 add	%i0, 32, %o5
	cmp	%i2, 0
	be	.L6
	 mov	0, %i3
	mov	%i2, %i3
	smul	%i4, %g3, %g4
.L33:
	mov	0, %g1
	cmp	%g3, 0
	be	.L11
	 add	%o5, %g4, %g4
	ldub	[%g4+%g1], %g2
.L32:
	stb	%g2, [%i1+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %g3
	bne,a	.L32
	 ldub	[%g4+%g1], %g2
.L11:
	add	%i4, 1, %i4
	add	%i3, -1, %i3
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%i4, %o7, %g1
	add	%i1, %g3, %i1
	smul	%g1, %o7, %g1
	addcc	%i5, -1, %i5
	be	.L10
	 sub	%i4, %g1, %i4
	cmp	%i3, 0
	bne,a	.L33
	 smul	%i4, %g3, %g4
.L10:
	sub	%i2, %i3, %i3
.L6:
	st	%i4, [%i0+4]
	st	%i5, [%i0]
	ld	[%i0+28], %g1
	andcc	%g1, 1, %g0
	bne	.L5
	 sethi	%hi(1073823744), %g1
	ld	[%i0+20], %o0
	or	%g1, 6, %g1
	cmp	%o0, %g1
	be	.L13
	 nop
	ld	[%i0+12], %o1
	sethi	%hi(.LC0), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC0), %o0
	ld	[%i0+16], %o1
	sethi	%hi(.LC1), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC1), %o0
	ld	[%i0+20], %o1
	sethi	%hi(.LC2), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC2), %o0
	call	cortos_exit, 0
	 mov	0, %o0
	ld	[%i0+20], %o0
.L13:
	call	cortos_lock_release, 0
	 nop
.L5:
	jmp	%i7+8
	 restore %g0, %i3, %o0
.L2:
	cmp	%i5, 0
	bne	.L4
	 mov	0, %i3
	jmp	%i7+8
	 restore %g0, %i3, %o0
.L15:
	b	.L6
	 mov	0, %i3
	.size	cortos_readMessages2, .-cortos_readMessages2
	.section	.rodata.str1.8
	.align 8
.LC3:
	.asciz	"%s address: VA = 0x%lx , PA = 0x%016llx \n"
	.align 8
.LC4:
	.asciz	"%s address translation not found\n"
	.align 8
.LC5:
	.asciz	"%s lock address: VA = 0x%lx , PA = 0x%016llx \n"
	.align 8
.LC6:
	.asciz	"%s lock address translation not found\n"
	.align 8
.LC7:
	.asciz	"%s buffer start address: VA = 0x%lx , PA = 0x%016llx \n"
	.align 8
.LC8:
	.asciz	"%s buffer address translation not found\n"
	.section	".text"
	.align 4
	.global findQueuePhyAddr
	.type	findQueuePhyAddr, #function
	.proc	020
findQueuePhyAddr:
	save	%sp, -96, %sp
	mov	%i2, %o1
	call	translateVaToPa, 0
	 mov	%i1, %o0
	cmp	%o0, 0
	bne	.L35
	 mov	%i0, %o1
	mov	%i1, %o2
	ld	[%i2], %o3
	ld	[%i2+4], %o4
	sethi	%hi(.LC3), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC3), %o0
	mov	%i3, %o1
	call	translateVaToPa, 0
	 ld	[%i1+20], %o0
	cmp	%o0, 0
	bne	.L37
	 mov	%i0, %o1
.L41:
	ld	[%i1+20], %o2
	ld	[%i3], %o3
	ld	[%i3+4], %o4
	sethi	%hi(.LC5), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC5), %o0
	add	%i1, 32, %i2
	mov	%i4, %o1
	mov	%i2, %o0
	call	translateVaToPa, 0
	 mov	%i0, %i1
	cmp	%o0, 0
	be,a	.L42
	 sethi	%hi(.LC7), %i0
	sethi	%hi(.LC8), %i0
.L43:
	call	cortos_printf, 0
	 restore %i0, %lo(.LC8), %o0
.L35:
	sethi	%hi(.LC4), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC4), %o0
	mov	%i3, %o1
	call	translateVaToPa, 0
	 ld	[%i1+20], %o0
	cmp	%o0, 0
	be	.L41
	 mov	%i0, %o1
.L37:
	sethi	%hi(.LC6), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC6), %o0
	add	%i1, 32, %i2
	mov	%i4, %o1
	mov	%i2, %o0
	call	translateVaToPa, 0
	 mov	%i0, %i1
	cmp	%o0, 0
	bne	.L43
	 sethi	%hi(.LC8), %i0
	sethi	%hi(.LC7), %i0
.L42:
	ld	[%i4], %i3
	ld	[%i4+4], %i4
	call	cortos_printf, 0
	 restore %i0, %lo(.LC7), %o0
	.size	findQueuePhyAddr, .-findQueuePhyAddr
	.section	.rodata.str1.8
	.align 8
.LC9:
	.asciz	"Started\n"
	.align 8
.LC10:
	.asciz	"Reserved queues in non cacheable region: free=0x%lx, rx=0x%lx, tx=0x%lx\n"
	.align 8
.LC11:
	.asciz	"free_queue"
	.align 8
.LC12:
	.asciz	"rx_queue"
	.align 8
.LC13:
	.asciz	"tx_queue"
	.align 8
.LC14:
	.asciz	"free_queue addr: %016llx,free_queue lock addr: %016llx,free_queue buffer addr: %016llx\n"
	.align 8
.LC15:
	.asciz	"rx_queue addr: %016llx,rx_queue lock addr: %016llx,rx_queue buffer addr: %016llx \n"
	.align 8
.LC16:
	.asciz	"tx_queue addr: %016llx,tx_queue lock addr: %016llx,tx_queue buffer addr: %016llx \n"
	.align 8
.LC17:
	.asciz	"Allocated Buffer[%d] VA = 0x%08lx\n"
	.align 8
.LC18:
	.asciz	"Allocated Buffer[%d] PA = 0x%016llx\n"
	.align 8
.LC19:
	.asciz	"Stored Buffer[%d] in free-queue = 0x%016llx\n"
	.align 8
.LC20:
	.asciz	"no. of item in free queue: %u\n"
	.align 8
.LC21:
	.asciz	"Control register = 0x%08lx\n"
	.align 8
.LC22:
	.asciz	"Configuration Done. NIC has started\n"
	.align 8
.LC23:
	.asciz	"bufferPtr(PA) stored in freeQ at : 0x%08lx is 0x%016llx\n"
	.align 8
.LC24:
	.asciz	"last written addr ny NIC:0x%08lx\n"
	.align 8
.LC25:
	.asciz	"bufferPtr(PA) red = %016llx\n"
	.align 8
.LC26:
	.asciz	"rxQ: %u, %u, %u, %u, %u, %u, %u, %u \n"
	.align 8
.LC27:
	.asciz	"txQ: %u, %u, %u, %u, %u, %u, %u, %u \n"
	.align 8
.LC28:
	.asciz	"bufferPtr(PA) written = %016llx\n"
	.align 8
.LC29:
	.asciz	"message_counter:%d\n"
	.align 8
.LC30:
	.asciz	"transmitted packet = %u, Received packet = %u, status register = %u\n"
	.align 8
.LC31:
	.asciz	"Releasing buffer[%d] 0x%lx\n"
	.align 8
.LC32:
	.asciz	"Released  buffer[%d] 0x%lx\n"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -696, %sp
	call	__ajit_write_serial_control_register_via_vmap__, 0
	 mov	1, %o0
	sethi	%hi(.LC9), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC9), %o0
	mov	4, %o1
	mov	1, %o2
	call	cortos_reserveQueue, 0
	 mov	8, %o0
	sethi	%hi(free_queue), %i4
	mov	4, %o1
	st	%o0, [%i4+%lo(free_queue)]
	mov	1, %o2
	call	cortos_reserveQueue, 0
	 mov	8, %o0
	sethi	%hi(rx_queue), %i3
	mov	4, %o1
	st	%o0, [%i3+%lo(rx_queue)]
	mov	1, %o2
	call	cortos_reserveQueue, 0
	 mov	8, %o0
	sethi	%hi(tx_queue), %i5
	mov	%o0, %o3
	ld	[%i4+%lo(free_queue)], %o1
	ld	[%i3+%lo(rx_queue)], %o2
	st	%o0, [%i5+%lo(tx_queue)]
	sethi	%hi(.LC10), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC10), %o0
	ld	[%i4+%lo(free_queue)], %o1
	add	%fp, -568, %o2
	add	%fp, -560, %o3
	add	%fp, -552, %o4
	sethi	%hi(.LC11), %o0
	call	findQueuePhyAddr, 0
	 or	%o0, %lo(.LC11), %o0
	ld	[%i3+%lo(rx_queue)], %o1
	add	%fp, -544, %o2
	add	%fp, -536, %o3
	add	%fp, -528, %o4
	sethi	%hi(.LC12), %o0
	call	findQueuePhyAddr, 0
	 or	%o0, %lo(.LC12), %o0
	ld	[%i5+%lo(tx_queue)], %o1
	add	%fp, -520, %o2
	add	%fp, -512, %o3
	add	%fp, -504, %o4
	sethi	%hi(.LC13), %o0
	call	findQueuePhyAddr, 0
	 or	%o0, %lo(.LC13), %o0
	call	setGlobalNicRegisterBasePointer, 0
	 sethi	%hi(-16777216), %o0
	ldd	[%fp-568], %g2
	std	%g2, [%fp-408]
	ldd	[%fp-560], %g2
	std	%g2, [%fp-400]
	ldd	[%fp-552], %g2
	std	%g2, [%fp-392]
	ldd	[%fp-544], %g2
	std	%g2, [%fp-384]
	ldd	[%fp-536], %g2
	std	%g2, [%fp-320]
	ldd	[%fp-528], %g2
	std	%g2, [%fp-256]
	ldd	[%fp-520], %g2
	std	%g2, [%fp-192]
	ldd	[%fp-512], %g2
	mov	1, %g1
	std	%g2, [%fp-128]
	ldd	[%fp-504], %g2
	st	%g1, [%fp-412]
	std	%g2, [%fp-64]
	add	%fp, -416, %o0
	call	configureNic, 0
	 st	%g0, [%fp-416]
	mov	0, %o0
	mov	0, %o1
	mov	0, %o2
	add	%fp, -488, %o3
	add	%fp, -480, %o4
	call	getNicQueuePhysicalAddresses, 0
	 add	%fp, -472, %o5
	mov	0, %o0
	mov	0, %o1
	mov	2, %o2
	add	%fp, -464, %o3
	add	%fp, -456, %o4
	call	getNicQueuePhysicalAddresses, 0
	 add	%fp, -448, %o5
	mov	0, %o0
	mov	0, %o1
	mov	1, %o2
	add	%fp, -440, %o3
	add	%fp, -432, %o4
	call	getNicQueuePhysicalAddresses, 0
	 add	%fp, -424, %o5
	ld	[%fp-468], %g1
	ld	[%fp-472], %o5
	ld	[%fp-488], %o1
	ld	[%fp-484], %o2
	ld	[%fp-480], %o3
	ld	[%fp-476], %o4
	st	%g1, [%sp+92]
	sethi	%hi(.LC14), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC14), %o0
	ld	[%fp-444], %g1
	ld	[%fp-448], %o5
	ld	[%fp-464], %o1
	ld	[%fp-460], %o2
	ld	[%fp-456], %o3
	ld	[%fp-452], %o4
	st	%g1, [%sp+92]
	sethi	%hi(.LC15), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC15), %o0
	ld	[%fp-420], %g1
	ld	[%fp-424], %o5
	st	%g1, [%sp+92]
	sethi	%hi(.LC16), %o0
	ld	[%fp-440], %o1
	or	%o0, %lo(.LC16), %o0
	ld	[%fp-436], %o2
	ld	[%fp-432], %o3
	ld	[%fp-428], %o4
	sethi	%hi(BufferPtrsVA), %l0
	sethi	%hi(.LC17), %i1
	call	cortos_printf, 0
	 mov	0, %i2
	or	%l0, %lo(BufferPtrsVA), %l0
	or	%i1, %lo(.LC17), %i1
.L45:
	call	cortos_bget_ncram, 0
	 mov	128, %o0
	sll	%i2, 2, %g1
	mov	%o0, %o2
	mov	%i2, %o1
	st	%o0, [%l0+%g1]
	call	cortos_printf, 0
	 mov	%i1, %o0
	add	%i2, 1, %i2
	cmp	%i2, 4
	bne	.L45
	 sethi	%hi(.LC18), %l1
	sethi	%hi(BufferPtrsPA), %i1
	mov	0, %i2
	or	%i1, %lo(BufferPtrsPA), %i1
	or	%l1, %lo(.LC18), %l1
	sll	%i2, 2, %g1
.L81:
	sll	%i2, 3, %i0
	ld	[%l0+%g1], %o0
	call	translateVaToPa, 0
	 add	%i1, %i0, %o1
	cmp	%o0, 0
	be	.L71
	 mov	%i2, %o1
	add	%i2, 1, %i2
	cmp	%i2, 4
.L79:
	bne	.L81
	 sll	%i2, 2, %g1
	sethi	%hi(free_queue), %i0
	sethi	%hi(.LC19), %l2
	mov	0, %i2
	or	%i0, %lo(free_queue), %i0
	or	%l2, %lo(.LC19), %l2
	sll	%i2, 3, %l1
.L82:
	mov	1, %o2
	add	%i1, %l1, %o1
	call	cortos_writeMessages, 0
	 ld	[%i0], %o0
	cmp	%o0, 0
	bne	.L72
	 mov	%i2, %o1
	add	%i2, 1, %i2
	cmp	%i2, 4
.L78:
	bne	.L82
	 sll	%i2, 3, %l1
	ld	[%i4+%lo(free_queue)], %g1
	sethi	%hi(.LC20), %o0
	add	%g1, 32, %i2
	ld	[%g1], %o1
	call	cortos_printf, 0
	 or	%o0, %lo(.LC20), %o0
	ld	[%i4+%lo(free_queue)], %g1
	sethi	%hi(.LC23), %l1
	ld	[%g1], %g1
	mov	0, %i1
	cmp	%g1, 0
	be	.L53
	 or	%l1, %lo(.LC23), %l1
.L62:
	mov	%i2, %o1
	ldd	[%i2], %o2
	call	cortos_printf, 0
	 mov	%l1, %o0
	add	%i1, 1, %i1
	ld	[%i0], %g1
	ld	[%g1], %g1
	cmp	%i1, %g1
	blu	.L62
	 add	%i2, 8, %i2
.L53:
	mov	1, %o2
	mov	1, %o3
	mov	0, %o0
	call	enableNic, 0
	 mov	0, %o1
	mov	0, %o1
	call	readFromNicReg, 0
	 mov	0, %o0
	mov	%o0, %o1
	sethi	%hi(.LC21), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC21), %o0
	sethi	%hi(.LC22), %o0
	sethi	%hi(rx_queue), %i1
	or	%o0, %lo(.LC22), %o0
	sethi	%hi(.LC24), %l4
	sethi	%hi(.LC25), %l3
	sethi	%hi(.LC26), %l2
	sethi	%hi(.LC29), %l1
	sethi	%hi(.LC30), %i0
	call	cortos_printf, 0
	 mov	0, %i2
	or	%i1, %lo(rx_queue), %i1
	or	%l4, %lo(.LC24), %l4
	or	%l3, %lo(.LC25), %l3
	or	%l2, %lo(.LC26), %l2
	or	%l1, %lo(.LC29), %l1
	b	.L51
	 or	%i0, %lo(.LC30), %i0
.L75:
	call	readFromNicReg, 0
	 add	%i2, 1, %i2
	mov	%o0, %o1
	call	cortos_printf, 0
	 mov	%l4, %o0
	ld	[%fp-496], %o1
	ld	[%fp-492], %o2
	call	cortos_printf, 0
	 mov	%l3, %o0
	ld	[%i1], %g1
	ld	[%g1+20], %g2
	st	%g2, [%sp+92]
	ld	[%g1+24], %g2
	st	%g2, [%sp+96]
	ld	[%g1+28], %g2
	mov	%l2, %o0
	st	%g2, [%sp+100]
	ld	[%g1], %o1
	ld	[%g1+4], %o2
	ld	[%g1+12], %o4
	ld	[%g1+16], %o5
	call	cortos_printf, 0
	 ld	[%g1+8], %o3
	add	%fp, -496, %o1
	mov	1, %o2
	call	cortos_writeMessages, 0
	 ld	[%i5+%lo(tx_queue)], %o0
	cmp	%o0, 0
	bne	.L73
	 ld	[%i5+%lo(tx_queue)], %g1
	mov	%i2, %o1
.L80:
	call	cortos_printf, 0
	 mov	%l1, %o0
	add	%fp, -580, %o1
	add	%fp, -576, %o2
	add	%fp, -572, %o3
	call	probeNic, 0
	 mov	0, %o0
	mov	%i0, %o0
	ld	[%fp-580], %o1
	call	cortos_printf, 0
	 ldd	[%fp-576], %o2
	cmp	%i2, 2048
	be	.L74
	 nop
.L51:
	add	%fp, -496, %o1
.L83:
	mov	1, %o2
	call	cortos_readMessages2, 0
	 ld	[%i1], %o0
	mov	220, %o1
	cmp	%o0, 0
	bne	.L75
	 mov	0, %o0
	call	__ajit_sleep__, 0
	 mov	1024, %o0
	cmp	%i2, 2048
	bne	.L83
	 add	%fp, -496, %o1
.L74:
	call	disableNic, 0
	 mov	0, %o0
	call	cortos_freeQueue, 0
	 ld	[%i3+%lo(rx_queue)], %o0
	call	cortos_freeQueue, 0
	 ld	[%i5+%lo(tx_queue)], %o0
	ld	[%i4+%lo(free_queue)], %o0
	sethi	%hi(.LC31), %i2
	sethi	%hi(.LC32), %i3
	call	cortos_freeQueue, 0
	 mov	%l0, %i5
	mov	0, %i4
	or	%i2, %lo(.LC31), %i2
	or	%i3, %lo(.LC32), %i3
.L57:
	ld	[%i5], %o2
	mov	%i4, %o1
	call	cortos_printf, 0
	 mov	%i2, %o0
	call	cortos_brel_ncram, 0
	 ld	[%i5], %o0
	mov	%i4, %o1
	ld	[%i5], %o2
	call	cortos_printf, 0
	 mov	%i3, %o0
	add	%i4, 1, %i4
	cmp	%i4, 4
	bne	.L57
	 add	%i5, 4, %i5
	call	cortos_exit, 0
	 mov	0, %o0
	jmp	%i7+8
	 restore
.L72:
	mov	%l2, %o0
	ldd	[%i1+%l1], %o2
	call	cortos_printf, 0
	 add	%i2, 1, %i2
	b	.L78
	 cmp	%i2, 4
.L71:
	mov	%l1, %o0
	ldd	[%i1+%i0], %o2
	call	cortos_printf, 0
	 add	%i2, 1, %i2
	b	.L79
	 cmp	%i2, 4
.L73:
	ld	[%g1+20], %g2
	st	%g2, [%sp+92]
	ld	[%g1+24], %g2
	st	%g2, [%sp+96]
	ld	[%g1+28], %g2
	sethi	%hi(.LC27), %o0
	st	%g2, [%sp+100]
	or	%o0, %lo(.LC27), %o0
	ld	[%g1], %o1
	ld	[%g1+4], %o2
	ld	[%g1+12], %o4
	ld	[%g1+16], %o5
	call	cortos_printf, 0
	 ld	[%g1+8], %o3
	ld	[%fp-496], %o1
	ld	[%fp-492], %o2
	sethi	%hi(.LC28), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC28), %o0
	b	.L80
	 mov	%i2, %o1
	.size	main, .-main
	.common	BufferPtrsPA,32,8
	.common	BufferPtrsVA,16,4
	.common	tx_queue,4,4
	.common	rx_queue,4,4
	.common	free_queue,4,4
	.ident	"GCC: (Buildroot 2014.08-g2ac7e17) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
