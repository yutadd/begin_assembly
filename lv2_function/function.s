.text
.globl main
plus: # rsi + rdi → rax
    push    %rbp
    mov     %rsp,%rbp
    mov     %rdi,%rax # rax=5
    add     %rsi,%rax # rax=rax+2
    pop     %rbp
    ret
print:

main:
    push    %rbp
    mov     %rsp,%rbp
    # call plus
    mov     $2,%rsi # 引数2
    mov     $5,%rdi # 引数1
    call    plus
    # call printf
    mov     %rax,%rsi # set arg
    lea     format(%rip),%rax # load format
    mov     %rax,%rdi # setformat
    mov     $0,%rax
    call    printf
    # exit(0)
    mov     $0x3c, %rax
    xor     %rdi, %rdi
    syscall
.data
format: .asciz "%d\n"

