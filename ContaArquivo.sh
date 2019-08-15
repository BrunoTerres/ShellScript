#!/bin/bash 

#######################################################################
#   ContaArquivo.sh   -   conta os arquivos .mp3 .mp4 e .jpg de todos
# os usuários da maquina 
# 
#   Criador: Bruno Eduardo Terres	(brunoeterres@gmail.com)
#   Data da criação: 09/07/2019
# 
#####################################

#Variaveis

#ContaMP3=$(find -iname *.mp3 | wc -l | uniq) 
#ContaMP4=$(find -iname *.mp4 | wc -l | uniq) 
#ContaJPG=$(find -iname *.jpg | wc -l | uniq) 
#USUHOME=$(awk -F":" '($3>=1000&&$3<65534) {print $5}' /etc/passwd | cut -c1-12)


#Achando Usuarios
MIN_UID=$(grep "^UID_MIN" /etc/login.defs | tr -s "\t" | cut -f2)
MAX_UID=$(grep "^UID_MAX" /etc/login.defs | tr -s "\t" | cut -f2)

OLDIFS=$IFS 
IFS=$'\n'

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

IFS=$OLDIFS


