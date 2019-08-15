#!/bin/bash 

#########################################################################
#                                                                       #
#   HelloScript.sh  -  O Script mostra, com base no horário do computa- #
#  dor, as mensagens: "Bom dia!", "Boa Tarde!", "Boa Noite!".           #
#                                                                       #
#   Criador: Bruno Terres (brunoeterres@gmail.com)                      #
#   Data de Criação: 03/06/2019                                         #
#                                                                       # #   Ex de Uso: ./HelloScript.sh                                         #
#                                                                       #
#########################################################################

#Apresentação do Script

clear
echo "Bem vindo ao HelloScript!" 
sleep 3 
clear


#Variáveis

HORA=$(date +%H)
HORA12=$(date +%l)
MIN=$(date +%M)


#Conversão 24h para 12h 

if [ $HORA -lt 12 ]
then 
	echo "Bom dia!" 
	HORAATUAL="$HORA12:$MIN AM" 
else
	if [ $HORA12 -lt 6 ]
	then
		echo "Boa tarde!" 
		HORAATUAL="$HORA12:$MIN PM"
	else
		echo "Boa noite!" 
		HORAATUAL="$HORA12:$MIN PM" 
	fi
fi


#Hora Atual

echo "A hora atual é: $HORAATUAL "



