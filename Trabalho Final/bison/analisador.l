%{
  #include "parser.tab.h"
%}

MULTILINE_COMM  \"{3}[\x00-\x7F]*\"{3}
RESERVADA       "as"|"assert"|"break"|"class"|"continue"|"del"|"elif"|"else"|"except"|"exec"|"finally"|"for"|"from"|"global"|"if"|"import"|"in"|"is"|"lambda"|"nonlocal"|"pass"|"raise"|"return"|"try"|"while"|"with"|"yield"|"True"|"False"|"None"
TIPO_DADOS      "int"|"float"|"complex"|"str"|"list"|"tuple"|"dict"
ATRIBUICAO      "="
EXPONENCIAL     "**"
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
FUNCAO_D        "def"{TABULACAO}+{ID}{TABULACAO}*{TUPLE}
FUNCAO_C        {ID}{TABULACAO}*{TUPLE}

%%
  /* 
  * Rules 
  */

{PARENTESES_O}      {strncpy(yylval.simbolo, yytext, 50); return PARENTESES_O;}
{PARENTESES_C}      {strncpy(yylval.simbolo, yytext, 50); return PARENTESES_C;}
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