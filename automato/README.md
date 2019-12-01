# Projeto - Parte 1

Automato que reconhece os tokens referentes a uma expressão matemática do tipo:

```
a + b - c
a * c - a
a - b * c
```

Os tokens devem são exibidos no formato `<nome_do_token, lexema>`, exemplo:

```
<soma,>
<identificador, a>
<identificador, b>
```

## Componente

| Nome                | Matrícula      |
| :------------------ | -------------: |
| Jadson André        | 201310457      |

## Metodologia

A atividade foi desenvolvida em Python, pela familiaridade com a mesma.
<p>O programa recebe a expressão do usuário ( via teclado) e faz a identificação dos tokens.</p>

## Executando

Para executar, basta fazer o download do *automato.py* e executar o seguinte comando:
`$ python3 automato.py`
<p>Em seguida, basta digitar a expressão desejada.</p>

## Conclusão

Um dificuldade encontrada foi o tratamento do 'espaço', desta forma, ao digitar a expressão, a mesma NÂO pode ter um 'espaço' após cada símbolo ou ocorrerá um erro de execução.
```
Exemplo: a + b
```

```
Saída: ERROR!
```
Portanto, para que seja feita a identificação correta dos tokens, a entrada deve ser: `a+b`

Outro problema (ainda tentando solucionar), o programa parece sair do loop após identificar um token do tipo OPERADOR.
```
Exemplo: a+b
```

```
Saída: <Identificador, a>
       <soma, >
       None
```