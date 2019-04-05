#include <stdio.h>

int main()
{

	int c;
	int blank=0, tab=0, newLine = 0;


	for(; (c = getchar()) != EOF;)
	{
		if(c == ' ')
			++blank;
		else if(c == '\t')
			++tab;
		else if(c == '\n')
			++newLine;
	}

	printf("%d \t %d \t %d \n", blank, tab, newLine);


	return 0;
}
