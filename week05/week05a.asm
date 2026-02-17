; Hello World in NASM assembly

global _start           ; expose program entry point

section .text           ; start of code segment

_start:

	;mov rax,-1
	;mov al,0x12

	;mov rax,-1
	;mov ax,0x1234

	;mov rax,-1
	;mov eax,0x12345678
	
	;mov rax,-1
	;mov eax,0
	;mov ax,word[var4]
	
	;mov rax,-1
	;mov eax,[var2]
	
	;mov rax,-1
	;movzx eax,word[var3]
	
	;mov rax,0
	;movsx eax,word[var3]
	;mov rbx,0
	;movsx ebx,word[var4]
	
	mov rax,0
	movsx rax,word[var3]
	mov rbx,0
	movsx rbx,word[var4]
 
    ; End the program
    mov rax,0x3c            ; system call for exit 
    xor rdi,rdi             ; exit code 0
    syscall                 ; invoke operating system call 

section .data           ; start of initialized data segment

	var1 dd 0x12345678
	var2 dd 0xdcba9876
	var3 dw 0x23da
	var4 dw 0xac97

section .bss            ; start of uninitialized data segment 
