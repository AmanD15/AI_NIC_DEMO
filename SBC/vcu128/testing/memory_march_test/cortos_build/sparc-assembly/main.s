	.file	"main.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"Writing DATA\n"
	.align 8
.LC1:
	.asciz	"Writing DATA from 0yy%lx\n"
	.align 8
.LC2:
	.asciz	"Safely reached %x %x \n"
	.align 8
.LC3:
	.asciz	"Num errors %u \n"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	sethi	%hi(-7341056), %g1
	or	%g1, 928, %g1
	save	%sp, %g1, %sp
	call	__ajit_write_serial_control_register_via_bypass__, 0
	 mov	3, %o0
	sethi	%hi(.LC0), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC0), %o0
	sethi	%hi(-7340032), %i2
	sethi	%hi(.LC1), %o0
	add	%fp, %i2, %i2
	or	%o0, %lo(.LC1), %o0
	mov	%i2, %o1
	sethi	%hi(351232), %i4
	sethi	%hi(736256), %i3
	sethi	%hi(15360), %i1
	sethi	%hi(.LC2), %l0
	call	cortos_printf, 0
	 mov	0, %i5
	sethi	%hi(1835008), %i0
	or	%i4, 901, %i4
	or	%i3, 560, %i3
	or	%i1, 1023, %i1
	b	.L3
	 or	%l0, %lo(.LC2), %l0
.L2:
	add	%i5, 1, %i5
	cmp	%i5, %i0
	be	.L8
	 sethi	%hi(.LC3), %o0
.L3:
	add	%i4, %i4, %g2
.L9:
	sll	%i5, 2, %g1
	srl	%i4, 3, %i4
	xor	%i4, %g2, %i4
	xor	%i4, %i5, %g2
	xor	%i3, %g2, %i3
	andcc	%i5, %i1, %g0
	bne	.L2
	 st	%i3, [%g1+%i2]
	mov	%i5, %o2
	mov	%l0, %o0
	call	cortos_printf, 0
	 mov	%i2, %o1
	add	%i5, 1, %i5
	cmp	%i5, %i0
	bne	.L9
	 add	%i4, %i4, %g2
	sethi	%hi(.LC3), %o0
.L8:
	mov	0, %o1
	call	cortos_printf, 0
	 or	%o0, %lo(.LC3), %o0
.L4:
	b,a	.L4
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
