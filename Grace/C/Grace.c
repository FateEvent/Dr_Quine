#include <stdio.h>
#include <fcntl.h>

/*
	"Yields falsehood when preceded by its quotation" yields falsehood when preceded by its quotation.
*/

#define open(x)FILE *stream = fopen("./Grace_kid.c", "w");

#define print(x)if (stream) { fprintf(stream,s,10,10,10,10,9,34,34,10,10,10,34,34,34,34,10,10,10,10,34,s,34,10,10); };

#define grace(x)int main(){char *s="#include <stdio.h>%c#include <fcntl.h>%c%c/*%c%c%cYields falsehood when preceded by its quotation%c yields falsehood when preceded by its quotation.%c*/%c%c#define open(x)FILE *stream = fopen(%c./Grace_kid.c%c, %cw%c);%c%c#define print(x)if (stream) { fprintf(stream,s,10,10,10,10,9,34,34,10,10,10,34,34,34,34,10,10,10,10,34,s,34,10,10); };%c%c#define grace(x)int main(){char *s=%c%s%c;open(x);print(x);fclose(stream);return(0);}%c%cgrace(x)";open(x);print(x);fclose(stream);return(0);};

grace(x)