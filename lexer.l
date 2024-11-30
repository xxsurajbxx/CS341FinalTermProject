%{
#include <stdio.h>
%}

Letter [a-zA-Z]
Digit [0-9]

%%

"program" {printf("PROGRAM\n");}
"end" {printf("END\n");}
"else" {printf("ELSE\n");}
"if" {printf("IF\n");}
"integer" {printf("INTEGER\n");}
"real" {printf("REAL\n");}
"character" {printf("CHARACTER\n");}
"print" {printf("PRINT\n");}
"len" {printf("LEN\n");}

"+" {printf("PLUS\n");}
"-" {printf("MINUS\n");}
"*" {printf("MULT\n");}
"/" {printf("DIV\n");}
"**" {printf("POW\n");}
"=" {printf("ASSOP\n");}
"==" {printf("EQ\n");}
"<" {printf("LTHAN\n");}
">" {printf("GTHAN\n");}
"//" {printf("CAT\n");}

![^\n]* {}

"," {printf("COMMA\n");}
"(" {printf("LPAREN\n");}
")" {printf("RPAREN\n");}
"::" {printf("DCOLON\n");}
"." {printf("DOT\n");}
"?" {printf("DEF\n");}

[ \n\t\r]* {}

{Letter}({Letter}|{Digit}|(_))* {printf("IDENT\n");}

{Digit}*"."{Digit}+ {printf("RCONST\n");}

{Digit}+ {printf("ICONST\n");}

((["](.)*["])|(['](.)*['])) {printf("SCONST\n");}

. {printf("ERR\n");}

%%
int yywrap(){}
int main(int argc, char **argv){
	++argv, --argc;
	if(argc>0) {
		yyin = fopen(argv[0],"r");
	}
	else {
		yyin = stdin;
	}
	yylex();
	printf("DONE\n");
	return 0;
}