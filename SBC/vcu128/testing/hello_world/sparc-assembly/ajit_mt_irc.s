	.file	"ajit_mt_irc.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.common	ajit_global_interrupt_handlers,64,4
	.align 4
	.global ajit_initialize_interrupt_handlers_to_null
	.type	ajit_initialize_interrupt_handlers_to_null, #function
	.proc	020
ajit_initialize_interrupt_handlers_to_null:
.LFB0:
	.file 1 "/home/tools_shared/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_mt_irc.c"
	.loc 1 11 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 13 0
	st	%g0, [%fp-4]
	b	.L2
	 nop
.L3:
	.loc 1 14 0 discriminator 2
	sethi	%hi(ajit_global_interrupt_handlers), %g1
	or	%g1, %lo(ajit_global_interrupt_handlers), %g2
	ld	[%fp-4], %g1
	sll	%g1, 2, %g1
	st	%g0, [%g2+%g1]
	.loc 1 13 0 discriminator 2
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
.L2:
	.loc 1 13 0 is_stmt 0 discriminator 1
	ld	[%fp-4], %g1
	cmp	%g1, 15
	ble	.L3
	 nop
	.loc 1 15 0 is_stmt 1
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE0:
	.size	ajit_initialize_interrupt_handlers_to_null, .-ajit_initialize_interrupt_handlers_to_null
	.align 4
	.global ajit_set_interrupt_handler
	.type	ajit_set_interrupt_handler, #function
	.proc	020
ajit_set_interrupt_handler:
.LFB1:
	.loc 1 18 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 19 0
	ld	[%fp+68], %g1
	cmp	%g1, 15
	bgu	.L4
	 nop
	.loc 1 20 0
	sethi	%hi(ajit_global_interrupt_handlers), %g1
	or	%g1, %lo(ajit_global_interrupt_handlers), %g2
	ld	[%fp+68], %g1
	sll	%g1, 2, %g1
	ld	[%fp+72], %g3
	st	%g3, [%g2+%g1]
.L4:
	.loc 1 22 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE1:
	.size	ajit_set_interrupt_handler, .-ajit_set_interrupt_handler
	.align 4
	.global ajit_generic_interrupt_handler
	.type	ajit_generic_interrupt_handler, #function
	.proc	020
ajit_generic_interrupt_handler:
.LFB2:
	.loc 1 25 0
	.cfi_startproc
	save	%sp, -120, %sp
.LCFI2:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 27 0
	add	%fp, -17, %g2
	add	%fp, -18, %g1
	mov	%g2, %o0
	mov	%g1, %o1
	call	ajit_get_core_and_thread_id, 0
	 nop
	.loc 1 28 0
	ldub	[%fp-17], %g1
	and	%g1, 0xff, %g2
	ldub	[%fp-18], %g1
	and	%g1, 0xff, %g1
	mov	%g2, %o0
	mov	%g1, %o1
	call	disableInterruptController, 0
	 nop
	.loc 1 30 0
	st	%g0, [%fp-4]
	.loc 1 31 0
	ld	[%fp+68], %g1
	srl	%g1, 4, %g1
	and	%g1, 255, %g1
	st	%g1, [%fp-8]
	.loc 1 32 0
	ld	[%fp-8], %g1
	cmp	%g1, 16
	bleu	.L7
	 nop
	.loc 1 32 0 is_stmt 0 discriminator 1
	ld	[%fp-8], %g1
	cmp	%g1, 31
	bgu	.L7
	 nop
.LBB2:
	.loc 1 34 0 is_stmt 1
	ld	[%fp-8], %g1
	add	%g1, -16, %g1
	st	%g1, [%fp-12]
	.loc 1 35 0
	sethi	%hi(ajit_global_interrupt_handlers), %g1
	or	%g1, %lo(ajit_global_interrupt_handlers), %g2
	ld	[%fp-12], %g1
	sll	%g1, 2, %g1
	ld	[%g2+%g1], %g1
	st	%g1, [%fp-16]
	.loc 1 36 0
	ld	[%fp-16], %g1
	cmp	%g1, 0
	be	.L8
	 nop
	.loc 1 38 0
	ld	[%fp-16], %g1
	call	%g1, 0
	 nop
