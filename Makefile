IDIR=./include
CC=gcc
CFLAGS=-I.

ODIR := obj

LIBS=-lm

_DEPS = memory.h chunk.h debug.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ =  memory.o chunk.o debug.o main.o 
OBJ =  $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

all: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

$(OBJ): | $(ODIR)

$(ODIR):
	mkdir -p $(ODIR)


.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~



