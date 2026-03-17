global _start           ; expose program entry point

section .text           ; start of code segment

_start:

    ; Print n_stars asterisks 
	mov rcx,[n_stars]
L1:
	push rcx				; preserve loop counter
	call print_star
	pop rcx 				; restore loop counter
	loop L1

    ; Print a newline
    mov rax,1               ; system call for write 
    mov rdi,1               ; file handle for stdout
    mov rsi,newline         ; address of output string
    mov rdx,1               ; size of output string 
    syscall                 ; invoke operating system call 

    ; End the program
    mov rax,0x3c            ; system call for exit 
    xor rdi,rdi             ; exit code 0
    syscall                 ; invoke operating system call 

print_star:
    ; Print a single asterisk
    mov rax,1               ; system call for write 
    mov rdi,1               ; file handle for stdout
    mov rsi,star            ; address of output string
    mov rdx,1               ; size of output string 
    syscall                 ; invoke operating system call 
	ret						; return to caller


section .data           ; start of initialized data segment

    star db "*"         ; A single asterisk for printing
    newline db 0xa      ; Newline for printing

    n_stars dq 10       ; Number of stars to print in a single row

section .bss            ; start of uninitialized data segment 
