// /**
// * <code> tapis.c </code> 
// * @author Haotian XUE  & HeJun CAO 
// * @date 31 janv. 2024
// * @Description
// *
// */

// #include <stdio.h>
// #include <stdlib.h>
// #include <string.h>
// #include <pthread.h>
// #include "tapis.h"



// void createTapis(tapis* tap, char* name_tapis, int capacity, pthread_cond_t* cv_full, pthread_cond_t* cv_empty){

//     // Initialisation
//     tap->capacity = capacity;
//     tap->cv_empty = cv_empty;
//     tap->cv_full = cv_full;
//     tap->name_tapis = creatCopy(name_tapis);
//     tap->file = malloc(sizeof(paquet*)* capacity);

// }

// void freeTapis(tapis * tap){
//     if(!tap){
//         free(tap->file);
//         free(tap);
//     }
// }


// void enfiler(tapis* tap, paquet* paquet){


// }

