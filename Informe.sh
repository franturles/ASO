#!/bin/bash
if [ $# = 0 ]
then
	echo "No hay parametros"
	sleep 2
	echo "Procediendo a la recopilacion de todos los usuarios"
	ListadoUsuarios=$(getent passwd {1000..60000} | cut -d: -f1,6)
	for Usuarios in $ListadoUsuarios
	do
		Usuario=$(echo $Usuarios | cut -d: -f1)
		HomeUsuarios=$(echo $Usuarios| cut -d: -f2)
		NumeroFicherosPro=$(find $HomeUsuarios -user $Usuario | wc -l)
		NumeroFicherosMod=$(find $HomeUsuarios -user $Usuario -perm -u+w | wc -l)
		#NumeroFicherosAb=$( ps -u $Usuario | grep nano | wc -l)
		FicheroAntiguo=$(ls $HomeUsuarios -tr -R | head -n2 | tail -n 1)
		FicheroMasReciente=$(ls $HomeUsuarios -t -R | head -n2 | tail -n 1)
		FicheroMasPequeño=$(ls -s -R $HomeUsuarios | head -n3 | tail -n1)
		echo "#################################################"
		echo "Usuario:$Usuario"
		echo "Nº Ficheros de los que es propietario:$NumeroFicherosPro"
		echo "Nº Ficheros que puede modificar:$NumeroFicherosMod"
		echo "Nº Ficheros abiertos:"
		echo "Ficheros más antiguo del usuario: $FicheroAntiguo "
		echo "Fichero más recientemente modificado: $FicheroMasReciente"
		echo "Tamaño fichero más pequeño: $FicheroMasPequeño"
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
		UsuarioEs=$(getent passwd {1000..60000} | cut -d: -f1 | grep -o "$2" | uniq)
		if [ -z $UsuarioEs ]
		then
			echo "No existe ese usuario"
		else
			NumeroFicherosPro=$(find /home/usuario -user usuario | wc -l)
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
