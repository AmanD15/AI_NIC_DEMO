	.file	"cortos_util_ee_printf.c"
	.global __fixdfdi
	.global __floatdidf
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	1071644672
	.long	0
	.section	".text"
	.align 4
	.type	get_components, #function
	.proc	010
get_components:
	save	%sp, -128, %sp
	mov	%i0, %g2
	mov	%i1, %g3
	std	%g2, [%fp-8]
	srl	%i0, 31, %l2
	andcc	%l2, 0xff, %g0
	be	.L2
	 ld	[%fp+64], %i3
	ldd	[%fp-8], %f8
	fnegs	%f8, %f8
	std	%f8, [%fp-8]
.L2:
	call	__fixdfdi, 0
	 ldd	[%fp-8], %o0
	sll	%i2, 3, %g1
	sethi	%hi(powers_of_10), %g2
	or	%g2, %lo(powers_of_10), %g2
	ldd	[%g2+%g1], %f10
	mov	%o0, %l0
	mov	%o1, %l1
	call	__floatdidf, 0
	 std	%f10, [%fp-16]
	ldd	[%fp-8], %f8
	ldd	[%fp-16], %f10
	fsubd	%f8, %f0, %f0
	fmuld	%f0, %f10, %f8
	std	%f8, [%fp-32]
	std	%f8, [%fp-24]
	call	__fixdfdi, 0
	 ldd	[%fp-32], %o0
	mov	%o0, %i4
	call	__floatdidf, 0
	 mov	%o1, %i5
	sethi	%hi(.LC0), %i1
	ldd	[%fp-24], %f8
	ldd	[%i1+%lo(.LC0)], %f10
	fsubd	%f8, %f0, %f0
	fcmped	%f0, %f10
	nop
	fbule	.L28
	 nop
	addcc	%i5, 1, %g3
	addx	%i4, 0, %g2
	mov	%g3, %i5
	mov	%g2, %i4
	mov	%g2, %o0
	call	__floatdidf, 0
	 mov	%g3, %o1
	ldd	[%fp-16], %f8
	fcmped	%f8, %f0
	nop
	fble	.L30
	 addcc	%l1, 1, %g3
.L5:
	cmp	%i2, 0
.L33:
	bne	.L10
	 mov	%l0, %o0
	call	__floatdidf, 0
	 mov	%l1, %o1
	ldd	[%i1+%lo(.LC0)], %f8
	ldd	[%fp-8], %f10
	fsubd	%f10, %f0, %f0
	fcmped	%f0, %f8
	nop
	fbuge	.L11
	 nop
	nop
	fbule	.L10
	 nop
.L11:
	and	%l0, 0, %g2
	and	%l1, 1, %g3
	or	%g2, %g3, %g2
	subcc	%g0, %g2, %g0
	addx	%g0, 0, %g1
	addcc	%l1, %g1, %l1
	addx	%l0, 0, %l0
.L10:
	std	%l0, [%i3]
	std	%i4, [%i3+8]
	stb	%l2, [%i3+16]
	jmp	%i7+12
	 restore %g0, %i3, %o0
.L28:
	fcmpd	%f0, %f10
	nop
	fbne	.L33
	 cmp	%i2, 0
	orcc	%i4, %i5, %g0
	bne	.L31
	 and	%i4, 0, %g2
	addcc	%i5, 1, %g3
.L32:
	addx	%i4, 0, %g2
	mov	%g3, %i5
	b	.L5
	 mov	%g2, %i4
.L30:
	mov	0, %i4
	addx	%l0, 0, %g2
	mov	%g3, %l1
	mov	%g2, %l0
	b	.L5
	 mov	0, %i5
.L31:
	and	%i5, 1, %g3
	orcc	%g2, %g3, %g0
	be,a	.L33
	 cmp	%i2, 0
	b	.L32
	 addcc	%i5, 1, %g3
	.size	get_components, .-get_components
	.align 4
	.type	putchar_wrapper, #function
	.proc	020
putchar_wrapper:
	save	%sp, -96, %sp
.L35:
	call	__ajit_serial_putchar_via_vmap__, 0
	 mov	%i0, %o0
	cmp	%o0, 0
	be	.L35
	 nop
.L41:
	call	__ajit_read_serial_control_register_via_vmap__, 0
	 nop
	and	%o0, 9, %o0
	cmp	%o0, 9
	be	.L41
	 nop
	jmp	%i7+8
	 restore
	.size	putchar_wrapper, .-putchar_wrapper
	.align 4
	.type	out_rev_, #function
	.proc	020
out_rev_:
	save	%sp, -96, %sp
	andcc	%i4, 3, %g0
	bne	.L56
	 ld	[%i0+12], %l0
	cmp	%i2, %i3
	bgeu	.L76
	 cmp	%i2, 0
	add	%i2, 1, %i5
	mov	%l0, %g1
	b	.L53
	 mov	32, %l1
.L70:
	call	%g2, 0
	 ld	[%i0+4], %o1
	cmp	%i5, %i3
.L77:
	be	.L76
	 cmp	%i2, 0
.L71:
	ld	[%i0+12], %g1
	add	%i5, 1, %i5
.L53:
	add	%g1, 1, %g2
	st	%g2, [%i0+12]
	ld	[%i0+16], %g2
	cmp	%g2, %g1
	bleu	.L77
	 cmp	%i5, %i3
	ld	[%i0], %g2
	cmp	%g2, 0
	bne	.L70
	 mov	32, %o0
	ld	[%i0+8], %g2
	cmp	%i5, %i3
	bne	.L71
	 stb	%l1, [%g2+%g1]
.L56:
	cmp	%i2, 0
.L76:
	be	.L78
	 andcc	%i4, 2, %g0
	ld	[%i0+12], %g1
.L79:
	add	%i2, -1, %i2
	add	%g1, 1, %g2
	ldub	[%i1+%i2], %o0
	st	%g2, [%i0+12]
	ld	[%i0+16], %g2
	cmp	%g1, %g2
	bgeu	.L76
	 cmp	%i2, 0
	ld	[%i0], %g2
	cmp	%g2, 0
	be,a	.L57
	 ld	[%i0+8], %g2
	sll	%o0, 24, %o0
	ld	[%i0+4], %o1
	call	%g2, 0
	 sra	%o0, 24, %o0
	cmp	%i2, 0
	bne,a	.L79
	 ld	[%i0+12], %g1
	andcc	%i4, 2, %g0
.L78:
	be	.L81
	 mov	32, %i5
.L68:
	ld	[%i0+12], %g1
.L75:
	sub	%g1, %l0, %g3
	cmp	%i3, %g3
	bleu	.L81
	 add	%g1, 1, %g2
.L62:
	st	%g2, [%i0+12]
	ld	[%i0+16], %g3
	cmp	%g3, %g1
	bleu,a	.L63
	 mov	%g2, %g1
	ld	[%i0], %g2
	cmp	%g2, 0
	be,a	.L60
	 ld	[%i0+8], %g2
	mov	32, %o0
	call	%g2, 0
	 ld	[%i0+4], %o1
	b	.L75
	 ld	[%i0+12], %g1
.L57:
	b	.L56
	 stb	%o0, [%g2+%g1]
.L63:
	sub	%g1, %l0, %g3
	cmp	%i3, %g3
	bgu	.L62
	 add	%g1, 1, %g2
.L81:
	jmp	%i7+8
	 restore
.L60:
	b	.L68
	 stb	%i5, [%g2+%g1]
	.size	out_rev_, .-out_rev_
	.global __umoddi3
	.global __udivdi3
	.align 4
	.type	print_integer, #function
	.proc	020
print_integer:
	save	%sp, -128, %sp
	ld	[%fp+92], %l3
	orcc	%i1, %i2, %g0
	bne	.L83
	 ld	[%fp+96], %l2
	andcc	%l2, 2048, %g0
	be	.L183
	 cmp	%i4, 16
	be,a	.L184
	 and	%l2, -17, %l2
	mov	1, %g1
	mov	0, %l0
	add	%fp, -32, %l1
.L85:
	andcc	%l2, 2, %g0
.L199:
	bne	.L92
	 mov	%l0, %o2
	cmp	%l3, 0
	bne	.L185
	 andcc	%l2, 1, %g0
.L92:
	cmp	%o2, %i5
.L196:
	bgeu	.L97
	 andcc	%g1, 0xff, %g0
	bne	.L162
	 mov	48, %g2
	b	.L195
	 cmp	%l0, %o2
.L186:
	bgeu	.L197
	 cmp	%l0, %o2
.L162:
	stb	%g2, [%l1+%o2]
	add	%o2, 1, %o2
	cmp	%o2, 31
	bleu	.L186
	 cmp	%o2, %i5
.L97:
	cmp	%l0, %o2
.L195:
.L197:
	bgeu	.L104
	 addx	%g0, 0, %g2
	cmp	%i4, 8
	be,a	.L104
	 and	%l2, -17, %l2
.L104:
	sethi	%hi(8192), %g1
	or	%g1, 16, %g1
	andcc	%l2, %g1, %g0
	be	.L198
	 cmp	%o2, 31
	andcc	%l2, 2048, %g0
	be	.L188
	 cmp	%o2, 0
.L106:
	cmp	%i4, 16
.L200:
	be	.L189
	 cmp	%o2, 31
	bgu	.L114
	 cmp	%i4, 2
	bne	.L114
	 add	%fp, %o2, %g1
	mov	98, %g2
	add	%o2, 1, %o2
	stb	%g2, [%g1-32]
.L114:
	cmp	%o2, 31
	bgu	.L113
	 add	%fp, %o2, %g1
	mov	48, %g2
	add	%o2, 1, %o2
	stb	%g2, [%g1-32]
	cmp	%o2, 31
