#include <stdio.h>

int main()
{
	int c;

	while((c = getchar() ))
	{
		printf("%d", c != EOF);
		putchar(c);
	}

	return 0;
}
