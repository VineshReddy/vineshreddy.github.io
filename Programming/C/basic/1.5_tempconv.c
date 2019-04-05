#include <stdio.h>

#define LOWER 0
#define UPPER 300
#define STEP 20

int main()
{
	int fahr; float celsius; 
	for(fahr = UPPER;fahr >= LOWER;fahr = fahr - STEP)
	{
		celsius = (5.0/9.0) * (fahr -32);
		printf("%d %6.2f \n", fahr, celsius);
	}

	return 0;
}