.L198:
	bgu	.L113
	 cmp	%i3, 0
	bne	.L190
	 andcc	%l2, 4, %g0
	bne	.L191
	 andcc	%l2, 8, %g0
	be	.L113
	 add	%fp, %o2, %g1
	mov	32, %g2
	add	%o2, 1, %o2
	stb	%g2, [%g1-32]
.L113:
	mov	%i0, %o0
.L202:
	mov	%l1, %o1
	mov	%l3, %o3
	call	out_rev_, 0
	 mov	%l2, %o4
	jmp	%i7+8
	 restore
.L83:
	and	%l2, 32, %g1
	mov	0, %l0
	subcc	%g0, %g1, %g0
	add	%fp, -32, %l1
	addx	%g0, -1, %l4
	and	%l4, 32, %l4
	b	.L90
	 add	%l4, 65, %l4
.L192:
.L87:
	stb	%o1, [%l1+%l0]
	mov	%i1, %o0
	mov	%i2, %o1
	mov	0, %o2
	call	__udivdi3, 0
	 mov	%i4, %o3
	add	%l0, 1, %l0
	cmp	%l0, 32
	mov	%o0, %i1
	addx	%g0, 0, %g1
	andcc	%g1, 0xff, %g0
	be	.L85
	 mov	%o1, %i2
	orcc	%i1, %o1, %g0
	be	.L199
	 andcc	%l2, 2, %g0
.L90:
	mov	%i1, %o0
	mov	%i2, %o1
	mov	0, %o2
	call	__umoddi3, 0
	 mov	%i4, %o3
	sll	%o1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 9
	ble,a	.L192
	 add	%o1, 48, %o1
	add	%o1, -10, %o1
	b	.L87
	 add	%o1, %l4, %o1
.L188:
	be	.L200
	 cmp	%i4, 16
	cmp	%o2, %l3
	be	.L201
	 cmp	%g2, 0
	cmp	%i5, %o2
	bne	.L200
	 cmp	%i4, 16
	cmp	%g2, 0
.L201:
	be	.L108
	 cmp	%i4, 2
	addcc	%o2, -1, %g1
	bne	.L193
	 cmp	%i4, 2
	b	.L106
	 mov	0, %o2
.L185:
	be	.L196
	 cmp	%o2, %i5
	cmp	%i3, 0
	bne,a	.L94
	 add	%l3, -1, %l3
	andcc	%l2, 12, %g0
	bne,a	.L94
	 add	%l3, -1, %l3
.L94:
	cmp	%l0, %l3
	bgeu	.L131
	 andcc	%g1, 0xff, %g0
	be	.L131
	 mov	48, %g2
	add	%fp, %l0, %g1
	add	%l0, 1, %o2
	b	.L121
	 stb	%g2, [%g1-32]
.L194:
	bgeu	.L196
	 cmp	%o2, %i5
	stb	%g2, [%l1+%o2]
	add	%o2, 1, %o2
.L121:
	cmp	%o2, 32
	addx	%g0, 0, %g1
	andcc	%g1, 0xff, %g0
	bne,a	.L194
	 cmp	%o2, %l3
	b	.L196
	 cmp	%o2, %i5
.L190:
	add	%fp, %o2, %g1
	mov	45, %g2
	add	%o2, 1, %o2
	stb	%g2, [%g1-32]
	mov	%i0, %o0
	mov	%l1, %o1
	mov	%l3, %o3
	call	out_rev_, 0
	 mov	%l2, %o4
	jmp	%i7+8
	 restore
.L183:
	mov	48, %g1
	and	%l2, -17, %l2
	stb	%g1, [%fp-32]
	mov	1, %l0
	mov	1, %g1
	b	.L85
	 add	%fp, -32, %l1
.L191:
	add	%fp, %o2, %g1
	mov	43, %g2
	add	%o2, 1, %o2
	stb	%g2, [%g1-32]
	mov	%i0, %o0
	mov	%l1, %o1
	mov	%l3, %o3
	call	out_rev_, 0
	 mov	%l2, %o4
	jmp	%i7+8
	 restore
.L189:
	andcc	%l2, 32, %g0
	bne	.L112
	 cmp	%o2, 31
	bgu	.L202
	 mov	%i0, %o0
	add	%fp, %o2, %g1
	mov	120, %g2
	add	%o2, 1, %o2
	b	.L114
	 stb	%g2, [%g1-32]
.L184:
	mov	1, %g1
	mov	0, %l0
	b	.L85
	 add	%fp, -32, %l1
.L112:
	bgu	.L202
	 mov	%i0, %o0
	add	%fp, %o2, %g1
	mov	88, %g2
	add	%o2, 1, %o2
	b	.L114
	 stb	%g2, [%g1-32]
.L108:
	be	.L200
	 cmp	%i4, 16
	be	.L200
	 mov	%o2, %g1
	b	.L114
	 mov	%g1, %o2
.L193:
	be	.L203
	 cmp	%l0, %g1
	cmp	%i4, 16
	bne,a	.L114
	 mov	%g1, %o2
	cmp	%l0, %g1
.L203:
	blu	.L106
	 add	%o2, -2, %o2
	b	.L106
	 mov	%g1, %o2
.L131:
	b	.L92
	 mov	%l0, %o2
	.size	print_integer, .-print_integer
	.global __moddi3
	.global __divdi3
	.align 4
	.type	print_broken_up_decimal.isra.4, #function
	.proc	020
print_broken_up_decimal.isra.4:
	save	%sp, -96, %sp
	ld	[%fp+92], %l0
	mov	%i2, %l1
	mov	%i3, %l3
	mov	%i4, %l4
	ld	[%fp+96], %i3
	ld	[%fp+100], %i4
	ld	[%fp+104], %l2
	cmp	%l0, 0
	be	.L205
	 ld	[%fp+108], %i2
	sethi	%hi(4096), %g1
	or	%g1, 16, %g2
	and	%i4, %g2, %g2
	cmp	%g2, %g1
	be	.L288
	 cmp	%l1, 0
	cmp	%i2, 31
.L303:
	bgu	.L223
	 mov	0, %o2
	mov	10, %o3
	mov	%l1, %o0
	call	__moddi3, 0
	 mov	%l3, %o1
	add	%o1, 48, %o1
	mov	%l1, %o0
	stb	%o1, [%l2+%i2]
	mov	0, %o2
	mov	10, %o3
	b	.L283
	 mov	%l3, %o1
.L289:
	mov	%l3, %o0
	mov	0, %o2
	cmp	%i2, 32
	be	.L223
	 mov	10, %o3
	call	__moddi3, 0
	 nop
	add	%o1, 48, %o1
	mov	%l3, %o0
	stb	%o1, [%l2+%i2]
	mov	0, %o2
	mov	10, %o3
	mov	%l1, %o1
.L283:
	call	__divdi3, 0
	 add	%l0, -1, %l0
	mov	%o0, %l3
	mov	%o1, %l1
	orcc	%l3, %o1, %g0
	bne	.L289
	 add	%i2, 1, %i2
	cmp	%i2, 31
	bgu	.L287
	 cmp	%l0, 0
	be	.L287
	 mov	48, %g1
	b	.L306
	 stb	%g1, [%l2+%i2]
.L290:
	cmp	%l0, 0
	be	.L301
	 cmp	%i2, 31
	stb	%g1, [%l2+%i2]
.L306:
	add	%i2, 1, %i2
	cmp	%i2, 31
	bleu	.L290
	 add	%l0, -1, %l0
.L287:
	cmp	%i2, 31
.L301:
	bgu	.L298
	 and	%i4, 3, %g1
	mov	46, %g1
.L302:
	stb	%g1, [%l2+%i2]
	add	%i2, 1, %i2
.L207:
	cmp	%i2, 31
.L300:
	bgu	.L223
	 mov	0, %o2
	mov	10, %o3
	mov	%i0, %o0
	call	__moddi3, 0
	 mov	%i1, %o1
	mov	0, %o2
	add	%o1, 48, %g1
	mov	10, %o3
	mov	%i0, %o0
	mov	%i1, %o1
	b	.L284
	 stb	%g1, [%l2+%i2]
.L291:
	mov	%l1, %o0
	mov	0, %o2
	cmp	%i2, 32
	be	.L223
	 mov	10, %o3
	call	__moddi3, 0
	 nop
	add	%o1, 48, %o1
	mov	%l1, %o0
	stb	%o1, [%l2+%i2]
	mov	0, %o2
	mov	10, %o3
	mov	%l0, %o1
.L284:
	call	__divdi3, 0
	 add	%i2, 1, %i2
	mov	%o0, %l1
	orcc	%l1, %o1, %g0
	bne	.L291
	 mov	%o1, %l0
.L223:
	and	%i4, 3, %g1
.L298:
	cmp	%g1, 1
	be	.L292
	 cmp	%i3, 0
.L228:
	cmp	%i2, 31
.L299:
	bgu	.L235
	 cmp	%l4, 0
	bne	.L293
	 mov	45, %g1
	andcc	%i4, 4, %g0
	bne	.L294
	 andcc	%i4, 8, %g0
	be	.L235
	 mov	32, %g1
	stb	%g1, [%l2+%i2]
	add	%i2, 1, %i2
.L235:
	mov	%i5, %i0
	call	out_rev_, 0
	 restore %g0, %l2, %o1
.L205:
	andcc	%i4, 16, %g0
	be	.L300
	 cmp	%i2, 31
	bleu,a	.L302
	 mov	46, %g1
	b	.L298
	 and	%i4, 3, %g1
.L293:
	mov	%i5, %i0
	stb	%g1, [%l2+%i2]
	mov	%l2, %i1
	call	out_rev_, 0
	 restore %i2, 1, %o2
.L292:
	be	.L299
	 cmp	%i2, 31
	cmp	%l4, 0
	bne,a	.L230
	 add	%i3, -1, %i3
	andcc	%i4, 12, %g0
	bne,a	.L230
	 add	%i3, -1, %i3
