#!/bin/bash 

#####################################################################
#                      -   FuncaoData.sh   -
#  Script que recebe como entrada  uma opção -f, -i, -b, -e ou --help
# e uma data com ou sem barras nos formatos BR ou US. -f retorna o formato
# se a data é BR ou US ou impossível de determinar. -i inverte o formato
# entre BR em US e US em BR. -b inclui barras. -e Escreve a data por 
# extenso.
#  Dev: Bruno Terres (brunoeterres@gmail.com)
#  Data: 17/09/19
#  Ex de uso: ./FuncaoData.sh -OPCAO DATA
#########################################################

#Entradas
OPCAO=$1
DATA=$2

#Funcao para tirar a barra e facilitar o manuseio da String DATA
tirabarra () {
	if [ "$(echo "$DATA" | grep -E '/')" ]
	then 
                DATASEMBARRA=$(echo $DATA | tr -d '/')
		DATA=$DATASEMBARRA
	fi 	
}


#Funcao para determinar o formato da DATA
formato () {
	tirabarra $DATA
	#FORMATO INVALIDO
	if [ "${DATA:0:2}" -gt 12 -a "${DATA:2:2}" -gt 12 ]
	then
		echo "Formato invalido"
		return 3
	#FORMATO IMPOSSIVEL DE DETERMINAR (dias abaixo de 12) :/
	elif [ "${DATA:0:2}" -le 12 -a "${DATA:2:2}" -le 12 ]
	then 
		echo "Não é possível determinar!" 
		return 2
	#FORMATO BR
	elif [ "${DATA:0:2}" -lt 31 -a "${DATA:2:2}" -lt 12 ]
	then 	
		echo "Formato BR"
		return 0
	#FORMATO US
	elif [ "${DATA:0:2}" -lt 12 -a "${DATA:2:2}" -lt 31 ]
	then 
	        echo "Formato US"
		return 1	
	else 
		echo "Não é possível determinar!"
		return 2
	fi 	
 
}

#Funcao que inverte entre BR e US
inverteformato () {
	tirabarra $DATA 
	DIAMES=${DATA:0:2}
	MESDIA=${DATA:2:2} 
	ANO=${DATA:4} 
	echo "$MESDIA/$DIAMES/$ANO"
  
}

#Funcao para colocar barras
incluibarra () {
	tirabarra $DATA 
	DIA=${DATA:0:2}
        MES=${DATA:2:2}
        ANO=${DATA:4}

	echo barra
	echo "$DIA/$MES/$ANO" 
}

#Funcao para pegar o formato, entre BR e US e filtrar para a Funcao de escrita por extenso
defineformato () {
	formato $DATA >> /dev/null
	RETURNFORMATO=$?
	if [ $RETURNFORMATO -eq 0 ]
	then 
 		DIA=${DATA:0:2}
 	        MES=${DATA:2:2}
        	ANO=${DATA:4}
	elif [ $RETURNFORMATO -eq 1 ]
	then 
 		DIA=${DATA:2:2}
                MES=${DATA:0:2}
                ANO=${DATA:4}
	elif [ $RETURNFORMATO -eq 2 ]
	then 
		echo "Formato de data indeterminado"
		read -p "Digite 0 para formato BR e 1 para formato USA: " REDEFININDO
		if [ $REDEFININDO -eq 0 ]
		then 	
 			DIA=${DATA:0:2}
	                MES=${DATA:2:2}
        	        ANO=${DATA:4}
		elif [ $REDEFININDO -eq 1 ]
		then 
			DIA=${DATA:2:2}
	                MES=${DATA:0:2}
         	        ANO=${DATA:4}
		else 
			echo "Forrmato Invalido"
		fi 
	else 
		echo "Formato Invalido"
	fi 
}

#Funcao que escreve a DATA por extenso
dataextenso () {
	defineformato $DATA
	if [ $MES -eq 01 ]
	then 
		echo "$DIA de Janeiro de $ANO" 
	elif [ $MES -eq 02 ]
	then 
		echo "$DIA de Fevereirro de $ANO"
	elif [ $MES -eq 03 ]
	then 
		echo "$DIA de Março de $ANO"
	elif [ $MES -eq 04 ]
	then 
		echo "$DIA de Abril de $ANO"
	elif [ $MES -eq 05 ] 
	then 
		echo "$DIA de Maio de $ANO"
	elif [ $MES -eq 06 ]
	then
		echo "$DIA de Junho de $ANO"
	elif [ $MES -eq 07 ]
	then
		echo "$DIA de Julho de $ANO"
	elif [ $MES -eq 08 ]
	then 
		echo "$DIA de Agosto de $ANO"
	lif [ $MES -eq 09 ]
	then 
		echo "$DIA de Setembro de $ANO"
	elif [ $MES -eq 10 ]
	then 
		echo "$DIA de Outubro de $ANO"
	elif [ $MES -eq 11 ]
	then 
		echo "$DIA de Novembro de $ANO"
	elif [ $MES -eq 12 ]
	then 
		echo "$DIA de Dezembro de $ANO"
	fi
}

#Case para receber as opções
case $OPCAO in 
	-f)
		formato $DATA
		;;
	-i)
		inverteformato $DATA
		;;
	-b)
		incluibarra $DATA
		;;
	-e) 
		dataextenso $DATA			
		;;
	--help)
	       echo " Uso ./FuncaoData.sh OPÇÃO DATA."
	       echo ""
	       echo "DATA nos formatos DDMMYYY ou MMDDYYY, com ou sem /."
	       echo ""
	       echo "Opções:"
	       echo "-f = Retorna 0 para BR, 1 para US, 2 quando impossivel de determinar e 3 quando invalido."
	       echo "-i = Inverte o formato BR para US e US para BR. Inclui barras."
	       echo "-b = Inclui Barras de Data. Exempl: de 28071996 para 28/07/1996."
	       echo "-e = Exibe a data em foormato extenso. Exemplo: de 28071996 para 28 de julho de 1996."
		;;
	*) 
		echo "Opcão Inválida" 
esac


#PQNAOVAIPROGITHUB?
