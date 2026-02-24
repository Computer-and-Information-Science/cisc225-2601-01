; Northampton Community College
; CISC 225, Computer Organization
; Exercise: Find absolute value of x-y

global _start           ; expose program entry point

section .text           ; start of code segment

_start:

	; Calculate x-y
	mov rax,[x]				; Get value of x 
	sub rax,[y]				; Calculate x-y

	; Change sign of difference, if negative
	cmp rax,0				; Compare to see if negative 
	jge L1					; Jump if no need to change the sign
	neg rax 				; Set RAX to positive (absolute value) 
L1:

	; Save the result
	mov [abs1],rax 			; Save absolute value to memory 

    ; End the program
    mov rax,0x3c            ; system call for exit 
    xor rdi,rdi             ; exit code 0
    syscall                 ; invoke operating system call 

section .data           ; start of initialized data segment

    x dq 7
    y dq 3

section .bss            ; start of uninitialized data segment 

    abs1 resq 1