.L230:
	cmp	%i2, %i3
	bgeu	.L228
	 cmp	%i2, 31
	bgu	.L299
	 mov	48, %g1
	b	.L307
	 stb	%g1, [%l2+%i2]
.L296:
	bgeu	.L299
	 cmp	%i2, 31
	stb	%g1, [%l2+%i2]
.L307:
	add	%i2, 1, %i2
	cmp	%i2, 31
	bleu,a	.L296
	 cmp	%i2, %i3
	b,a	.L299
.L288:
	ble	.L297
	 cmp	%l1, 0
	mov	%l1, %o0
.L305:
	mov	%l3, %o1
	mov	0, %o2
	call	__moddi3, 0
	 mov	10, %o3
	orcc	%o0, %o1, %g0
	bne	.L303
	 cmp	%i2, 31
	mov	0, %o2
.L304:
	mov	10, %o3
	mov	%l1, %o0
	call	__divdi3, 0
	 mov	%l3, %o1
	mov	0, %o2
	mov	%o0, %l1
	mov	%o1, %l3
	mov	10, %o3
	call	__moddi3, 0
	 add	%l0, -1, %l0
	orcc	%o0, %o1, %g0
	be	.L304
	 mov	0, %o2
	cmp	%l1, 0
	bg	.L303
	 cmp	%i2, 31
	cmp	%l1, 0
	bne	.L207
	 cmp	%l3, 0
	bne	.L303
	 cmp	%i2, 31
	b,a	.L300
.L294:
	mov	43, %g1
	mov	%i5, %i0
	stb	%g1, [%l2+%i2]
	mov	%l2, %i1
	call	out_rev_, 0
	 restore %i2, 1, %o2
.L297:
	bne	.L207
	 cmp	%l3, 0
	bne	.L305
	 mov	%l1, %o0
	b	.L300
	 cmp	%i2, 31
	.size	print_broken_up_decimal.isra.4, .-print_broken_up_decimal.isra.4
	.section	.rodata.cst8
	.align 8
.LC1:
	.long	471254
	.long	2014963922
	.align 8
.LC2:
	.long	0
	.long	0
	.align 8
.LC3:
	.long	1073217536
	.long	0
	.align 8
.LC4:
	.long	1070761895
	.long	1668236127
	.align 8
.LC5:
	.long	1069976104
	.long	2338371580
	.align 8
.LC6:
	.long	1069069535
	.long	792659070
	.align 8
.LC7:
	.long	1067841051
	.long	3090678783
	.align 8
.LC8:
	.long	1070810131
	.long	1352628735
	.align 8
.LC9:
	.long	1074434895
	.long	158966641
	.align 8
.LC10:
	.long	1071644672
	.long	0
	.align 8
.LC11:
	.long	1073900465
	.long	3149223190
	.align 8
.LC12:
	.long	1072049730
	.long	4277811695
	.align 8
.LC13:
	.long	1073741824
	.long	0
	.align 8
.LC14:
	.long	1076625408
	.long	0
	.align 8
.LC15:
	.long	1076101120
	.long	0
	.align 8
.LC16:
	.long	1075314688
	.long	0
	.align 8
.LC17:
	.long	1072693248
	.long	0
	.section	".text"
	.align 4
	.type	print_exponential_number, #function
	.proc	020
print_exponential_number:
	save	%sp, -192, %sp
	mov	%i1, %g2
	mov	%i2, %g3
	std	%g2, [%fp-56]
	srl	%i1, 31, %l6
	mov	%i3, %l4
	andcc	%l6, 0xff, %g1
	be	.L309
	 ldd	[%fp-56], %f8
	fnegs	%f8, %f8
.L309:
	sethi	%hi(.LC2), %g4
	ldd	[%g4+%lo(.LC2)], %f10
	fcmpd	%f8, %f10
	nop
	fbe,a	.L366
	 mov	1, %g4
	std	%f8, [%fp-64]
	sethi	%hi(1047552), %o4
	ldd	[%fp-64], %i2
	or	%o4, 1023, %o4
	sethi	%hi(1072693248), %g2
	and	%i2, %o4, %o4
	or	%o4, %g2, %g2
	sethi	%hi(4294966272), %o5
	mov	0, %g3
	or	%o5, 1023, %o5
	and	%i3, %o5, %o5
	or	%o5, %g3, %g3
	std	%g2, [%fp-56]
	sethi	%hi(.LC4), %g2
	ldd	[%fp-56], %f16
	sethi	%hi(.LC3), %i3
	ldd	[%i3+%lo(.LC3)], %f14
	fsubd	%f16, %f14, %f12
	ldd	[%g2+%lo(.LC4)], %f16
	sethi	%hi(.LC5), %g2
	ldd	[%g2+%lo(.LC5)], %f18
	fmuld	%f12, %f12, %f14
	fmuld	%f12, %f16, %f16
	sethi	%hi(.LC6), %g2
	faddd	%f16, %f18, %f16
	sethi	%hi(.LC7), %i3
	ldd	[%g2+%lo(.LC6)], %f18
	fmuld	%f14, %f18, %f18
	srl	%i2, 20, %g3
	fsubd	%f16, %f18, %f16
	and	%g3, 2047, %g3
	ldd	[%i3+%lo(.LC7)], %f18
	add	%g3, -1023, %i3
	st	%i3, [%fp-68]
	fmuld	%f12, %f14, %f12
	sethi	%hi(.LC8), %g2
	fmuld	%f12, %f18, %f12
	ldd	[%g2+%lo(.LC8)], %f14
	faddd	%f16, %f12, %f12
	ld	[%fp-68], %f16
	fitod	%f16, %f16
	fmuld	%f16, %f14, %f16
	faddd	%f12, %f16, %f12
	fcmped	%f12, %f10
	nop
	fbul	.L398
	 nop
	fdtoi	%f12, %f10
	st	%f10, [%fp-68]
	ld	[%fp-68], %l5
.L313:
	cmp	%l5, -308
	be	.L367
	 sethi	%hi(.LC9), %g2
	st	%l5, [%fp-68]
	ld	[%fp-68], %f16
	ldd	[%g2+%lo(.LC9)], %f12
	fitod	%f16, %f14
	ldd	[%g4+%lo(.LC2)], %f10
	fmuld	%f14, %f12, %f12
	sethi	%hi(.LC10), %g2
	ldd	[%g2+%lo(.LC10)], %f16
	faddd	%f12, %f16, %f12
	fcmped	%f12, %f10
	nop
	fbul	.L399
	 nop
	fdtoi	%f12, %f17
	st	%f17, [%fp-68]
	fitod	%f17, %f16
	ld	[%fp-68], %g2
.L318:
	sethi	%hi(.LC11), %g3
	ldd	[%g3+%lo(.LC11)], %f10
	sethi	%hi(.LC13), %g4
	fmuld	%f14, %f10, %f14
	sethi	%hi(.LC12), %g3
	ldd	[%g3+%lo(.LC12)], %f10
	fmuld	%f16, %f10, %f16
	fsubd	%f14, %f16, %f10
	ldd	[%g4+%lo(.LC13)], %f16
	sethi	%hi(.LC14), %g4
	fmuld	%f10, %f10, %f12
	faddd	%f10, %f10, %f14
	fsubd	%f16, %f10, %f10
	ldd	[%g4+%lo(.LC14)], %f16
	sethi	%hi(.LC15), %g4
	ldd	[%g4+%lo(.LC15)], %f18
	fdivd	%f12, %f16, %f16
	sethi	%hi(.LC16), %g4
	faddd	%f16, %f18, %f16
	ldd	[%g4+%lo(.LC16)], %f18
	fdivd	%f12, %f16, %f16
	faddd	%f16, %f18, %f16
	addcc	%g2, 1023, %o5
	fdivd	%f12, %f16, %f12
	sll	%o5, 20, %g2
	mov	0, %g3
	faddd	%f10, %f12, %f10
	sethi	%hi(.LC17), %g4
	fdivd	%f14, %f10, %f10
	std	%g2, [%fp-56]
	ldd	[%g4+%lo(.LC17)], %f14
	ldd	[%fp-56], %f16
	faddd	%f10, %f14, %f10
	fmuld	%f10, %f16, %f10
.L315:
	fcmped	%f8, %f10
	nop
	fbuge	.L320
	 nop
	sethi	%hi(.LC15), %g2
	add	%l5, -1, %l5
	ldd	[%g2+%lo(.LC15)], %f12
	fdivd	%f10, %f12, %f10
.L320:
	add	%l5, 17, %g2
	cmp	%g2, 34
	bgu	.L368
	 fmovs	%f10, %f12
	sra	%l5, 31, %g2
	subcc	%g0, %l5, %g0
	xor	%g2, %l5, %g3
	sub	%g3, %g2, %g2
	sll	%g2, 3, %g2
	subx	%g0, -1, %g4
	sethi	%hi(powers_of_10), %i3
	or	%i3, %lo(powers_of_10), %i3
	ldd	[%i3+%g2], %f12
	sethi	%hi(4096), %g2
	andcc	%i5, %g2, %g0
	bne	.L402
	 srl	%l5, 31, %g3
	mov	0, %i1
.L400:
	andcc	%g4, 0xff, %g0
	be	.L329
	 cmp	%g1, 0
	bne,a	.L403
	 fnegs	%f8, %f8
	add	%fp, -24, %g1
.L421:
	std	%f8, [%fp-56]
	st	%g1, [%sp+64]
	ldd	[%fp-56], %o0
	mov	%l4, %o2
	call	get_components, 0
	 nop
	unimp	24
	cmp	%i1, 0
	ldd	[%fp-24], %i2
	ld	[%fp-16], %l1
	ld	[%fp-12], %l0
	be	.L404
	 ldub	[%fp-8], %l6
