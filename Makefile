CFLAGS=-Wall -Wno-strict-aliasing -std=gnu11 -g -I. -O0
OBJS=cpp.o debug.o dict.o gen.o lex.o vector.o parse.o buffer.o map.o \
     error.o path.o file.o set.o encoding.o
override CFLAGS += -DBUILD_DIR='"$(shell pwd)"'

omam8-8cc: 8cc.h main.o $(OBJS)
	cc -o $@ main.o $(OBJS) $(LDFLAGS)

$(OBJS) main.o: 8cc.h keyword.inc

clean: cleanobj
	rm -f omam8-8cc

cleanobj:
	rm -f *.o *.s

all: omam8-8cc

.PHONY: clean cleanobj all
