#!/bin/bash 

##########################################################################
#
#    UsuariosHumanos.sh  -  Script com a finalidade de mostrar os Usuários# Humano cadastrados na maquina                                         
#    
#    Nome do Criador: Bruno Terres    (brunoeterres@gmail.com)
#    Data de Criação: 04/07/2019           
#   
#    ./UsuariosHumanos.sh  -  devolve os usuários humanos do sistema junt 
# com seu UID, DIR HOME e Nome/Descrição 
# 
################################

#UIDs Usuarios comuns 
MIN_UID=$(grep "^UID_MIN" /etc/login.defs | tr -s "\t" | cut -f2)
MAX_UID=$(grep "^UID_MAX" /etc/login.defs | tr -s "\t" | cut -f2)

#Alterando o IFS para quebra de linha/salvando o antigo para  o fim do programa 
OLDIFS=$IFS 
IFS=$'\n'

#Criando cabeçalho 
echo -e "USUARIO\t\tUID\t\tDIR HOME\t\tNOME OU DESCRIÇÃO" 

#Loop FOR para pegar informações dos usuarios 
for USU in $(cat /etc/passwd)
do
	USERID=$(echo $USU | cut -d":" -f3) 
        if [ $USERID -ge $MIN_UID -a $USERID -le $MAX_UID ]  
	then 
		USUARIO=$(echo $USU | cut -d":" -f1) 
		NOME=$(echo $USU | cut -d":" -f5 | tr -d ',')
		DIRHOME=$(echo $USU | cut -d":" -f6) 
		echo -e "$USUARIO\t\t$USERID\t\t$DIRHOME\t\t$NOME"
	fi
done 

#Redefinindo IFS
IFS=$OLDIFS
