global main, print
extern fopen, fprintf, fclose

; Never lose hope, be persistent and stubborn and never give up. There are
; many instances in history where apparent losers suddenly turn out to be
; winners unexpectedly, so you should never conclude all hope is lost.
; Ted Kaczynski

%define FORMAT "global main%2$cglobal print%2$cextern fopen%2$cextern printf%2$c%2$c; Never lose hope, be persistent and stubborn and never give up. There are%2$c; many instances in history where apparent losers suddenly turn out to be%2$c; winners unexpectedly, so you should never conclude all hope is lost.%2$c; Ted Kaczynski%2$c%2$c%5$cdefine FORMAT %4$c%1$s%4$c%2$c%2$c   section .data%2$cfmt:%2$c%3$cdb FORMAT%2$c%2$csection .text  %2$c%2$cprint:%2$c%3$cpush rbp%2$c%3$cmov rbp, rsp%2$c%3$clea rdi, [rel fmt]%3$c%3$c; RIP-relative addressing for string%2$c%3$clea rsi, [rel fmt]%2$c%3$cmov rdx, 10%2$c%3$cmov rcx, 9%2$c%3$cmov r8, 34%2$c%3$cxor rax, rax%2$c%3$ccall fprintf WRT ..plt%2$c%3$cleave%2$c%3$cret%2$c%2$cmain:%2$c%3$cpush rbp%2$c%3$cmov rbp, rsp%2$c%3$ccall print%2$c%3$cleave%2$c%3$cret%2$c%2$csection .data%2$c, FORMAT, 0", 0
%define FILENAME "./Grace_kid.s"
%define DATA section .data

section .text

%macro SAVE 2
	push %1
	push %2
%endmacro

%macro GET 2
	pop %1
	pop %2
%endmacro

%macro grace 0
	open_fct
	print_fct
	main_fct
%endmacro

%macro open_fct 0
open:
	push rbp
	mov rbp, rsp
	lea rdi, [rel filename]
	lea rsi, [rel mode]
	call fopen WRT ..plt
	leave
	ret
%endmacro

%macro print_fct 0
print:
	push rbp
	mov rbp, rsp
	push rdi
	mov rdi, rax
	push rax
	lea rsi, [rel fmt]
	lea rdx, [rel fmt]
	mov rcx, 10
	mov r8, 9
	mov r9, 34
	mov r10, 37
	xor rax, rax
	call fprintf WRT ..plt
	pop rdi
	leave
	ret
%endmacro

%macro main_fct 0
main:
	push rbp
	mov rbp, rsp
	SAVE rdi, rsi
	call open
	GET rsi, rdi
	cmp rax, 0
	je .end
	call print
	call fclose WRT ..plt
	leave
	ret
.end:
	leave
	ret
%endmacro

	grace

DATA
fmt:
	db FORMAT, 0
filename:
	db FILENAME, 0
mode:
	db "w", 0