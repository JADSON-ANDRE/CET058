
%{
/* Código C, use para #include, variáveis globais e constantes
 * este código ser adicionado no início do arquivo fonte em C
 * que será gerado.
 */
#include <stdio.h>
#include <stdlib.h>

typedef struct No {
	char token[50];
	int num_filhos;
	struct No** filhos;
} No;

typedef struct registro_da_tabela_de_simbolo {
    char token[50];
    char lexema[50];
    int tipo;
    int endereco;
} RegistroTS;

#define TAM_TABELA_DE_SIMBOLOS 1024
RegistroTS tabela_de_simbolos[TAM_TABELA_DE_SIMBOLOS];
int prox_posicao_livre = 0;
int prox_mem_livre = 0;

void liberar_no(No* no);
void imprimir_arvore(No* raiz);
No* allocar_no();
No* novo_no(char[50], No**, int);
No** alloca_filhos(int num_filhos);
void imprimir_tabela_de_simbolos(RegistroTS*);
void inserir_na_tabela_de_simbolos(RegistroTS);

%}
/* Declaração de Tokens no formato %token NOME_DO_TOKEN */
%union {
	int numero;
	char simbolo[50];
	struct No* no;
}

%token PARENTESES_O
%token PARENTESES_C
%token MOD
%token OP_RELACIONAL
%token OP_LOGICO
%token ATRIBUICAO
%token EXPONENCIAL
%token MUL
%token DIV
%token DIV_INT
%token ADD
%token SUB
%token INT
%token FLOAT
%token ID
%token EOL

%type<no> calc
%type<no> termo
%type<no> fator
%type<no> exp
%type<no> operador
%type<no> open
%type<no> close

%type<simbolo> ID
%type<simbolo> INT
%type<simbolo> FLOAT
%type<simbolo> MUL
%type<simbolo> MOD
%type<simbolo> DIV
%type<simbolo> DIV_INT
%type<simbolo> SUB
%type<simbolo> ADD
%type<simbolo> ATRIBUICAO
%type<simbolo> OP_RELACIONAL
%type<simbolo> OP_LOGICO
%type<simbolo> PARENTESES_O
%type<simbolo> PARENTESES_C

%%
/* Regras de Sintaxe */
calc: 
	/* empty */ {}
	| calc exp EOL	{
			imprimir_arvore($2); printf("]\n");
			imprimir_tabela_de_simbolos(tabela_de_simbolos);
			} 
exp: fator
	| exp ADD fator{
		No** filhos = alloca_filhos(3);
		filhos[0] = $1;
		filhos[1] = novo_no("+", NULL, 0);
		filhos[2] = $3;
		$$ = novo_no("exp", filhos, 3);
	}
	| exp SUB fator{
		No** filhos = alloca_filhos(3);
		filhos[0] = $1;
		filhos[1] = novo_no("-", NULL, 0);
		filhos[2] = $3;
		$$ = novo_no("exp", filhos, 3);
	}
	| exp operador fator{
		No** filhos = alloca_filhos(3);
		filhos[0] = $1;
		filhos[1] = $2;
		filhos[2] = $3;
		$$ = novo_no("exp", filhos, 3);
	}
	| exp ATRIBUICAO fator{
		No** filhos = alloca_filhos(3);
		filhos[0] = $1;
		filhos[1] = novo_no("=", NULL, 0);
		filhos[2] = $3;
		$$ = novo_no("exp", filhos, 3);
	}
	| open exp close{
		No** filhos = alloca_filhos(3);
		filhos[0] = $1;
		filhos[1] = $2;
		filhos[2] = $3;
		$$ = novo_no("exp", filhos, 3);
	}
;

fator: termo           
	| fator MUL termo {                         
		No** filhos = alloca_filhos(3);
		filhos[0] = $1;
		filhos[1] = novo_no("*", NULL, 0);
		filhos[2] = $3;
		$$ = novo_no("fator", filhos, 3);
	}
	| fator DIV termo {                             
		No** filhos = alloca_filhos(3);
		filhos[0] = $1;
		filhos[1] = novo_no("/", NULL, 0);
		filhos[2] = $3;
		$$ = novo_no("fator", filhos, 3);
	}
	| fator DIV_INT termo {
		No **filhos = alloca_filhos(3);
		filhos[0] = $1;
		filhos[1] = novo_no("//", NULL, 0);
		filhos[2] = $3;
		$$ = novo_no("fator", filhos, 3);
	}
	| fator MOD termo {
		No **filhos = alloca_filhos(3);
		filhos[0] = $1;
		filhos[1] = novo_no("%", NULL, 0);
		filhos[2] = $3;
		$$ = novo_no("fator", filhos, 3);
	}
;

operador : OP_RELACIONAL { $$ = novo_no($1, NULL, 0); }
	| OP_LOGICO { $$ = novo_no($1, NULL, 0); }
;

open : PARENTESES_O { $$ = novo_no($1, NULL, 0); };
close : PARENTESES_C { $$ = novo_no($1, NULL, 0); };

termo : INT { $$ = novo_no($1, NULL, 0); }
	| FLOAT { $$ = novo_no($1, NULL, 0); }
	| ID { $$ = novo_no($1, NULL, 0); }
;

%%
/* Código C geral, será adicionado ao final do código fonte 
 * C gerado.
 */
No** alloca_filhos(int num_filhos){
	return (No **)malloc(sizeof(No *) * num_filhos);
}
No* allocar_no() {
	return (No*) malloc(sizeof(No));
}
void liberar_no(No* no) {
	free(no);
}
No* novo_no(char token[50], No** filhos, int num_filhos) {
	No* no = allocar_no();
	snprintf(no->token, 50, "%s", token);
	no->filhos = filhos;
	no->num_filhos= num_filhos;
	return no;
}
void imprimir_arvore(No* raiz) {
	if (raiz->filhos != NULL) {	
	printf("[%s", raiz->token);	
		for (int n = 0 ; n < raiz->num_filhos; n++){
			imprimir_arvore(raiz->filhos[n]);
		}
	} else{
		printf("[%s]", raiz->token);
	}
}

void inserir_na_tabela_de_simbolos(RegistroTS registro) {
    if (prox_posicao_livre == TAM_TABELA_DE_SIMBOLOS) {
        printf("Erro! Tabela de Símbolos Cheia!");
        return;
    }
    tabela_de_simbolos[prox_posicao_livre] = registro;
    prox_posicao_livre++;
}

void imprimir_tabela_de_simbolos(RegistroTS *tabela_de_simbolos) {
    printf("----------- Tabela de Símbolos ---------------\n");
    for(int i = 0; i < prox_posicao_livre; i++) {
        printf("{%s} -> {%s} -> {%d} -> {%x}\n", tabela_de_simbolos[i].token, \
                                               tabela_de_simbolos[i].lexema, \
                                               tabela_de_simbolos[i].tipo, \
                                               tabela_de_simbolos[i].endereco);
        printf("---------\n");
    }
    printf("----------------------------------------------\n");
}

int main(int argc, char** argv) {
	yyparse();
}
yyerror(char *s) {
	fprintf(stderr, "error: %s\n", s);
}
