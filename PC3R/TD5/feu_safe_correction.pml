mtype { ROUGE, ORANGE, VERT, INDETERMINEE};

chan observe = [0] of {mtype,bool}

active proctype feu(){

    bool clignotant
    mtype couleur = INDETERMINEE

    

    initial:
    couleur = ORANGE;
    clignotant = true;
    
    if
    :: true -> clignotant = false; goto gored;
    :: true -> goto initial;
    fi


    gored:
    atomic{
        couleur = ROUGE
        observe!couleur,clignotant
    }
    if
    :: true -> goto gogreen;
    :: true -> goto gored;  
    :: true -> goto fault;
    fi

    gogreen:
    atomic{
        couleur = VERT
        observe!couleur,clignotant
    }
    if
    :: true -> goto goorange;
    :: true -> goto gogreen;
    :: true -> goto fault;
    fi

    goorange:
    atomic{
        couleur = ORANGE
        observe!couleur,clignotant
    }
    if
    :: true -> goto gored;
    :: true -> goto goorange;
    :: true -> goto fault;
    fi


    fault:
    atomic{
        couleur = ORANGE;
        clignotant = true;
        observe ! couleur, clignotant
    }
    if
    :: true -> goto fault  
    fi 


}



active proctype observateur(){


    mtype precedent = INDETERMINEE;
    mtype couleur = INDETERMINEE;
    bool clignote = false;


    do
    :: atomic{couleur = ORANGE ->
            assert(clignote == true || precedent != ROUGE);
            precedent = ORANGE
    } ;
    :: atomic{couleur = VERT ->
            assert(clignote == true || precedent != ORANGE);
            precedent = VERT
    } ;
    :: atomic{couleur = ROUGE ->
                assert(clignote == true || precedent != VERT);
                precedent = ROUGE
    } ;
    :: atomic{clignote == true -> assert(couleur == ORANGE)}
    od

}