.L332:
	sethi	%hi(4096), %g1
	andcc	%i5, %g1, %g0
	bne	.L405
	 cmp	%l5, -1
.L347:
	mov	%i2, %o0
.L422:
	mov	%l0, %o3
	mov	%l1, %o2
	and	%i5, 2, %i2
	mov	%i3, %o1
	mov	0, %l0
	cmp	%i4, %l0
.L417:
	bgu	.L406
	 mov	0, %g1
.L350:
	st	%g1, [%sp+96]
	ld	[%fp+92], %g1
	st	%g1, [%sp+104]
	ld	[%fp+96], %g1
	ld	[%i0+12], %i3
	st	%l4, [%sp+92]
	st	%i5, [%sp+100]
	st	%g1, [%sp+108]
	and	%l6, 0xff, %o4
	call	print_broken_up_decimal.isra.4, 0
	 mov	%i0, %o5
	cmp	%i1, 0
	bne	.L428
	 and	%i5, 32, %i5
	ld	[%i0+12], %g2
	add	%g2, 1, %g1
	ld	[%i0+16], %g3
	st	%g1, [%i0+12]
	subcc	%g0, %i5, %g0
	addx	%g0, -1, %g1
	and	%g1, 32, %g1
	cmp	%g2, %g3
	add	%g1, 69, %g3
	bgeu	.L353
	 mov	%g3, %g1
	ld	[%i0], %g4
	cmp	%g4, 0
	be	.L354
	 sll	%g1, 24, %o0
	ld	[%i0+4], %o1
	call	%g4, 0
	 sra	%o0, 24, %o0
.L353:
	mov	%l5, %g3
	cmp	%l5, 0
	ble	.L355
	 sra	%l5, 31, %g2
.L356:
	mov	5, %g1
	add	%l0, -1, %l0
	st	%g1, [%sp+96]
	st	%l0, [%sp+92]
	mov	%i0, %o0
	mov	%g2, %o1
	mov	%g3, %o2
	srl	%l5, 31, %o3
	mov	10, %o4
	call	print_integer, 0
	 mov	0, %o5
	cmp	%i2, 0
	be	.L428
	 mov	32, %i5
.L397:
	ld	[%i0+12], %g1
.L415:
	sub	%g1, %i3, %g3
	cmp	%i4, %g3
	bleu	.L428
	 add	%g1, 1, %g2
.L362:
	st	%g2, [%i0+12]
	ld	[%i0+16], %g3
	cmp	%g3, %g1
	bleu,a	.L373
	 mov	%g2, %g1
	ld	[%i0], %g2
	cmp	%g2, 0
	be	.L360
	 mov	32, %o0
	call	%g2, 0
	 ld	[%i0+4], %o1
	b	.L415
	 ld	[%i0+12], %g1
.L366:
	mov	0, %g3
	mov	0, %l5
.L310:
	sethi	%hi(4096), %g2
	andcc	%i5, %g2, %g0
	be	.L400
	 mov	0, %i1
.L402:
	cmp	%l4, 0
	bne	.L323
	 mov	%l4, %g2
	mov	0, %g2
	mov	1, %l4
.L323:
	cmp	%l5, %l4
	bge	.L409
	 mov	1, %i1
	cmp	%l5, -4
	bl	.L410
	 mov	1, %i3
.L325:
	and	%i1, %i3, %i1
	andcc	%i1, 0xff, %i1
	be	.L327
	 add	%g2, -1, %g2
	sub	%g2, %l5, %g2
.L327:
	xnor	%g0, %g2, %l4
	or	%i5, 2048, %i5
	sra	%l4, 31, %l4
	cmp	%i1, 0
	be	.L400
	 and	%g2, %l4, %l4
	cmp	%g1, 0
	be	.L421
	 add	%fp, -24, %g1
	b	.L425
	 fnegs	%f8, %f8
.L373:
	sub	%g1, %i3, %g3
	cmp	%i4, %g3
	bgu	.L362
	 add	%g1, 1, %g2
.L428:
	jmp	%i7+8
	 restore
.L360:
	ld	[%i0+8], %g2
	b	.L397
	 stb	%i5, [%g2+%g1]
.L406:
	b	.L350
	 sub	%i4, %l0, %g1
.L403:
	add	%fp, -24, %g1
.L425:
	std	%f8, [%fp-56]
	st	%g1, [%sp+64]
	ldd	[%fp-56], %o0
	mov	%l4, %o2
	call	get_components, 0
	 nop
	unimp	24
	cmp	%i1, 0
	ldd	[%fp-24], %i2
	ld	[%fp-16], %l1
	ld	[%fp-12], %l0
	bne	.L332
	 ldub	[%fp-8], %l6
.L404:
	mov	%i2, %o0
	mov	%l1, %o2
	mov	%i3, %o1
	cmp	%o0, 0
	bg	.L380
	 mov	%l0, %o3
	cmp	%o0, 0
.L426:
	be	.L411
	 cmp	%o1, 9
.L348:
	add	%l5, 99, %g1
.L423:
	cmp	%g1, 198
	bgu	.L363
	 mov	5, %l0
	mov	4, %l0
.L363:
	andcc	%i5, 2, %i2
	bne	.L350
	 mov	0, %g1
	b	.L417
	 cmp	%i4, %l0
.L409:
	mov	0, %i1
	cmp	%l5, -4
	bge	.L325
	 mov	1, %i3
	b	.L418
	 mov	0, %i3
.L405:
	bl	.L347
	 mov	%i2, %o0
	call	__floatdidf, 0
	 mov	%i3, %o1
	add	%l5, 1, %l2
	sethi	%hi(powers_of_10), %g2
	sll	%l2, 3, %g1
	or	%g2, %lo(powers_of_10), %g2
	ldd	[%g2+%g1], %f8
	fcmpd	%f0, %f8
	nop
	fbne	.L422
	 mov	%i2, %o0
	add	%l4, -1, %l4
	b	.L422
	 mov	%l2, %l5
.L410:
	mov	0, %i3
.L418:
	and	%i1, %i3, %i1
	andcc	%i1, 0xff, %i1
	be	.L327
	 add	%g2, -1, %g2
	b	.L327
	 sub	%g2, %l5, %g2
.L424:
	jmp	%i7+8
	 restore
.L329:
	andcc	%g3, 0xff, %i3
	be	.L334
	 sub	%l4, %l5, %g2
	cmp	%g2, 306
	ble	.L336
	 fmuld	%f8, %f12, %f10
.L414:
	cmp	%g1, 0
	bne,a	.L337
	 fnegs	%f10, %f10
.L337:
	add	%fp, -24, %g1
	std	%f10, [%fp-56]
	st	%g1, [%sp+64]
	ldd	[%fp-56], %o0
	mov	%l4, %o2
	call	get_components, 0
	 nop
	unimp	24
	ldd	[%fp-24], %l0
	ldd	[%fp-16], %i2
	ldub	[%fp-8], %l6
.L338:
	mov	%l0, %o0
	mov	%l1, %o1
	mov	%i2, %o2
	cmp	%o0, 0
	ble	.L426
	 mov	%i3, %o3
.L380:
	add	%l5, 1, %l5
.L419:
	mov	0, %o2
	mov	0, %o3
	mov	0, %o0
	b	.L348
	 mov	1, %o1
.L368:
	fmovs	%f11, %f13
	mov	0, %g4
	b	.L310
	 mov	0, %g3
.L398:
	fdtoi	%f12, %f11
	st	%f11, [%fp-68]
	fitod	%f11, %f10
	fcmpd	%f12, %f10
	nop
	fbe	.L313
	 ld	[%fp-68], %l5
	b	.L313
	 add	%l5, -1, %l5
.L355:
	subcc	%g0, %l5, %g3
.L420:
	mov	5, %g1
	subx	%g0, %g2, %g2
	add	%l0, -1, %l0
	st	%g1, [%sp+96]
	st	%l0, [%sp+92]
	mov	%i0, %o0
	mov	%g2, %o1
	mov	%g3, %o2
	srl	%l5, 31, %o3
	mov	10, %o4
	call	print_integer, 0
	 mov	0, %o5
	cmp	%i2, 0
	bne	.L397
	 mov	32, %i5
	b,a	.L424
.L334:
	cmp	%g2, 306
	bg	.L414
	 fdivd	%f8, %f12, %f10
.L336:
	std	%f10, [%fp-56]
	std	%f8, [%fp-40]
	std	%f12, [%fp-48]
	call	__fixdfdi, 0
	 ldd	[%fp-56], %o0
	mov	%o0, %l0
	call	__floatdidf, 0
	 mov	%o1, %l1
	cmp	%i3, 0
	ldd	[%fp-40], %f8
	be	.L339
	 ldd	[%fp-48], %f12
	fdivd	%f0, %f12, %f0
	sll	%l4, 3, %g1
	sethi	%hi(powers_of_10), %g2
	fsubd	%f8, %f0, %f8
	or	%g2, %lo(powers_of_10), %g2
	ldd	[%g2+%g1], %f10
	std	%f10, [%fp-32]
	fmuld	%f12, %f10, %f12
.L340:
	fmuld	%f8, %f12, %f8
.L342:
	std	%f8, [%fp-56]
	std	%f8, [%fp-40]
	call	__fixdfdi, 0
	 ldd	[%fp-56], %o0
	mov	%o0, %l2
	call	__floatdidf, 0
	 mov	%o1, %l3
	ldd	[%fp-40], %f8
	sethi	%hi(.LC10), %g1
	fsubd	%f8, %f0, %f0
	mov	0, %g2
	ldd	[%g1+%lo(.LC10)], %f8
	fcmped	%f0, %f8
	nop
	fbge	.L427
	 mov	1, %g3
	mov	0, %g2
	mov	0, %g3
	ldd	[%g1+%lo(.LC10)], %f8
