	.file	"matrix_opt.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	init_matrices
	.type	init_matrices, @function
init_matrices:
.LFB39:
	.cfi_startproc
	endbr64
	vmovdqa	ymm3, YMMWORD PTR .LC0[rip]
	vbroadcastss	ymm2, DWORD PTR .LC5[rip]
	mov	rcx, rdx
	mov	edx, 8
	vmovd	xmm8, edx
	mov	edx, 1374389535
	lea	rax, 4194304[rdi]
	vmovd	xmm6, edx
	mov	edx, 100
	vpbroadcastd	ymm8, xmm8
	vmovd	xmm7, edx
	vpbroadcastd	ymm6, xmm6
	vpbroadcastd	ymm7, xmm7
	vmovdqa	ymm5, ymm3
	.p2align 4
	.p2align 3
.L2:
	vmovdqa	ymm0, ymm5
	add	rdi, 32
	vpaddd	ymm5, ymm5, ymm8
	vpmuldq	ymm1, ymm0, ymm6
	vpsrlq	ymm4, ymm0, 32
	vpmuldq	ymm4, ymm4, ymm6
	vpshufd	ymm1, ymm1, 245
	vpblendd	ymm1, ymm1, ymm4, 170
	vpsrad	ymm1, ymm1, 5
	vpmulld	ymm1, ymm1, ymm7
	vpsubd	ymm0, ymm0, ymm1
	vcvtdq2ps	ymm0, ymm0
	vdivps	ymm0, ymm0, ymm2
	vmovups	YMMWORD PTR -32[rdi], ymm0
	cmp	rdi, rax
	jne	.L2
	mov	edx, 8
	lea	rax, 4194304[rsi]
	vmovd	xmm7, edx
	mov	edx, 5
	vmovd	xmm6, edx
	mov	edx, 1374389535
	vpbroadcastd	ymm7, xmm7
	vmovd	xmm4, edx
	mov	edx, 100
	vpbroadcastd	ymm6, xmm6
	vmovd	xmm5, edx
	vpbroadcastd	ymm4, xmm4
	vpbroadcastd	ymm5, xmm5
	.p2align 4
	.p2align 3
.L3:
	vmovdqa	ymm0, ymm3
	add	rsi, 32
	vpaddd	ymm3, ymm3, ymm7
	vpaddd	ymm0, ymm0, ymm6
	vpmuldq	ymm1, ymm0, ymm4
	vpsrlq	ymm8, ymm0, 32
	vpmuldq	ymm8, ymm8, ymm4
	vpshufd	ymm1, ymm1, 245
	vpblendd	ymm1, ymm1, ymm8, 170
	vpsrad	ymm1, ymm1, 5
	vpmulld	ymm1, ymm1, ymm5
	vpsubd	ymm0, ymm0, ymm1
	vcvtdq2ps	ymm0, ymm0
	vdivps	ymm0, ymm0, ymm2
	vmovups	YMMWORD PTR -32[rsi], ymm0
	cmp	rax, rsi
	jne	.L3
	mov	edx, 4194304
	xor	esi, esi
	mov	rdi, rcx
	vzeroupper
	jmp	memset@PLT
	.cfi_endproc
.LFE39:
	.size	init_matrices, .-init_matrices
	.p2align 4
	.globl	multiply_matrices
	.type	multiply_matrices, @function
multiply_matrices:
.LFB40:
	.cfi_startproc
	endbr64
	mov	r10, rsi
	mov	r9, rdi
	xor	r11d, r11d
	lea	r8, 4194304[rsi]
.L8:
	mov	rcx, r10
	mov	rdi, r9
.L13:
	vbroadcastss	ymm2, DWORD PTR [rdi]
	vbroadcastss	ymm1, DWORD PTR 4[rdi]
	lea	rsi, 4096[rcx]
	xor	eax, eax
	.p2align 4
	.p2align 3
.L10:
	vmovups	ymm0, YMMWORD PTR [rcx+rax]
	vfmadd213ps	ymm0, ymm2, YMMWORD PTR [rdx+rax]
	vfmadd231ps	ymm0, ymm1, YMMWORD PTR [rsi+rax]
	vmovups	YMMWORD PTR [rdx+rax], ymm0
	add	rax, 32
	cmp	rax, 4096
	jne	.L10
	add	rcx, 8192
	add	rdi, 8
	cmp	r8, rcx
	jne	.L13
	add	r11, 1024
	add	rdx, 4096
	add	r9, 4096
	cmp	r11, 1048576
	jne	.L8
	vzeroupper
	ret
	.cfi_endproc