.LBE2:
	.loc 1 33 0
	b	.L10
	 nop
.L8:
.LBB3:
	.loc 1 42 0
	mov	1, %g1
	st	%g1, [%fp-4]
.LBE3:
	.loc 1 33 0
	b	.L10
	 nop
.L7:
	.loc 1 46 0
	mov	1, %g1
	st	%g1, [%fp-4]
.L10:
	.loc 1 48 0
	ldub	[%fp-17], %g1
	and	%g1, 0xff, %g2
	ldub	[%fp-18], %g1
	and	%g1, 0xff, %g1
	mov	%g2, %o0
	mov	%g1, %o1
	call	enableInterruptController, 0
	 nop
	.loc 1 50 0
	ld	[%fp-4], %g1
	cmp	%g1, 0
	be	.L6
	 nop
	.loc 1 52 0
#APP
! 52 "/home/tools_shared/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_mt_irc.c" 1
	ta 0;
! 0 "" 2
#NO_APP
.L6:
	.loc 1 54 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE2:
	.size	ajit_generic_interrupt_handler, .-ajit_generic_interrupt_handler
	.align 4
	.global readInterruptControlRegister
	.type	readInterruptControlRegister, #function
	.proc	016
readInterruptControlRegister:
.LFB3:
	.loc 1 57 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI3:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 58 0
	ld	[%fp+68], %g1
	add	%g1, %g1, %g1
	mov	%g1, %g2
	ld	[%fp+72], %g1
	add	%g2, %g1, %g1
	sll	%g1, 2, %g1
	mov	%g1, %g2
	sethi	%hi(-53248), %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-4]
	.loc 1 62 0
	ld	[%fp-4], %o0
	call	__ajit_load_word_mmu_bypass__, 0
	 nop
	st	%o0, [%fp-8]
	.loc 1 64 0
	ld	[%fp-8], %g1
	.loc 1 65 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE3:
	.size	readInterruptControlRegister, .-readInterruptControlRegister
	.align 4
	.global writeInterruptControlRegister
	.type	writeInterruptControlRegister, #function
	.proc	020
writeInterruptControlRegister:
.LFB4:
	.loc 1 68 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI4:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	.loc 1 69 0
	ld	[%fp+68], %g1
	add	%g1, %g1, %g1
	mov	%g1, %g2
	ld	[%fp+72], %g1
	add	%g2, %g1, %g1
	sll	%g1, 2, %g1
	mov	%g1, %g2
	sethi	%hi(-53248), %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-4]
	.loc 1 73 0
	ld	[%fp+76], %o0
	ld	[%fp-4], %o1
	call	__ajit_store_word_mmu_bypass__, 0
	 nop
	.loc 1 75 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE4:
	.size	writeInterruptControlRegister, .-writeInterruptControlRegister
	.align 4
	.global enableInterruptController
	.type	enableInterruptController, #function
	.proc	020
enableInterruptController:
.LFB5:
	.loc 1 80 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI5:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 81 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	call	readInterruptControlRegister, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 82 0
	ld	[%fp-4], %g1
	or	%g1, 1, %g1
	st	%g1, [%fp-4]
	.loc 1 83 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	ld	[%fp-4], %o2
	call	writeInterruptControlRegister, 0
	 nop
	.loc 1 84 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE5:
	.size	enableInterruptController, .-enableInterruptController
	.align 4
	.global disableInterruptController
	.type	disableInterruptController, #function
	.proc	020
disableInterruptController:
.LFB6:
	.loc 1 88 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI6:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 89 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	call	readInterruptControlRegister, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 90 0
	ld	[%fp-4], %g1
	and	%g1, -2, %g1
	st	%g1, [%fp-4]
	.loc 1 91 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	ld	[%fp-4], %o2
	call	writeInterruptControlRegister, 0
	 nop
	.loc 1 92 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE6:
	.size	disableInterruptController, .-disableInterruptController
	.align 4
	.global enableInterrupt
	.type	enableInterrupt, #function
	.proc	020
