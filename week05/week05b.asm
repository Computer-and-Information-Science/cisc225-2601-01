; Hello World in NASM assembly

global _start           ; expose program entry point

section .text           ; start of code segment

_start:

	;mov al,0x6a
	;and al,0x36

	;mov al,0x6a
	;or al,0x36

	;mov al,0x6a
	;xor al,0x36

	;mov al,0x6a
	;not al

	;mov al,0x6a
	;shl al,1
	;mov al,0x6a
	;shr al,1

	mov al,250
	add al,10

    ; End the program
    mov rax,0x3c            ; system call for exit 
    xor rdi,rdi             ; exit code 0
    syscall                 ; invoke operating system call 

section .data           ; start of initialized data segment


section .bss            ; start of uninitialized data segment 