.LFE40:
	.size	multiply_matrices, .-multiply_matrices
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC7:
	.string	"Result check: %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	endbr64
	lea	r10, 8[rsp]
	.cfi_def_cfa 10, 0
	and	rsp, -32
	mov	edi, 4194304
	push	QWORD PTR -8[r10]
	push	rbp
	mov	rbp, rsp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	push	r13
	push	r12
	push	r10
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xd,0x2,0x76,0x78
	.cfi_escape 0x10,0xc,0x2,0x76,0x70
	push	rbx
	sub	rsp, 16
	.cfi_escape 0x10,0x3,0x2,0x76,0x60
	call	malloc@PLT
	mov	edi, 4194304
	mov	r13, rax
	call	malloc@PLT
	mov	esi, 1
	mov	edi, 4194304
	mov	r12, rax
	call	calloc@PLT
	test	r13, r13
	mov	rbx, rax
	sete	al
	test	r12, r12
	sete	dl
	or	al, dl
	jne	.L21
	test	rbx, rbx
	je	.L21
	vmovdqa	ymm3, YMMWORD PTR .LC0[rip]
	vbroadcastss	ymm2, DWORD PTR .LC5[rip]
	mov	ecx, 8
	mov	rax, r13
	vmovd	xmm8, ecx
	mov	ecx, 1374389535
	lea	rdx, 4194304[r13]
	vmovd	xmm6, ecx
	mov	ecx, 100
	vpbroadcastd	ymm8, xmm8
	vmovd	xmm7, ecx
	vpbroadcastd	ymm6, xmm6
	vpbroadcastd	ymm7, xmm7
	vmovdqa	ymm5, ymm3
	.p2align 4
	.p2align 3
.L19:
	vmovdqa	ymm0, ymm5
	add	rax, 32
	vpaddd	ymm5, ymm5, ymm8
	vpmuldq	ymm1, ymm0, ymm6
	vpsrlq	ymm4, ymm0, 32
	vpmuldq	ymm4, ymm4, ymm6
	vpshufd	ymm1, ymm1, 245
	vpblendd	ymm1, ymm1, ymm4, 170
	vpsrad	ymm1, ymm1, 5
	vpmulld	ymm1, ymm1, ymm7
	vpsubd	ymm0, ymm0, ymm1
	vcvtdq2ps	ymm0, ymm0
	vdivps	ymm0, ymm0, ymm2
	vmovups	YMMWORD PTR -32[rax], ymm0
	cmp	rax, rdx
	jne	.L19
	mov	ecx, 8
	mov	rax, r12
	lea	rdx, 4194304[r12]
	vmovd	xmm7, ecx
	mov	ecx, 5
	vmovd	xmm6, ecx
	mov	ecx, 1374389535
	vpbroadcastd	ymm7, xmm7
	vmovd	xmm4, ecx
	mov	ecx, 100
	vpbroadcastd	ymm6, xmm6
	vmovd	xmm5, ecx
	vpbroadcastd	ymm4, xmm4
	vpbroadcastd	ymm5, xmm5
	.p2align 4
	.p2align 3
.L20:
	vmovdqa	ymm0, ymm3
	add	rax, 32
	vpaddd	ymm3, ymm3, ymm7
	vpaddd	ymm0, ymm0, ymm6
	vpmuldq	ymm1, ymm0, ymm4
	vpsrlq	ymm8, ymm0, 32
	vpmuldq	ymm8, ymm8, ymm4
	vpshufd	ymm1, ymm1, 245
	vpblendd	ymm1, ymm1, ymm8, 170
	vpsrad	ymm1, ymm1, 5
	vpmulld	ymm1, ymm1, ymm5
	vpsubd	ymm0, ymm0, ymm1
	vcvtdq2ps	ymm0, ymm0
	vdivps	ymm0, ymm0, ymm2
	vmovups	YMMWORD PTR -32[rax], ymm0
	cmp	rdx, rax
	jne	.L20
	mov	rdx, rbx
	mov	rsi, r12
	mov	rdi, r13
	vzeroupper
	call	multiply_matrices
	vxorps	xmm0, xmm0, xmm0
	lea	rsi, .LC7[rip]
	mov	edi, 2
	vcvtss2sd	xmm0, xmm0, DWORD PTR [rbx]
	mov	eax, 1
	call	__printf_chk@PLT
	mov	rdi, r13
	call	free@PLT
	mov	rdi, r12
	call	free@PLT
	mov	rdi, rbx
	call	free@PLT
	xor	eax, eax
.L17:
	add	rsp, 16
	pop	rbx
	pop	r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	pop	r12
	pop	r13
	pop	rbp
	lea	rsp, -8[r10]
	.cfi_def_cfa 7, 8
	ret
.L21:
	.cfi_restore_state
	mov	eax, 1
	jmp	.L17
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC5:
	.long	1092616192
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
