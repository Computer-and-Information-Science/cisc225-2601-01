; Hello World in NASM assembly

global _start           ; expose program entry point

section .text           ; start of code segment

_start:

;    mov rax,10
;    mov rbx,0x3bd7
;    mov rcx,rbx
;    mov rdx,[arr1]
;    mov [var1],rbx 
;    ;mov [var1],[var2] ; can't do this
;    mov rax,[var2]
;    mov [var1],rax 

 
 
;    mov rax,-1
;    ;mov al,3 
;    ;mov ax,3 
;    mov eax,3 

;    mov qword[var1],100 


    mov rax,10
    mov rbx,20
    add rax,rbx

    add qword[var1],5
    add [var1],rax 

    neg rax 

    ; var3 = var1 + var2;
    mov rax,[var1]
    add rax,[var2]
    mov [var3],rax 

    ; var3 = ++var1 - var2--;
    inc qword[var1]
    mov rax,[var1]
    sub rax,[var2]
    mov [var3],rax 
    dec qword[var2]

    ; Write "Hello World!" to the console
    mov rax,1               ; system call for write 
    mov rdi,1               ; file handle for stdout
    mov rsi,hello_str       ; address of output string
    mov rdx,hello_str_len   ; size of output string 
    syscall                 ; invoke operating system call 

    ; End the program
    mov rax,0x3c            ; system call for exit 
    xor rdi,rdi             ; exit code 0
    syscall                 ; invoke operating system call 

section .data           ; start of initialized data segment

    hello_str db "Hello World!",0xa     ; output string with newline
    hello_str_len equ $-hello_str       ; size of output string 

    var1 dq 10
    var2 dq -5
    var3 dd 20
    var4 dd 30
    var5 dw 8
    var6 dw 11
    var7 db 5
    var8 db 3

    arr1 dq 11,22,33,44     ; Array of 4 quadwords, initialized to 11, 22, 33, and 44
    arr2 dd 1,2,3,4
    arr3 dw 10,20,30,40
    arr4 db 9,8,7,6
    arr5 db "abcd"
    arr6 db "abcd",1,2,3,4,"efgh"

section .bss            ; start of uninitialized data segment 

    var9 resq 1
    var10 resd 1
    var11 resw 1
    var12 resb 10
