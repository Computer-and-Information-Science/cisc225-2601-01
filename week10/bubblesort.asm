global bubblepass
global bubblesort
global swap

section .text           ; start of code segment

; Function: bubblepass
;	Carry out a single bubble pass on the given array
; Parameters:
;	RDI - Base address of an array of doublewords
;	ESI - Count of doublewords in the array
bubblepass:
	push rbp			; Preserve base pointer
	mov rbp,rsp			; Copy stack pointer

	mov ecx,esi 		; Set up loop counter 
	dec ecx				; Decrement loop counter (one less than size of array)
	mov rsi,rdi			; Copy address of first element 
	add rsi,4			; Point to second element
.L1:

	mov edx,[rdi]		; Get first element for comparison 
	cmp edx,[rsi]		; Compare with second element
	jle .L2 			; If in order, bypass the swap 

	; Swap contents of [rdi] and [rsi]
	push rdi			; Preserve registers prior to function call 
	push rsi 
	push rcx 
	call swap			; Swap values at RDI and RSI 
	pop rcx				; Restore registers 
	pop rsi 
	pop rdi 

.L2:
	add rdi,4			; Next element
	add rsi,4			; Next element
	loop .L1

	pop rbp				; Restore base pointer 
	ret

; Function: bubblesort
;	Carry out a bubble sort on the given array
; Parameters:
;	RDI - Base address of an array of doublewords
;	ESI - Count of doublewords in the array
bubblesort:
	push rbp				; Preserve base pointer
	mov rbp,rsp				; Copy base pointer

	mov ecx,esi				; Set up looop counter 
	dec ecx					; Decrement loop counter (one less than array size)
.L1:

	push rdi 				; Preserve registers before function call 
	push rsi 
	push rcx
	call bubblepass			; Call function with same parameters as given 
	pop rcx 				; Restore registers
	pop rsi 
	pop rdi 

	loop .L1

	pop rbp					; Restore base pointer
	ret

; Function: swap
;	Swap contents of two doubleword memory locations
; Parameters:
;	RDI - Address of first doubleword
;	RSI - Address of second doubleword
swap:
	push rbp			; Preserve base pointer
	mov rbp,rsp			; Copy stack pointer

	mov edx,[rdi]		; Copy first doubleword 
	xchg edx,[rsi] 		; Swap first value with second doubleword 
	xchg edx,[rdi]		; Copy second value to first doubleword

	pop rbp				; Restore base pointer
	ret

section .data           ; start of initialized data segment


section .bss            ; start of uninitialized data segment 
