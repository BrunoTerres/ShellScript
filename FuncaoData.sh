#!/bin/bash 


DATA=$1



separando () {
	echo ${DATA:3:4} 
}



tirabarra () {
	if [ "$(echo "$DATA" | grep -E '/')" ]
	then 
		DATASEMBARRA=$(echo $DATA | tr -d '/')
		echo $DATA
		echo $DATASEMBARRA
	fi 	
}


formato () {
	if [ "$(echo "$DATA" | grep -E '/')" ] 
	then 
		tirabarra $DATA
		if [ "${DATASEMBARRA:0:2}" -gt 12 -a "${DATASEMBARRA:2:2}" -lt 31 ]
		then
			echo "com barra"
			echo "formato BR return 0"
			return 0
		#BAD
		elif [ "${DATASEMBARRA:0:2}" -lt 31 -a "${DATASEMBARRA:2:2}" -gt 12 ]
		then 	
			echo "com barra"
			echo "formato USA return 1"
			return 1
		elif [ "${DATASEMBARRA:0:2}" -gt 31 -o "${DATASEMBARRA:2:2}" -gt 31 ]
		then 
			echo "Formato inválido!" 
		else 
			echo "Não é possível determinar!"
		fi
	else 
		if [ "${DATA:0:2}" -gt 12 -a "${DATA:2:2}" -lt 31 ] 
		then 
			echo "sem barra"
			echo "formato Brasil return 0" 
			return 0
		elif [ "${DATA:0:2}" -lt 31 -a "${DATA:2:2}" -gt 12 ] 
		then 
			echo "sem barra" 
			echo "formato USA return 1"
			return 1 
		elif [ "${DATA:0:2}" -gt 31 -o "${DATA:2:2}" -gt 31 ]
		then 
			echo "Formato inválido!"
		else 
			echo "Não é possível determinar!"
		fi 
	fi 	
 
} 
formato $DATA

