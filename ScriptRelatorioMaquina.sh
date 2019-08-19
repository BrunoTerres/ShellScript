#!/bin/bash 

############################################################################
#                                                                          #
#   ScriptRelatorioMaquina.sh  -  Script que gera um relatório da maquina  #
#  atual contendo as seguintes informações: Nome da Maquina, Data e Hora,  #
#  Tempo de Atividade da Maquina, Versão do Kernel, Quantidade CPUs/Cores  #
#  Modelo CPU, Total de Memória RAM Disponível, Partições.                 #
#                                                                          #
#   Criador: Bruno Terres  (brunoeterres@gmail.com)                        #
#   Data de Criação: 28/05/2019                                            #
#                                                                          #
############################################################################


#Variaveis com informações da maquina
NOMEMAQUINA=$(uname -n) 
DATA=$(date) 
TEMPOLIGADA=$(uptime -s)
VERSAOKERNEL=$(uname -r) 
MODELOCPU=$(cat /proc/cpuinfo|grep "model name"|uniq|cut -c13-60)
CPUCORES=$(cat /proc/cpuinfo|grep "cpu cores"| uniq| cut -c12-25)
MEMINFOMB=$(awk '$3=="kB"{$2=$2/1024;$3="MB"} 1' /proc/meminfo |grep "MemTotal"| cut -c10-20)
PARTICOES=$(df -h| head -n6) 

#Saí́das
clear 
echo "================================================================="
echo "Relatório da Maquina: $NOMEMAQUINA " 
echo "Data/Hora: $DATA "
echo "================================================================="
echo " "
echo "Máquina Ativa desde: $TEMPOLIGADA "
echo " "
echo "Versão do Kernel: $VERSAOKERNEL " 
echo " " 
echo "CPUs:" 
echo "Quantidade de CPUs/Core: $CPUCORES " 
echo "Modelo da CPU: $MODELOCPU "
echo " "
echo "Memória Total: $MEMINFOMB "
echo " "
echo "Partições: "
echo "$PARTICOES "

