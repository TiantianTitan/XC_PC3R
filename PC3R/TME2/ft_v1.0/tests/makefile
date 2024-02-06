####################################################
CC	= gcc -Wall -O3 -D_REENTRANT -I../include -L../lib

LIBS	= -lfthread -lpthread
#LIBS	= -posix4 -lfthread -lpthread # for solaris

############ C code to executable code #####################
.c :
	$(CC) $< $(LIBS)
	a.out

####################################################
all:
	aux/testAll

####################################################
clean:
	rm -f *~ a.out

####################################################