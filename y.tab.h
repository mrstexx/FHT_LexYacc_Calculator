/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    VARIABLE = 258,
    ASSIGN = 259,
    INTEGER = 260,
    NEWLINE = 261,
    COMMA = 262,
    SMALLER = 263,
    SMALLER_EQUAL = 264,
    EQUAL = 265,
    NOT_EQUAL = 266,
    BIGGER_EQUAL = 267,
    BIGGER = 268,
    CONDITION = 269,
    OPERATOR = 270,
    MINUS = 271,
    PLUS = 272,
    TIMES = 273,
    DIVIDE = 274,
    MODULO = 275,
    OPEN_BRACES = 276,
    CLOSE_BRACES = 277,
    MIN = 278,
    MAX = 279
  };
#endif
/* Tokens.  */
#define VARIABLE 258
#define ASSIGN 259
#define INTEGER 260
#define NEWLINE 261
#define COMMA 262
#define SMALLER 263
#define SMALLER_EQUAL 264
#define EQUAL 265
#define NOT_EQUAL 266
#define BIGGER_EQUAL 267
#define BIGGER 268
#define CONDITION 269
#define OPERATOR 270
#define MINUS 271
#define PLUS 272
#define TIMES 273
#define DIVIDE 274
#define MODULO 275
#define OPEN_BRACES 276
#define CLOSE_BRACES 277
#define MIN 278
#define MAX 279

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
