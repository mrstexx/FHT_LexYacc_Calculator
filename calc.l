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

        
0x[0-9a-fA-F]+  {
                    yylval = (int)strtol(yytext, NULL, 0);
                    return INTEGER;
                }
                
":="    return ASSIGN;
"+"     return PLUS;
"*"     return TIMES;
"-"     return MINUS;
"/"     return DIVIDE;
"%"     return MODULO;
"<"     return SMALLER;
"<="    return SMALLER_EQUAL;
"=="    return EQUAL;
"!="    return NOT_EQUAL;
">="    return BIGGER_EQUAL;
">"     return BIGGER;
"?"     return CONDITION;
":"     return OPERATOR;
"min"   return MIN;
"max"   return MAX;

"\n"    return NEWLINE;

[ \t]   ;

.       yyerror("Invalid character");

%%

int yywrap() {
    return 1;
}
