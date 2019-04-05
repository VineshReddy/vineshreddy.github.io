#include <stdio.h>

#define LOWER 0
#define UPPER 300
#define STEP 20

float tempConversion(int fahr); 

int main()
{
	int fahr; 
	for(fahr = UPPER;fahr >= LOWER;fahr = fahr - STEP)
	{
		printf("%d %6.2f \n", fahr, tempConversion(fahr));
	}

	return 0;
}


float tempConversion(int fahr)
{	
	return (5.0/9.0) * (fahr - 32);
}

