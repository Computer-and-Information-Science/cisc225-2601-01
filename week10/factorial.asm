global factorial

section .text           ; start of code segment

; Function: factorial
;	Compute factorial of doubleword argument
; Parameters:
;	EDI - Doubleword, unsigned integer for which factorial is to be computed
; Returns:
;	EAX - Factorial value
factorial:
	push rbp 			; Preserve base pointer
	mov rbp,rsp			; Set up base pointer
	sub rsp,8			; Allocate space for doubleword local variable

	cmp edi,0			; Compare given value with zero
	jg .L1 				; If not zero, recursive function call
	mov eax,1			; Base case, return 1
	jmp .L2				; Done.
.L1:
	mov [rbp-4],edi		; Save original parameter value (to local variable)
	dec edi				; Original value, munus 1
	call factorial		; Recursive call, result in EAX 
	mul dword[rbp-4]	; Multiply by original parameter value, result in EAX
.L2:
	add rsp,8			; Destroy local variables
	pop rbp				; Restore base pointer
	ret

section .data           ; start of initialized data segment


section .bss            ; start of uninitialized data segment 
