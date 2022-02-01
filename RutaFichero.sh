#!/bin/bash
clear
if [ $# -ge 1 ]
then
	for var in $*
		do
		localizacion=$(find /home -name $var)
		echo "Selecciona una de estas opciones:"
		echo "1. Listar archivo o directorio"
		echo "2. Ver el contenido de archivo o directorio"
		echo "3. Ver permisos de archivo o directorio"
		read op
		while true; do
		case $op in
			1) echo "Listar"
			if [ -f "$localizacion" ]
        			then
                		echo "Eso es un fichero"
                		find /home -name $var
                		sleep 2
        		elif [ -d "$localizacion" ]
        			then
                		echo "Eso es un directorio"
                		find /home -name /$var 2> /dev/null
        		fi
				;;

			2) echo "Contenido"
			if [ -f "$localizacion" ]
        			then
                		echo "Eso es un fichero"
                		cat $localizacion
                		sleep 2
        		elif [ -d "$localizacion" ]
        			then
                		echo "Eso es un directorio"
                		tree $localizacion
                		sleep 2
			fi
				;;

			3)
			echo "Permisos"
			if [ -f "$localizacion" ]
        			then
                		echo "Eso es un fichero"
                		ls -l $localizacion
                		sleep 2
        		elif [ -d "$localizacion" ]
        			then
                		echo "Eso es un directorio"
                		ls -l $localizacion
                		sleep 2
        		fi
				;;
		esac
		shift
		done
	done
else
	clear
	echo "Tienes que poner como minimo 1 parametro"
fi
