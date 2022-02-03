#!/bin/bash
ListarUsuarios=$(getent passwd {1000..60000} | cut -d: -f1)
HomeDeUsuarios=$(getent passwd {1000..60000} | cut -d: -f6)

if [ $EUID = 0 ]; then
	echo "Vale, eres root"
		if [ -z $1 ]; then
			echo "No hay ningun parametro"
			sleep 2
			echo "Procediendo a la copia de seguridad de todos los usuarios"
			for Usuario in $ListarUsuarios
			do
				echo "Creando copìa de $Usuario"
			done
			#echo $ListarUsuarios
		else
			echo "El parametro es $1"
		fi
else
	echo "No eres root"
fi