enableInterrupt:
.LFB7:
	.loc 1 98 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI7:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	.loc 1 99 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	call	readInterruptControlRegister, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 100 0
	mov	1, %g2
	ld	[%fp+76], %g1
	sll	%g2, %g1, %g1
	ld	[%fp-4], %g2
	or	%g2, %g1, %g1
	st	%g1, [%fp-4]
	.loc 1 101 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	ld	[%fp-4], %o2
	call	writeInterruptControlRegister, 0
	 nop
	.loc 1 102 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE7:
	.size	enableInterrupt, .-enableInterrupt
	.align 4
	.global enableAllInterrupts
	.type	enableAllInterrupts, #function
	.proc	020
enableAllInterrupts:
.LFB8:
	.loc 1 107 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI8:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 108 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	call	readInterruptControlRegister, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 109 0
	ld	[%fp-4], %g2
	sethi	%hi(64512), %g1
	or	%g1, 1022, %g1
	or	%g2, %g1, %g1
	st	%g1, [%fp-4]
	.loc 1 110 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	ld	[%fp-4], %o2
	call	writeInterruptControlRegister, 0
	 nop
	.loc 1 111 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE8:
	.size	enableAllInterrupts, .-enableAllInterrupts
	.align 4
	.global enableInterruptControllerAndAllInterrupts
	.type	enableInterruptControllerAndAllInterrupts, #function
	.proc	020
enableInterruptControllerAndAllInterrupts:
.LFB9:
	.loc 1 116 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI9:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 117 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	sethi	%hi(64512), %g1
	or	%g1, 1023, %o2
	call	writeInterruptControlRegister, 0
	 nop
	.loc 1 118 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE9:
	.size	enableInterruptControllerAndAllInterrupts, .-enableInterruptControllerAndAllInterrupts
	.align 4
	.global setInterruptMask
	.type	setInterruptMask, #function
	.proc	020
setInterruptMask:
.LFB10:
	.loc 1 127 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI10:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	.loc 1 128 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	call	readInterruptControlRegister, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 131 0
	sethi	%hi(64512), %g1
	or	%g1, 1022, %g1
	st	%g1, [%fp-8]
	.loc 1 134 0
	ld	[%fp-8], %g1
	xnor	%g0, %g1, %g2
	ld	[%fp-4], %g1
	and	%g2, %g1, %g2
	ld	[%fp-8], %g3
	ld	[%fp+76], %g1
	and	%g3, %g1, %g1
	or	%g2, %g1, %g1
	st	%g1, [%fp-4]
	.loc 1 136 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	ld	[%fp-4], %o2
	call	writeInterruptControlRegister, 0
	 nop
	.loc 1 137 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE10:
	.size	setInterruptMask, .-setInterruptMask
	.align 4
	.global disableInterrupt
	.type	disableInterrupt, #function
	.proc	020
disableInterrupt:
.LFB11:
	.loc 1 142 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI11:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	.loc 1 143 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	call	readInterruptControlRegister, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 144 0
	mov	1, %g2
	ld	[%fp+76], %g1
	sll	%g2, %g1, %g1
	xnor	%g0, %g1, %g1
	ld	[%fp-4], %g2
	and	%g2, %g1, %g1
	st	%g1, [%fp-4]
	.loc 1 145 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	ld	[%fp-4], %o2
	call	writeInterruptControlRegister, 0
	 nop
	.loc 1 146 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE11:
	.size	disableInterrupt, .-disableInterrupt
