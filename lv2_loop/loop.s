.text
.globl main
main:
    pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
    leaq	message(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	addl	$1, -4(%rbp)
.L2:
	cmpl	$9, -4(%rbp)
	jle	.L3
        # exit(0)
    mov     $0x3c, %rax               # set operation code 0x3c
    xor     %rdi, %rdi              # set 0 to rdi
    syscall                         # execute exit
.data
message:    .asciz "hello"

/*	leaq	message(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
    */