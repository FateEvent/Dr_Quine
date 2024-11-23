#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>

/*
	"Yields falsehood when preceded by its quotation" yields falsehood when preceded by its quotation.
*/

int number = 5;

#define checknum(x)if (number == 0) exit(0); char nbchar = number - 1 + 48;

#define open(x)char *prog = "Sully_"; char *ext = ".c"; char filename[10]; snprintf(filename, 10, "%s%c%s", prog, nbchar, ext); FILE *stream = fopen(filename, "w");

#define print(x)if (stream) { fprintf(stream,s,10,10,10,10,10,9,34,34,10,10,10,nbchar,10,10,10,10,34,34,34,34,34,37,37,37,34,34,34,10,10,10,10,34,prog,nbchar,prog,nbchar,prog,nbchar,prog,nbchar,34,10,10,34,s,34,10,10); };

#define exec(x)system("gcc Sully_4.c -o Sully_4 && chmod +x Sully_4 && ./Sully_4");

#define sully(x)int main(){ char *s="#include <stdio.h>%c#include <fcntl.h>%c#include <stdlib.h>%c%c/*%c%c%cYields falsehood when preceded by its quotation%c yields falsehood when preceded by its quotation.%c*/%c%cint number = %c;%c%c#define checknum(x)if (number == 0) exit(0); char nbchar = number - 1 + 48;%c%c#define open(x)char *prog = %cSully_%c; char *ext = %c.c%c; char filename[10]; snprintf(filename, 10, %c%cs%cc%cs%c, prog, nbchar, ext); FILE *stream = fopen(filename, %cw%c);%c%c#define print(x)if (stream) { fprintf(stream,s,10,10,10,10,10,9,34,34,10,10,10,nbchar,10,10,10,10,34,34,34,34,34,37,37,37,34,34,34,10,10,10,10,34,prog,nbchar,prog,nbchar,prog,nbchar,prog,nbchar,34,10,10,34,s,34,10,10); };%c%c#define exec(x)system(%cgcc %s%c.c -o %s%c && chmod +x %s%c && ./%s%c%c);%c%c#define sully(x)int main(){ char *s=%c%s%c; checknum(x); open(x); print(x); fclose(stream); exec(x); return(0); };%c%csully(x)"; checknum(x); open(x); print(x); fclose(stream); exec(x); return(0); };

sully(x)