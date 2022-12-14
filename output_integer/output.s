.text
.global main
main:
  push %rbx
  lea  format(%rip), %rdi
  mov  $1234, %rsi           # Writing to ESI zero extends to RSI.
  xor %rax, %rax          # Zeroing EAX is efficient way to clear AL.
  call printf
  pop %rbx
# exit(0)
  mov     $0x3c, %rax               # set operation code 0x3c
  xor     %rdi, %rdi              # set 0 to rdi
  syscall                         # execute exit
.data
format: .asciz "%d\n"
# from https://stackoverflow.com/questions/38335212/calling-printf-in-x86-64-using-gnu-assembler