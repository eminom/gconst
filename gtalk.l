
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define YYSTYPE char*
#include "y.tab.h"

int yylex(void);

//Ubuntu warns in this API
extern char *strdup(const char*);

//#define PRT(...)	{printf(__VA_ARGS__); puts("");}
#define PRT(...)
#define ERROR(...)  {fprintf(stderr, __VA_ARGS__); puts("");}

%}

%%

const {
	PRT("const");
	return TokenConst;
}

[a-zA-Z][a-zA-Z0-9_]*  {
	PRT("var");
	yylval = strdup(yytext);
	return Var;
}

[0-9]+\.?[0-9]* {
	PRT("number");
	yylval = strdup(yytext);
	return Number;
}

\(	{
	PRT("left-moon");
	return TokenLeftMoon;
}

\)  {
	PRT("right-moon");
	return TokenRightMoon;
}

= { 
	return TokenEqual;
}

[ \t\n\r]         ;

.   {ERROR("Unknown token\n");
		 abort();
}

%%

int yywrap(void){
	return 1;
}









