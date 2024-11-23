#include <stdio.h>
#include <fcntl.h>

/*
	"Yields falsehood when preceded by its quotation" yields falsehood when preceded by its quotation.
*/

#define number "5"

#define checknum(x)char nb = number[0]; int next = nb - 48; if (next > 0) next -= 1; nb = next + 48;

#define open(x)char *prog = "Sully_"; char *ext = ".c"; char filename[10]; snprintf(filename, 10, "%s%c%s", prog, nb, ext); FILE *stream = fopen(filename, "w");

#define print(x)if (stream) { fprintf(stream,s,10,10,10,10,9,34,34,10,10,10,34,34,10,10,10,10,34,34,34,34,34,37,37,37,34,34,34,10,10,10,10,34,s,34,10,10); };

#define sully(x)int main(){ char *s="#include <stdio.h>%c#include <fcntl.h>%c%c/*%c%c%cYields falsehood when preceded by its quotation%c yields falsehood when preceded by its quotation.%c*/%c%c#define number %c5%c%c%c#define checknum(x)char nb = number[0]; int next = nb - 48; if (next > 0) next -= 1; nb = next + 48;%c%c#define open(x)char *prog = %cSully_%c; char *ext = %c.c%c; char filename[10]; snprintf(filename, 10, %c%cs%cc%cs%c, prog, nb, ext); FILE *stream = fopen(filename, %cw%c);%c%c#define print(x)if (stream) { fprintf(stream,s,10,10,10,10,9,34,34,10,10,10,34,34,10,10,10,10,34,34,34,34,34,37,37,37,34,34,34,10,10,10,10,34,s,34,10,10); };%c%c#define sully(x)int main(){ char *s=%c%s%c; checknum(x); open(x); print(x); fclose(stream); return(0); };%c%csully(x)"; checknum(x); open(x); print(x); fclose(stream); return(0); };

sully(x)