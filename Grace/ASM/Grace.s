global main, print
extern fopen, fprintf, fclose

; Never lose hope, be persistent and stubborn and never give up. There are
; many instances in history where apparent losers suddenly turn out to be
; winners unexpectedly, so you should never conclude all hope is lost.
; Ted Kaczynski

%define FORMAT "global main%3$cglobal print%3$cextern fopen%3$cextern printf%3$c%3$c; Never lose hope, be persistent and stubborn and never give up. There are%3$c; many instances in history where apparent losers suddenly turn out to be%3$c; winners unexpectedly, so you should never conclude all hope is lost.%3$c; Ted Kaczynski%3$c%3$c%6$cdefine FORMAT %5$c%1$s%5$c%3$c%3$c   section .data%3$cfmt:%3$c%4$cdb FORMAT%3$c%3$csection .text  %3$c%3$cprint:%3$c%4$cpush rbp%3$c%4$cmov rbp, rsp%3$c%4$clea rdi, [rel fmt]%4$c%4$c; RIP-relative addressing for string%3$c%4$clea rsi, [rel fmt]%3$c%4$cmov rdx, 10%3$c%4$cmov rcx, 9%3$c%4$cmov r8, 34%3$c%4$cxor rax, rax%3$c%4$ccall fprintf WRT ..plt%3$c%4$cleave%3$c%4$cret%3$c%3$cmain:%3$c%4$cpush rbp%3$c%4$cmov rbp, rsp%3$c%4$ccall print%3$c%4$cleave%3$c%4$cret%3$c%3$csection .data%3$c, FORMAT, 0", 0
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