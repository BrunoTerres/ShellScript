#!/bin/bash 

#######################################################################
#                                                                     #
#  ScriptBackupHome.sh - Fazer backup do diretório /home do usuário   #
#                                                                     #
#  Autor: Bruno Terres  (brunoeterres@gmail.com)                      #
#  Data Criação: 27/05/2019                                           #
#                                                                     # 
#  Descrição: Script que cria o diretório Backup, caso não exista     #
# (/home/<usuario>/Backup) e faz o backup compactado                  #
# de todo o Diretório /home no formato backup_home_AAAAMMDDHHMM.tgz   #
#                                                                     #
#  Exemplo de uso:  ./ScriptBackupHome.sh                             #
#######################################################################

DIRDEST=$HOME/Backup

if [ ! -d ~/Backup ] 
then 
	echo "Criando Diretório $DIRDEST..."
	mkdir -p $DIRDEST   	
fi

DAYS7=$(find $DIRDEST -ctime -7 -name backup_home\*tgz)

if [ "$DAYS7" ] #testa se a variável é nula. Atenção aspas duplas para caracteres especiais 
then 
	echo "Já foi gerado um backup do diretório $HOME nos últimos sete dias. " 
	echo "Deseja continuar? (N/s): "
	read -n1 CONT 
	echo " "
	if [ "$CONT" = N -o "$CONT" = n -o "$CONT" = "" ]
	then 
		echo "Backup Abortado!" 
		exit 1 
	elif [ "$CONT" = S -o "$CONT" = s ] 
	then 
		echo "Será criado mais um Backup para a mesma semana!" 
	else 
		echo "Opção Inválida!" 
		exit 2 
	fi 
fi

echo "Criando Backup..." 
ARQ="backup_home_$(date +%Y%m%d%H%M).tgz"
tar zcvpf $DIRDEST/$ARQ --exclude="$DIRDEST" "$HOME"/* > /dev/null

echo 
echo "O bacukp de nome \""$ARQ"\" foi criado em $DIRDEST" 
echo 
echo "Backup concluído!" 
