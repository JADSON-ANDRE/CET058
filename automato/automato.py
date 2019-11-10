# Eglom Sóstenes e Jadson André
# Automato

def numero(lexema):
    try: 
        int(lexema)
        return True
    except ValueError:
        return False

def token(lexema):
    if (lexema == '('):
        return '<parêntese_abertura, >'
    elif (lexema == ')'):
        return '<parêntese_fechamento, >'
    elif (lexema == '['):
        return '<colchete_abertura, >'
    elif (lexema == ']'):
        return '<colchete_fechamento, >'
    elif (lexema == '^'):
        return '<exponenciação, >'
    elif (lexema == '+'):
        return '<soma, >'
    elif (lexema == '-'):
        return '<subtração, >'
    elif (lexema == '*'):
        return '<multiplicação, >'
    elif (lexema == '/'):
        return '<divisão, >'
    elif (str.isalpha(lexema[0])):
        return '<identificador, ' + lexema + '>'
    elif (numero(lexema[0])):
        return '<numero, ' + lexema + '>'
    elif (lexema == '<'):
        return '<menor, >'
    elif (lexema == '<='):
        return '<menor_igual, >'
    elif (lexema == '>'):
        return '<maior, >'
    elif (lexema == '>='):
        return '<maior_igual, >'
    elif (lexema == '='):
        return '<igualdade, >'
    elif (lexema == '&&'):
        return '<AND, >'
    elif (lexema == '||'):
        return '<OR, >'
    elif (lexema == '\0'):
        return '<EOL,>'
    else:
        return '<NÃO-IDENTIFICADO>'

entrada = input('Expressão: ')
while (entrada != ''):
    for expr in entrada.split():
        parte = token(expr)
        print(parte, end = '\n')
    entrada = input('\nExpressão ou finalize com ENTER: ')

