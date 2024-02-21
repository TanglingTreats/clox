IDIR=./include
CC=gcc
CFLAGS=-I.

ODIR := obj

LIBS=-lm

_DEPS = vm.h value.h memory.h chunk.h debug.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ =  vm.o value.o memory.o chunk.o debug.o main.o 
OBJ =  $(patsubst %,$(ODIR)/%,$(_OBJ))

clox: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(OBJ): | $(ODIR)

$(ODIR):
	mkdir -p $(ODIR)


.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~



