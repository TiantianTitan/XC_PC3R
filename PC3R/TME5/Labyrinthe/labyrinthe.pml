active proctype labyrinthe (){

// Par rapport au schéma fournit du TME5, on implémente ce ficher.

// ICI on donne un schéma simplifié
/*     y\x  0 1 2 3 4 
*           S ________
*       4  |  ____ | |
*       3  |_|     | |
*       2  |   XXXX| |
*       1  |X  ____  |
*       0  |X______| |
*                   E
*/


    initial:
        if 
            ::true -> printf("Début à la case 0_4. "); goto case_0_4
        fi

    case_2_0 : 
        if 
            ::true -> printf("Droite vers la case 2_1. "); goto case_2_1 
        fi

    case_3_0: 
        if 
            ::true -> printf("Haut vers la case 1_4. "); goto case_4_0 
        fi

    case_4_0: 
        if 
            ::true -> printf("Sortie. "); assert false 
            ::true -> printf("Droite vers la case 4_1. "); goto case_4_1
            ::true -> printf("Bas vers la case 3_0. "); goto case_3_0 
        fi


    case_0_1: 
        if 
            ::true -> printf("Haut vers la case 1_1. ");  goto case_1_1
            ::true -> printf("Droite vers la case 0_2. "); goto case_0_2 
        fi

    case_1_1: 
        if 
            ::true -> printf("Haut vers la case 2_1. "); goto case_2_1
            ::true -> printf("Droite vers la case 1_2. "); goto case_1_2 
            ::true -> printf("Bas vers la case 0_1. "); goto case_0_1
        fi

    case_2_1: 
        if 
            ::true -> printf("Haut vers la case 3_1. "); goto case_3_1
            ::true -> printf("Gauche vers la case 2_0. "); goto case_2_0 
            ::true -> printf("Bas vers la case 1_1. "); goto case_1_1
        fi

    case_3_1: 
        if 
            ::true -> printf("Droite vers la case 3_2. "); goto case_3_2
            ::true -> printf("Bas vers la case 2_1. "); goto case_2_1 
        fi

    case_4_1: 
        if 
            ::true -> printf("Gauche vers la case 4_0. "); goto case_4_0
            ::true -> printf("Droite vers la case 4_2. "); goto case_4_2
        fi


    case_0_2: 
        if 
            ::true -> printf("Gauche vers la case 0_1. "); goto case_0_1
            ::true -> printf("Droite vers la case 0_3. ");  goto case_0_3
        fi

    case_1_2: 
        if 
            ::true ->printf("Gauche vers la case 1_1. ");  goto case_1_1
            ::true ->printf("Droite vers la case 1_3. "); goto case_1_3
        fi

    case_3_2: 
        if 
            ::true -> printf("Gauche vers la case 3_1. "); goto case_3_1
            ::true -> printf("Droite vers la case 3_3. "); goto case_3_3
        fi

    case_4_2: 
        if 
            ::true -> printf("Gauche vers la case 4_1. "); goto case_4_1
            ::true -> printf("Droite vers la case 4_3. "); goto case_4_3
        fi


    case_0_3: 
        if 
            ::true -> printf("Gauche vers la case 0_2. "); goto case_0_2
        fi

    case_1_3: 
        if 
            ::true -> printf("Gauche vers la case 1_2. "); goto case_1_2
            ::true -> printf("Droite vers la case 1_4. "); goto case_1_4
        fi

    case_3_3: 
        if 
            ::true -> printf("Gauche vers la case 3_2. "); goto case_3_2 
            ::true -> printf("Haut vers la case 4_3. "); goto case_4_3
        fi

    case_4_3: 
        if 
            ::true -> printf("Bas vers la case 3_3. "); goto case_3_3
            ::true -> printf("Gauche vers la case 4_2. "); goto case_4_2
        fi

    case_0_4: 
        if 
            ::true -> printf("Haut vers la case 1_4. "); goto case_1_4 
        fi

    case_1_4:  
        if 
            ::true -> printf("Bas vers la case 0_4. "); goto case_0_4
            ::true -> printf("Gauche vers la case 1_3. "); goto case_1_3 
            ::true -> printf("Haut vers la case 2_4. "); goto case_2_4
        fi

    case_2_4:
        if 
            ::true -> printf("Haut vers la case 3_4. "); goto case_3_4
            ::true -> printf("Bas vers la case 1_4. "); goto case_1_4 
        fi

    case_3_4:
        if 
            ::true -> printf("Haut vers la case 4_4. "); goto case_4_4
            ::true -> printf("Bas vers la case 2_4. "); goto case_2_4 
        fi

    case_4_4: 
        if 
            ::true -> printf("Bas vers la case 3_4. "); goto case_3_4 
        fi
}