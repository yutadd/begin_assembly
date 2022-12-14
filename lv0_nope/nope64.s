.globl main
main:
    mov $0x3c, %rax /* 0x3c=60 */
    mov $0, %rdi 
    syscall
