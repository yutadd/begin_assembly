.globl main
main: # _startだとリンカエラーになる。
        push %rbp

        mov %rsp,%rbp
        lea message(%rip),%rax
        mov %rax,%rdi
        call puts

        pop %rbp
        # exit(0)
        mov     $0x3c, %rax
        xor     %rdi, %rdi
        syscall
message:    .asciz "hello"