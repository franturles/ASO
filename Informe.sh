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
		NumeroFicherosAb=$( lsof -u $Usuario 2> /dev/null | wc -l)
		FicheroAntiguo=$(ls $HomeUsuarios -tr -R | head -n2 | tail -n 1)
		FicheroMasReciente=$(ls $HomeUsuarios -t -R | head -n2 | tail -n 1)
		FicheroMasPequeño=$(ls -s -R $HomeUsuarios | head -n3 | tail -n1)
		FicheroMasPesado=$(du $HomeUsuarios | sort -n -r | head -n3 )
		echo "#################################################"
		echo "Usuario:$Usuario"
		echo "Nº Ficheros de los que es propietario:$NumeroFicherosPro"
		echo "Nº Ficheros que puede modificar:$NumeroFicherosMod"
		echo "Nº Ficheros abiertos:$NumeroFicherosAb"
		echo "Ficheros más antiguo del usuario: $FicheroAntiguo "
		echo "Fichero más recientemente modificado: $FicheroMasReciente"
		echo "Tamaño fichero más pequeño: $FicheroMasPequeño"
		echo "Tamaño medio de fichero:"
		echo "Tamaño fichero más grande:$FicheroMasPesado"
		echo "Tipo de fichero más usual:"
		echo "#################################################"
		read pause
	done
elif [ $# > 2 ]
then
	if [ $1 = -u ]
	then
		UsuarioEs=$(getent passwd {1000..60000} | cut -d: -f1 | grep -o "$2" | uniq)
		HomeUsuariosEs=$(getent passwd {1000..60000} | grep "$2" | cut -d: -f6)
                NumeroFicherosPro=$(find $HomeUsuariosEs -user $UsuarioEs | wc -l)
                NumeroFicherosMod=$(find $HomeUsuariosEs -user $UsuarioEs -perm -u+w | wc -l)
                NumeroFicherosAb=$( lsof -u $UsuarioEs | wc -l)
                FicheroAntiguo=$(ls $HomeUsuariosEs -tr -R | head -n2 | tail -n 1)
                FicheroMasReciente=$(ls $HomeUsuariosEs -t -R | head -n2 | tail -n 1)
                FicheroMasPequeño=$(ls -s -R $HomeUsuariosEs | head -n3 | tail -n1)
                FicheroMasPesado=$(du $HomeUsuariosEs | sort -n -r | head -n3 )

		if [ -z $UsuarioEs ]
		then
			echo "No existe ese usuario"
		else
			NumeroFicherosPro=$(find /home/usuario -user usuario | wc -l)
			echo "Existe el usuario $UsuarioEs"
			echo "#################################################"
	                echo "Usuario:$UsuarioEs"
	                echo "Nº Ficheros de los que es propietario:$NumFicherosProEs "
	                echo "Nº Ficheros que puede modificar:$NumeroFicherosMod"
	                echo "Nº Ficheros abiertos:$NumeroFicherosAb "
	                echo "Ficheros más antiguo del usuario:$FicheroAntiguo"
	                echo "Fichero más recientemente modificado:$FicheroMasReciente"
	                echo "Tamaño fichero más pequeño:$FicheroMasPequeño"
	                echo "Tamaño medio de fichero:"
	                echo "Tamaño fichero más grande:$FicheroMasPesado"
	                echo "Tipo de fichero más usual:"
	                echo "#################################################"
	                read pause

		fi
	elif [ $1 = -c ]
	then
		UsuariosConectados=$(who | cut -d" " -f1)
		for UsuarioConectado in $UsuariosConectados
		do
                	HomeUsuariosCo=$(getent passwd {1000..60000} | grep "$UsuarioConectado" | cut -d: -f6)
                	NumeroFicherosPro=$(find $HomeUsuariosCo -user $UsuarioCo | wc -l)
               		NumeroFicherosMod=$(find $HomeUsuariosCo -user $UsuarioCo -perm -u+w | wc -l)
               		NumeroFicherosAb=$( lsof -u $UsuarioCo | wc -l)
                	FicheroAntiguo=$(ls $HomeUsuariosCo -tr -R | head -n2 | tail -n 1)
                	FicheroMasReciente=$(ls $HomeUsuariosCo -t -R | head -n2 | tail -n 1)
        	        FicheroMasPequeño=$(ls -s -R $HomeUsuariosCo | head -n3 | tail -n 1)
	                FicheroMasPesado=$(du $HomeUsuariosCo | sort -n -r | head -n3 )

			echo "#################################################"
                        echo "Usuario:$UsuarioConectado"
                        echo "Nº Ficheros de los que es propietario:$NumeroFicherosPro"
                        echo "Nº Ficheros que puede modificar:$NumeroFicherosMod"
                        echo "Nº Ficheros abiertos:$NumeroFicherosAb "
                        echo "Ficheros más antiguo del usuario:$FicheroAntiguo"
                        echo "Fichero más recientemente modificado:$FicheroMasReciente"
                        echo "Tamaño fichero más pequeño:$FicheroMasPequeño"
                        echo "Tamaño medio de fichero:"
                        echo "Tamaño fichero más grande:$FicheroMasPesado"
                        echo "Tipo de fichero más usual:"
                        echo "#################################################"
                        read pause

			sleep 2
		done
	fi
fi
