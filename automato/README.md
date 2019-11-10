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

## Componentes

| Nome                | Matrícula      |
| :------------------ | -------------: |
| Eglom Sóstenes      | 201511456      |
| Jadson André        | 201310457      |

## Metodologia

A atividade foi desenvolvida em Python, pela familiaridade com a mesma.
<p>O programa recebe a expressão do usuário ( via teclado) e faz a identificação dos mais variados tokens.</p>

## Executando

Para executar, basta fazer o download do *automato.py* e executar o seguinte comando:
`$ python3 automato.py`
<p>Em seguida, basta digitar a expressão desejada.</p>

## Conclusão

Um dificuldade encontrada foi o tratamento do 'espaço', desta forma, ao digitar a expressão, a mesma precisa ter um 'espaço' após cada símbolo ou a mesma será identificada de acordo com o primeiro símbolo da expressão.
```
Exemplo: a+b
```

```
Saída: <identificador,a+b>
```
Portanto, para que seja feita a identificação correta dos tokens, a entrada deve ser: `a + b`