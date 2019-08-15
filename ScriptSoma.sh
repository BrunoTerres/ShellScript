#!/bin/bash 

##########################################################################
#                                                                        #
#    ScriptSoma.sh  -  Solicita dois operandos como entrada, faz a soma  #
#  e devolve o valor para o usuário.                                     #
#                                                                        #
#    Autor: Bruno Terres (brunoeterres@gmail.com                         #
#    Data Criação: 28/05/2019                                            #
#                                                                        #
#################33#######################################################

clear 
echo "Bem vindo ao Script de soma de Bruno Terres!"
sleep 3s 
clear 
read -p "Digite o primeiro operando para a soma: " OP1 
echo " " 
read -p "Digite o segundo operando para a soma:  " OP2
clear 
SOMA=$(($OP1 + $OP2)) 
echo "A soma dos valores $OP1 e $OP2 é de: $SOMA " 

