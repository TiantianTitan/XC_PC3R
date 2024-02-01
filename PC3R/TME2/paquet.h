/**
* <code> paquet.h </code> 
* @author Haotian XUE  & HeJun CAO 
* @date 31 janv. 2024
* @Description
*
*/


#ifndef PAQUET_H_
#define PAQUET_H_


typedef struct paquet
{
    char* name;
} paquet;


char* creatCopy(const char* chaine){
    size_t size = strlen(chaine);
    // size + 1 -> str + "\0"
    char* copy = malloc(sizeof(char)*(size+1));
    for(int i = 0; i < size+1 ; i++){
        copy[i] = chaine[i];
    }
    return copy;
}

void createPaquet(paquet * p,const char* chaine);
void freePaquet(paquet * p);






#endif /* PAQUET_H_ */