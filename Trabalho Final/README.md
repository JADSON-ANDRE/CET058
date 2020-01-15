# **Introdução**

> Um compilador é um programa que lê um programa escrito numa linguagem de alto
  nível (linguagem fonte), e traduz num programa equivalente em linguagem de baixo
  nível. Parte importante dessa tarefa é que o compilador tem a capacidade de
  detectar e reportar a presença de erros no código fonte.

# **Sintaxe da Linguagem**

### **Tipos de dados**

    1     # int
    1.2 ou 1.  # float
    'python'   # str
    [1, 2, 3]  # list

### **Atribuição**

    a = 1 # A variável a recebe o valor 1
    b, c, d = 2, 3, 4.5 # Variáveis recebem cada uma um dos valores
    e = ["cet058" "compiladores"]

### **Expressões Aritiméticas Básicas**

    X = Y + Z # Soma
    X = Y - Z # Subtração
    X = Y * Z # Multiplicação
    X = Y / Z # Divisão
    X = Y ^ Z # Potenciação

### **Expressões Relacionais e Lógicas**

    X == X # Igualdade
    X != Y # Diferença
    X > Y # Maior
    X < Z # Menor
    X >= Y # Maior ou igual
    X <= Z # Menor ou igual
    X or Y
    Y and Z

### **Estruturas Condicionais**

    if X > Y: # Se a condição for verdadeira, faça...
    elif X == X: # Senão se, faça
    else: # Senão, faça...

### **Estruturas de Repetição**

    nums = [1, 2, 3, 4, 5]
    # for
    for n in nums: print(n)
    for i, n in enumerate(nums): print(i, n)
    for i in range(len(nums)): print(nums[i])
    # while
    i = 0
    while i < len(nums): print(nums[i]) i = i + 1

## **Analisador Léxico**

> É feito uma varredura no código-fonte, onde,  caractere a carectere são analisados e produz uma sequência de símbolos (símbolos léxicos ou tokens), estes, podem ser manipulados mais facilmente por um parser (leitor de saída). Esse processo é conhecido como Analisador léxico. 
  É nessa fase que são reconhecidas as palavras reservadas, constantes, identificadores e outras palavras que pertencem a linguagem de programação.

   Exemplo:
 
    CARACTERE      [a-zA-Z]
    NUMERO         [0-9]
    ID             ({CARACTERE}|_)+({CARACTERE}|{NUMERO}|_)*

> Para o exemplo acima, temos a definição de um `CARACTERE`, um `NUMERO` e a partir desses blocos base, podemos criar elementos mais complexos como um identificador, definido pelo token `ID`.
  O token `ID` diz que um identificador deve ter seu inicio como um `CARACTERE` no mínimo e após isso o `ID` pode conter qualquer número de `CARACTERE` ou `NUMERO`.

## **Analisador Sintático**

> O programa lê a entrada de texto da esquerda para a direita e produz uma derivação mais à direita
  Neste caso, usamos o `BISON`, que juntamente com o `FLEX` realiza esse processo através do método `Look-Ahead-Left-Right`.
  O trabalho do `BISON` é realizar a analise de um conjunto de tokens gerados pelo `FLEX` e verificar se sua estrutura gramatical está de acordo com uma determinada **gramática formal**.
  Essa analise, gera uma estrutura de dados, normalmente uma árvore, que captura a hierarquia implícita dessa entrada.

    1+9*2

    <Integer, 1>
    <Operador Matematico, +>
    <Integer, 9>
    <Operador Matematico, *>
    <Integer, 2>

    [exp[1][+][factor[9][*][2]