.L427:
	addcc	%l3, %g3, %i3
	fcmpd	%f0, %f8
	nop
	fbne	.L344
	 addx	%l2, %g2, %i2
	and	%i2, -1, %i2
	and	%i3, -2, %i3
.L344:
	mov	%i2, %o0
	call	__floatdidf, 0
	 mov	%i3, %o1
	ldd	[%fp-32], %f12
	fcmped	%f0, %f12
	nop
	fbul	.L338
	 nop
	addcc	%l1, 1, %g3
	mov	0, %i2
	addx	%l0, 0, %g2
	mov	%g3, %l1
	mov	%g2, %l0
	b	.L338
	 mov	0, %i3
.L411:
	bleu	.L423
	 add	%l5, 99, %g1
	b	.L419
	 add	%l5, 1, %l5
.L354:
	ld	[%i0+8], %g1
	stb	%g3, [%g1+%g2]
	cmp	%l5, 0
	mov	%l5, %g3
	bg	.L356
	 sra	%l5, 31, %g2
	b	.L420
	 subcc	%g0, %l5, %g3
.L399:
	fdtoi	%f12, %f11
	st	%f11, [%fp-68]
	fitod	%f11, %f16
	fcmpd	%f12, %f16
	nop
	fbe	.L318
	 ld	[%fp-68], %g2
	add	%g2, -1, %g2
	st	%g2, [%fp-68]
	ld	[%fp-68], %f12
	b	.L318
	 fitod	%f12, %f16
.L367:
	sethi	%hi(.LC1), %g2
	b	.L315
	 ldd	[%g2+%lo(.LC1)], %f10
.L339:
	sll	%l4, 3, %g1
	sethi	%hi(powers_of_10), %g2
	st	%f12, [%fp-68]
	or	%g2, %lo(powers_of_10), %g2
	ldd	[%g2+%g1], %f16
	ld	[%fp-68], %g1
	std	%f16, [%fp-32]
	srl	%g1, 20, %i3
	ld	[%fp-32], %g1
	and	%i3, 2047, %i3
	srl	%g1, 20, %g3
	add	%i3, -1023, %g1
	and	%g3, 2047, %g3
	sra	%g1, 31, %g4
	add	%g3, -1023, %g2
	fmuld	%f12, %f0, %f0
	xor	%g4, %g1, %g3
	sra	%g2, 31, %g1
	sub	%g3, %g4, %g4
	xor	%g1, %g2, %g2
	sub	%g2, %g1, %g1
	cmp	%g4, %g1
	ble	.L341
	 fsubd	%f8, %f0, %f8
	fdivd	%f12, %f16, %f12
	b	.L342
	 fdivd	%f8, %f12, %f8
.L341:
	ldd	[%fp-32], %f10
	b	.L340
	 fdivd	%f10, %f12, %f12
	.size	print_exponential_number, .-print_exponential_number
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC18:
	.asciz	"fni+"
	.align 8
.LC19:
	.asciz	"fni"
	.align 8
.LC20:
	.asciz	"nan"
	.align 8
.LC22:
	.asciz	"fni-"
	.section	.rodata.cst8
	.align 8
.LC21:
	.long	-1048577
	.long	4294967295
	.align 8
.LC23:
	.long	2146435071
	.long	4294967295
	.align 8
.LC24:
	.long	1104006501
	.long	0
	.align 8
.LC25:
	.long	-1043477147
	.long	0
	.section	".text"
	.align 4
	.type	print_floating_point, #function
	.proc	020
print_floating_point:
	save	%sp, -184, %sp
	st	%i1, [%fp-64]
	st	%i2, [%fp-60]
	ldd	[%fp-64], %f8
	fcmpd	%f8, %f8
	nop
	fbne	.L460
	 ldub	[%fp+95], %g3
	sethi	%hi(.LC21), %g1
	ldd	[%g1+%lo(.LC21)], %f10
	fcmped	%f8, %f10
	nop
	fbl	.L461
	 sethi	%hi(.LC23), %g1
	ldd	[%g1+%lo(.LC23)], %f10
	fcmped	%f8, %f10
	nop
	fbule	.L458
	 nop
	andcc	%i5, 4, %g0
	bne	.L462
	 mov	4, %o2
	mov	3, %o2
	sethi	%hi(.LC19), %o1
	mov	%i0, %o0
	or	%o1, %lo(.LC19), %o1
	mov	%i4, %o3
	call	out_rev_, 0
	 mov	%i5, %o4
	jmp	%i7+8
	 restore
.L458:
	cmp	%g3, 0
	be	.L463
	 sethi	%hi(.LC24), %g1
.L437:
	andcc	%i5, 2048, %g0
	be	.L449
	 mov	0, %i2
	cmp	%i3, 17
	bleu	.L440
	 add	%fp, -32, %i1
	b	.L441
	 mov	48, %g2
.L464:
	cmp	%i3, 17
	bgu	.L444
	 mov	1, %g1
	mov	0, %g1
.L444:
	andcc	%g1, 0xff, %g0
	be	.L465
	 cmp	%g3, 0
.L441:
	stb	%g2, [%i1+%i2]
	add	%i2, 1, %i2
	cmp	%i2, 31
	bleu	.L464
	 add	%i3, -1, %i3
.L440:
	cmp	%g3, 0
.L465:
	be	.L445
	 add	%fp, -56, %g1
	st	%i1, [%sp+92]
	st	%i2, [%sp+96]
.L459:
	std	%f8, [%fp-64]
	ldd	[%fp-64], %g2
	mov	%i0, %o0
	mov	%g2, %o1
	mov	%g3, %o2
	mov	%i3, %o3
	mov	%i4, %o4
	call	print_exponential_number, 0
	 mov	%i5, %o5
	jmp	%i7+8
	 restore
.L460:
	mov	%i0, %o0
	sethi	%hi(.LC20), %o1
	mov	3, %o2
	or	%o1, %lo(.LC20), %o1
	mov	%i4, %o3
	call	out_rev_, 0
	 mov	%i5, %o4
	jmp	%i7+8
	 restore
.L461:
	mov	%i0, %o0
	sethi	%hi(.LC22), %o1
	mov	4, %o2
	or	%o1, %lo(.LC22), %o1
	mov	%i4, %o3
	call	out_rev_, 0
	 mov	%i5, %o4
	jmp	%i7+8
	 restore
.L463:
	ldd	[%g1+%lo(.LC24)], %f10
	fcmped	%f8, %f10
	nop
	fbg	.L438
	 sethi	%hi(.LC25), %g1
	ldd	[%g1+%lo(.LC25)], %f10
	fcmped	%f8, %f10
	nop
	fbuge	.L437
	 nop
.L438:
	add	%fp, -32, %g1
	st	%g0, [%sp+96]
	b	.L459
	 st	%g1, [%sp+92]
.L462:
	sethi	%hi(.LC18), %o1
	mov	%i0, %o0
	or	%o1, %lo(.LC18), %o1
	mov	%i4, %o3
	call	out_rev_, 0
	 mov	%i5, %o4
	jmp	%i7+8
	 restore
.L449:
	mov	6, %i3
	b	.L440
	 add	%fp, -32, %i1
.L445:
	std	%f8, [%fp-64]
	mov	%i3, %o2
	ldd	[%fp-64], %o0
	st	%g1, [%sp+64]
	call	get_components, 0
	 nop
	unimp	24
	ldd	[%fp-56], %o0
	ldub	[%fp-40], %o4
	st	%i3, [%sp+92]
	st	%i4, [%sp+96]
	st	%i5, [%sp+100]
	st	%i1, [%sp+104]
	st	%i2, [%sp+108]
	ldd	[%fp-48], %o2
	call	print_broken_up_decimal.isra.4, 0
	 mov	%i0, %o5
	jmp	%i7+8
	 restore
	.size	print_floating_point, .-print_floating_point
	.section	.rodata.str1.8
	.align 8
.LC26:
	.asciz	")llun("
	.align 8
.LC27:
	.asciz	")lin("
	.section	".text"
	.align 4
	.type	_vsnprintf, #function
	.proc	04
_vsnprintf:
	save	%sp, -184, %sp
	sethi	%hi(8192), %l2
	sethi	%hi(.LC27), %l3
	sethi	%hi(2147482624), %l4
	sethi	%hi(.LC26), %l6
	sethi	%hi(64512), %l5
	or	%l2, 1, %l2
	or	%l3, %lo(.LC27), %l3
	or	%l4, 1023, %l4
	or	%l6, %lo(.LC26), %l6
	or	%l5, 1023, %l5
.L625:
	ldsb	[%i1], %o0
.L661:
	cmp	%o0, 0
	be	.L640
	 ldub	[%i1], %g3
.L581:
	cmp	%o0, 37
	be,a	.L468
	 add	%i1, 2, %i1
	ld	[%i0+12], %g1
	add	%g1, 1, %g2
	st	%g2, [%i0+12]
	ld	[%i0+16], %g2
	cmp	%g1, %g2
	bgeu,a	.L645
	 add	%i1, 1, %i1
	ld	[%i0], %g2
	cmp	%g2, 0
	be,a	.L470
	 ld	[%i0+8], %g2
	call	%g2, 0
	 ld	[%i0+4], %o1
	add	%i1, 1, %i1
.L645:
	ldsb	[%i1], %o0
	cmp	%o0, 0
	bne	.L581
	 ldub	[%i1], %g3
.L640:
	ld	[%i0], %g1
	cmp	%g1, 0
	be,a	.L641
	 ld	[%i0+16], %g1
	ld	[%i0+12], %i0
.L671:
	jmp	%i7+8
	 restore
.L468:
	mov	0, %i3
	sethi	%hi(.L479), %g4
.L472:
	ldub	[%i1-1], %g1
	add	%g1, -32, %g2
	and	%g2, 0xff, %g2
	cmp	%g2, 16
	bleu	.L642
	 add	%i1, -1, %i5
