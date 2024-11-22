#include <stdio.h>
/*
	"Yields falsehood when preceded by its quotation" yields falsehood when preceded by its quotation.
*/
int	main(){
	char *s="#include <stdio.h>%c/*%c%c%cYields falsehood when preceded by its quotation%c yields falsehood when preceded by its quotation.%c*/%cint%cmain(){%c%cchar *s=%c%s%c;%c%c/*%c%c%cIf my grandmother had had wheels, she would have been a bike.%c%c*/%c%cprintf(s,10,10,9,34,34,10,10,9,10,9,34,s,34,10,9,10,9,9,10,9,10,9,10,9,10);%c%creturn(0);%c}";
	/*
		If my grandmother had had wheels, she would have been a bike.
	*/
	printf(s,10,10,9,34,34,10,10,9,10,9,34,s,34,10,9,10,9,9,10,9,10,9,10,9,10);
	return(0);
}