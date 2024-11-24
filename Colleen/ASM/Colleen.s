global	main						; the standard gcc entry point
extern	printf

section .text

main:
	push	rbp
	mov		rbp, rsp

	; lea computes the address of the strings relative to
			; the RIP (Instruction Pointer), making the code
					; position-independent
	lea		rsi, [rel string]		; RIP-relative addressing for string
	lea		rdi, [rel fmt]			; RIP-relative addressing for fmt
	call	printf WRT ..plt

	leave
	ret

section .data
string:	db "fighters", 0
fmt: 	db "Hello, %s!", 10, 0	; note the newline (10) and null (0) at the end