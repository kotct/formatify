CXX=gcc

CFLAGS=-I. -fPIC
LFLAGS=-ggdb
SLFLAGS=$(LFLAGS) -shared
XLFLAGS=$(LFLAGS) -pie

LIBFILE=lib/libformatify.so
BINFILE=formatify

all: formatify

$(LIBFILE): obj/parse.o
	$(CXX) $(SLFLAGS) -o $@ $^

$(BINFILE): obj/formatify.o $(LIBFILE)
	$(CXX) $(XLFLAGS) -o $@ $^

obj/%.o:
	$(CXX) $(CFLAGS) -c -o $@ $(filter-out %.h,$^)

obj/parse.o: src/parse.c src/parse.h
obj/formatify.o: src/formatify.c src/formatify.h
