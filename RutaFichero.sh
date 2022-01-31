#!/bin/bash
clear
if [ $# -ge 1 ]
then
	for var in $*
	do
	localizacion=$(find /home -name $var)
        if [ -f "$localizacion" ]
	then
	echo "Eso es un fichero"
	find /home -name $var
	ls -l $localizacion
	cat $localizacion
	sleep 2
	elif [ -d "$localizacion" ]
	then
	echo "Eso es un directorio"
	find /home -name /$var 2> /dev/null
	tree $localizacion
	ls -l $localizacion
	sleep 2
	fi
	done

else
clear
echo "Tienes que poner como minimo 1 parametro"
fi

