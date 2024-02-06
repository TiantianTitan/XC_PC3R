INCL_DIR	= ../include
LIB_DIR		= ../lib

##############################################################
MAKE		= make
CC		= gcc
AR		= ar
RANLIB		= ranlib

##############################################################
LIBS		= -lfthread -lpthread
#LIBS		= -lposix4 -lfthread -lpthread # for solaris

##############################################################
##############################################################
CFLAGS		= -Wall -O3 -D_REENTRANT

############ Basic libraries #################################
LIB_NAME	= fthread
LIBFT         	= lib$(LIB_NAME).a

############ C code to executable code ########################
.c.o :
	$(CC) $(CFLAGS) -c $<

############ The h files ######################################
HFILES	      = fthread.h fthread_internal.h \
                event.h thread.h scheduler.h \
                broadcastlist.h locklist.h threadlist.h \
                environment.h trace.h verify.h

############ The C files ######################################
CFILES	      = event.c thread.c scheduler.c \
                broadcastlist.c locklist.c threadlist.c \
                environment.c automaton.c instruction.c

############ The object files ##################################
OBJS	      = event.o	thread.o scheduler.o \
                broadcastlist.o locklist.o threadlist.o \
                environment.o automaton.o instruction.o

############ Make entries ######################################
all: lib

lib: $(HFILE) $(OBJS)
	$(AR) r $(LIBFT) $(OBJS)
	- $(RANLIB) $(LIBFT)

install: lib
	cp $(LIBFT) $(LIB_DIR)
	cp fthread.h $(INCL_DIR)

clean:
	- rm -rf *.o *~ $(LIBFT) a.out

############ Auxiliary ########################################
TEST		= test.c

lines:
	wc -l $(CFILES) $(HFILES)

test:all
	$(CC) $(CFLAGS) -I. -L. $(TEST) $(LIBS)
	a.out

############ Dependencies ########################################
$(OBJS): $(HFILE)

############ end of makefile #####################################

