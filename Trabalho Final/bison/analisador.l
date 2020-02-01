%{
  #include "parser.tab.h"
%}

RESERVADA       "as"|"assert"|"break"|"class"|"continue"|"print"|"del"|"elif"|"else"|"except"|"exec"|"finally"|"for"|"from"|"global"|"if"|"import"|"in"|"is"|"lambda"|"nonlocal"|"pass"|"raise"|"return"|"try"|"while"|"with"|"yield"|"True"|"False"|"None"
TIPO_DADOS      "int"|"float"|"complex"|"str"|"list"|"tuple"|"dict"
ATRIBUICAO      "="
EXPONENCIAL     "^"
MUL             "*"
DIV             "/"
DIV_INT         "//"
MOD             "\%"
ADD             "+"
SUB             "-"
OP_RELACIONAL   ">"|"<"|"=="|">="|"<="|"!="
OP_LOGICO       "and"|"or"|"not"
OP_DOT          \.
NUMERO          [0-9]
SINAL           [-+]?
CARACTERE       [a-zA-Z]
TABULACAO       [ \t\n]
PARENTESES_O    "("
PARENTESES_C    ")"
COLCHETES_O     "["
COLCHETES_C     "]"
CHAVES_O        "{"
CHAVES_C        "}"
INICIO_BLOCO    ":"
VIRGULA         ","
STRING          (\'([^\\\"]|\\.)*\')|(\"([^\\\"]|\\.)*\")
ID              ({CARACTERE}|_)+({CARACTERE}|{NUMERO}|_)*
INT             {SINAL}{NUMERO}+
FLOAT           {SINAL}({NUMERO}+\.{NUMERO}*|{NUMERO}*\.{NUMERO}+)
ELEMENT         {STRING}|{INT}|{FLOAT}|{ID}|{TIPO_DADOS}
LIST            {COLCHETES_O}{TABULACAO}*(({ELEMENT})({TABULACAO}*{VIRGULA}{TABULACAO}*({ELEMENT}){TABULACAO}*)*)*{COLCHETES_C}

%%
  /* 
  * Rules 
  */

{RESERVADA}      {strncpy(yylval.simbolo, yytext, 50); return RESERVADA;}
{PARENTESES_O}      {strncpy(yylval.simbolo, yytext, 50); return PARENTESES_O;}
{PARENTESES_C}      {strncpy(yylval.simbolo, yytext, 50); return PARENTESES_C;}
{COLCHETES_O}       {strncpy(yylval.simbolo, yytext, 50); return COLCHETES_O;}
{COLCHETES_C}       {strncpy(yylval.simbolo, yytext, 50); return COLCHETES_C;}
{CHAVES_O}          {strncpy(yylval.simbolo, yytext, 50); return CHAVES_O;}
{CHAVES_C}          {strncpy(yylval.simbolo, yytext, 50); return CHAVES_C;}
{INICIO_BLOCO}      {strncpy(yylval.simbolo, yytext, 50); return INICIO_BLOCO;}
{MOD}               {strncpy(yylval.simbolo, yytext, 50); return MOD;}
{OP_RELACIONAL}     {strncpy(yylval.simbolo, yytext, 50); return OP_RELACIONAL;}
{OP_LOGICO}         {strncpy(yylval.simbolo, yytext, 50); return OP_LOGICO;}
{ATRIBUICAO}        {return ATRIBUICAO;}
{EXPONENCIAL}       {return EXPONENCIAL;}
{MUL}               {return MUL;}
{DIV}               {return DIV;}
{DIV_INT}           {return DIV_INT;}
{ADD}               {return ADD;}
{SUB}               {return SUB;}
{INT}               {strncpy(yylval.simbolo, yytext, 50); return INT;}
{FLOAT}             {strncpy(yylval.simbolo, yytext, 50); return FLOAT;}
{ID}                {strncpy(yylval.simbolo, yytext, 50); return ID;}
"\n"                {return EOL;}

%%

int yywrap() {}