.L473:
	add	%g1, -48, %g2
	and	%g2, 0xff, %g2
	cmp	%g2, 9
	bgu	.L481
	 mov	%i5, %g3
	mov	0, %i4
.L482:
	add	%i4, %i4, %g2
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	sll	%i4, 3, %i4
	add	%i5, 1, %i5
	add	%g2, %i4, %i4
	add	%i4, %g1, %i4
	ldub	[%i5], %g1
	add	%g1, -48, %g2
	and	%g2, 0xff, %g2
	cmp	%g2, 9
	bleu	.L482
	 add	%i4, -48, %i4
.L634:
	sll	%g1, 24, %g2
.L483:
	sra	%g2, 24, %g2
	cmp	%g2, 46
	be	.L643
	 mov	0, %l0
.L486:
	add	%g1, -104, %g2
	and	%g2, 0xff, %g2
	cmp	%g2, 18
	bgu,a	.L663
	 add	%g1, -37, %g2
	sll	%g2, 2, %g2
	sethi	%hi(.L496), %g3
	or	%g3, %lo(.L496), %g3
	ld	[%g3+%g2], %g2
	jmp	%g2
	 nop
	.section	".rodata"
	.section	".text"
.L495:
	ldub	[%i5+1], %g1
.L635:
	or	%i3, 512, %i3
	add	%i5, 1, %i5
.L490:
	add	%g1, -37, %g2
.L663:
	and	%g2, 0xff, %g2
	cmp	%g2, 83
	bleu	.L644
	 sll	%g2, 2, %g2
.L499:
	ld	[%i0+12], %g2
	add	%g2, 1, %g3
	st	%g3, [%i0+12]
	ld	[%i0+16], %g3
	cmp	%g2, %g3
	bgeu	.L625
	 add	%i5, 1, %i1
	ld	[%i0], %g3
	cmp	%g3, 0
	be	.L580
	 sll	%g1, 24, %o0
	ld	[%i0+4], %o1
	call	%g3, 0
	 sra	%o0, 24, %o0
	b	.L625
	 add	%i5, 1, %i1
.L642:
	or	%g4, %lo(.L479), %g3
	sll	%g2, 2, %g2
	ld	[%g3+%g2], %g2
	jmp	%g2
	 nop
	.section	".rodata"
	.section	".text"
.L478:
	or	%i3, 1, %i3
	b	.L472
	 add	%i1, 1, %i1
.L477:
	or	%i3, 2, %i3
	b	.L472
	 add	%i1, 1, %i1
.L476:
	or	%i3, 4, %i3
	b	.L472
	 add	%i1, 1, %i1
.L475:
	or	%i3, 16, %i3
	b	.L472
	 add	%i1, 1, %i1
.L474:
	or	%i3, 8, %i3
	b	.L472
	 add	%i1, 1, %i1
.L470:
	add	%i1, 1, %i1
	b	.L645
	 stb	%g3, [%g2+%g1]
.L481:
	sll	%g1, 24, %g2
	sra	%g2, 24, %g4
	cmp	%g4, 42
	bne	.L483
	 mov	0, %i4
	ld	[%i2], %i4
	cmp	%i4, 0
	bl	.L646
	 add	%i2, 4, %i2
	ldub	[%g3+1], %g1
	b	.L634
	 add	%i5, 1, %i5
.L644:
	sethi	%hi(.L508), %g3
	or	%g3, %lo(.L508), %g3
	ld	[%g3+%g2], %g2
	jmp	%g2
	 nop
	.section	".rodata"
	.section	".text"
.L643:
	ldub	[%i5+1], %g1
	or	%i3, 2048, %i3
	add	%g1, -48, %g3
	and	%g3, 0xff, %g3
	cmp	%g3, 9
	bgu	.L487
	 add	%i5, 1, %g2
.L488:
	add	%l0, %l0, %g3
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	sll	%l0, 3, %l0
	add	%g2, 1, %g2
	add	%g3, %l0, %l0
	add	%l0, %g1, %l0
	ldub	[%g2], %g1
	add	%g1, -48, %g3
	and	%g3, 0xff, %g3
	cmp	%g3, 9
	bleu	.L488
	 add	%l0, -48, %l0
	b	.L486
	 mov	%g2, %i5
.L487:
	sll	%g1, 24, %g3
	sra	%g3, 24, %g3
	cmp	%g3, 42
	bne,a	.L486
	 mov	%g2, %i5
	ld	[%i2], %g2
	ldub	[%i5+2], %g1
	xnor	%g0, %g2, %l0
	add	%i2, 4, %i2
	sra	%l0, 31, %l0
	add	%i5, 2, %i5
	b	.L486
	 and	%g2, %l0, %l0
.L493:
	ldsb	[%i5+1], %g2
	cmp	%g2, 108
	bne	.L635
	 ldub	[%i5+1], %g1
	ldub	[%i5+2], %g1
	or	%i3, 1536, %i3
	b	.L490
	 add	%i5, 2, %i5
.L492:
	ldub	[%i5+1], %g1
	or	%i3, 1024, %i3
	b	.L490
	 add	%i5, 1, %i5
.L491:
	ldsb	[%i5+1], %g2
	cmp	%g2, 104
	be	.L498
	 ldub	[%i5+1], %g1
	or	%i3, 128, %i3
	b	.L490
	 add	%i5, 1, %i5
.L500:
	ld	[%i0+12], %g1
	add	%g1, 1, %g2
	st	%g2, [%i0+12]
	ld	[%i0+16], %g2
	cmp	%g1, %g2
	bgeu	.L625
	 add	%i5, 1, %i1
	ld	[%i0], %g2
	cmp	%g2, 0
	be	.L573
	 mov	37, %o0
	call	%g2, 0
	 ld	[%i0+4], %o1
	b	.L661
	 ldsb	[%i1], %o0
.L506:
	ld	[%i2], %o2
	or	%i3, %l2, %o4
	cmp	%o2, 0
	bne	.L570
	 add	%i2, 4, %i2
	mov	%i0, %o0
	mov	%l3, %o1
	mov	5, %o2
	mov	10, %o3
	call	out_rev_, 0
	 add	%i5, 1, %i1
	b	.L661
	 ldsb	[%i1], %o0
.L505:
	ld	[%i2], %g1
	ld	[%i0+12], %g2
	andcc	%i3, 64, %g0
	bne	.L647
	 add	%i2, 4, %i2
	andcc	%i3, 128, %g0
	be	.L576
	 andcc	%i3, 512, %g0
	sth	%g2, [%g1]
	b	.L625
	 add	%i5, 1, %i1
.L504:
	ld	[%i0+12], %g1
	andcc	%i3, 2, %i3
	be	.L533
	 ld	[%i0+16], %g3
	mov	1, %i1
.L534:
	ld	[%i2], %g4
	add	%g1, 1, %g2
	st	%g2, [%i0+12]
	cmp	%g1, %g3
	bgeu	.L539
	 add	%i2, 4, %i2
	ld	[%i0], %g2
	cmp	%g2, 0
	be,a	.L540
	 ld	[%i0+8], %g2
	sll	%g4, 24, %o0
	ld	[%i0+4], %o1
	call	%g2, 0
	 sra	%o0, 24, %o0
.L539:
	cmp	%i3, 0
	be,a	.L625
	 add	%i5, 1, %i1
	mov	32, %i3
.L627:
	cmp	%i4, %i1
	bleu,a	.L625
	 add	%i5, 1, %i1
	ld	[%i0+12], %g1
	add	%g1, 1, %g2
	st	%g2, [%i0+12]
	ld	[%i0+16], %g2
	cmp	%g1, %g2
	bgeu,a	.L627
	 add	%i1, 1, %i1
	ld	[%i0], %g2
	cmp	%g2, 0
	be,a	.L544
	 ld	[%i0+8], %g2
	mov	32, %o0
	call	%g2, 0
	 ld	[%i0+4], %o1
	b	.L627
	 add	%i1, 1, %i1
.L503:
	sll	%g1, 24, %g2
	sra	%g2, 24, %g3
	cmp	%g3, 105
	bne	.L648
	 cmp	%g3, 100
	sethi	%hi(16384), %g3
.L662:
	or	%i3, %g3, %i3
	and	%g1, -33, %g1
.L669:
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 88
	be,a	.L511
	 mov	16, %l1
	sra	%g2, 24, %g1
	cmp	%g1, 111
	be	.L513
	 mov	8, %l1
	cmp	%g1, 98
	be	.L513
	 mov	2, %l1
	and	%i3, -17, %i3
	mov	10, %l1
.L511:
	sra	%g2, 24, %g2
	cmp	%g2, 88
	be,a	.L513
	 or	%i3, 32, %i3
.L513:
	andcc	%i3, 2048, %g0
	be	.L514
	 add	%i5, 1, %i1
	and	%i3, -2, %i3
.L514:
	sethi	%hi(16384), %g1
	andcc	%i3, %g1, %g0
	be	.L515
	 andcc	%i3, 1024, %g0
	bne	.L649
	 andcc	%i3, 512, %g0
	be	.L517
	 andcc	%i3, 64, %g0
	ld	[%i2], %o3
	cmp	%o3, 0
	ble	.L518
	 add	%i2, 4, %i2
	sra	%o3, 31, %g1
	st	%o3, [%fp-52]
	st	%g1, [%fp-56]
.L519:
	st	%i4, [%sp+92]
	st	%i3, [%sp+96]
	mov	%i0, %o0
	ld	[%fp-56], %o1
	ld	[%fp-52], %o2
	srl	%o3, 31, %o3
	and	%l1, 26, %o4
	call	print_integer, 0
	 mov	%l0, %o5
	b	.L661
	 ldsb	[%i1], %o0
