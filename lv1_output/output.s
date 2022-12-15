.text
.globl main
main:
        mov     $1, %rax        # syscall(write)
        mov     $1, %rdi        # to stdout
        mov     $message, %rsi  # msg addr
        mov     $len, %rdx       # regist length
        syscall                 # execute   write

        # exit(0)
        mov     $0x3c, %rax               # set operation code 0x3c
        xor     %rdi, %rdi              # set 0 to rdi
        syscall                         # execute exit
.data
message:    .ascii  "Hello, world\n"
msgend:     .equ    len, msgend - message # PIE objectとなるためコンパイル時にはgcc と ldを別々に行う必要がある。