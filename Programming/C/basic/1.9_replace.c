#include <stdio.h>

int main()
{

	int c;
	int blank=0;


	for(; (c = getchar()) != EOF;)
	{
		if(c == ' ')
		{
			++blank;
			if(blank == 1)putchar(c);
		}
		else if(c != ' ')
		{
			blank = 0;
			putchar(c);
		}
	}



	return 0;
}