.L507:
	ld	[%i2], %i1
	cmp	%i1, 0
	be	.L650
	 add	%i2, 4, %i2
	orcc	%l0, 0, %g1
	be,a	.L548
	 mov	%l4, %g1
.L548:
	ldub	[%i1], %g2
	sll	%g2, 24, %o0
	cmp	%o0, 0
	be,a	.L549
	 mov	0, %l1
	b	.L551
	 mov	%i1, %l1
.L550:
	be,a	.L549
	 sub	%l1, %i1, %l1
.L551:
	add	%l1, 1, %l1
	ldsb	[%l1], %g3
	cmp	%g3, 0
	bne,a	.L550
	 addcc	%g1, -1, %g1
	sub	%l1, %i1, %l1
.L549:
	andcc	%i3, 2048, %l7
	be,a	.L664
	 andcc	%i3, 2, %i3
	cmp	%l1, %l0
	bgu,a	.L552
	 mov	%l0, %l1
.L552:
	andcc	%i3, 2, %i3
.L664:
	bne	.L637
	 st	%i3, [%fp-36]
	cmp	%i4, %l1
	bleu	.L652
	 add	%l1, 1, %i3
.L558:
	ld	[%i0+12], %g1
	add	%g1, 1, %g2
	st	%g2, [%i0+12]
	ld	[%i0+16], %g2
	cmp	%g1, %g2
	bgeu	.L665
	 mov	%i3, %l1
	ld	[%i0], %g2
	cmp	%g2, 0
	be	.L557
	 mov	32, %o0
	call	%g2, 0
	 ld	[%i0+4], %o1
	mov	%i3, %l1
.L656:
.L665:
	cmp	%i4, %l1
	bgu	.L558
	 add	%l1, 1, %i3
.L652:
	ldub	[%i1], %g2
	sll	%g2, 24, %o0
	cmp	%o0, 0
	bne	.L653
	 mov	%i3, %l1
	ld	[%fp-36], %o4
.L667:
	cmp	%o4, 0
	be,a	.L625
	 add	%i5, 1, %i1
	mov	32, %i3
.L631:
	cmp	%i4, %l1
	bleu,a	.L625
	 add	%i5, 1, %i1
	ld	[%i0+12], %g1
	add	%g1, 1, %g2
	st	%g2, [%i0+12]
	ld	[%i0+16], %g2
	cmp	%g1, %g2
	bgeu,a	.L631
	 add	%l1, 1, %l1
	ld	[%i0], %g2
	cmp	%g2, 0
	be,a	.L568
	 ld	[%i0+8], %g2
	mov	32, %o0
	call	%g2, 0
	 ld	[%i0+4], %o1
	b	.L631
	 add	%l1, 1, %l1
.L502:
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 70
	be,a	.L530
	 or	%i3, 32, %i3
.L530:
	mov	%i2, %o1
	mov	8, %o2
	call	memcpy, 0
	 add	%fp, -16, %o0
	mov	%i0, %o0
	st	%g0, [%sp+92]
	ld	[%fp-16], %o1
	ld	[%fp-12], %o2
.L639:
	mov	%l0, %o3
	mov	%i4, %o4
	mov	%i3, %o5
	call	print_floating_point, 0
	 add	%i2, 8, %i2
	b	.L625
	 add	%i5, 1, %i1
.L501:
	and	%g1, -33, %g2
	sll	%g2, 24, %g2
	sra	%g2, 24, %g2
	cmp	%g2, 71
	bne	.L666
	 and	%g1, -3, %g1
	sethi	%hi(4096), %g2
	or	%i3, %g2, %i3
.L666:
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 69
	be,a	.L532
	 or	%i3, 32, %i3
.L532:
	mov	%i2, %o1
	mov	8, %o2
	call	memcpy, 0
	 add	%fp, -8, %o0
	mov	1, %g1
	mov	%i0, %o0
	ld	[%fp-8], %o1
	ld	[%fp-4], %o2
	b	.L639
	 st	%g1, [%sp+92]
.L655:
	call	%g3, 0
	 ld	[%i0+4], %o1
.L562:
	ldub	[%i1], %g2
	add	%l0, -1, %l0
	sll	%g2, 24, %o0
.L637:
	cmp	%o0, 0
	be	.L667
	 ld	[%fp-36], %o4
.L653:
	cmp	%l7, 0
	be	.L566
	 cmp	%l0, 0
	be	.L667
	 ld	[%fp-36], %o4
.L566:
	ld	[%i0+12], %g1
	add	%g1, 1, %g3
	st	%g3, [%i0+12]
	ld	[%i0+16], %g3
	cmp	%g1, %g3
	bgeu	.L562
	 add	%i1, 1, %i1
	ld	[%i0], %g3
	cmp	%g3, 0
	bne	.L655
	 sra	%o0, 24, %o0
	ld	[%i0+8], %g3
	b	.L562
	 stb	%g2, [%g3+%g1]
.L557:
	ld	[%i0+8], %g2
	mov	32, %g3
	mov	%i3, %l1
	b	.L656
	 stb	%g3, [%g2+%g1]
.L641:
	cmp	%g1, 0
	be,a	.L671
	 ld	[%i0+12], %i0
	ld	[%i0+8], %g3
	cmp	%g3, 0
	be,a	.L671
	 ld	[%i0+12], %i0
	ld	[%i0+12], %g2
	cmp	%g1, %g2
	bleu,a	.L583
	 add	%g1, -1, %g2
.L583:
	stb	%g0, [%g3+%g2]
	ld	[%i0+12], %i0
	jmp	%i7+8
	 restore
.L648:
	bne,a	.L669
	 and	%g1, -33, %g1
	b	.L662
	 sethi	%hi(16384), %g3
.L647:
	stb	%g2, [%g1]
	b	.L625
	 add	%i5, 1, %i1
.L533:
	mov	1, %g2
	mov	32, %l0
.L535:
	cmp	%i4, %g2
	bleu	.L534
	 add	%g2, 1, %i1
	add	%g1, 1, %g2
	cmp	%g3, %g1
	bleu	.L590
	 st	%g2, [%i0+12]
	ld	[%i0], %g2
	cmp	%g2, 0
	be	.L537
	 mov	32, %o0
	call	%g2, 0
	 ld	[%i0+4], %o1
	ld	[%i0+12], %g1
	ld	[%i0+16], %g3
	b	.L535
	 mov	%i1, %g2
.L570:
	mov	10, %g1
	st	%o4, [%sp+96]
	st	%g1, [%sp+92]
	mov	%i0, %o0
	mov	0, %o1
	mov	0, %o3
	mov	16, %o4
	mov	%l0, %o5
	call	print_integer, 0
	 add	%i5, 1, %i1
	b	.L661
	 ldsb	[%i1], %o0
.L646:
	or	%i3, 2, %i3
	sub	%g0, %i4, %i4
	ldub	[%g3+1], %g1
	b	.L634
	 add	%i5, 1, %i5
.L590:
	mov	%g2, %g1
	b	.L535
	 mov	%i1, %g2
.L537:
	ld	[%i0+8], %g2
	stb	%l0, [%g2+%g1]
	mov	%i1, %g2
	ld	[%i0+12], %g1
	b	.L535
	 ld	[%i0+16], %g3
.L544:
	add	%i1, 1, %i1
	b	.L627
	 stb	%i3, [%g2+%g1]
.L568:
	add	%l1, 1, %l1
	b	.L631
	 stb	%i3, [%g2+%g1]
.L515:
	bne	.L657
	 and	%i3, -13, %i5
	andcc	%i3, 512, %g0
	bne	.L658
	 andcc	%i3, 64, %g0
	bne,a	.L659
	 ldub	[%i2+3], %o2
	ld	[%i2], %o2
	andcc	%i3, 128, %g0
	be	.L528
	 add	%i2, 4, %i2
	and	%o2, %l5, %o2
.L528:
	st	%i4, [%sp+92]
.L638:
	st	%i5, [%sp+96]
	mov	%i0, %o0
	mov	0, %o1
	mov	0, %o3
	and	%l1, 26, %o4
	call	print_integer, 0
	 mov	%l0, %o5
	b	.L661
	 ldsb	[%i1], %o0
.L498:
	ldub	[%i5+2], %g1
	or	%i3, 192, %i3
	b	.L490
	 add	%i5, 2, %i5
.L576:
	bne,a	.L670
	 st	%g2, [%g1]
	andcc	%i3, 1024, %g0
	be,a	.L578
	 st	%g2, [%g1]
	st	%g0, [%g1]
	st	%g2, [%g1+4]
	b	.L625
	 add	%i5, 1, %i1
.L578:
.L670:
	b	.L625
	 add	%i5, 1, %i1
.L573:
	ld	[%i0+8], %g2
	mov	37, %g3
	add	%i5, 1, %i1
	b	.L625
	 stb	%g3, [%g2+%g1]
.L540:
	b	.L539
	 stb	%g4, [%g2+%g1]
.L580:
	ld	[%i0+8], %g3
	add	%i5, 1, %i1
	b	.L625
	 stb	%g1, [%g3+%g2]
.L517:
	bne,a	.L660
	 ldsb	[%i2+3], %o3
	andcc	%i3, 128, %g0
	be,a	.L522
	 ld	[%i2], %o3
	ldsh	[%i2+2], %o3
	add	%i2, 4, %i2
.L521:
	cmp	%o3, 0
	ble	.L523
	 sra	%o3, 31, %o4
	st	%o3, [%fp-60]
	st	%o4, [%fp-64]
.L524:
	st	%i4, [%sp+92]
	st	%i3, [%sp+96]
	mov	%i0, %o0
	ld	[%fp-64], %o1
	ld	[%fp-60], %o2
	srl	%o3, 31, %o3
	and	%l1, 26, %o4
	call	print_integer, 0
	 mov	%l0, %o5
	b	.L661
	 ldsb	[%i1], %o0
.L659:
	b	.L528
	 add	%i2, 4, %i2
