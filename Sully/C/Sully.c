#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>

/*
	Non plus ultra.
*/

int number = 5;

#define checknum(x)if (number <= 0) exit(0); int nbnext = number - 1; char curr_filename[15]; snprintf(curr_filename, 15, "Sully_%d.c", number); if (access(curr_filename, F_OK) == -1) nbnext = number;

#define open(x)char filename[15]; snprintf(filename, 15, "Sully_%d.c", nbnext); FILE *stream = fopen(filename, "w");

#define print(x)if (stream) { fprintf(stream,s,10,10,10,10,10,10,9,10,10,10,nbnext,10,10,34,34,10,10,34,34,34,34,10,10,10,10,34,34,10,10,34,s,34,10,10); };

#define exec(x)char command[80]; snprintf(command, 80, "gcc Sully_%d.c -o Sully_%d && chmod +x Sully_%d && ./Sully_%d",nbnext,nbnext,nbnext,nbnext); system(command);

#define sully(x)int main(){ char *s="#include <stdio.h>%c#include <fcntl.h>%c#include <stdlib.h>%c#include <unistd.h>%c%c/*%c%cNon plus ultra.%c*/%c%cint number = %d;%c%c#define checknum(x)if (number <= 0) exit(0); int nbnext = number - 1; char curr_filename[15]; snprintf(curr_filename, 15, %cSully_%%d.c%c, number); if (access(curr_filename, F_OK) == -1) nbnext = number;%c%c#define open(x)char filename[15]; snprintf(filename, 15, %cSully_%%d.c%c, nbnext); FILE *stream = fopen(filename, %cw%c);%c%c#define print(x)if (stream) { fprintf(stream,s,10,10,10,10,10,10,9,10,10,10,nbnext,10,10,34,34,10,10,34,34,34,34,10,10,10,10,34,34,10,10,34,s,34,10,10); };%c%c#define exec(x)char command[80]; snprintf(command, 80, %cgcc Sully_%%d.c -o Sully_%%d && chmod +x Sully_%%d && ./Sully_%%d%c,nbnext,nbnext,nbnext,nbnext); system(command);%c%c#define sully(x)int main(){ char *s=%c%s%c; checknum(x); open(x); print(x); fclose(stream); exec(x); return(0); };%c%csully(x)"; checknum(x); open(x); print(x); fclose(stream); exec(x); return(0); };

sully(x)