.Letext0:
	.file 2 "/home/tools_shared/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x461
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF36
	.byte	0x1
	.uaword	.LASF37
	.uaword	.Ltext0
	.uaword	.Letext0
	.uaword	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.uaword	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.asciz	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.uaword	.LASF2
	.uleb128 0x4
	.uaword	.LASF5
	.byte	0x2
	.byte	0x2e
	.uaword	0x48
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.uaword	.LASF3
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.uaword	.LASF4
	.uleb128 0x4
	.uaword	.LASF6
	.byte	0x2
	.byte	0x34
	.uaword	0x61
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.uaword	.LASF8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF9
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.uaword	.LASF10
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF11
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LASF12
	.uleb128 0x5
	.byte	0x1
	.uaword	.LASF38
	.byte	0x1
	.byte	0xa
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LLST0
	.byte	0x1
	.uaword	0xb1
	.uleb128 0x6
	.asciz	"I"
	.byte	0x1
	.byte	0xc
	.uaword	0x2f
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.uaword	.LASF14
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.uaword	.LFB1
	.uaword	.LFE1
	.uaword	.LLST1
	.byte	0x1
	.uaword	0xea
	.uleb128 0x8
	.uaword	.LASF13
	.byte	0x1
	.byte	0x11
	.uaword	0x56
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x9
	.asciz	"foo"
	.byte	0x1
	.byte	0x11
	.uaword	0xf1
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.byte	0
	.uleb128 0xa
	.uaword	0xf1
	.uleb128 0xb
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.uaword	0xea
	.uleb128 0xd
	.byte	0x1
	.uaword	.LASF15
	.byte	0x1
	.byte	0x18
	.byte	0x1
	.uaword	.LFB2
	.uaword	.LFE2
	.uaword	.LLST2
	.byte	0x1
	.uaword	0x17b
	.uleb128 0x8
	.uaword	.LASF16
	.byte	0x1
	.byte	0x18
	.uaword	0x56
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xe
	.uaword	.LASF17
	.byte	0x1
	.byte	0x1a
	.uaword	0x3d
	.byte	0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0xe
	.uaword	.LASF18
	.byte	0x1
	.byte	0x1a
	.uaword	0x3d
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x6
	.asciz	"err"
	.byte	0x1
	.byte	0x1e
	.uaword	0x2f
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xe
	.uaword	.LASF19
	.byte	0x1
	.byte	0x1f
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xf
	.uaword	.Ldebug_ranges0+0
	.uleb128 0xe
	.uaword	.LASF20
	.byte	0x1
	.byte	0x22
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.uaword	.LASF21
	.byte	0x1
	.byte	0x23
	.uaword	0xf1
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.uaword	.LASF39
	.byte	0x1
	.byte	0x38
	.byte	0x1
	.uaword	0x56
	.uaword	.LFB3
	.uaword	.LFE3
	.uaword	.LLST3
	.byte	0x1
	.uaword	0x1d4
	.uleb128 0x8
	.uaword	.LASF17
	.byte	0x1
	.byte	0x38
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x8
	.uaword	.LASF18
	.byte	0x1
	.byte	0x38
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xe
	.uaword	.LASF22
	.byte	0x1
	.byte	0x3a
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xe
	.uaword	.LASF23
	.byte	0x1
	.byte	0x3e
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.uaword	.LASF24
	.byte	0x1
	.byte	0x43
	.byte	0x1
	.uaword	.LFB4
	.uaword	.LFE4
	.uaword	.LLST4
	.byte	0x1
	.uaword	0x22a
	.uleb128 0x8
	.uaword	.LASF17
	.byte	0x1
	.byte	0x43
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x8
	.uaword	.LASF18
	.byte	0x1
	.byte	0x43
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x8
	.uaword	.LASF25
	.byte	0x1
	.byte	0x43
	.uaword	0x56
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0xe
	.uaword	.LASF22
	.byte	0x1
	.byte	0x45
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.uaword	.LASF26
	.byte	0x1
	.byte	0x4f
	.byte	0x1
	.uaword	.LFB5
	.uaword	.LFE5
	.uaword	.LLST5
	.byte	0x1
	.uaword	0x270
	.uleb128 0x8
	.uaword	.LASF17
	.byte	0x1
	.byte	0x4f
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x8
	.uaword	.LASF18
	.byte	0x1
	.byte	0x4f
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x6
	.asciz	"cv"
	.byte	0x1
	.byte	0x51
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.uaword	.LASF27
	.byte	0x1
	.byte	0x57
	.byte	0x1
	.uaword	.LFB6
	.uaword	.LFE6
	.uaword	.LLST6
	.byte	0x1
	.uaword	0x2b6
	.uleb128 0x8
	.uaword	.LASF17
	.byte	0x1
	.byte	0x57
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x8
	.uaword	.LASF18
	.byte	0x1
	.byte	0x57
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x6
	.asciz	"cv"
	.byte	0x1
	.byte	0x59
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.uaword	.LASF28
	.byte	0x1
	.byte	0x61
	.byte	0x1
	.uaword	.LFB7
	.uaword	.LFE7
	.uaword	.LLST7
	.byte	0x1
	.uaword	0x30b
	.uleb128 0x8
	.uaword	.LASF17
	.byte	0x1
	.byte	0x61
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x8
	.uaword	.LASF18
	.byte	0x1
	.byte	0x61
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x8
	.uaword	.LASF29
	.byte	0x1
	.byte	0x61
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x6
	.asciz	"cv"
	.byte	0x1
	.byte	0x63
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.uaword	.LASF30
	.byte	0x1
	.byte	0x6a
	.byte	0x1
	.uaword	.LFB8
	.uaword	.LFE8
	.uaword	.LLST8
	.byte	0x1
	.uaword	0x351
	.uleb128 0x8
	.uaword	.LASF17
	.byte	0x1
	.byte	0x6a
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x8
	.uaword	.LASF18
	.byte	0x1
	.byte	0x6a
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x6
	.asciz	"cv"
	.byte	0x1
	.byte	0x6c
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.uaword	.LASF31
	.byte	0x1
	.byte	0x73
	.byte	0x1
	.uaword	.LFB9
	.uaword	.LFE9
	.uaword	.LLST9
	.byte	0x1
	.uaword	0x38a
	.uleb128 0x8
	.uaword	.LASF17
	.byte	0x1
	.byte	0x73
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x8
	.uaword	.LASF18
	.byte	0x1
	.byte	0x73
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.uaword	.LASF32
	.byte	0x1
	.byte	0x7e
	.byte	0x1
	.uaword	.LFB10
	.uaword	.LFE10
	.uaword	.LLST10
	.byte	0x1
	.uaword	0x3ed
	.uleb128 0x8
	.uaword	.LASF17
	.byte	0x1
	.byte	0x7e
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x8
	.uaword	.LASF18
	.byte	0x1
	.byte	0x7e
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x8
	.uaword	.LASF33
	.byte	0x1
	.byte	0x7e
	.uaword	0x56
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x6
	.asciz	"cv"
	.byte	0x1
	.byte	0x80
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xe
	.uaword	.LASF34
	.byte	0x1
	.byte	0x83
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.uaword	.LASF35
	.byte	0x1
	.byte	0x8d
	.byte	0x1
	.uaword	.LFB11
	.uaword	.LFE11
	.uaword	.LLST11
	.byte	0x1
	.uaword	0x442
	.uleb128 0x8
	.uaword	.LASF17
	.byte	0x1
	.byte	0x8d
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x8
	.uaword	.LASF18
	.byte	0x1
	.byte	0x8d
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x8
	.uaword	.LASF29
	.byte	0x1
	.byte	0x8d
	.uaword	0x2f
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x6
	.asciz	"cv"
	.byte	0x1
	.byte	0x8f
	.uaword	0x56
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x11
	.uaword	0xf1
	.uaword	0x452
	.uleb128 0x12
	.uaword	0x7d
	.byte	0xf
	.byte	0
	.uleb128 0x13
	.uaword	.LASF40
	.byte	0x1
	.byte	0x8
	.uaword	0x442
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	ajit_global_interrupt_handlers
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.uaword	.LFB0-.Ltext0
	.uaword	.LCFI0-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI0-.Ltext0
	.uaword	.LFE0-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST1:
	.uaword	.LFB1-.Ltext0
	.uaword	.LCFI1-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI1-.Ltext0
	.uaword	.LFE1-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST2:
	.uaword	.LFB2-.Ltext0
	.uaword	.LCFI2-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI2-.Ltext0
	.uaword	.LFE2-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST3:
	.uaword	.LFB3-.Ltext0
	.uaword	.LCFI3-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI3-.Ltext0
	.uaword	.LFE3-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST4:
	.uaword	.LFB4-.Ltext0
	.uaword	.LCFI4-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI4-.Ltext0
	.uaword	.LFE4-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST5:
	.uaword	.LFB5-.Ltext0
	.uaword	.LCFI5-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI5-.Ltext0
	.uaword	.LFE5-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST6:
	.uaword	.LFB6-.Ltext0
	.uaword	.LCFI6-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI6-.Ltext0
	.uaword	.LFE6-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST7:
	.uaword	.LFB7-.Ltext0
	.uaword	.LCFI7-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI7-.Ltext0
	.uaword	.LFE7-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST8:
	.uaword	.LFB8-.Ltext0
	.uaword	.LCFI8-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI8-.Ltext0
	.uaword	.LFE8-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST9:
	.uaword	.LFB9-.Ltext0
	.uaword	.LCFI9-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI9-.Ltext0
	.uaword	.LFE9-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST10:
	.uaword	.LFB10-.Ltext0
	.uaword	.LCFI10-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI10-.Ltext0
	.uaword	.LFE10-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST11:
	.uaword	.LFB11-.Ltext0
	.uaword	.LCFI11-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI11-.Ltext0
	.uaword	.LFE11-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
	.section	.debug_aranges,"",@progbits
	.uaword	0x1c
	.uahalf	0x2
	.uaword	.Ldebug_info0
	.byte	0x4
	.byte	0
	.uahalf	0
	.uahalf	0
	.uaword	.Ltext0
	.uaword	.Letext0-.Ltext0
	.uaword	0
	.uaword	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.uaword	.LBB2-.Ltext0
	.uaword	.LBE2-.Ltext0
	.uaword	.LBB3-.Ltext0
	.uaword	.LBE3-.Ltext0
	.uaword	0
	.uaword	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF28:
	.asciz	"enableInterrupt"
