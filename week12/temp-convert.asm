; Temperature Conversion
; Northampton Community College
; CISC 225, Computer Organization

global main		; exposes program entry point to the linker
extern printf	; declare external function
extern scanf

section .text	; start of code segment

main:
	push rbp				; preserve base pointer
	mov rbp,rsp				; copy stack pointer to base pointer

  ; Prompt for input
  mov rdi,fmt_prompt            ; address of format string
  xor rax,rax                   ; clear RAX for printf
  call printf                   ; issue the prompt

  ; Input temperature and scale
  mov rdi,fmt_input             ; address of input format string
  mov rsi,temp                  ; address for temperature input
  mov rdx,scale                 ; address for temp scale input
  call scanf                    ; input temperature and scale

  ; Branch to appropriate label based on scale
  or byte[scale],0x20           ; convert scale to lowercase
  cmp byte[scale],'f'           ; is scale == 'f'?
  je .ftoc                      ; go to .ftoc if scale == 'f'
  cmp byte[scale],'c'           ; is scale == 'c'?
  je .ctof                      ; go to .ctof if scale == 'c'
  jmp .done                     ; neither 'c' nor 'f' entered, exit the program

.ftoc:
  ; Input scale was F, convert to C and output
  movsd xmm1,[temp]				; xmm1 = (temp - 32) * 5 / 9
  subsd xmm1,[c32]
  mulsd xmm1,[c5]
  divsd xmm1,[c9]				; result, 3rd argument to printf

	mov rdi,fmt_ftoc_output		; address of output format string 
	movsd xmm0,[temp]			; 2nd argument to printf (original F temperature)
	mov rax,2					; 2 FP arguments to printf 
	call printf					; Print the result 

	jmp .done					; Finished, end the program

.ctof:
  ; Input scale was C, convert to F and output
  movsd xmm1,[temp]       ; xmm1 = temp * 9 / 5 + 32
  mulsd xmm1,[c9]
  divsd xmm1,[c5]
  addsd xmm1,[c32]        ; result, 3rd argument to printf

  mov rdi,fmt_ctof_output       ; address of output format string
  movsd xmm0,[temp]             ; 2nd argument to printf
  mov rax,2                     ; 2 floating point arguments to printf
  call printf                   ; print the result

.done:
	pop		rbp				; restore base pointer
	mov		rax, 0			; exit status (0 = success)
	ret

section .data	; start of initialized data segment

  ; Format strings for prompt and input
	fmt_prompt db "Temperature and scale (e.g. 45.2f): ",0
  fmt_input db "%lf%c",0

  ; Format strings for output
  fmt_ftoc_output db "%.2lfF = %.2lfC",0xa,0
  fmt_ctof_output db "%.2lfC = %.2lfF",0xa,0

  ; Constants for conversion formulas
  c5 dq 5.0
  c9 dq 9.0
  c32 dq 32.0

section .bss	; start of uninitialized data segment
  temp resq 1      ; To receive floating point temperature input
  scale resb 1     ; To receive character scale
