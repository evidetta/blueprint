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
BINROOT=./bin

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(BINROOT)/$(EXECUTABLE)

.cc.o:
	$(CC) $(CFLAGS) $< -o $@

$(LLGEN): $(LLSOURCES)
	$(LL) $(LLFLAGS) $(LLSOURCES)

clean:
	rm $(LLGEN) $(OBJECTS) $(BINROOT)/$(EXECUTABLE)
