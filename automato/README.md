# Projeto - Parte 1

### Componentes

| Nome                | Matrícula      |
| :------------------ | -------------: |
| Eglom Sostenes      | 201511456      |
| Jadson André        | 201310457      |

### Metodologia

O exercício foi desenvolvido na linguagem Python, pela familiaridade com a mesma. O programa recebe a expressão do usuário e faz a identificação de tokens.

### Executando

Para executar, basta fazer o download do *automato.p* e executar o seguinte comando:
**$ python3 automato.py**

### Conclusão

Um dificuldade encontrada foi o tratamento do 'espaço', desta forma, a expressão precisar ter um 'espaço' após cada símbolo ou a mesma será identificada de acordo com o primeiro símbolo da expressão.
```
Exemplo: a+b
```

```
Saída: <identificador,a+b>
```