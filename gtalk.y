
%{

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>

#define YYSTYPE	char*
int yylex(void);
void yyerror(char *);
extern int yylineno;

%}

%token Var
%token Number
%token TokenConst
%token TokenLeftMoon
%token TokenRightMoon
%token TokenEqual

%%

Program:
ConstDefsOp{}

ConstDefsOp:
ConstDefs ConstDefsOp{}
|{}

ConstDefs:
TokenConst TokenLeftMoon StatementsOp TokenRightMoon {
	//printf("matched\n");
};

StatementsOp:
SingleStatement StatementsOp{}
|{};

SingleStatement:
Var TokenEqual Number {
	printf("  %s = %s, \n", $1, $3);
}

%%

void yyerror(char *err){
	printf("error:%s, line %d\n", err, yylineno);
}

int main(int argc, char **argv){
	if(argc != 2){
		printf("arguments needed\n");
		return -1;
	}
	const char *name = argv[1];
	printf("%s = ReadOnly { \n", name);
	if(yyparse()){
		fprintf(stderr,"error parsing\n");
		return -1;
	}
	printf("}\n");
	return 0;
}
