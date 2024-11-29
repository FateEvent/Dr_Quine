#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>

/*
	"Yields falsehood when preceded by its quotation" yields falsehood when preceded by its quotation.
*/

int number = 5;

#define checknum(x)if (number == 0) exit(0); int nbnext = number - 1; if (number == 5 && access("Sully_5.c", F_OK) == -1) nbnext = 5;

#define open(x)char *prog = "Sully_"; char *ext = ".c"; char filename[10]; snprintf(filename, 10, "%s%d%s", prog, nbnext, ext); FILE *stream = fopen(filename, "w");

#define print(x)if (stream) { fprintf(stream,s,10,10,10,10,10,10,9,34,34,10,10,10,nbnext,10,10,34,34,10,10,34,34,34,34,34,34,34,34,10,10,10,10,34,34,10,10,34,s,34,10,10); };

#define exec(x)char command[60]; snprintf(command, 60, "gcc %s%d.c -o %s%d && chmod +x %s%d && ./%s%d",prog,nbnext,prog,nbnext,prog,nbnext,prog,nbnext); system(command);

#define sully(x)int main(){ char *s="#include <stdio.h>%c#include <fcntl.h>%c#include <stdlib.h>%c#include <unistd.h>%c%c/*%c%c%cYields falsehood when preceded by its quotation%c yields falsehood when preceded by its quotation.%c*/%c%cint number = %d;%c%c#define checknum(x)if (number == 0) exit(0); int nbnext = number - 1; if (number == 5 && access(%cSully_5.c%c, F_OK) == -1) nbnext = 5;%c%c#define open(x)char *prog = %cSully_%c; char *ext = %c.c%c; char filename[10]; snprintf(filename, 10, %c%%s%%d%%s%c, prog, nbnext, ext); FILE *stream = fopen(filename, %cw%c);%c%c#define print(x)if (stream) { fprintf(stream,s,10,10,10,10,10,10,9,34,34,10,10,10,nbnext,10,10,34,34,10,10,34,34,34,34,34,34,34,34,10,10,10,10,34,34,10,10,34,s,34,10,10); };%c%c#define exec(x)char command[60]; snprintf(command, 60, %cgcc %%s%%d.c -o %%s%%d && chmod +x %%s%%d && ./%%s%%d%c,prog,nbnext,prog,nbnext,prog,nbnext,prog,nbnext); system(command);%c%c#define sully(x)int main(){ char *s=%c%s%c; checknum(x); open(x); print(x); fclose(stream); exec(x); return(0); };%c%csully(x)"; checknum(x); open(x); print(x); fclose(stream); exec(x); return(0); };

sully(x)