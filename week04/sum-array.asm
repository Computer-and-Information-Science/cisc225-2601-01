; CISC 225, Computer Organization
; Project: Sum Array
;
; Calculate the sum of an array of quadwords leaving the sum in the RAX
; register. The code should be written such that the number of interations
; of any loop code is dependent on the size of the array.

global _start		; exposes program entry point to the linker

section .text		; start of code segment

_start:

	; Calculate sum of all elements in array1, leave sum in RAX 
	;mov rax,0				; initialize running sum 
	;mov rsi,array1			; address of first element of array1
	;add rax,[rsi]			; add element to running sum
	;add rsi,8				; update to address of next element 
	;add rax,[rsi]			; add next element to running sum 
	;add rsi,8				; update to address of next element 
	;add rax,[rsi]			; add next element to running sum 
	;add rsi,8				; update to address of next element 
	;add rax,[rsi]			; add next element to running sum 
	;add rsi,8				; update to address of next element 
	;add rax,[rsi]			; add next element to running sum 


	; Better version, using a LOOP instruction
	mov rax,0				; initialize running sum 
	mov rsi,array1			; base address of array 
	mov rcx,array1_length	; set up loop counter
L1:
	add rax,[rsi]			; add array element to running sum
	add rsi,8				; update address to next array element 
	loop L1 				; next iteration (next array element)



	; End the program
	mov		rax, 0x3c				; system call for exit
	xor		rdi, rdi				; exit code 0
	syscall					  		; invoke operating system call

section .data		; start of initialized data segment

	array1 dq 4,7,2,8,1,-4
	array1_length EQU ($-array1)/8

section .bss		; start of uninitialized data segment
