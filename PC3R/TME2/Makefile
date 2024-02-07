# Définition du compilateur
CC=gcc

# Options de compilation
CFLAGS=-Wall -Wextra -g

# Liens vers les bibliothèques nécessaires, en ajoutant le nom de la bibliothèque
# Pas besoin de -L si libfthread.a est dans le répertoire courant
LDFLAGS=-L. -lfthread -lpthread  # -lpthread ajouté car fthread pourrait dépendre de pthread

# Nom de l'exécutable à générer
EXEC=mon_programme

# Objets nécessaires pour l'exécutable
OBJ = tme2.o paquet.o

# Règle principale
all: $(EXEC)

# Règle pour l'exécutable
$(EXEC): $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)

# Règle pour les fichiers objets
%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

# Règle pour nettoyer les fichiers compilés
clean:
	rm -f $(OBJ) $(EXEC)
