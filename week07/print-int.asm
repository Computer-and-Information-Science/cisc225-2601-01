; Output an unsigned doubleword to the console as 10 digits

global _start           ; expose program entry point

section .text           ; start of code segment

; Print N to the console
N equ 36247890

_start:

    mov rdi,buf             ; address of first character of output buffer
    add rdi,buf_len-2       ; position of right digit in output buffer

    mov rax,N               ; integer to convert to string for output
    mov rbx,10              ; divisor
    mov rcx,buf_len-1       ; loop counter
L1:
    xor rdx,rdx             ; clear high-order bits for division
    div rbx                 ; divide RAX by 10
    or dl,0x30              ; convert remainder to ASCII character
    mov [rdi],dl            ; copy character to output buffer
    dec rdi                 ; adjust address of output buffer
    loop L1                 ; next digit

    ; Write buf to the console
    mov rax,1               ; system call for write 
    mov rdi,1               ; file handle for stdout
    mov rsi,buf             ; address of output string
    mov rdx,buf_len         ; size of output string 
    syscall                 ; invoke operating system call 

    ; End the program
    mov rax,0x3c            ; system call for exit 
    xor rdi,rdi             ; exit code 0
    syscall                 ; invoke operating system call 

section .data           ; start of initialized data segment

    buf db "xxxxxxxxxx",0xa     ; output string with newline
	buf_len equ $-buf			; size of output string

section .bss            ; start of uninitialized data segment 
