#ifndef OUTIL_H_
#define OUTL_H_

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char* ConcatStr(char* src1, char* src2)
{
	int lengthSrc1 = strlen( src1 );
	int lengthSrc2 = strlen( src2 );
	char* res = (char*) malloc ( ( lengthSrc1 + lengthSrc2 + 1 ) * sizeof( char ) );
	for (int j=0; j < lengthSrc1; j++)
    {
        res [j] = src1[j];
    }
		
	for (int j = 0; src2[j] != '\0'; ++j, ++lengthSrc1)
    {
	    res [lengthSrc1] = src2[j];
    }
	
	res[lengthSrc1]='\0';
	return res;
}

int digitsInANumber(int i)
{
	int count =0;
	while( i != 0 )
	{
		count++;
		i /= 10;
	}
	return count;
}

char* IntToStr(int i)
{
	char* res = (char*) malloc( (digitsInANumber( i ) + 1 )*sizeof( char ) );
	sprintf(res, "%d", i);
	return res;
}


char* newcopy(const char* src)
{
	size_t n = strlen( src );
	char* dest = (char*) malloc( (strlen( src ) +1 ) * sizeof( char ) );
	for(size_t i = 0; i <= n; ++i) 
    {
        dest[ i ]=src[ i ];
    }
	return dest;
}

#endif