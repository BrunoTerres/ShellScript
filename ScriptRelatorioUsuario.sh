#!/bin/bash 

#########################################################################
#                                                                       #
#   ScriptRelatorioUsuario.sh  -  O Script pede um nome de usuario como #
#  parametro e como saida apresenta as seguintes informações: UID do usr#
#  Nome Completo/Descrição do Usuário, Total em Uso no /home do Usuário #
#  Informações do Último login do usuário.                              #
#                                                                       #
#   Criador: Bruno Terres (brunoeterres@gmail.com)                      #
#   Data de Criação: 29/05/2019                                         #
#                                                                       #
#   ExUso: ./ScriptRelatorioUsuario.sh                                  #
#                                                                       # #########################################################################

#Solicitação da entarda do nome do usuario
read -p "Digite o nome de um Usuaŕio: " VAR1
sleep 2 
clear

#Variáveis 
GUID=$(id $VAR1| cut -c5-8)
NOME=$(cat /etc/passwd| egrep $VAR1| cut -d: -f5| tr -d ,)
TOTALHOME=$(du -sh /home/$VAR1| cut -c1-4)
ULTIMOLOGIN=$(lastlog |egrep "$VAR1") 

#Saídas
echo "============================================================="
echo "Relatório do Usuário: $VAR1 "
echo " "
echo "UID: $GUID "
echo "Nome ou Descrição: $NOME "
echo " "
echo "Ultimo Login: "
echo "Nome do Usuário/Porta/LigadoDesde"
echo "$ULTIMOLOGIN"
echo "============================================================="

