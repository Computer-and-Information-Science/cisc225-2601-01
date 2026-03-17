global _start           ; expose program entry point

section .text           ; start of code segment

_start:

	; Push all elements of array onto stack 
	mov rsi,array			; address of first element 
	mov rcx,array_size		; set up loop counter 
L1:
	push qword[rsi]			; push array value onto stack 
	add rsi,8				; address of next element 
	loop L1					; next loop iteration

	; Pop all elements in reverse of original order 
	mov rsi,array			; address of first element 
	mov rcx,array_size		; set up loop counter 
L2:
	pop qword[rsi]			; pop stack back to array element
	add rsi,8				; address of next element 
	loop L2					; next loop iteration 

    ; End the program
    mov rax,0x3c            ; system call for exit 
    xor rdi,rdi             ; exit code 0
    syscall                 ; invoke operating system call 

section .data           ; start of initialized data segment

    array dq 10,20,30,40,50,60,70,80,90,100     ; sample array values
    array_size equ ($-array)/8                  ; size of sample array

section .bss            ; start of uninitialized data segment 
