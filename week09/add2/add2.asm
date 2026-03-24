global add2

section .text	; start of code segment

add2:
	; Parameters:
	;	EDI - First integer
	;	ESI - Second integer
	; Return:
	;	EAX - Sum of first and second

	mov eax,EDI			; Get first Parameter
	add eax,ESI			; Add second parameter 
	; Sum is returned through EAX

	ret 				; Return

section .data	; start of initialized data segment

section .bss	; start of uninitialized data segment
