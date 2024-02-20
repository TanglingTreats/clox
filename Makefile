CC = gcc
CFLAGS = -c -Wall -std=c99
ODIR = ./lib

main: main.o common.o memory.o chunk.o debug.o | lib_dir
	$(CC) main.o common.o memory.o chunk.o debug.o -o clox

main.o: main.c
	$(CC) $(CFLAGS) main.c --outdir=$(ODIR)/

common.o: common.h
	$(CC) $(CFLAGS) common.h --outdir=$(ODIR)/

memory.o: memory.c
	$(CC) $(CFLAGS) memory.c --outdir=$(ODIR)/

chunk.o: chunk.c
	$(CC) $(CFLAGS) chunk.c --outdir=$(ODIR)/

debug.o: debug.c
	$(CC) $(CFLAGS) debug.c --outdir=$(ODIR)/

lib_dir:
	mkdir -p $(ODIR)


