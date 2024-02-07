#ifndef OUTIL_H_
#define OUTIL_H_

#include <stdlib.h>
#include <stdio.h>
#include <string.h>



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