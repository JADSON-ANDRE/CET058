def numero(lexema):
    try: 
        int(lexema)
        return True
    except ValueError:
        return False

def Parte(lexema):
    parte = " "
    if str.isalpha(lexema[0]):
        i = 0
        while (str.isalpha(c[i])):
            parte += c[i]
            i += 1
        return parte
    else:
        i = 0
        while (numero(c[i])):
            parte += c[i]
            i += 1
        return parte

def retornaToken(lexema):
    if (lexema == "+"):
        return "<soma,>"
    elif (lexema == "-"):
        return "<subtração,>"
    elif (lexema == "*"):
        return "<multiplicação,>"
    elif (lexema == "/"):
        return "<divisão,>"
    elif (str.isalpha(lexema[0])):
        return "<identificador, " + lexema + ">"
    elif (numero(lexema[0])):
        return "<numero, " + lexema + ">"
    elif (lexema == "<"):
        return "<menor,>"
    elif (lexema == ">"):
        return "<maior,>"
    elif (lexema == "="):
        return "<igualdade,>"
    elif (lexema == "&&"):
        return "<AND,>"
    elif (lexema == "||"):
        return "<OR,>"
    elif (lexema == "\0"):
        return "<EOL,>"
    else:
        return "<undefined>"
        
name = input("Expressão: ")
while (name != ''):
    for expr in name.split():
        token = retornaToken(expr)
        print(token, end = '\n')
    name = input("\nExpressão ou '\q' para finalizar: ")

