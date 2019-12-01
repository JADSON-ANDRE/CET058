# Jadson André
# Automato

def token(lexema):
	for i in range(0, len(lexema)):
		if(lexema[i].isalpha() == True):
			token = ("<Identificador, "+str(lexema[i]))
		else:
			if(lexema[i].isalpha() == True ):
				token = token+str(lexema[i])
			else:
				if(str(lexema[i]) == "+"):
					token = token+str(">")
					print("\n"+str(token))
					token = ' '
					token = ("<soma, >")
					print(""+str(token))
					token = ' '
				elif(lexema[i] == '-'):
					token = token+str(">")
					print("\n"+str(token))
					token = ' '
					token = ("<subtração, >")
					print(""+str(token))
					token = ' '
				elif(lexema[i] == '*'):
					token = token+str(">")
					print("\n"+str(token))
					token = ' '
					token = ("<multiplicação, >")
					print(""+str(token))
					token = ' '
				elif(lexema[i] == '/'):
					token = token+str(">")
					print("\n"+str(token))
					token = ' '
					token = ("<divisão, >")
					print(""+str(token))
					token = ' '
				elif(token != ' '):
					token = token+str(">")
					print("\n"+str(token))
					token = ' '
					token = token+str(">")
					print(""+str(token))
				elif (lexema == '\0'):
		        		return '<EOL,>'
				else:
				        return '<NÃO-IDENTIFICADO>'

entrada = input('Digite a expressão: ')
while (entrada != '0'):
	for lex in entrada.split():
		parte = token(lex)
		print(parte, end = '\n')
	entrada = input('\nNova expressão ou finalize com 0: ')