.L660:
	b	.L521
	 add	%i2, 4, %i2
.L518:
	sra	%o3, 31, %g3
	st	%o3, [%fp-68]
	st	%g3, [%fp-72]
	ldd	[%fp-72], %g2
	subcc	%g0, %g3, %g3
	subx	%g0, %g2, %g2
	b	.L519
	 std	%g2, [%fp-56]
.L657:
	mov	%i2, %o1
	add	%fp, -24, %o0
	call	memcpy, 0
	 mov	8, %o2
	add	%i2, 8, %i2
	st	%i4, [%sp+92]
	st	%i5, [%sp+96]
	mov	%i0, %o0
	ld	[%fp-24], %o1
	ld	[%fp-20], %o2
	mov	0, %o3
	and	%l1, 26, %o4
	call	print_integer, 0
	 mov	%l0, %o5
	b	.L661
	 ldsb	[%i1], %o0
.L649:
	mov	%i2, %o1
	add	%fp, -32, %o0
	call	memcpy, 0
	 mov	8, %o2
	ldd	[%fp-32], %g2
	st	%i4, [%sp+92]
	sra	%g2, 31, %g1
	srl	%g2, 31, %o3
	st	%g1, [%fp-44]
	st	%g1, [%fp-48]
	ldd	[%fp-48], %o4
	xor	%o4, %g2, %i4
	xor	%o5, %g3, %i5
	subcc	%i5, %o5, %g3
	subx	%i4, %o4, %g2
	add	%i2, 8, %i2
	st	%i3, [%sp+96]
	mov	%i0, %o0
	and	%l1, 26, %o4
	mov	%g2, %o1
	mov	%g3, %o2
	call	print_integer, 0
	 mov	%l0, %o5
	b	.L661
	 ldsb	[%i1], %o0
.L658:
	ld	[%i2], %o2
	st	%i4, [%sp+92]
	b	.L638
	 add	%i2, 4, %i2
.L650:
	mov	%i0, %o0
	mov	%l6, %o1
	mov	6, %o2
	mov	%i4, %o3
	mov	%i3, %o4
	call	out_rev_, 0
	 add	%i5, 1, %i1
	b	.L661
	 ldsb	[%i1], %o0
.L523:
	st	%o3, [%fp-76]
	sra	%o3, 31, %g1
	st	%g1, [%fp-80]
	ldd	[%fp-80], %g2
	subcc	%g0, %g3, %g3
	subx	%g0, %g2, %g2
	b	.L524
	 std	%g2, [%fp-64]
.L522:
	b	.L521
	 add	%i2, 4, %i2
	.align 4
	.subsection	-1
	.align 4
.L508:
	.word	.L500
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L501
	.word	.L502
	.word	.L501
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L503
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L503
	.word	.L504
	.word	.L503
	.word	.L501
	.word	.L502
	.word	.L501
	.word	.L499
	.word	.L503
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L499
	.word	.L505
	.word	.L503
	.word	.L506
	.word	.L499
	.word	.L499
	.word	.L507
	.word	.L499
	.word	.L503
	.word	.L499
	.word	.L499
	.word	.L503
	.previous
	.subsection	-1
	.align 4
.L479:
	.word	.L474
	.word	.L473
	.word	.L473
	.word	.L475
	.word	.L473
	.word	.L473
	.word	.L473
	.word	.L473
	.word	.L473
	.word	.L473
	.word	.L473
	.word	.L476
	.word	.L473
	.word	.L477
	.word	.L473
	.word	.L473
	.word	.L478
	.previous
	.subsection	-1
	.align 4
.L496:
	.word	.L491
	.word	.L490
	.word	.L492
	.word	.L490
	.word	.L493
	.word	.L490
	.word	.L490
	.word	.L490
	.word	.L490
	.word	.L490
	.word	.L490
	.word	.L490
	.word	.L495
	.word	.L490
	.word	.L490
	.word	.L490
	.word	.L490
	.word	.L490
	.word	.L495
	.previous
	.size	_vsnprintf, .-_vsnprintf
	.align 4
	.global uart_send_char
	.type	uart_send_char, #function
	.proc	020
uart_send_char:
	save	%sp, -96, %sp
.L673:
	call	__ajit_serial_putchar_via_vmap__, 0
	 mov	%i0, %o0
	cmp	%o0, 0
	be	.L673
	 nop
.L679:
	call	__ajit_read_serial_control_register_via_vmap__, 0
	 nop
	and	%o0, 9, %o0
	cmp	%o0, 9
	be	.L679
	 nop
	jmp	%i7+8
	 restore
	.size	uart_send_char, .-uart_send_char
	.align 4
	.global vprintf_
	.type	vprintf_, #function
	.proc	04
vprintf_:
	save	%sp, -120, %sp
	sethi	%hi(putchar_wrapper), %g1
	or	%g1, %lo(putchar_wrapper), %g1
	st	%g1, [%fp-20]
	sethi	%hi(2147482624), %g1
	or	%g1, 1023, %g1
	mov	%i0, %o1
	st	%g0, [%fp-16]
	st	%g0, [%fp-12]
	st	%g0, [%fp-8]
	add	%fp, -20, %o0
	st	%g1, [%fp-4]
	call	_vsnprintf, 0
	 mov	%i1, %o2
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	vprintf_, .-vprintf_
	.align 4
	.global vsnprintf_
	.type	vsnprintf_, #function
	.proc	04
vsnprintf_:
	save	%sp, -120, %sp
	cmp	%i1, 0
	bl	.L688
	 subcc	%g0, %i0, %g0
	subx	%g0, 0, %g1
	st	%i0, [%fp-12]
	and	%i1, %g1, %i1
	st	%g0, [%fp-20]
	st	%g0, [%fp-16]
	st	%g0, [%fp-8]
	st	%i1, [%fp-4]
	add	%fp, -20, %o0
	mov	%i2, %o1
	call	_vsnprintf, 0
	 mov	%i3, %o2
	jmp	%i7+8
	 restore %g0, %o0, %o0
.L688:
	subx	%g0, 0, %g1
	st	%i0, [%fp-12]
	st	%g0, [%fp-20]
	st	%g0, [%fp-16]
	st	%g0, [%fp-8]
	add	%fp, -20, %o0
	mov	%i2, %o1
	mov	%i3, %o2
	sethi	%hi(2147482624), %i1
	or	%i1, 1023, %i1
	and	%i1, %g1, %i1
	call	_vsnprintf, 0
	 st	%i1, [%fp-4]
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	vsnprintf_, .-vsnprintf_
	.align 4
	.global vsprintf_
	.type	vsprintf_, #function
	.proc	04
vsprintf_:
	mov	%o2, %o3
	mov	%o1, %o2
	sethi	%hi(2147482624), %o1
	or	%o1, 1023, %o1
	or	%o7, %g0, %g1
	call	vsnprintf_, 0
	 or	%g1, %g0, %o7
	.size	vsprintf_, .-vsprintf_
	.align 4
	.global vfctprintf
	.type	vfctprintf, #function
	.proc	04
vfctprintf:
	save	%sp, -120, %sp
	sethi	%hi(2147482624), %g1
	or	%g1, 1023, %g1
	st	%i0, [%fp-20]
	st	%i1, [%fp-16]
	st	%g0, [%fp-12]
	st	%g0, [%fp-8]
	add	%fp, -20, %o0
	mov	%i2, %o1
	st	%g1, [%fp-4]
	call	_vsnprintf, 0
	 mov	%i3, %o2
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	vfctprintf, .-vfctprintf
	.align 4
	.global printf_
	.type	printf_, #function
	.proc	04
printf_:
	save	%sp, -104, %sp
	add	%fp, 72, %o1
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	st	%o1, [%fp-4]
	call	vprintf_, 0
	 mov	%i0, %o0
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	printf_, .-printf_
	.align 4
	.global sprintf_
	.type	sprintf_, #function
	.proc	04
sprintf_:
	save	%sp, -104, %sp
	add	%fp, 76, %o2
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	st	%o2, [%fp-4]
	mov	%i0, %o0
	call	vsprintf_, 0
	 mov	%i1, %o1
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	sprintf_, .-sprintf_
	.align 4
	.global snprintf_
	.type	snprintf_, #function
	.proc	04
snprintf_:
	save	%sp, -104, %sp
	add	%fp, 80, %o3
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	st	%o3, [%fp-4]
	mov	%i0, %o0
	mov	%i1, %o1
	call	vsnprintf_, 0
	 mov	%i2, %o2
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	snprintf_, .-snprintf_
	.align 4
	.global fctprintf
	.type	fctprintf, #function
	.proc	04
fctprintf:
	save	%sp, -104, %sp
	add	%fp, 80, %o3
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	st	%o3, [%fp-4]
	mov	%i0, %o0
	mov	%i1, %o1
	call	vfctprintf, 0
	 mov	%i2, %o2
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	fctprintf, .-fctprintf
	.section	".rodata"
	.align 8
	.type	powers_of_10, #object
	.size	powers_of_10, 144
powers_of_10:
	.long	1072693248
	.long	0
	.long	1076101120
	.long	0
	.long	1079574528
	.long	0
	.long	1083129856
	.long	0
	.long	1086556160
	.long	0
	.long	1090021888
	.long	0
	.long	1093567616
	.long	0
	.long	1097011920
	.long	0
	.long	1100470148
	.long	0
	.long	1104006501
	.long	0
	.long	1107468383
	.long	536870912
	.long	1110919286
	.long	3892314112
	.long	1114446484
	.long	2717908992
	.long	1117925532
	.long	3846176768
	.long	1121369284
	.long	512753664
	.long	1124887541
	.long	640942080
	.long	1128383353
	.long	937459712
	.long	1131820119
	.long	2245566464
	.ident	"GCC: (Buildroot 2014.08-g2ac7e17) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
