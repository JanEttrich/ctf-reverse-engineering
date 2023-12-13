bits 64
global f


f:
  push rbp
  mov rbp, rsp
  mov rsi, rdi

.l0:
  mov al, [rsi]
  cmp al, 0
  je .l1
  inc rsi
  jmp .l0

.l1:
  dec rsi


.l2:
  cmp rdi, rsi
  jge .l3
  mov al, [rdi]
  mov cl, [rsi]
  cmp al, cl
  jne .l4
  inc rdi
  dec rsi
  jmp .l2

.l3:
  mov rax, 1
  leave
  ret

.l4:
  mov rax, 0
  leave
  ret
