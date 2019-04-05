#include <stdio.h>
#define MAXLINE 1000

int getlinee(char line[], int maxline);
void copy(char longest[], char line[]);

int main()
{
	int len;
	char line[MAXLINE];
	char longest[MAXLINE];
	int max =0;

	while((len = getlinee(line, MAXLINE)) > 0)
	{
		if(len > max)
		{
			max = len;
			copy(longest, line);
		}
	}
	if(max > 0)
	{
		printf("%s length: %d", longest, max);
	}

	return 0;
}

int getlinee(char s[], int lim)
{
	int c,i;

	for(i=0; i<lim-1 && (c=getchar()) !=EOF && c != 
			'\n'; ++i)
		s[i] = c;
	if(c == '\n') {
		s[i] = c;
		++i;
	}
	s[i] = '\0';
	return i;
}

void copy(char to[], char from[])
{
	int i;

	for(i=0;(to[i] = from[i]) != '\0';++i);
}


