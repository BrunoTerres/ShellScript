#!/bin/bash 

###############################################
#                                                                        
#  ScriptCalc.sh  -  Recebe duas entradas numéricas como Parametro mostra
# as opções de operadores e faz o calculo.                              
#                                                                        
#  Criador: Bruno Terres (brunoeterres@gmail.com)                       
#  DataCriação: 27/05/2019                                                
#  Modo de Uso: ./ScriptCalc.sh                                         
#                                                                       
#######################################################


#Operando

clear
read -p "Digite o primeiro parâmetro numérico: " N1
echo 
read -p "Digite o segundo parâmetro númerico: " N2  
clear

#Checagem de Operando 

if [ ! $N1 ] || [ ! $N2 ]
then
	echo "Nenhum dos valores pode ser nulo!" >&2 
  	exit 1
fi


#Escolhendo o operador 

 
echo "Operandos escolhidos $N1 e $N2. "
echo "Escolha a operação desejada... "
echo "1) Soma" 
echo "2) Subtração"
echo "3) Multiplicação"
echo "4) Divisão"
echo "S) Sair"
read -p "Operador: " OP

#Calculo 

case $OP in 
	
	1)	
		echo "Operador escolhido: Soma"
		R=$(($N1+$N2));
		echo "A soma dos operandos $N1 e $N2 é $R"	 
		;;

	2) 
		echo "Operador escolhido: Subtração" 
		R=$(($N1-$N2)) 
		echo "A subtração dos operandos $N1 e $N2 é $R"
		;; 

    	3)	
		echo "Operador escolhido: Multiplicação" 
		if [ $N1 -eq 0 -o $N2 -eq 0 ]  
		then
			echo "Multiplicação por zero não suportada!">&2
			exit 1	
		else 
			R=$(($N1*$N2)) 
			echo "A multiplicação dos operandos $N1 e $N2 é $R"
		fi	
		;;
	4)	
		echo "Operador escolhido: Divisão" 
		if [ $N1 -eq 0 -o $N2 -eq 0 ]
		then 
			echo "Divisão por zero não suportada!" 
		elif [ 	$(expr $N1 % $N2) -eq 0 ]
		then 
			R=$(($N1/$N2)) 
			echo "Divisão exata"
			echo "A divisão exata dos operandos $N1 e $N2 é $R"
		else	
			R=$(($N1/$N2)) 
			echo "Divisão com resto"
			echo "A divisão não exata dos operandos $N1 e $N2 é $R com resto $(expr $N1 % $N2)"

                fi
		;;		
	[Ss]) 
		echo "Saindo..." 
		exit 
		;;
	*)	
		echo "Opção Inválida!" 
		exit 1 
		;;
esac



