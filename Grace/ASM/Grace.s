; Non plus ultra.

global main, print
extern fopen, fprintf, fclose

; Per me si va ne la città dolente,
; per me si va ne l'etterno dolore,
; per me si va tra la perduta gente.
;	Dante (inferno, canto III)

%define FORMAT "; Non plus ultra.%2$c%2$cglobal main, print%2$cextern fopen, fprintf, fclose%2$c%2$c; Per me si va ne la città dolente,%2$c; per me si va ne l'etterno dolore,%2$c; per me si va tra la perduta gente.%2$c;%3$cDante (inferno, canto III)%2$c%2$c%%define FORMAT %4$c%1$s%4$c%2$c%%define FILENAME %4$c./Grace_kid.s%4$c%2$c%%define DATA section .data%2$c%2$csection .text%2$c%2$c%%macro SAVE 2%2$c%3$cpush %%1%2$c%3$cpush %%2%2$c%%endmacro%2$c%2$c%%macro GET 2%2$c%3$cpop %%1%2$c%3$cpop %%2%2$c%%endmacro%2$c%2$c%%macro grace 0%2$c%3$copen_fct%2$c%3$cprint_fct%2$c%3$cmain_fct%2$c%%endmacro%2$c%2$c%%macro open_fct 0%2$copen:%2$c%3$cpush rbp%2$c%3$cmov rbp, rsp%2$c%3$clea rdi, [rel filename]%2$c%3$clea rsi, [rel mode]%2$c%3$ccall fopen WRT ..plt%2$c%3$cleave%2$c%3$cret%2$c%%endmacro%2$c%2$c%%macro print_fct 0%2$cprint:%2$c%3$cpush rbp%2$c%3$cmov rbp, rsp%2$c%3$cpush rdi%2$c%3$cmov rdi, rax%2$c%3$cpush rax%2$c%3$clea rsi, [rel fmt]%2$c%3$clea rdx, [rel fmt]%2$c%3$cmov rcx, 10%2$c%3$cmov r8, 9%2$c%3$cmov r9, 34%2$c%3$cxor rax, rax%2$c%3$ccall fprintf WRT ..plt%2$c%3$cpop rdi%2$c%3$cleave%2$c%3$cret%2$c%%endmacro%2$c%2$c%%macro main_fct 0%2$cmain:%2$c%3$cpush rbp%2$c%3$cmov rbp, rsp%2$c%3$cSAVE rdi, rsi%2$c%3$ccall open%2$c%3$cGET rsi, rdi%2$c%3$ccmp rax, 0%2$c%3$cje .end%2$c%3$ccall print%2$c%3$ccall fclose WRT ..plt%2$c%3$cleave%2$c%3$cret%2$c.end:%2$c%3$cleave%2$c%3$cret%2$c%%endmacro%2$c%2$c%3$cgrace%2$c%2$cDATA%2$cfmt:%2$c%3$cdb FORMAT, 0%2$cfilename:%2$c%3$cdb FILENAME, 0%2$cmode:%2$c%3$cdb %4$cw%4$c, 0"
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