
// // Pour obtenir un bon schéma
// // spin -a .pml
// // gcc -o pan pan.c
// //./pan -D| dot -Tps | ps2pdf - pan.pdf
// // evince pan.pdf

#define MAX_QUEUE_SIZE 5 // Example queue size limit

mtype = {V, R, C, DONE};

// Definition of channels for communication
chan prodToGest = [0] of {mtype, int};
chan gestToOuv = [0] of {mtype, int};
chan ouvToGest = [0] of {mtype, int};
chan ouvToColl = [0] of {mtype, int};

// Counters for queue sizes
int gestQueueSize = 0;

// Producteur
proctype Producteur() {
    int id = 1;
    do
    :: true ->
        if
        :: (gestQueueSize < MAX_QUEUE_SIZE) ->
            prodToGest ! V, id;
            id = id + 1;
            gestQueueSize++;
        :: else -> skip; // Wait if queue is full
        fi;
    od;
}

// Gestionnaire
proctype Gestionnaire() {
    mtype statut; int id;
    do
    :: prodToGest ? statut, id ->
        if
        :: (gestQueueSize > 0) -> // Ensure queue is not empty
            gestToOuv ! statut, id;
            gestQueueSize--;
        :: else -> skip;
        fi;
    :: ouvToGest ? statut, id ->
        if
        :: statut == C ->
            ouvToColl ! statut, id;
        :: else ->
            if
            :: (gestQueueSize < MAX_QUEUE_SIZE) ->
                gestToOuv ! statut, id;
                gestQueueSize++;
            :: else -> skip; // Prevent worker starvation
            fi;
        fi;
    od;
}

// Ouvrier
proctype Ouvrier() {
    mtype statut; int id;
    do
    :: gestToOuv ? statut, id ->
        // Packet operation simulation (Initialize or Work)
        if
        :: statut == V ->
            // Simulate initializing packet
            ouvToGest ! R, id;
        :: statut == R ->
            // Simulate working on packet
            ouvToGest ! C, id;
        fi;
    od;
}

// Collecteur
proctype Collecteur() {
    mtype statut; int id;
    do
    :: ouvToColl ? statut, id ->
        // Simulate converting packet content to string and collecting
        printf("Packet %d collected\n", id);
    od;
}

// Initialization
init {
    run Producteur();
    run Gestionnaire();
    run Ouvrier();
    run Collecteur();
}
