; Unpacked Addition
; CISC 225, Computer Organization

global main		; exposes program entry point to the linker
extern printf

section .text	; start of code segment

main:
	push rbp				; preserve base pointer
	mov rbp,rsp				; copy stack pointer to base pointer

  ; Print num1
  mov rdi,fmt       ; Format string
  mov rsi,num1      ; Address of string to print
  xor rax,rax       ; No FP arguments
  call printf       ; Print the string

  ; Print num2
  mov rdi,fmt       ; Format string
  mov rsi,num2      ; Address of string to print
  xor rax,rax       ; No FP arguments
  call printf       ; Print the string

	; Convert ASCII chars in num1, num2 to binary coded decimal.
	mov rcx,12		; Loop counter
	mov rax,num1	; Address of high-order digit of num1
	mov rbx,num2	; Address of high-order digit of num2
.L1:
	and byte[rax],0xf	; Zero high nibble of byte at RAX (num1)
	and byte[rbx],0xf	; Zero high nibble of byte at RBX (num2)
	inc rax				; Next byte in num1
	inc rbx				; Next byte in num2
	loop .L1			; Process next byte

	; Add digits, right-to-left, with result in sum
	mov rcx,12			; Loop counter
	mov rdi,sum+12		; Point to null-terminator of sum
	clc					; Clear carry flag (no carry to low-order digit)
.L2:
	dec rax				; Move one byte left in num1
	dec rbx 			; Move one byte left in num2
	dec rdi				; Move one byte left in sum
	mov dl,[rax]		; Digit of num1 to register for addition
	adc dl,[rbx]		; Add digit of num2
	cmp dl,10			; Need to carry a 1?
	jb .L3				; Jump no carry 
	sub dl,10			; Subtract out the carry
	stc 				; Set carry for next iteration
	jmp .L4
.L3:
	clc 				; No carry for next iteration 
.L4:
	mov [rdi],dl		; Save digit to sum
	loop .L2

	; Convert sum to ASCII digits
	mov rcx,12			; Loop counter
.L5:
	or byte[rdi],0x30	; Convert decimal digit to ASCII character
	inc rdi				; Next byte in sum
	loop .L5

  ; Print sum
  mov rdi,fmt       ; Format string
  mov rsi,sum       ; Address of string to print
  xor rax,rax       ; No FP arguments
  call printf       ; Print the string

	pop		rbp				; restore base pointer
	mov		rax, 0			; exit status (0 = success)
	ret

section .data	; start of initialized data segment

num1 db '008246135523',0
num2 db '002575246757',0
sum db '000000000000',0

fmt db '%s',0xa ; Format string

section .bss	; start of uninitialized data segment
