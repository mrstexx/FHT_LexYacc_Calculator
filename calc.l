%{
extern int yylval; 
extern int sym[];
int yyerror(char *s);
#include "y.tab.h"
%}

%%

[a-z]   {
            yylval = *yytext - 'a';
            return VARIABLE;
        }

[0-9]+  {  
            yylval = atoi(yytext);
            return INTEGER;
        }

[()]    {
            return *yytext;
        }

":="    return ASSIGN;
"+"     return PLUS;
"*"     return TIMES;
"-"     return MINUS;
"/"     return DIVIDE;
"%"     return MODULO;

"\n"    return NEWLINE;

[ \t]   ;

.       yyerror("Invalid character");

%%

int yywrap() {
    return 1;
}
