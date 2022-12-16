.text
.globl main
plus:
    push    %rbp
    mov     %rsp,%rbp
    mov     %rdi,-20(%rbp)
    mov     %rsi,-24(%rbp)
    mov     -24(%rbp),%rdx
    mov     -24(%rbp),%rax
    add     %rdx,%rax
    mov     %rax,-4(%rbp)
    pop     %rbp
    ret
print:

main:
    push    %rbp
    mov     %rsp,%rbp
    sub     $16,%rsp
    mov     $2,%rsi # 引数2
    mov     $5,%rdi # 引数1
    call    plus
    mov     %rax,-4(%rbp) # 結果の取得 error segment fault
    mov     %rax,%rsi
    lea     format(%rip),%rax
    mov     %rax,%rdi
    mov     $0,%rax
    call    printf
    mov     $0,%rax
    # exit(0)
    mov     $0x3c, %rax
    xor     %rdi, %rdi
    syscall
.data
format: .asciz "%d\n"

