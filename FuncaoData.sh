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
		elif [ "${DATASEMBARRA:0:2}" -lt 31 -a "${DATASEMBARRA:2:2}" -gt 12 ]
		then 	
			echo "com barra"
			echo "formato USA return 1"
			return 1
		else 
			echo "nada"
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
		else 
			echo "nada2"
		fi 
	fi 	
 
} 
formato $DATA


checabarra () {
	if [ $(echo "$DATA" | egrep '/') ]
	then 	
		echo oi			
	else 
		echo "Nao tem barra" 
	fi
}

