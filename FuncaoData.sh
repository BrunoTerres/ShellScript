#!/bin/bash 


DATA=$1



rando () {
	tirabarra $DATA
	echo ${DATA:0:2}
        echo ${DATA:2:2}	
}


tirabarra () {
	if [ "$(echo "$DATA" | grep -E '/')" ]
	then 
		local DATASEMBARRA=$(echo $DATA | tr -d '/')
		DATA=$DATASEMBARRA
	fi 	
}

formato () {
	tirabarra $DATA
	if [ "${DATA:0:2}" -gt 12 -a "${DATA:2:2}" -gt 12 ]
	then
		echo "Formato invalido"
		echo "return 3"
		return 3
	elif [ "${DATA:0:2}" -le 12 -a "${DATA:2:2}" -le 12 ]
	then 
		echo "Não é possível determinar!" 
		return 2
	elif [ "${DATA:0:2}" -lt 31 -a "${DATA:2:2}" -lt 12 ]
	then 	
		echo "com barra"
		echo "formato BR return 0"
		return 0
	elif [ "${DATA:0:2}" -lt 12 -a "${DATA:2:2}" -lt 31 ]
	then 
		echo "com barra"
	        echo "Formato USA return 1"
		return 1	
	else 
		echo "Não é possível determinar!"
		return 2
	fi 	
 
}

inverteformato () {
	tirabarra $DATA 
	DIAMES=${DATA:0:2}
	MESDIA=${DATA:2:2} 
	ANO=${DATA:4} 
	echo "$MESDIA/$DIAMES/$ANO"

}

incluibarra () {
	tirabarra $DATA
	DIA=${DATA:0:2}
        MES=${DATA:2:2}
        ANO=${DATA:4}
	echo "$DIA/$MES/$ANO" 

}




