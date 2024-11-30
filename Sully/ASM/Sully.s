global main, print, cmd_fct
extern fopen, fprintf, sprintf, fclose, system

; "¡Aquí no se rinde nadie, carajo!"
; Camilo Cienfuegos

%define FORMAT "global main, print, cmd_fct%2$cextern fopen, fprintf, sprintf, fclose, system%2$c%2$c; %3$c¡Aquí no se rinde nadie, carajo!%3$c%2$c; Camilo Cienfuegos%2$c%2$c%%define FORMAT %3$c%1$s%3$c%2$c%2$c%%define DATA section .data%2$c%2$c%%macro SAVE 2%2$cpush %%1%2$cpush %%2%2$c%%endmacro%2$c%2$c%%macro GET 2%2$cpop %%1%2$cpop %%2%2$c%%endmacro%2$c%2$c%%macro open_fct 0%2$copen:%2$cpush rbp%2$cmov rbp, rsp%2$clea rdi, [rel filename]%2$clea rsi, [rel filename_fmt]%2$cmov rdx, r12%2$ccall sprintf WRT ..plt%2$clea rdi, [rel filename]%2$clea rsi, [rel mode]%2$ccall fopen WRT ..plt%2$cleave%2$cret%2$c%%endmacro%2$c%2$c%%macro print_fct 0%2$cprint:%2$cpush rbp%2$cmov rbp, rsp%2$cpush rdi%2$cmov rdi, rax%2$cpush rax%2$clea rsi, [rel fmt]%2$clea rdx, [rel fmt]%2$cmov rcx, 10%2$cmov r8, 34%2$cmov r9, r12%2$cxor rax, rax%2$ccall fprintf WRT ..plt%2$cpop rdi%2$cleave%2$cret%2$c%%endmacro%2$c%2$c%%macro cmd_fct 0%2$ccreate_command:%2$cpush rbp%2$cmov rbp, rsp%2$clea rdi, [rel command]%2$clea rsi, [rel command_fmt]%2$cmov rdx, r12%2$ccall sprintf WRT ..plt%2$clea rdi, [rel command]%2$ccall system WRT ..plt%2$cleave%2$cret%2$c%%endmacro%2$c%2$c%%macro checknum 0%2$cxor r12, r12%2$cmov r12, QWORD [rel number]%2$ccmp r12, 0%2$cje .end%2$ccmp r12, 5%2$cjne .reduction%2$cSAVE rdi, rsi%2$cSAVE rdx, rcx%2$cmov rax, 21%2$clea rdi, [rel filepath]%2$cxor rsi, rsi%2$csyscall%2$cGET rcx, rdx%2$cGET rsi, rdi%2$ctest rax, rax%2$cjnz .skip_reduc%2$c.reduction:%2$cdec r12%2$c.skip_reduc:%2$c%%endmacro%2$c%2$c%%macro main_fct 0%2$cmain:%2$cpush rbp%2$cmov rbp, rsp%2$ccall checknum%2$cSAVE rdi, rsi%2$cSAVE rdx, rcx%2$ccall open%2$cGET rcx, rdx%2$cGET rsi, rdi%2$ccmp rax, 0%2$cje .end%2$ccall print%2$ccall fclose WRT ..plt%2$cSAVE rdi, rsi%2$cSAVE rdx, rcx%2$ccall create_command%2$cGET rcx, rdx%2$cGET rsi, rdi%2$cleave%2$cret%2$c.end:%2$cleave%2$cret%2$c%%endmacro%2$c%2$c%%macro sully 0%2$copen_fct%2$cprint_fct%2$ccmd_fct%2$cmain_fct%2$c%%endmacro%2$c%2$csection .text%2$c%2$csully%2$c%2$cDATA%2$cfmt: db FORMAT, 0%2$cfilename: times 100 db 0%2$cfilename_fmt: db %3$cSully_%%d.s%3$c, 0%2$cmode: db %3$cw%3$c, 0%2$cnumber: dq %4$d%2$cfilepath: db %3$cSully_5.s%3$c, 0%2$ccommand: times 256 db 0%2$ccommand_fmt: db %3$cnasm -f elf64 Sully_%%1$d.s -o Sully_%%1$d.o && gcc -m64 -o Sully_%%1$d Sully_%%1$d.o && rm Sully_%%1$d.o && chmod +x Sully_%%1$d && ./Sully_%%1$d%3$c, 0"

%define DATA section .data

%macro SAVE 2
push %1
push %2
%endmacro

%macro GET 2
pop %1
pop %2
%endmacro

%macro open_fct 0
open:
push rbp
mov rbp, rsp
lea rdi, [rel filename]
lea rsi, [rel filename_fmt]
mov rdx, r12
call sprintf WRT ..plt
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
mov r8, 34
mov r9, r12
xor rax, rax
call fprintf WRT ..plt
pop rdi
leave
ret
%endmacro

%macro cmd_fct 0
create_command:
push rbp
mov rbp, rsp
lea rdi, [rel command]
lea rsi, [rel command_fmt]
mov rdx, r12
call sprintf WRT ..plt
lea rdi, [rel command]
call system WRT ..plt
leave
ret
%endmacro

%macro checknum 0
xor r12, r12
mov r12, QWORD [rel number]
cmp r12, 0
je .end
cmp r12, 5
jne .reduction
SAVE rdi, rsi
SAVE rdx, rcx
mov rax, 21
lea rdi, [rel filepath]
xor rsi, rsi
syscall
GET rcx, rdx
GET rsi, rdi
test rax, rax
jnz .skip_reduc
.reduction:
dec r12
.skip_reduc:
%endmacro

%macro main_fct 0
main:
push rbp
mov rbp, rsp
call checknum
SAVE rdi, rsi
SAVE rdx, rcx
call open
GET rcx, rdx
GET rsi, rdi
cmp rax, 0
je .end
call print
call fclose WRT ..plt
SAVE rdi, rsi
SAVE rdx, rcx
call create_command
GET rcx, rdx
GET rsi, rdi
leave
ret
.end:
leave
ret
%endmacro

%macro sully 0
open_fct
print_fct
cmd_fct
main_fct
%endmacro

section .text

sully

DATA
fmt: db FORMAT, 0
filename: times 100 db 0
filename_fmt: db "Sully_%d.s", 0
mode: db "w", 0
number: dq 5
filepath: db "Sully_5.s", 0
command: times 256 db 0
command_fmt: db "nasm -f elf64 Sully_%1$d.s -o Sully_%1$d.o && gcc -m64 -o Sully_%1$d Sully_%1$d.o && rm Sully_%1$d.o && chmod +x Sully_%1$d && ./Sully_%1$d", 0