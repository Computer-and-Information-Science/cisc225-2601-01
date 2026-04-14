; Given two sides of a right triangle, calculate hypotenuse
; Northampton Community College
; CISC 225, Computer Organization

global main		; exposes program entry point to the linker
extern printf	; declare external function
extern scanf

section .text	; start of code segment

main:
	push rbp				; preserve base pointer
	mov rbp,rsp				; copy stack pointer to base pointer

  ; Prompt for input of two sides
	mov rdi,fmt_prompt		; address of prompt string
	xor rax,rax				; clear RAX, no FP arguments
	call printf				; print the prompt 

  ; Input side a and side b
	mov rdi,fmt_input		; addres of input format string 
	mov rsi,side_a			; address for side a
	mov rdx,side_b			; address for side b 
	call scanf				; input the two sides 

  ; Square side a, leaving result in XMM0
	movsd xmm0,[side_a]		; value of side a for squaring
	mulsd xmm0,xmm0			; square side a 

  ; Square side b, leaving result in XMM1
	movsd xmm1,[side_b]		; value of side b for squaring 
	mulsd xmm1,xmm1			; square side b

  ; Add squares of sides a and b, result in XMM0
	addsd xmm0,xmm1			; a^2 + b^2 in XMM0

  ; Square root of sum, result in XMM0
	sqrtsd xmm0,xmm0		; square root of XMM0, hypotenuse 

  ; Output result
	mov rdi,fmt_output		; address of output format string 
	mov rax,1				; one floating point argument (in XMM0)
	call printf 			; print the hypotenuse 

	pop		rbp				; restore base pointer
	mov		rax, 0			; exit status (0 = success)
	ret

section .data	; start of initialized data segment

  fmt_prompt db "Enter length of two sides: ",0 ; prompt format string
  fmt_input db "%lf %lf",0 ; input format string, two 64-bit fp values
  fmt_output db "The hypotenuse is %0.2lf.",0xa,0

section .bss	; start of uninitialized data segment

  side_a resq 1
  side_b resq 1
