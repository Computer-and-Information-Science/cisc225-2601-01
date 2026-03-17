global _start           ; expose program entry point

section .text           ; start of code segment

_start:

	; Push all characters in str1 onto the stack 
	xor rsi,rsi				; clear rsi for indexing the string 
L1:
	cmp byte[str1+rsi],0	; reached null terminator? 
	je L2 					; if null, end the loop 
	push qword[str1+rsi]	; push character onto stack 
	inc rsi					; advance index to next character
	jmp L1 
L2:

	; Copy all characters back to str1 in reverse order 
	xor rsi,rsi 
L3:
	cmp byte [str1+rsi],0
	je L4
	;pop qword[str1+rsi]   ; can't do this because this pops 8 bytes
	pop rdx					; pop stack to a register (8 bytes)
	mov [str1+rsi],dl 		; move low byte of RDX to str1+rsi
	inc rsi 
	jmp L3
L4:

    ; End the program
    mov rax,0x3c            ; system call for exit 
    xor rdi,rdi             ; exit code 0
    syscall                 ; invoke operating system call 

section .data           ; start of initialized data segment

    str1 db "Hello World!",0        ; A sample string
    str2 db "abcdef",0              ; Another string immediately following

section .bss            ; start of uninitialized data segment 
