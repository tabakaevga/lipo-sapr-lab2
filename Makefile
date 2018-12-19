# compiler
CC=g++
CFLAGS=-c
OFLAG=-o
# CppUnit 
CPPUNIT_FLAGS=-I$CPPUNIT_HOME/include -L$CPPUNIT_HOME/lib -lcppunit
# PCRE 
PCRE_FLAG=-lpcrecpp

# directory structure:
# object files 
OBJ=obj
# Test files 
TEST=test
# Source files
SRC=src
# binaries
SFILE=script.sh
OFILE=main
TESTFILE=test/test_find_macros

all: $(OFILE)

$(OFILE): $(OBJ)/main.o $(OBJ)/MacrosFinder.o $(OBJ)/MacrosFinderTest.o
	$(CC) $(OBJ)/main.o $(OBJ)/MacrosFinder.o $(OBJ)/MacrosFinderTest.o $(PCRE_FLAG) $(CPPUNIT_FLAGS) $(CPPFLAGS) $(OFLAG) $(OFILE)
	./$(OFILE) -t < $(TEST)/test_find_macros
	
$(OBJ)/main.o: $(SRC)/main.cpp
	$(CC) $(CFLAGS) $(SRC)/main.cpp $(CPPFLAGS) $(OFLAG) $(OBJ)/main.o
	
$(OBJ)/MacrosFinder.o: $(SRC)/MacrosFinder.cpp
	$(CC) $(CFLAGS) $(SRC)/MacrosFinder.cpp $(CPPFLAGS) $(OFLAG) $(OBJ)/MacrosFinder.o
	
$(OBJ)/MacrosFinderTest.o: $(SRC)/MacrosFinderTest.cpp
	$(CC) $(CFLAGS) $(SRC)/MacrosFinderTest.cpp $(CPPFLAGS) $(OFLAG) $(OBJ)/MacrosFinderTest.o
	
test: $(OFILE)

compare: $(OFILE)
	./$(SFILE) < $(TESTFILE) > fsout
	./$(OFILE) < $(TESTFILE) | sort > fcout
	diff fsout fcout

clean:
	rm -rf $(OFILE) $(OBJ)/* fcout fsout