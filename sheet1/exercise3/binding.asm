; tell the assembler this is 64-bit code
BITS 64

; declare the name of the function to be called
extern foo_system_v

; make the function globally visible:
global foo_ms_abi

foo_ms_abi:
	push rbp
	mov rbp, rsp
	
	; preserve used registers
	push rdi
	push rsi
	
	; map params to registers and stack
	mov rax, [rbp+0x48]
	push rax
	mov rax, [rbp+0x40]
	push rax
	
	mov rdi, rcx
	mov rsi, rdx
	mov rdx, r8
	mov rcx, r9
	
	mov r9, [rbp+0x38]
	mov r8, [rbp+0x30]
	
	call foo_system_v
	
	; restore preserved registers
	add rsp, 0x10
	pop rsi
	pop rdi
	
	leave
	ret
	