.LASF25:
	.asciz	"value"
.LASF20:
	.asciz	"ilevel"
.LASF32:
	.asciz	"setInterruptMask"
.LASF4:
	.asciz	"short unsigned int"
.LASF40:
	.asciz	"ajit_global_interrupt_handlers"
.LASF34:
	.asciz	"insert_mask"
.LASF15:
	.asciz	"ajit_generic_interrupt_handler"
.LASF19:
	.asciz	"trap_type"
.LASF21:
	.asciz	"fn_ptr"
.LASF23:
	.asciz	"ret_val"
.LASF3:
	.asciz	"unsigned char"
.LASF17:
	.asciz	"core_id"
.LASF22:
	.asciz	"addr"
.LASF6:
	.asciz	"uint32_t"
.LASF26:
	.asciz	"enableInterruptController"
.LASF29:
	.asciz	"interrupt_id"
.LASF9:
	.asciz	"long unsigned int"
.LASF27:
	.asciz	"disableInterruptController"
.LASF30:
	.asciz	"enableAllInterrupts"
.LASF7:
	.asciz	"unsigned int"
.LASF16:
	.asciz	"tbr_value"
.LASF8:
	.asciz	"long long unsigned int"
.LASF5:
	.asciz	"uint8_t"
.LASF13:
	.asciz	"interrupt_level"
.LASF35:
	.asciz	"disableInterrupt"
.LASF11:
	.asciz	"sizetype"
.LASF2:
	.asciz	"long long int"
.LASF33:
	.asciz	"mask"
.LASF39:
	.asciz	"readInterruptControlRegister"
.LASF36:
	.asciz	"GNU C 4.7.4"
.LASF14:
	.asciz	"ajit_set_interrupt_handler"
.LASF1:
	.asciz	"short int"
.LASF38:
	.asciz	"ajit_initialize_interrupt_handlers_to_null"
.LASF10:
	.asciz	"long int"
.LASF12:
	.asciz	"char"
.LASF24:
	.asciz	"writeInterruptControlRegister"
.LASF0:
	.asciz	"signed char"
.LASF31:
	.asciz	"enableInterruptControllerAndAllInterrupts"
.LASF18:
	.asciz	"thread_id"
.LASF37:
	.asciz	"/home/tools_shared/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_mt_irc.c"
	.ident	"GCC: (Buildroot 2014.08-ge7c9750) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
