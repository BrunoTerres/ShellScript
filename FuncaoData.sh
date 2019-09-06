#!/bin/bash 


DATA=$1



separando () {
	echo ${DATA:3:4} 
}
separando $DATA


formato () {
	if [ "$(echo "$DATA" | grep -E '/')" ] 
	then 
		if [ "${DATA:0:2}" -gt 12 ]  
		then
			echo com barra 
			echo 0
			return 0
		elif [ "${DATA:3:4}" -gt 12 ]
		then 	
			echo com barra
			echo 1
			return 1
		else 
			echo calma 	
		fi
	else
		if [ "${DATA:0:2}" -gt 12 -a "${DATA:2:2}" -lt 31 ]
		then
			echo sem barra
			echo 0
			return 0
		elif [ "${DATA:0:2}" -lt 31 -a "${DATA:2:2}" -gt 12 ]
		then 	
			echo sem barra
			echo 1
			return 1
		else 
			echo nada
		fi
 
	fi
} 
checabarra () {
	if [ $(echo "$DATA" | egrep '/') ]
	then 	
		echo oi			
	else 
		echo "Nao tem barra" 
	fi
}

formato $DATA
