global main
global print
extern printf

; Never lose hope, be persistent and stubborn and never give up. There are
; many instances in history where apparent losers suddenly turn out to be
; winners unexpectedly, so you should never conclude all hope is lost.
; Ted Kaczynski

section .text

print:
	push rbp
	mov rbp, rsp
	lea rdi, [rel fmt]		; RIP-relative addressing for string
	lea rsi, [rel fmt]
	mov rdx, 10
	mov rcx, 9
	mov r8, 34
	xor rax, rax
	call printf WRT ..plt
	leave
	ret

main:
	push rbp
	mov rbp, rsp
	call print
	leave
	ret

section .data
fmt:
	db "global main%2$cglobal print%2$cextern printf%2$c%2$c; Never lose hope, be persistent and stubborn and never give up. There are%2$c; many instances in history where apparent losers suddenly turn out to be%2$c; winners unexpectedly, so you should never conclude all hope is lost.%2$c; Ted Kaczynski%2$c%2$csection .text%2$c%2$cprint:%2$c%3$cpush rbp%2$c%3$cmov rbp, rsp%2$c%3$clea rdi, [rel fmt]%3$c%3$c; RIP-relative addressing for string%2$c%3$clea rsi, [rel fmt]%2$c%3$cmov rdx, 10%2$c%3$cmov rcx, 9%2$c%3$cmov r8, 34%2$c%3$cxor rax, rax%2$c%3$ccall printf WRT ..plt%2$c%3$cleave%2$c%3$cret%2$c%2$cmain:%2$c%3$cpush rbp%2$c%3$cmov rbp, rsp%2$c%3$ccall print%2$c%3$cleave%2$c%3$cret%2$c%2$csection .data%2$cfmt:%2$c%3$cdb %4$c%1$s%4$c, 0", 0