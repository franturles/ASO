#!/bin/bash
if [ $# -eq 1 ] && [ -f "$1" ]
then
	archivo=$(cat $1 | cut -c 3-10)
	echo $archivo
elif [ $# -eq 0 ] && [ -d "$1" ]
then
	echo "Debes pasar un fichero"
fi
