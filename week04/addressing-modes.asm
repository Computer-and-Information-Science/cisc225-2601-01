global _start		; exposes program entry point to the linker

section .text		; start of code segment

_start:

	;mov rax,array1 
	;mov rbx,[array1]
	;mov rcx,[array1+8]
	;mov rdx,[array1+16]

	;mov rax,array1
	;mov rbx,[rax]
	;add rax,8
	;mov rcx,[rax]
	;add rax,8
	;mov rdx,[rax]

	;mov rsi,0
	;mov rbx,[array1+rsi]
	;add rsi,8
	;mov rcx,[array1+rsi]
	;add rsi,8
	;mov rdx,[array1+rsi]

	mov rax,array1
	mov rsi,0
	mov rbx,[rax+rsi]
	add rsi,8
	mov rcx,[rax+rsi]
	add rsi,8
	mov rdx,[rax+rsi]

	; End the program
	mov		rax, 0x3c				; system call for exit
	xor		rdi, rdi				; exit code 0
	syscall					  		; invoke operating system call

section .data		; start of initialized data segment

	array1 dq 10,20,30,40,50,60,70,80
	array1_size EQU $-array1
	array1_length EQU ($-array1)/8

	array2 dd 11,22,33,44,55,66,77,88
	array2_size EQU $-array2
	;array2_length EQU ($-array2)/4
	array2_length EQU array2_size/4

	array3 dw 0x11,0x22,0x33,0x44,0x55,0x66,0x77,0x88
	array3_size EQU $-array3

	array4 db '12345678'
	array4_size EQU $-array4

section .bss		; start of uninitialized data segment
