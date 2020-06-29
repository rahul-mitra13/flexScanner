# Makefile for Lexical Analyzer
#
# Maintain that following definitions:
#        HDR        all header files (*.h) that you create
#        HDRg       all header files generated by programs (e.g., flex and bison)
#        SRC        all C source files (*.c) that you create
#        SRCg       all C source files generated by programs
#        OBJ        all object files (*.o) required to load your progrms
#        GRD        all files required for grading
#
# Use the following make targets:
#        pmc        to build your program (into 'pmc')
#        grade      to hand in your program for grading
#        clean      to remove files generated by programs
#

HDR = msg.h  
HDRg = 
SRC = pmc.c 
SRCg = lex.yy.c 
OBJ = pmc.o lex.yy.o 
GRD = ${HDR} ${SRC} scanner.l Makefile 

CC = gcc
CFLAGS = -Wall -Wno-unused-function

pmc: ${OBJ} 
	${CC} ${CFLAG} -o pmc ${OBJ} -L/home/pyoon/flex/lib -lfl

clean: 
	rm -f pmc myscanner.tar ${HDRg} ${SRCg} ${OBJ}

grade:
	tar cvf - ${GRD} > myscanner.tar

print:
	enscript -2rG ${GRD}

# making scanner
lex.yy.c: scanner.l
	flex scanner.l