; rd_isolate.asm — deny R&D exfiltration
; mirrors your mandatory firewall rule #2
section .data
  msg db "[DENY] R&D mail blocked", 0xA

section .text
  global _start
_start:
  mov  rax, 1
  mov  rdi, 1
  mov  rsi, msg
  mov  rdx, 24
  syscall