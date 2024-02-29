mtype { ROUGE, ORANGE, VERT, INDETERMINEE};


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
    couleur = ROUGE;
    if
    :: true -> goto gogreen;
    :: true -> goto gored;  
    :: true -> goto fault;
    fi

    gogreen:
    couleur = VERT
    if
    :: true -> goto goorange;
    :: true -> goto gogreen;
    :: true -> goto fault;
    fi

    goorange:
    couleur = ORANGE
    if
    :: true -> goto gored;
    :: true -> goto goorange;
    :: true -> goto fault;
    fi


    fault:
    clignotant = true;


    fault_loop:
    couleur = ORANGE;
    if
    :: true -> goto fault_loop;
    fi


}