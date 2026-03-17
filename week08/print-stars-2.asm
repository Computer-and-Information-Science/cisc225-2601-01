global _start           ; expose program entry point

section .text           ; start of code segment

_start:

	; Print nrows of ncols asterisks
	mov rcx,[nrows]			; loop counter 
L2:
	push rcx				; preserve loop counter

	; Print ncols asterisks followed by newline
	mov rcx,[ncols]
L1:
	push rcx				; preserve loop counter 
	call print_star 
	pop rcx					; restore loop counter
	loop L1
	call print_newline

	pop rcx					; restore loop counter
	loop L2

    ; End the program
    mov rax,0x3c            ; system call for exit 
    xor rdi,rdi             ; exit code 0
    syscall                 ; invoke operating system call 

; TODO Copy functions from print-start-1.asm
print_star:
    ; Print a single asterisk
    mov rax,1               ; system call for write 
    mov rdi,1               ; file handle for stdout
    mov rsi,star            ; address of output string
    mov rdx,1               ; size of output string 
    syscall                 ; invoke operating system call 
	ret						; return to caller

print_newline:
    ; Print a single newline
    mov rax,1               ; system call for write 
    mov rdi,1               ; file handle for stdout
    mov rsi,newline            ; address of output string
    mov rdx,1               ; size of output string 
    syscall                 ; invoke operating system call 
	ret						; return to caller


section .data           ; start of initialized data segment

    star db "*"         ; A single asterisk for printing
    newline db 0xa      ; Newline for printing

    nrows dq 10         ; Number of rows of stars to print
    ncols dq 20         ; Number of stars to print in each row

section .bss            ; start of uninitialized data segment 
