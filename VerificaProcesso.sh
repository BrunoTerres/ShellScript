#!/bin/bash 

########################################################################
#
#   VerificaProcesso.sh  -  Script com a finalidade de receber o nome 
# de um processo como entrada e devolver o estado,  se esta em execução
# ou não.
#
#   Desenvolvedor: Bruno Terres     (brunoeterres@gmail.com)
#   Data de Criação: 05/07/2019                                     
#   
#   ./VerificaProcesso.sh  
#
###########################################

#Variáveis
read -p "Qual processo você deseja consultar? " PROCESSO

until ps axu | grep $PROCESSO | grep -v grep > /dev/null
do
	echo "ATENÇÃO!!!! O processo $PROCESSO NÃO está em execução!"
	sleep 2
done

PROCESPID=$(pgrep -f $PROCESSO | head -n1)

clear
echo "O processo $PROCESSO está em execução"
echo "O PID do Processo é: $PROCESPID"
read -p "Você deseja encerrar o processo "$PROCESSO"?" RESPOSTA

if [ $RESPOSTA=="SIM" -o $RESPOSTA=="S" -o $RESPOSTA=="sim" -o $RESPOSTA=="s" ]
then 
	kill $PROCESPID
fi



