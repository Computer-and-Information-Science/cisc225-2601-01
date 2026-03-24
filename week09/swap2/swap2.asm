global swap2

section .text	; start of code segment

; Function: swap2
;	Swap contents of two integers
; Parameters:
;	RDI - Address of an integer 
;	RSI - Address of an integer
; Returns:
;	None.
swap2:
	push rbp				; preserve base pointer
	push rbx				; preserve RBX (callee saved)
	mov rbp,rsp				; set base pointer

	mov rax,[rdi]
	mov rbx,[rsi]
	mov [rdi],rbx
	mov [rsi],rax

	pop rbx 				; restore RBX
	pop rbp					; restore base pointer
	ret


section .data	; start of initialized data segment

section .bss	; start of uninitialized data segment
