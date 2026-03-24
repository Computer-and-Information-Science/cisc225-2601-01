; Hello World in NASM assembly with C Library

global main             ; expose program entry point
extern printf           ; declare external function
extern scanf

section .text           ; start of code segment

main:
    push rbp                ; preserve base pointer
    mov rbp,rsp             ; copy stack pointer

    ; Prompt for and input a
    mov rdi,prompt_a        ; address of prompt string for printf
    xor rax,rax             ; clear RAX for printf
    call printf             ; print the prompt
    mov rdi,input_format    ; address of input format string for scanf
    mov rsi,a               ; address of 32-bit int to receive input
    call scanf              ; input the int

    ; Prompt for and input b
    mov rdi,prompt_b        ; address of prompt string for printf
    xor rax,rax             ; clear RAX for printf
    call printf             ; print the prompt
    mov rdi,input_format    ; address of input format string for scanf
    mov rsi,b               ; address of 32-bit int to receive input
    call scanf              ; input the int

    ; call GCD function to find GCD of a and b
    mov edi,[a]             ; first argument to gcd
    mov esi,[b]             ; second argument to gcd
    call gcd 

    ; output the GCD
    mov rdi,output_format   ; address of output string, 1st argument
    mov esi,eax             ; pass return from gcd as 2nd argument
    xor rax,rax             ; clear RAX for printf
    call printf 

    pop rbp                 ; restore base pointer
    xor rax,rax             ; exit status 0
    ret                     ; exit main function

gcd:
	push rbp
	mov rbp,rsp

    ; Find GCD of EDI and ESI
.L1:
    mov eax,edi             ; set up for division
    cdq
    idiv esi                ; divide EDI (now in EAX) by ESI

    mov edi,esi             ; replace EDI with ESI
    mov esi,edx             ; move remainder of division to ESI

    cmp esi,0               ; if ESI is not zero, do it again
    jne .L1

    mov eax,edi             ; return the GCD

	pop rbp 
	ret

section .data           ; start of initialized data segment
    prompt_a db "Enter a: ",0
    prompt_b db "Enter b: ",0
    input_format db "%d",0
    output_format db "The GCD is %d.",0xa,0

section .bss            ; start of uninitialized data segment 
    a resd 1
    b resd 1
