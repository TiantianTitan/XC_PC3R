
CC=gcc

CFLAGS=-Wall -Wextra -g

LDFLAGS=-L. -lfthread -lpthread 

EXEC=mon_programme

OBJ = tme2.o

all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

clean:
	rm -f $(OBJ) $(EXEC)
