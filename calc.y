%{
#include <stdio.h>
#include <string.h>
int sym[26];
int yyerror(char *s);
int yylex();
%}

%token VARIABLE ASSIGN INTEGER NEWLINE
%left COMMA
%left SMALLER SMALLER_EQUAL EQUAL NOT_EQUAL BIGGER_EQUAL BIGGER CONDITION OPERATOR
%left MINUS PLUS
%left TIMES DIVIDE MODULO
%left OPEN_BRACES CLOSE_BRACES
%left MIN MAX

%%

program: program statement
       |
       ;

statement: expr NEWLINE { printf("%d\n", $1); }
         | VARIABLE ASSIGN expr NEWLINE { sym[$1] = $3; }
         ;

expr: INTEGER                         { $$ = $1; }
      | VARIABLE                      { $$ = sym[$1]; }
      | expr PLUS expr                { $$ = $1 + $3; }
      | expr TIMES expr               { $$ = $1 * $3; }
      | expr MINUS expr               { $$ = $1 - $3; }
      | expr DIVIDE expr              { if ($3 == 0) {
                                          $$ = yyerror("Cannot divide by zero!");
                                        } else
                                          $$ = $1 / $3;
                                      }
      | expr MODULO expr              { $$ = $1 % $3; }
      | PLUS expr                     { $$ = $2; }
      | MINUS expr                    { $$ = -$2; }
      | OPEN_BRACES expr CLOSE_BRACES { $$ = $2; }
      | expr SMALLER expr             { $$ = $1 < $3; }
      | expr SMALLER_EQUAL expr       { $$ = $1 <= $3; }
      | expr EQUAL expr               { $$ = $1 == $3; }
      | expr NOT_EQUAL expr           { $$ = $1 != $3; }
      | expr BIGGER_EQUAL expr        { $$ = $1 >= $3; }
      | expr BIGGER expr              { $$ = $1 > $3; }
      | expr CONDITION expr OPERATOR expr  { if ($1 != 0) $$ = $3; else $$ = $5; }
      | MIN OPEN_BRACES min CLOSE_BRACES   {
                                              $$ = $3;
                                           }
      | MAX OPEN_BRACES max CLOSE_BRACES   {
                                              $$ = $3;
                                           }
      ;

min: expr             { $$ = $1; }
   | min COMMA expr   {
                        if ($1 < $3) $$ = $1; else $$ = $3;
                      }
   ;

max: expr             { $$ = $1; }
   |  max COMMA expr  {
                        if ($1 < $3) $$ = $3; else $$ = $1;
                      }
   ;
%%

int yyerror(char *s) {
  fprintf(stderr, "%s\n", s);
  return 0;
}

int main() {
  yyparse();
  return 0;
}
