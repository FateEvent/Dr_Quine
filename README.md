# dr-quine

### Quines

A [quine](https://en.wikipedia.org/wiki/Quine_(computing)) in computer science is a
> computer program that takes no input and produces a copy of its own source code as its only output. [...] A quine is a [fixed point](https://en.wikipedia.org/wiki/Fixed_point_(mathematics)) of an execution environment, when that environment is viewed as a function transforming programs into their outputs.

It takes inspiration by Willard Van Orman Quine, who enunciated the [paradox that beras his name](https://en.wikipedia.org/wiki/Quine%27s_paradox), demonstrating that paradoxes such as the [liar paradox](https://en.wikipedia.org/wiki/Liar_paradox) may arise independently of direct self-references.

> In general, the method used to create a quine in any programming language is to have, within the program, two pieces: (a) code used to do the actual printing and (b) data that represents the textual form of the code. The code functions by using the data to print the code (which makes sense since the data represents the textual form of the code), but it also uses the data, processed in a simple way, to print the textual representation of the data itself.

### Tips for Quines in C

[Here](https://stackoverflow.com/questions/60212717/quine-program-example-in-c) are some explanations about a quine in C, and [here](https://gcc.gnu.org/onlinedocs/cpp/Macros.html) may be found the GNU documentation about macros.

I found interesting pieces of information on how to use `snprintf` to join two strings in [this answer on StackOverflow](https://stackoverflow.com/a/5262176), and how to use it before calling `system` in [this one](https://stackoverflow.com/a/30305727). Using it this way allowed me to avoid hard-coding the names of object files and executables in the call to `system`.

### A Quine in Assembly

Some interesting examples of quines in Assembly may be found in a [Code Golf page](https://codegolf.stackexchange.com/questions/577/assembly-language-quine) and in the [GitHub repository x86-Quine by NeilBostian](https://github.com/NeilBostian/x86-Quine/blob/master/quine.min.s).

The NASM Assembly official guide may be found at [this link](https://www.nasm.us/xdoc/2.13.01/nasmdoc.pdf).

To make a program in Assembly, we need to define a [`main` function](https://stackoverflow.com/questions/54582629/using-a-user-defined-entry-point-in-assembly-x86-64-nasm-when-compiling-with-gcc), as in C. This is achieved with the keywords `global main`.
In [this StackOverflow page](https://stackoverflow.com/questions/9668908/printf-in-nasm-behavior) and in [this blog article](https://www.mgaillard.fr/2024/09/20/printf-assembly-linux.html) are given basic explanations about how to use the function `printf` in Assembly, whereas in [these "learning-notes"](https://github.com/ifding/learning-notes/blob/master/security/reverse-engineering/4-printf-with-several-arguments.md) we can find an explanation about ho to pass parameters to this function.

If we choose to compile with GCC, as we can see from the following snippet, we have to pass each argument on the stack by using registers (similarly to what we do with other functions):
```asm
main			proc near

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

				push	ebp
				mov		ebp, esp
				and		esp, 0FFFFFFF0h
				sub		esp, 10h
				mov		eax, offset aADBDCD ; "a=%d; b=%d; c=%d"
				mov		[esp+10h+var_4], 3
				mov		[esp+10h+var_8], 2
				mov		[esp+10h+var_C], 1
				mov		[esp+10h+var_10], eax
				call	_printf
				mov		eax, 0
				leave
				retn
main		endp
```

For example, the following code works:
```asm
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
fmt: 	db "Hello, %s!", 10, 9, "Hello, worlds!", 10, 0	; note the newline (10) and null (0) at the end
```
as we can see:
```sh
faventur@k2r4p2:Colleen/ASM ‹main›$ make && ./Colleen
nasm -f elf64 Colleen.s -o Colleen.o
gcc -m64 -o Colleen Colleen.o
Hello, fighters!
		Hello, worlds!
```

It's important to have a `0` (or NULL character) at the end of strings.

Here are the registers in the order used for function parameters:
rdi, rsi, rdx, rcx, r8, r9, r10.

To call `fprintf`, I followed the tips given in [this StackOverflow page](https://stackoverflow.com/questions/53948710/how-to-call-fprintf-function-in-assembly-code).