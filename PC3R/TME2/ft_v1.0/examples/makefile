CC 	= gcc -Wall -O3 -D_REENTRANT -I ../include -L ../lib
LIBS	= -lfthread -lpthread

############ C code to executable code #####################
.c :
	$(CC) $< $(LIBS)
	a.out

####################
all:
	echo "type: make x"

####################
clean:
	rm -f *~ a.out

####################