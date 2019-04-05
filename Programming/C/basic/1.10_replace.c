#include <stdio.h>

int main()
{

	int c;
	int blank=0, tab=0, newLine = 0;


	for(; (c = getchar()) != EOF;)
	{
		if(c == '\t')
		{
			putchar('\\');
			putchar('t');
		}
		else if(c == '\b')
		{

			putchar('\\');
			putchar('b');
		}
		else if(c == '\\')
		{
			putchar('\\');
			putchar('\\');
		}
		else putchar(c);
	}



	return 0;
}
