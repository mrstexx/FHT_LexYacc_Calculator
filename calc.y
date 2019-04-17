%{
#include <stdio.h>
int sym[26];
int yyerror(char *s);
int yylex();
%}

%token VARIABLE ASSIGN INTEGER NEWLINE
%left PLUS MINUS
%left TIMES DIVIDE
%left MODULO

%%

program: program statement
       | 
       ;

statement: expr NEWLINE { printf("%d\n", $1); }
         | VARIABLE ASSIGN expr NEWLINE { sym[$1] = $3; }
         | 
         ;

expr: INTEGER            { $$ = $1; }
      | VARIABLE         { $$ = sym[$1]; }
      | expr PLUS expr   { $$ = $1 + $3; }
      | expr TIMES expr  { $$ = $1 * $3; }
      | expr MINUS expr  { $$ = $1 - $3; }
      | expr DIVIDE expr { $$ = $1 / $3; }
      | expr MODULO expr { $$ = $1 % $3; }
      | '(' expr ')'     { $$ = $2; }
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
