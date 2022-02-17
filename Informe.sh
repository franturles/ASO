#!/bin/bash
if [ $# = 0 ]
then
	echo "No hay parametros"
	sleep 2
	echo "Procediendo a la recopilacion de todos los usuarios"
elif [ $# > 2 ]
then
	if [ $1 = -u ]
	then
		UsuarioEs=$(getent passwd {1000..60000} | cut -d: -f1 | grep $2 -o | uniq)
		if [ -z $UsuarioEs ]
		then
			echo "No existe ese usuario"
		else
			echo "Existe el usuario $UsuarioEs"
		fi
	elif [ $1 = -c ]
	then
		UsuariosConectado=$(who | cut -d" " -f1)
		for var in $UsuariosConectados
		do
			echo "El usuario $var esta conectado"
			sleep 2
		done
	fi
fi
