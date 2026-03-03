; Sum integers from 1 through N using formula

global _start           ; expose program entry point

section .text           ; start of code segment

N equ 3 ; Calculate sum of 1 through N, leave result in RAX

_start:

	mov rax,N
	inc rax				; N + 1
	mov rbx,N			; N
	mul rbx				; N * (N + 1) -> RAX 

	mov rbx,2			; for division
	mov rdx,0			; set up for division
	div rbx


    ; End the program
    mov rax,0x3c            ; system call for exit 
    xor rdi,rdi             ; exit code 0
    syscall                 ; invoke operating system call 

section .data           ; start of initialized data segment

section .bss            ; start of uninitialized data segment 
