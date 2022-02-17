#!/bin/bash
if [ $# = 0 ]
then
	echo "No hay parametros"
	sleep 2
	echo "Procediendo a la recopilacion de todos los usuarios"
	Usuarios=$(getent passwd {1000..60000} | cut -d: -f1 | grep $2 -o | uniq)
	for Usuario in $Usuarios
	do
		echo "#################################################"
		echo "Usuario:$Usuario"
		echo "Nº Ficheros de los que es propietario:"
		echo "Nº Ficheros que puede modificar:"
		echo "Nº Ficheros abiertos:"
		echo "Ficheros más antiguo del usuario:"
		echo "Fichero más recientemente modificado:"
		echo "Tamaño fichero más pequeño:"
		echo "Tamaño medio de fichero:"
		echo "Tamaño fichero más grande:"
		echo "Tipo de fichero más usual:"
		echo "#################################################"
		read pause
	done
elif [ $# > 2 ]
then
	if [ $1 = -u ]
	then
		UsuarioEs=$(getent passwd {1000..60000} | cut -d: -f1 | grep $2 -o | uniq)
		if [ -z $UsuarioEs ]
		then
			echo "No existe ese usuario"
		else
			NumFicherosProEs=$(ls -l /home/$UsuarioEs | cut -d" " -f2)
			echo "Existe el usuario $UsuarioEs"
			echo "#################################################"
	                echo "Usuario:$UsuarioEs"
	                echo "Nº Ficheros de los que es propietario:$NumFicherosProEs "
	                echo "Nº Ficheros que puede modificar:"
	                echo "Nº Ficheros abiertos:"
	                echo "Ficheros más antiguo del usuario:"
	                echo "Fichero más recientemente modificado:"
	                echo "Tamaño fichero más pequeño:"
	                echo "Tamaño medio de fichero:"
	                echo "Tamaño fichero más grande:"
	                echo "Tipo de fichero más usual:"
	                echo "#################################################"
	                read pause

		fi
	elif [ $1 = -c ]
	then
		UsuariosConectados=$(who | cut -d" " -f1)
		for UsuarioConectado in $UsuariosConectados
		do
			echo "#################################################"
                        echo "Usuario:$UsuarioConectado"
                        echo "Nº Ficheros de los que es propietario:"
                        echo "Nº Ficheros que puede modificar:"
                        echo "Nº Ficheros abiertos:"
                        echo "Ficheros más antiguo del usuario:"
                        echo "Fichero más recientemente modificado:"
                        echo "Tamaño fichero más pequeño:"
                        echo "Tamaño medio de fichero:"
                        echo "Tamaño fichero más grande:"
                        echo "Tipo de fichero más usual:"
                        echo "#################################################"
                        read pause

			sleep 2
		done
	fi
fi
