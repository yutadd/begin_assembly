.text
.globl main
main:
    push	%rbp
	mov	%rsp, %rbp # movlのように、サイズを指定していないため、コンパイル時にワーニングが出る。
	sub	$16, %rsp
	mov	$0, -4(%rbp)
	jmp	L2
L3:
    /*leaq	message(%rip), %rax
	mov	%rax, %rdi
	call	puts@PLT*/
	add	$1, -4(%rbp)
    # ここで呼び出し元に戻ったりせず、そのまま下の行が実行される。
L2:
	cmp	$50000000, -4(%rbp)
	jle	L3
        # exit(0)
    mov     $0x3c, %rax               # set operation code 0x3c
    xor     %rdi, %rdi              # set 0 to rdi
    syscall                         # execute exit
.data
message:    .asciz "hello"