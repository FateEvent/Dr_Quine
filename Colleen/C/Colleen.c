#include <stdio.h>

/*
	"Yields falsehood when preceded by its quotation" yields falsehood when preceded by its quotation.
*/

void	print() {

	char *s="#include <stdio.h>%c%c/*%c%c%cYields falsehood when preceded by its quotation%c yields falsehood when preceded by its quotation.%c*/%c%cvoid%cprint() {%c%c%cchar *s=%c%s%c;%c%cprintf(s,10,10,10,9,34,34,10,10,10,9,10,10,9,34,s,34,10,9,10,10,10,9,10,9,10,9,9,10,9,10,9,10,9,10);%c}%c%cint%cmain() {%c%c/*%c%c%cIf my grandmother had had wheels, she would have been a bike.%c%c*/%c%cprint();%c%creturn(0);%c}";
	printf(s,10,10,10,9,34,34,10,10,10,9,10,10,9,34,s,34,10,9,10,10,10,9,10,9,10,9,9,10,9,10,9,10,9,10);
}

int	main() {
	/*
		If my grandmother had had wheels, she would have been a bike.
	*/
	print();
	return(0);
}