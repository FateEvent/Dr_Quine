# dr-quine

A [quine](https://en.wikipedia.org/wiki/Quine_(computing)) in computer science is a
> computer program that takes no input and produces a copy of its own source code as its only output. [...] A quine is a [fixed point](https://en.wikipedia.org/wiki/Fixed_point_(mathematics)) of an execution environment, when that environment is viewed as a function transforming programs into their outputs.

It takes inspiration by Willard Van Orman Quine, who enunciated the [paradox that beras his name](https://en.wikipedia.org/wiki/Quine%27s_paradox), demonstrating that paradoxes such as the [liar paradox](https://en.wikipedia.org/wiki/Liar_paradox) may arise independently of direct self-references.

> In general, the method used to create a quine in any programming language is to have, within the program, two pieces: (a) code used to do the actual printing and (b) data that represents the textual form of the code. The code functions by using the data to print the code (which makes sense since the data represents the textual form of the code), but it also uses the data, processed in a simple way, to print the textual representation of the data itself.

[Here](https://stackoverflow.com/questions/60212717/quine-program-example-in-c) are some explanations about a quine in C, and [here](https://gcc.gnu.org/onlinedocs/cpp/Macros.html) may be found the GNU documentation about macros.

