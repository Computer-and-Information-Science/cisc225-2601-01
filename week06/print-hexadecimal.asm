; Print hexadecimal value of a quadword
; Northampton Community College
; CISC 225, Computer Organization

global _start		; exposes program entry point to the linker

section .text		; start of code segment

_start:

	; Move number to RAX 
	mov rax,[number]			; Will work with this in RAX 
	mov rdi,number_str			; Address of output string 
	mov rcx,16					; Set up loop counter 
L1:
	rol rax,4					; Rotate high-order nubble to low-order nubble 
	mov bl,al 					; Copy low-order byte 
	and bl,0xf 					; Mask out high-order nibble	

	; Determine character to be written to output string 
	cmp bl,10					; Compare to 10 (0-9 or A-F)
	jge L2
	; Handle '0' through '9'
	mov byte[rdi],'0'			; '0' to buffer as base ASCII value
	add byte[rdi],bl			; Add nibble to get correct character
	jmp L3
L2:	; Handle 'A' through 'F'
	mov byte[rdi],'A'			; 'A' to buffer as base ASCII value
	add byte[rdi],bl			; Add value in BL (will be 10 or more)
	sub byte[rdi],10			; Subtract to get correct character
L3:	; Next character
	inc rdi						; Advance address to next output character
	loop L1

	; Newline character at end of string 
	mov byte[rdi],0xa			; Newline character

	; Write ASCII of num to the console
	mov		rax, 1					      ; system call for write
	mov		rdi, 1			      		; file handle, stdout
	mov		rsi, number_str  			; address of string to output
	mov		rdx, number_str_len		; number of bytes to output
	syscall					        		; invoke operating system call

	; End the program
	mov		rax, 0x3c				; system call for exit
	xor		rdi, rdi				; exit code 0
	syscall							; invoke operating system call

section .data		; start of initialized data segment

	number dq 2764921

section .bss		; start of uninitialized data segment

	number_str_len equ 21
	number_str resb number_str_len ; output string, 20 digits plus newline
