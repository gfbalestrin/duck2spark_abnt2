#!/bin/bash

function usage() {
        echo "Forma de uso: ./converte.sh script.txt"
}


if [ "$#" -ne 1 ]; then
   	echo "Parametros incorretos!"
	usage
elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	usage
else
java -jar encoder/encoder.jar -i $1 -o $1.bin -l encoder/resources/br.properties && 
python duck2spark/duck2spark.py -i $1.bin -l 1 -f 2000 -o $1.ino &&
NOME="$(cut -d'.' -f1 <<<"$1.ino")" &&
mv $1.ino $NOME.ino &&
rm $1.bin &&
echo "... finalizado!" && 
echo "Arquivo gerado: $NOME.ino"
fi
