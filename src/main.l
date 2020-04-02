%{
#include<stdio.h>
#include<string.h>
%}
LETRA   [a-zA-Z]
DIGITO  [0-9] 
SIMBOLO [-._]

PALAVRA  {LETRA}+
INTEIRO  {DIGITO}+
MESCLA {PALAVRA}({SIMBOLO}{PALAVRA})*
MUITO {PALAVRA}?{INTEIRO}{PALAVRA}?
FIM ([.]{PALAVRA})+
%%
{MESCLA}[@]{MESCLA}{FIM}? { printf("%s\n", yytext); }
{MUITO}[@]{MUITO}{FIM} {  printf("%s\n", yytext); }
[[:space:]]+ ;
[^[:space:]]+ ;
[.\n]* ;
%%

int main(){
	yylex();
	return 0;
}
