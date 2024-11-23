#include <stdio.h>
#include <fcntl.h>

/*
	"Yields falsehood when preceded by its quotation" yields falsehood when preceded by its quotation.
*/

#define number "5"

#define open(x)char *prog = "Sully_"; char *ext = ".c"; char filename[10]; snprintf(filename, 10, "%s%s%s", prog, number, ext); FILE *stream = fopen(filename, "w");

#define print(x)if (stream) { fprintf(stream,s,10,10,10,10,9,34,34,10,10,10,34,34,10,10,34,34,34,34,34,37,37,37,34,34,34,10,10,10,10,34,s,34,10,10); };

#define sully(x)int main(){ char *s="#include <stdio.h>%c#include <fcntl.h>%c%c/*%c%c%cYields falsehood when preceded by its quotation%c yields falsehood when preceded by its quotation.%c*/%c%c#define number %c5%c%c%c#define open(x)char *prog = %cSully_%c; char *ext = %c.c%c; char filename[10]; snprintf(filename, 10, %c%cs%cs%cs%c, prog, number, ext); FILE *stream = fopen(filename, %cw%c);%c%c#define print(x)if (stream) { fprintf(stream,s,10,10,10,10,9,34,34,10,10,10,34,34,10,10,34,34,34,34,34,37,37,37,34,34,34,10,10,10,10,34,s,34,10,10); };%c%c#define sully(x)int main(){ char *s=%c%s%c; open(x); print(x); fclose(stream); return(0); };%c%csully(x)"; open(x); print(x); fclose(stream); return(0); };

sully(x)