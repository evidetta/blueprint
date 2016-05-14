CC=g++
CFLAGS=-c -Wall
LDFLAGS=
LL=flex
LLFLAGS=
LLGEN=lex.yy.cc
CCSOURCES=main.cc $(LLGEN)
LLSOURCES=scanner.ll
OBJECTS=$(CCSOURCES:.cc=.o)
EXECUTABLE=blueprintc

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(EXECUTABLE)

.cc.o:
	$(CC) $(CFLAGS) $< -o $@

$(LLGEN): $(LLSOURCES)
	$(LL) $(LLFLAGS) $(LLSOURCES)

clean:
	rm $(LLGEN) $(OBJECTS) $(EXECUTABLE)
