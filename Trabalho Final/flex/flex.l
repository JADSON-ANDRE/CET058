  /*
   Sequencia de Comandos:
	flex sample*.lex
	gcc lex.yy.c -lfl
	./a.out 
  */

%{
	int counter = 0;

%}

RESERVADA      "and"|"as"|"assert"|"break"|"class"|"continue"|"del"|"elif"|"else"|"except"|"exec"|"finally"|"for"|"from"|"global"|"if"|"import"|"in"|"is"|"lambda"|"nonlocal"|"not"|"or"|"pass"|"raise"|"return"|"try"|"while"|"with"|"yield"|"True"|"False"|"None"
TIPO_DADOS     "int"|"float"|"str"|"list"
ATRIBUICAO     "="
OP_MATEMATICO  "+"|"-"|"*"|"/"|"^"|"//"|"%"
OP_RELACIONAL  ">"|"<"|"=="|">="|"<="|"!="
OP_LOGICO      "and"|"or"|"not"
OP_DOT         \.
NUMERO         [0-9]
SINAL          [-+]?
CARACTERE      [a-zA-Z]
TABULACAO      [ \t\n]
PARENTESES_O   "("
PARENTESES_C   ")"
COLCHETES_O    "["
COLCHETES_C    "]"
CHAVES_O       "{"
CHAVES_C       "}"
INICIO_BLOCO   ":"
VIRGULA        ","
STRING         \'([^\\\']|\\.)+\'
ID             ({CARACTERE}|_)+({CARACTERE}|{NUMERO}|_)*
INT            {NUMERO}+
FLOAT          {SINAL}({NUMERO}+\.{NUMERO}*|{NUMERO}*\.{NUMERO}+)
ELEMENT        {STRING}|{INT}|{FLOAT}|{ID}|{TIPO_DADOS}
LIST           {COLCHETES_O}{TABULACAO}*(({ELEMENT})({TABULACAO}*{VIRGULA}{TABULACAO}*({ELEMENT}){TABULACAO}*)*)*{COLCHETES_C}
FUNCAO_D       "def"{TABULACAO}*{ID}{TABULACAO}
FUNCAO_C       {ID}{TABULACAO}*{TUPLE}

%%
  /* 
  * Rules 
  */
{RESERVADA}       {printf("\n<Palavra reservada , %s >", yytext); counter++;}
{TIPO_DADOS}      {printf("\n<Tipo , %s >", yytext); counter++;}
{LIST}            {printf("\n<List , %s >", yytext); counter++;}
{PARENTESES_O}    {printf("\n<Abre parenteses , %s >", yytext); counter++;}
{PARENTESES_C}    {printf("\n<Fecha parenteses , %s >", yytext); counter++;}
{COLCHETES_O}     {printf("\n<Abre colchetes , %s >", yytext); counter++;}
{COLCHETES_C}     {printf("\n<Fecha colchetes , %s >", yytext); counter++;}
{CHAVES_O}        {printf("\n<Abre chaves , %s >", yytext); counter++;}
{CHAVES_C}        {printf("\n<Fecha chaves , %s >", yytext); counter++;}
{VIRGULA}         {printf("\n<Virgula , %s >", yytext); counter++;}
{INICIO_BLOCO}    {printf("\n<Inicio do bloco , %s >", yytext); counter++;}
{STRING}          {printf("\n<String , %s >", yytext); counter++;}
{INT}             {printf("\n<Inteiro , %s >", yytext); counter++;}
{FLOAT}           {printf("\n<Float , %s >", yytext); counter++;}
{OP_MATEMATICO}   {printf("\n<Operador matematico , %s >", yytext); counter++;}
{OP_RELACIONAL}   {printf("\n<Operador relacional , %s >", yytext); counter++;}
{ATRIBUICAO}      {printf("\n<Atribuicao , %s >", yytext); counter++;}
{OP_DOT}          {printf("\n<Operador dot , %s >", yytext); counter++;}
{ID}              {printf("\n<Identificador , %s >", yytext); counter++;}
<<EOF>>           return 0;
  
%%

int yywrap() {}

int main() {
  printf("Iniciando Análise Léxica...\n---\n");
  yylex();
  printf("\n\nForam encontradas %d ocorrências.\n", counter);
  printf("---\nÁnalise Finalizada!\n");
  return 0;
}
