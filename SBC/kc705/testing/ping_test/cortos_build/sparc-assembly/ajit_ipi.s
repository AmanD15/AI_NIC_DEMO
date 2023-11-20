	.file	"ajit_ipi.c"
	.section	".text"
	.align 4
	.global __ajit_get_ipi_message_pointer__
	.type	__ajit_get_ipi_message_pointer__, #function
	.proc	0110
__ajit_get_ipi_message_pointer__:
	add	%o0, %o0, %o0
	sethi	%hi(-53248), %g1
	add	%o0, %o1, %o1
	or	%g1, 136, %g1
	sll	%o1, 3, %o0
	jmp	%o7+8
	 add	%o0, %g1, %o0
	.size	__ajit_get_ipi_message_pointer__, .-__ajit_get_ipi_message_pointer__
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"set-ipi-interrupt: imesg->pointer = 0x%x\n"
	.section	".text"
	.align 4
	.global __ajit_set_ipi_interrupt__
	.type	__ajit_set_ipi_interrupt__, #function
	.proc	020
__ajit_set_ipi_interrupt__:
	save	%sp, -96, %sp
	sethi	%hi(-53248), %l0
	add	%i2, %i2, %i5
	or	%l0, 136, %g2
	add	%i5, %i3, %i5
	sll	%i5, 3, %g3
	add	%g3, %g2, %g1
	stb	%i0, [%g3+%g2]
	stb	%i1, [%g1+1]
	stb	%i2, [%g1+2]
	stb	%i3, [%g1+3]
	st	%i4, [%g1+4]
	sethi	%hi(.LC0), %o0
	mov	%i4, %o1
	call	cortos_printf, 0
	 or	%o0, %lo(.LC0), %o0
	or	%l0, 132, %l0
	mov	1, %g2
	ld	[%l0], %g1
	sll	%g2, %i5, %i5
	andn	%g1, %i5, %g1
	or	%g1, %i5, %i5
	st	%i5, [%l0]
	jmp	%i7+8
	 restore
	.size	__ajit_set_ipi_interrupt__, .-__ajit_set_ipi_interrupt__
	.align 4
	.global __ajit_clear_ipi_interrupt__
	.type	__ajit_clear_ipi_interrupt__, #function
	.proc	020
__ajit_clear_ipi_interrupt__:
	add	%o0, %o0, %o0
	sethi	%hi(-53248), %g1
	add	%o0, %o1, %o1
	or	%g1, 132, %g1
	mov	1, %o0
	ld	[%g1], %g2
	sll	%o0, %o1, %o0
	andn	%g2, %o0, %o0
	jmp	%o7+8
	 st	%o0, [%g1]
	.size	__ajit_clear_ipi_interrupt__, .-__ajit_clear_ipi_interrupt__
	.align 4
	.global __ajit_set_ipi_mask_register__
	.type	__ajit_set_ipi_mask_register__, #function
	.proc	020
__ajit_set_ipi_mask_register__:
	sethi	%hi(-53248), %g1
	or	%g1, 128, %g1
	jmp	%o7+8
	 st	%o0, [%g1]
	.size	__ajit_set_ipi_mask_register__, .-__ajit_set_ipi_mask_register__
	.align 4
	.global __ajit_get_ipi_mask_register__
	.type	__ajit_get_ipi_mask_register__, #function
	.proc	016
__ajit_get_ipi_mask_register__:
	sethi	%hi(-53248), %g1
	or	%g1, 128, %g1
	jmp	%o7+8
	 ld	[%g1], %o0
	.size	__ajit_get_ipi_mask_register__, .-__ajit_get_ipi_mask_register__
	.align 4
	.global __ajit_set_ipi_value_register__
	.type	__ajit_set_ipi_value_register__, #function
	.proc	020
__ajit_set_ipi_value_register__:
	sethi	%hi(-53248), %g1
	or	%g1, 132, %g1
	jmp	%o7+8
	 st	%o0, [%g1]
	.size	__ajit_set_ipi_value_register__, .-__ajit_set_ipi_value_register__
	.align 4
	.global __ajit_get_ipi_value_register__
	.type	__ajit_get_ipi_value_register__, #function
	.proc	016
__ajit_get_ipi_value_register__:
	sethi	%hi(-53248), %g1
	or	%g1, 132, %g1
	jmp	%o7+8
	 ld	[%g1], %o0
	.size	__ajit_get_ipi_value_register__, .-__ajit_get_ipi_value_register__
	.align 4
	.global __ajit_read_ipi_info__
	.type	__ajit_read_ipi_info__, #function
	.proc	020
__ajit_read_ipi_info__:
	add	%o0, %o0, %o0
	cmp	%o4, 0
	be	.L9
	 add	%o0, %o1, %o1
	sll	%o1, 3, %g2
	sethi	%hi(-53248), %g1
	or	%g1, 136, %g1
	add	%g2, %g1, %g1
	st	%g1, [%o4]
.L9:
	cmp	%o2, 0
	be	.L10
	 sethi	%hi(-53248), %g1
	or	%g1, 128, %g1
	ld	[%g1], %g1
	srl	%g1, %o1, %g1
	and	%g1, 1, %g1
	st	%g1, [%o2]
.L10:
	cmp	%o3, 0
	be	.L22
	 sethi	%hi(-53248), %g1
	or	%g1, 132, %g1
	ld	[%g1], %g1
	srl	%g1, %o1, %o1
	and	%o1, 1, %o1
	st	%o1, [%o3]
.L22:
	jmp	%o7+8
	 nop
	.size	__ajit_read_ipi_info__, .-__ajit_read_ipi_info__
	.ident	"GCC: (Buildroot 2014.08-g2ac7e17) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
