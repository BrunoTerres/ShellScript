#!/bin/bash 

#######################################################################
#   ContaArquivo.sh   -   conta os arquivos .mp3 .mp4 e .jpg de todos
# os usuários da maquina 
# 
#   Desenvolvedor: Bruno Eduardo Terres	(brunoeterres@gmail.com)
#   Data da criação: 09/07/2019
# 
#####################################


#Localizando no arquivo /etc/login.defs os parametros de UID min e max para encontrar os usuários "humanos".
MIN_UID=$(grep "^UID_MIN" /etc/login.defs | tr -s "\t" | cut -f2)
MAX_UID=$(grep "^UID_MAX" /etc/login.defs | tr -s "\t" | cut -f2)

#Alterando IFS para quebra de linha 
OLDIFS=$IFS 
IFS=$'\n'

#Laço FOR para rodar linha a linha procurando UID entre 1000 e 60000, contar os arquivos e exibi-los 
for USU in $(cat /etc/passwd) 
do 
	USRID=$(echo $USU | cut -d":" -f3) 
	if [ $USRID -ge $MIN_UID -a $USRID -le $MAX_UID ] 
	then 
		USRNAME=$(echo $USU | cut -d":" -f1) 
		CONTAMP3=$(find -name *.mp3 -user $USRNAME | uniq | wc -l)
		CONTAMP4=$(find -name *.mp4 -user $USRNAME | uniq | wc -l)
		CONTAJPG=$(find -name *.jpg -user $USRNAME | uniq | wc -l)
		echo "Usuario: $USRNAME"
		echo "Arquivos JPG: $CONTAJPG"
		echo "Arquivos MP3: $CONTAMP3"
		echo "Arquivos MP4: $CONTAMP4"
		echo " "
	fi 
done

#Reestabelecendo o IFS
IFS=$OLDIFS


