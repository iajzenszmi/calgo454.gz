	.file	"src.f"
	.text
	.globl	jcek1_
	.type	jcek1_, @function
jcek1_:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$136, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -120(%rbp)
	movq	%rsi, -128(%rbp)
	movq	%rdx, -136(%rbp)
	movq	%rcx, -144(%rbp)
	movq	%r8, -152(%rbp)
	movq	%r9, -160(%rbp)
	movq	-136(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	movq	%rdx, %rbx
	cmovns	%rax, %rbx
	movq	48(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -80(%rbp)
	movq	%rbx, %rax
	imulq	-80(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %r12
	movl	$0, %r13d
	movq	%rbx, %r12
	notq	%r12
	movq	-128(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, -176(%rbp)
	movq	$0, -168(%rbp)
	movq	-128(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -96(%rbp)
	movq	-96(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %r14
	movl	$0, %r15d
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %r10
	movl	$0, %r11d
	jmp	.L15
.L25:
	nop
.L15:
	movl	$0, -60(%rbp)
	movq	-160(%rbp), %r8
	movq	-152(%rbp), %rdi
	movq	-144(%rbp), %rcx
	movq	-136(%rbp), %rdx
	movq	-128(%rbp), %rsi
	movq	-120(%rbp), %rax
	pushq	48(%rbp)
	pushq	16(%rbp)
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	jcnst1_@PLT
	addq	$16, %rsp
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	movl	$1, -52(%rbp)
.L7:
	cmpl	%eax, -52(%rbp)
	setg	%dl
	movzbl	%dl, %edx
	testl	%edx, %edx
	jne	.L20
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rbx, %rdx
	leaq	(%r12,%rdx), %rcx
	movq	16(%rbp), %rdx
	movl	(%rdx), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rcx
	movq	-144(%rbp), %rdx
	movss	(%rdx,%rcx,4), %xmm0
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rcx
	movq	-152(%rbp), %rdx
	movss	(%rdx,%rcx,4), %xmm2
	movaps	%xmm0, %xmm1
	subss	%xmm2, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	jb	.L19
	nop
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rcx
	movq	-152(%rbp), %rdx
	movss	(%rdx,%rcx,4), %xmm1
	movq	40(%rbp), %rdx
	movss	(%rdx), %xmm0
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rbx, %rdx
	leaq	(%r12,%rdx), %rcx
	movq	16(%rbp), %rdx
	movl	(%rdx), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rcx
	addss	%xmm1, %xmm0
	movq	-144(%rbp), %rdx
	movss	%xmm0, (%rdx,%rcx,4)
	jmp	.L5
.L19:
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rcx
	movq	-160(%rbp), %rdx
	movss	(%rdx,%rcx,4), %xmm0
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rbx, %rdx
	leaq	(%r12,%rdx), %rcx
	movq	16(%rbp), %rdx
	movl	(%rdx), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rcx
	movq	-144(%rbp), %rdx
	movss	(%rdx,%rcx,4), %xmm2
	movaps	%xmm0, %xmm1
	subss	%xmm2, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	jb	.L5
	nop
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rcx
	movq	-160(%rbp), %rdx
	movss	(%rdx,%rcx,4), %xmm0
	movq	40(%rbp), %rdx
	movss	(%rdx), %xmm1
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rbx, %rdx
	leaq	(%r12,%rdx), %rcx
	movq	16(%rbp), %rdx
	movl	(%rdx), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rcx
	subss	%xmm1, %xmm0
	movq	-144(%rbp), %rdx
	movss	%xmm0, (%rdx,%rcx,4)
.L5:
	addl	$1, -52(%rbp)
	jmp	.L7
.L20:
	nop
	movq	24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jle	.L21
	nop
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	addl	$1, %eax
	movl	%eax, -108(%rbp)
	movl	-108(%rbp), %eax
	movq	-128(%rbp), %rdx
	movl	(%rdx), %r13d
	movl	%eax, -52(%rbp)
.L14:
	cmpl	%r13d, -52(%rbp)
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L22
	movq	-160(%rbp), %r8
	movq	-152(%rbp), %rdi
	movq	-144(%rbp), %rcx
	movq	-136(%rbp), %rdx
	movq	-128(%rbp), %rsi
	movq	-120(%rbp), %rax
	pushq	48(%rbp)
	pushq	16(%rbp)
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	jcnst1_@PLT
	addq	$16, %rsp
	movl	-52(%rbp), %eax
	cltq
	imulq	%rbx, %rax
	leaq	(%r12,%rax), %rdx
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	addq	%rax, %rdx
	movq	-144(%rbp), %rax
	movss	(%rax,%rdx,4), %xmm0
	movl	-52(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-152(%rbp), %rax
	movss	(%rax,%rdx,4), %xmm2
	movaps	%xmm0, %xmm1
	subss	%xmm2, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	ja	.L23
	nop
	movl	-52(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-160(%rbp), %rax
	movss	(%rax,%rdx,4), %xmm0
	movl	-52(%rbp), %eax
	cltq
	imulq	%rbx, %rax
	leaq	(%r12,%rax), %rdx
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	addq	%rax, %rdx
	movq	-144(%rbp), %rax
	movss	(%rax,%rdx,4), %xmm2
	movaps	%xmm0, %xmm1
	subss	%xmm2, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	jbe	.L11
.L23:
	nop
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -112(%rbp)
	movl	$1, -60(%rbp)
	movq	32(%rbp), %rdi
	leaq	-112(%rbp), %rcx
	movq	-136(%rbp), %rdx
	movq	-128(%rbp), %rsi
	movq	-120(%rbp), %rax
	subq	$8, %rsp
	pushq	56(%rbp)
	pushq	48(%rbp)
	pushq	-144(%rbp)
	movq	%rdi, %r9
	movq	16(%rbp), %r8
	movq	%rax, %rdi
	call	jcent_
	addq	$32, %rsp
	movq	-120(%rbp), %rax
	movl	(%rax), %edx
	movl	$1, -56(%rbp)
.L13:
	cmpl	%edx, -56(%rbp)
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L24
	movl	-56(%rbp), %eax
	cltq
	imulq	%rbx, %rax
	leaq	(%r12,%rax), %rcx
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	addq	%rax, %rcx
	movq	-144(%rbp), %rax
	movss	(%rax,%rcx,4), %xmm1
	movl	-56(%rbp), %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	32(%rbp), %rax
	movss	(%rax,%rcx,4), %xmm0
	addss	%xmm1, %xmm0
	movl	-56(%rbp), %eax
	cltq
	imulq	%rbx, %rax
	leaq	(%r12,%rax), %rcx
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	addq	%rax, %rcx
	movss	.LC1(%rip), %xmm1
	divss	%xmm1, %xmm0
	movq	-144(%rbp), %rax
	movss	%xmm0, (%rax,%rcx,4)
	addl	$1, -56(%rbp)
	jmp	.L13
.L24:
	nop
.L11:
	addl	$1, -52(%rbp)
	jmp	.L14
.L22:
	nop
	movl	-60(%rbp), %eax
	testl	%eax, %eax
	jg	.L25
.L21:
	nop
	nop
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	jcek1_, .-jcek1_
	.globl	jcent_
	.type	jcent_, @function
jcent_:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movq	%rcx, -96(%rbp)
	movq	%r8, -104(%rbp)
	movq	%r9, -112(%rbp)
	movq	-72(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %r12
	movl	$0, %r13d
	movq	-88(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	24(%rbp), %rdx
	movl	(%rdx), %edx
	movslq	%edx, %rdx
	movq	%rdx, -48(%rbp)
	movq	%rax, %rdx
	imulq	-48(%rbp), %rdx
	movl	$0, %ecx
	testq	%rdx, %rdx
	cmovs	%rcx, %rdx
	movq	%rdx, %r10
	movl	$0, %r11d
	movq	%rax, %r8
	notq	%r8
	movq	-72(%rbp), %rdx
	movl	(%rdx), %ecx
	movl	$1, -24(%rbp)
.L30:
	cmpl	%ecx, -24(%rbp)
	setg	%dl
	movzbl	%dl, %edx
	testl	%edx, %edx
	jne	.L32
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rsi
	movq	-112(%rbp), %rdx
	pxor	%xmm0, %xmm0
	movss	%xmm0, (%rdx,%rsi,4)
	movq	32(%rbp), %rdx
	movl	(%rdx), %esi
	movl	$1, -20(%rbp)
.L29:
	cmpl	%esi, -20(%rbp)
	setg	%dl
	movzbl	%dl, %edx
	testl	%edx, %edx
	jne	.L33
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rdi
	movq	-112(%rbp), %rdx
	movss	(%rdx,%rdi,4), %xmm1
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rax, %rdx
	leaq	(%r8,%rdx), %rdi
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rdi
	movq	16(%rbp), %rdx
	movss	(%rdx,%rdi,4), %xmm0
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rdi
	addss	%xmm1, %xmm0
	movq	-112(%rbp), %rdx
	movss	%xmm0, (%rdx,%rdi,4)
	addl	$1, -20(%rbp)
	jmp	.L29
.L33:
	nop
	movq	32(%rbp), %rdx
	movl	(%rdx), %edx
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%edx, %xmm0
	movss	%xmm0, -52(%rbp)
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rsi
	movq	-112(%rbp), %rdx
	movss	(%rdx,%rsi,4), %xmm0
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rax, %rdx
	leaq	(%r8,%rdx), %rsi
	movq	-96(%rbp), %rdx
	movl	(%rdx), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rsi
	movq	16(%rbp), %rdx
	movss	(%rdx,%rsi,4), %xmm1
	subss	%xmm1, %xmm0
	movaps	%xmm0, %xmm2
	movss	-52(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	subss	%xmm1, %xmm0
	movaps	%xmm0, %xmm1
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rsi
	divss	%xmm1, %xmm2
	movaps	%xmm2, %xmm0
	movq	-112(%rbp), %rdx
	movss	%xmm0, (%rdx,%rsi,4)
	addl	$1, -24(%rbp)
	jmp	.L30
.L32:
	nop
	nop
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	jcent_, .-jcent_
	.section	.rodata
.LC3:
	.string	"src.f"
	.align 8
.LC4:
	.ascii	"( \" \", //\" ITERATION\", 4X, I5 )"
	.align 8
.LC5:
	.ascii	"( \" \", 15X, \" COORDINATES AT POINT\", I4/8(F8.4, 2X) )"
	.align 8
.LC6:
	.ascii	"( \" \", 20X, \" FUNCTION VALUES\", /8(F10.4, 2X ) )"
	.align 8
.LC7:
	.ascii	"( \" \", 20X, \" CORRECTED POINT\", /8(F8.4, 2X ) )"
	.align 8
.LC8:
	.ascii	"( \" \", \" CENTROID COORDINATES\", 2X, 5(F8.4, 2X) )"
	.text
	.globl	jconsx_
	.type	jconsx_, @function
jconsx_:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$760, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -696(%rbp)
	movq	%rsi, -704(%rbp)
	movq	%rdx, -712(%rbp)
	movq	%rcx, -720(%rbp)
	movq	%r8, -728(%rbp)
	movq	%r9, -736(%rbp)
	movq	-712(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovns	%rax, %rdx
	movq	%rdx, %r12
	movq	104(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -88(%rbp)
	movq	%r12, %rax
	imulq	-88(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, -752(%rbp)
	movq	$0, -744(%rbp)
	movq	%r12, %r13
	notq	%r13
	movq	-704(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -96(%rbp)
	movq	-96(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, -768(%rbp)
	movq	$0, -760(%rbp)
	movq	-704(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, -784(%rbp)
	movq	$0, -776(%rbp)
	movq	-712(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	movq	%rdx, %rbx
	cmovns	%rax, %rbx
	movq	-696(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -120(%rbp)
	movq	%rbx, %rax
	imulq	-120(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, -800(%rbp)
	movq	$0, -792(%rbp)
	movq	%rbx, %rax
	notq	%rax
	movq	%rax, -752(%rbp)
	movq	-696(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -128(%rbp)
	movq	-128(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %r14
	movl	$0, %r15d
	movq	-712(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -136(%rbp)
	movq	-136(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movl	$1, -148(%rbp)
	leaq	.LC3(%rip), %rax
	movq	%rax, -680(%rbp)
	movl	$134, -672(%rbp)
	leaq	.LC4(%rip), %rax
	movq	%rax, -608(%rbp)
	movq	$31, -600(%rbp)
	movl	$4096, -688(%rbp)
	movq	72(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -684(%rbp)
	leaq	-688(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	leaq	-148(%rbp), %rcx
	leaq	-688(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_integer_write@PLT
	leaq	-688(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write_done@PLT
	movl	$0, -156(%rbp)
	movq	-704(%rbp), %rax
	movl	(%rax), %edx
	movq	-696(%rbp), %rax
	movl	(%rax), %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	testl	%eax, %eax
	jle	.L83
	nop
	movl	$1, -156(%rbp)
	jmp	.L35
.L83:
	nop
.L35:
	movq	-712(%rbp), %rax
	movl	(%rax), %ecx
	movl	$2, -144(%rbp)
.L39:
	movl	-144(%rbp), %eax
	cmpl	%eax, %ecx
	setl	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L84
	movq	-696(%rbp), %rax
	movl	(%rax), %edx
	movl	$1, -56(%rbp)
.L38:
	cmpl	%edx, -56(%rbp)
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L85
	movl	-56(%rbp), %eax
	cltq
	imulq	%r12, %rax
	leaq	0(%r13,%rax), %rsi
	movl	-144(%rbp), %eax
	cltq
	addq	%rax, %rsi
	movq	32(%rbp), %rax
	pxor	%xmm0, %xmm0
	movss	%xmm0, (%rax,%rsi,4)
	addl	$1, -56(%rbp)
	jmp	.L38
.L85:
	nop
	movl	-144(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -144(%rbp)
	jmp	.L39
.L84:
	nop
	movq	-712(%rbp), %rax
	movl	(%rax), %r15d
	movl	$2, -144(%rbp)
.L46:
	movl	-144(%rbp), %eax
	cmpl	%eax, %r15d
	setl	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L86
	movq	-696(%rbp), %rax
	movl	(%rax), %r14d
	movl	$1, -56(%rbp)
.L42:
	cmpl	%r14d, -56(%rbp)
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L87
	movl	-144(%rbp), %edx
	movq	56(%rbp), %rax
	movl	%edx, (%rax)
	movq	88(%rbp), %r8
	movq	80(%rbp), %rdi
	movq	32(%rbp), %rcx
	movq	-712(%rbp), %rdx
	movq	-704(%rbp), %rsi
	movq	-696(%rbp), %rax
	pushq	104(%rbp)
	pushq	56(%rbp)
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	jcnst1_@PLT
	addq	$16, %rsp
	movl	-56(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	80(%rbp), %rax
	movss	(%rax,%rdx,4), %xmm1
	movl	-56(%rbp), %eax
	cltq
	imulq	%rbx, %rax
	movq	-752(%rbp), %rsi
	leaq	(%rsi,%rax), %rdx
	movl	-144(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movq	40(%rbp), %rax
	movss	(%rax,%rdx,4), %xmm2
	movl	-56(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	88(%rbp), %rax
	movss	(%rax,%rdx,4), %xmm0
	movl	-56(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	80(%rbp), %rax
	movss	(%rax,%rdx,4), %xmm3
	subss	%xmm3, %xmm0
	mulss	%xmm2, %xmm0
	movl	-56(%rbp), %eax
	cltq
	imulq	%r12, %rax
	leaq	0(%r13,%rax), %rdx
	movl	-144(%rbp), %eax
	cltq
	addq	%rax, %rdx
	addss	%xmm1, %xmm0
	movq	32(%rbp), %rax
	movss	%xmm0, (%rax,%rdx,4)
	addl	$1, -56(%rbp)
	jmp	.L42
.L87:
	nop
	movl	-144(%rbp), %eax
	movl	%eax, -152(%rbp)
	movq	88(%rbp), %r9
	movq	80(%rbp), %r8
	movq	32(%rbp), %rcx
	movq	-712(%rbp), %rdx
	movq	-704(%rbp), %rsi
	movq	-696(%rbp), %rax
	leaq	-152(%rbp), %rdi
	pushq	%rdi
	pushq	104(%rbp)
	pushq	24(%rbp)
	pushq	96(%rbp)
	leaq	-156(%rbp), %rdi
	pushq	%rdi
	pushq	56(%rbp)
	movq	%rax, %rdi
	call	jcek1_
	addq	$48, %rsp
	leaq	.LC3(%rip), %rax
	movq	%rax, -680(%rbp)
	movl	$156, -672(%rbp)
	leaq	.LC5(%rip), %rax
	movq	%rax, -608(%rbp)
	movq	$53, -600(%rbp)
	movl	$4096, -688(%rbp)
	movq	72(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -684(%rbp)
	leaq	-688(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	leaq	-144(%rbp), %rcx
	leaq	-688(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_integer_write@PLT
	movq	-696(%rbp), %rax
	movl	(%rax), %r14d
	movl	$1, -56(%rbp)
.L45:
	movl	-688(%rbp), %eax
	andl	$3, %eax
	andl	$1, %eax
	testb	%al, %al
	jne	.L88
	cmpl	%r14d, -56(%rbp)
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L89
	movl	-56(%rbp), %eax
	cltq
	imulq	%r12, %rax
	leaq	0(%r13,%rax), %rdx
	movl	-144(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movq	32(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	leaq	-688(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_real_write@PLT
	addl	$1, -56(%rbp)
	jmp	.L45
.L88:
	nop
	jmp	.L44
.L89:
	nop
.L44:
	leaq	-688(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write_done@PLT
	movl	-144(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -144(%rbp)
	jmp	.L46
.L86:
	nop
	movq	-712(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -152(%rbp)
	movq	-712(%rbp), %rax
	movl	(%rax), %ebx
	movq	56(%rbp), %rax
	movl	$1, (%rax)
.L48:
	movq	56(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %ebx
	setl	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L90
	movq	56(%rbp), %r8
	movq	48(%rbp), %rdi
	movq	32(%rbp), %rcx
	movq	-712(%rbp), %rdx
	movq	-704(%rbp), %rsi
	movq	-696(%rbp), %rax
	subq	$8, %rsp
	pushq	104(%rbp)
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	jfunc_@PLT
	addq	$16, %rsp
	movq	56(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	56(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L48
.L90:
	nop
	movl	$1, -68(%rbp)
	leaq	.LC3(%rip), %rax
	movq	%rax, -680(%rbp)
	movl	$169, -672(%rbp)
	leaq	.LC6(%rip), %rax
	movq	%rax, -608(%rbp)
	movq	$48, -600(%rbp)
	movl	$4096, -688(%rbp)
	movq	72(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -684(%rbp)
	leaq	-688(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	movq	-712(%rbp), %rax
	movl	(%rax), %ebx
	movq	56(%rbp), %rax
	movl	$1, (%rax)
.L51:
	movl	-688(%rbp), %eax
	andl	$3, %eax
	andl	$1, %eax
	testb	%al, %al
	jne	.L91
	movq	56(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %ebx
	setl	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L92
	movq	56(%rbp), %rax
	movl	(%rax), %eax
	cltq
	subq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	48(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	leaq	-688(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_real_write@PLT
	movq	56(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	56(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L51
.L91:
	nop
	jmp	.L50
.L92:
	nop
.L50:
	leaq	-688(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write_done@PLT
.L80:
	movl	$1, -140(%rbp)
	movq	-712(%rbp), %rax
	movl	(%rax), %eax
	movl	$2, -52(%rbp)
.L54:
	cmpl	%eax, -52(%rbp)
	setg	%dl
	movzbl	%dl, %edx
	testl	%edx, %edx
	jne	.L93
	movl	-140(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rcx
	movq	48(%rbp), %rdx
	movss	(%rdx,%rcx,4), %xmm0
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rcx
	movq	48(%rbp), %rdx
	movss	(%rdx,%rcx,4), %xmm2
	movaps	%xmm0, %xmm1
	subss	%xmm2, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	jnb	.L94
	nop
	movl	-52(%rbp), %edx
	movl	%edx, -140(%rbp)
	jmp	.L53
.L94:
	nop
.L53:
	addl	$1, -52(%rbp)
	jmp	.L54
.L93:
	nop
	movq	64(%rbp), %rax
	movl	$1, (%rax)
	movq	-712(%rbp), %rax
	movl	(%rax), %eax
	movl	$2, -52(%rbp)
.L58:
	cmpl	%eax, -52(%rbp)
	setg	%dl
	movzbl	%dl, %edx
	testl	%edx, %edx
	jne	.L95
	movq	64(%rbp), %rdx
	movl	(%rdx), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rcx
	movq	48(%rbp), %rdx
	movss	(%rdx,%rcx,4), %xmm0
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rcx
	movq	48(%rbp), %rdx
	movss	(%rdx,%rcx,4), %xmm2
	movaps	%xmm0, %xmm1
	subss	%xmm2, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	jb	.L56
	nop
	movq	64(%rbp), %rdx
	movl	-52(%rbp), %ecx
	movl	%ecx, (%rdx)
.L56:
	addl	$1, -52(%rbp)
	jmp	.L58
.L95:
	nop
	movq	64(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	48(%rbp), %rax
	movss	(%rax,%rdx,4), %xmm0
	movl	-140(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	48(%rbp), %rax
	movss	(%rax,%rdx,4), %xmm2
	movq	-736(%rbp), %rax
	movss	(%rax), %xmm1
	addss	%xmm2, %xmm1
	movaps	%xmm1, %xmm2
	movaps	%xmm0, %xmm1
	subss	%xmm2, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	ja	.L96
	nop
	movl	$1, -68(%rbp)
	jmp	.L60
.L96:
	nop
	addl	$1, -68(%rbp)
	movq	16(%rbp), %rax
	movl	(%rax), %edx
	movl	-68(%rbp), %eax
	subl	%edx, %eax
	testl	%eax, %eax
	jns	.L97
	nop
.L60:
	movq	96(%rbp), %r9
	movq	56(%rbp), %r8
	leaq	-140(%rbp), %rcx
	movq	-712(%rbp), %rdx
	movq	-704(%rbp), %rsi
	movq	-696(%rbp), %rax
	subq	$8, %rsp
	leaq	-152(%rbp), %rdi
	pushq	%rdi
	pushq	104(%rbp)
	pushq	32(%rbp)
	movq	%rax, %rdi
	call	jcent_
	addq	$32, %rsp
	movq	-696(%rbp), %rax
	movl	(%rax), %edx
	movl	$1, -56(%rbp)
.L63:
	cmpl	%edx, -56(%rbp)
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L98
	movq	-728(%rbp), %rax
	movss	(%rax), %xmm1
	movss	.LC2(%rip), %xmm0
	addss	%xmm1, %xmm0
	movaps	%xmm0, %xmm1
	movl	-56(%rbp), %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	96(%rbp), %rax
	movss	(%rax,%rcx,4), %xmm0
	mulss	%xmm1, %xmm0
	movq	-728(%rbp), %rax
	movss	(%rax), %xmm1
	movl	-56(%rbp), %eax
	cltq
	imulq	%r12, %rax
	leaq	0(%r13,%rax), %rcx
	movl	-140(%rbp), %eax
	cltq
	addq	%rax, %rcx
	movq	32(%rbp), %rax
	movss	(%rax,%rcx,4), %xmm2
	mulss	%xmm2, %xmm1
	movl	-56(%rbp), %eax
	cltq
	imulq	%r12, %rax
	leaq	0(%r13,%rax), %rcx
	movl	-140(%rbp), %eax
	cltq
	addq	%rax, %rcx
	subss	%xmm1, %xmm0
	movq	32(%rbp), %rax
	movss	%xmm0, (%rax,%rcx,4)
	addl	$1, -56(%rbp)
	jmp	.L63
.L98:
	nop
	movl	-140(%rbp), %edx
	movq	56(%rbp), %rax
	movl	%edx, (%rax)
	movq	88(%rbp), %r9
	movq	80(%rbp), %r8
	movq	32(%rbp), %rcx
	movq	-712(%rbp), %rdx
	movq	-704(%rbp), %rsi
	movq	-696(%rbp), %rax
	leaq	-152(%rbp), %rdi
	pushq	%rdi
	pushq	104(%rbp)
	pushq	24(%rbp)
	pushq	96(%rbp)
	leaq	-156(%rbp), %rdi
	pushq	%rdi
	pushq	56(%rbp)
	movq	%rax, %rdi
	call	jcek1_
	addq	$48, %rsp
	movq	56(%rbp), %r8
	movq	48(%rbp), %rdi
	movq	32(%rbp), %rcx
	movq	-712(%rbp), %rdx
	movq	-704(%rbp), %rsi
	movq	-696(%rbp), %rax
	subq	$8, %rsp
	pushq	104(%rbp)
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	jfunc_@PLT
	addq	$16, %rsp
.L70:
	movq	64(%rbp), %rax
	movl	$1, (%rax)
	movq	-712(%rbp), %rax
	movl	(%rax), %eax
	movl	$2, -52(%rbp)
.L66:
	cmpl	%eax, -52(%rbp)
	setg	%dl
	movzbl	%dl, %edx
	testl	%edx, %edx
	jne	.L99
	movq	64(%rbp), %rdx
	movl	(%rdx), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rcx
	movq	48(%rbp), %rdx
	movss	(%rdx,%rcx,4), %xmm0
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rcx
	movq	48(%rbp), %rdx
	movss	(%rdx,%rcx,4), %xmm2
	movaps	%xmm0, %xmm1
	subss	%xmm2, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	jnb	.L100
	nop
	movq	64(%rbp), %rdx
	movl	-52(%rbp), %ecx
	movl	%ecx, (%rdx)
	jmp	.L65
.L100:
	nop
.L65:
	addl	$1, -52(%rbp)
	jmp	.L66
.L99:
	nop
	movq	64(%rbp), %rax
	movl	(%rax), %eax
	movl	-140(%rbp), %edx
	subl	%edx, %eax
	testl	%eax, %eax
	jne	.L101
	nop
	movq	-696(%rbp), %rax
	movl	(%rax), %edx
	movl	$1, -64(%rbp)
.L69:
	cmpl	%edx, -64(%rbp)
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L102
	movl	-64(%rbp), %eax
	cltq
	imulq	%r12, %rax
	leaq	0(%r13,%rax), %rcx
	movl	-140(%rbp), %eax
	cltq
	addq	%rax, %rcx
	movq	32(%rbp), %rax
	movss	(%rax,%rcx,4), %xmm1
	movl	-64(%rbp), %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	96(%rbp), %rax
	movss	(%rax,%rcx,4), %xmm0
	addss	%xmm1, %xmm0
	movl	-64(%rbp), %eax
	cltq
	imulq	%r12, %rax
	leaq	0(%r13,%rax), %rcx
	movl	-140(%rbp), %eax
	cltq
	addq	%rax, %rcx
	movss	.LC1(%rip), %xmm1
	divss	%xmm1, %xmm0
	movq	32(%rbp), %rax
	movss	%xmm0, (%rax,%rcx,4)
	addl	$1, -64(%rbp)
	jmp	.L69
.L102:
	nop
	movl	-140(%rbp), %edx
	movq	56(%rbp), %rax
	movl	%edx, (%rax)
	movq	88(%rbp), %r9
	movq	80(%rbp), %r8
	movq	32(%rbp), %rcx
	movq	-712(%rbp), %rdx
	movq	-704(%rbp), %rsi
	movq	-696(%rbp), %rax
	leaq	-152(%rbp), %rdi
	pushq	%rdi
	pushq	104(%rbp)
	pushq	24(%rbp)
	pushq	96(%rbp)
	leaq	-156(%rbp), %rdi
	pushq	%rdi
	pushq	56(%rbp)
	movq	%rax, %rdi
	call	jcek1_
	addq	$48, %rsp
	movq	56(%rbp), %r8
	movq	48(%rbp), %rdi
	movq	32(%rbp), %rcx
	movq	-712(%rbp), %rdx
	movq	-704(%rbp), %rsi
	movq	-696(%rbp), %rax
	subq	$8, %rsp
	pushq	104(%rbp)
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	jfunc_@PLT
	addq	$16, %rsp
	jmp	.L70
.L101:
	nop
	leaq	.LC3(%rip), %rax
	movq	%rax, -680(%rbp)
	movl	$228, -672(%rbp)
	leaq	.LC7(%rip), %rax
	movq	%rax, -608(%rbp)
	movq	$47, -600(%rbp)
	movl	$4096, -688(%rbp)
	movq	72(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -684(%rbp)
	leaq	-688(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	movq	-696(%rbp), %rax
	movl	(%rax), %ebx
	movl	$1, -60(%rbp)
.L73:
	movl	-688(%rbp), %eax
	andl	$3, %eax
	andl	$1, %eax
	testb	%al, %al
	jne	.L103
	cmpl	%ebx, -60(%rbp)
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L104
	movl	-60(%rbp), %eax
	cltq
	imulq	%r12, %rax
	leaq	0(%r13,%rax), %rdx
	movl	-140(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movq	32(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	leaq	-688(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_real_write@PLT
	addl	$1, -60(%rbp)
	jmp	.L73
.L103:
	nop
	jmp	.L72
.L104:
	nop
.L72:
	leaq	-688(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write_done@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, -680(%rbp)
	movl	$229, -672(%rbp)
	leaq	.LC6(%rip), %rax
	movq	%rax, -608(%rbp)
	movq	$48, -600(%rbp)
	movl	$4096, -688(%rbp)
	movq	72(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -684(%rbp)
	leaq	-688(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	movq	-712(%rbp), %rax
	movl	(%rax), %ebx
	movq	56(%rbp), %rax
	movl	$1, (%rax)
.L76:
	movl	-688(%rbp), %eax
	andl	$3, %eax
	andl	$1, %eax
	testb	%al, %al
	jne	.L105
	movq	56(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %ebx
	setl	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L106
	movq	56(%rbp), %rax
	movl	(%rax), %eax
	cltq
	subq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	48(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	leaq	-688(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_real_write@PLT
	movq	56(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	56(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L76
.L105:
	nop
	jmp	.L75
.L106:
	nop
.L75:
	leaq	-688(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write_done@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, -680(%rbp)
	movl	$230, -672(%rbp)
	leaq	.LC8(%rip), %rax
	movq	%rax, -608(%rbp)
	movq	$49, -600(%rbp)
	movl	$4096, -688(%rbp)
	movq	72(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -684(%rbp)
	leaq	-688(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	movq	-696(%rbp), %rax
	movl	(%rax), %ebx
	movl	$1, -56(%rbp)
.L79:
	movl	-688(%rbp), %eax
	andl	$3, %eax
	andl	$1, %eax
	testb	%al, %al
	jne	.L107
	cmpl	%ebx, -56(%rbp)
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L108
	movl	-56(%rbp), %eax
	cltq
	subq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	96(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	leaq	-688(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_real_write@PLT
	addl	$1, -56(%rbp)
	jmp	.L79
.L107:
	nop
	jmp	.L78
.L108:
	nop
.L78:
	leaq	-688(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write_done@PLT
	movl	-148(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -148(%rbp)
	movl	-148(%rbp), %edx
	movq	-720(%rbp), %rax
	movl	(%rax), %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	testl	%eax, %eax
	jg	.L97
	nop
	leaq	.LC3(%rip), %rax
	movq	%rax, -680(%rbp)
	movl	$235, -672(%rbp)
	leaq	.LC4(%rip), %rax
	movq	%rax, -608(%rbp)
	movq	$31, -600(%rbp)
	movl	$4096, -688(%rbp)
	movq	72(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -684(%rbp)
	leaq	-688(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	leaq	-148(%rbp), %rcx
	leaq	-688(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_integer_write@PLT
	leaq	-688(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write_done@PLT
	jmp	.L80
.L97:
	nop
	nop
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	jconsx_, .-jconsx_
	.section	.rodata
	.align 4
.LC1:
	.long	1073741824
	.align 4
.LC2:
	.long	1065353216
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
