SOURCE = lex.yy.c\
	y.tab.c

all:
	yacc -d gtalk.y
	lex -l gtalk.l
	cc -std=c99 -o parser $(SOURCE) -lm

clean:
	rm -rf parser
	rm -f y.tab.c y.tab.h lex.yy.c

