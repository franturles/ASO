#!/bin/bash
clear
echo "Espere por favor..."
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
		NumeroFicherosPro=$(find $HomeUsuarios -type f -user $Usuario | wc -l)
		NumeroFicherosMod=$(find $HomeUsuarios -type f -user $Usuario -perm -u+w | wc -l)
		NumeroFicherosAb=$( lsof -u $Usuario 2> /dev/null | wc -l)
		FicheroAntiguo=$(ls $HomeUsuarios -tr -R | head -n2 | tail -n 1)
		FicheroMasReciente=$(ls $HomeUsuarios -t -R | head -n2 | tail -n 1)
		FicheroMasPeque=$(find / -user $Usuario -type f -printf "%s %f\0" 2>/dev/null | sort -z -n | head -z -n 1 | cut -z -d ' ' -f 2 | tr '\0' '\n')
		FicheroMasPesado=$(find / -user $Usuario -type f -printf "%s %f\0" 2>/dev/null | sort -z -n | tail -z -n 1 | cut -z -d ' ' -f 1 | tr '\0' '\n')
		FicheroMedio=$(find / -user $Usuario -ls 2>/dev/null | awk '{sum += $7; n++;} END {print sum/n;}')
		#FicheroUsual=$() Sin solucionar
		echo "#################################################"
		echo "Usuario:$Usuario"
		echo "Nº Ficheros de los que es propietario:$NumeroFicherosPro"
		echo "Nº Ficheros que puede modificar:$NumeroFicherosMod"
		echo "Nº Ficheros abiertos:$NumeroFicherosAb"
		echo "Ficheros más antiguo del usuario: $FicheroAntiguo "
		echo "Fichero más recientemente modificado: $FicheroMasReciente"
		echo "Tamaño fichero más pequeño: $FicheroMasPeque"
		echo "Tamaño medio de fichero:$FicheroMedio"
		echo "Tamaño fichero más grande:$FicheroMasPesado"
		echo "Tipo de fichero más usual: Sin concretar"
		echo "#################################################"
		read pause
	done
elif [ $# > 2 ]
then
	if [ $1 = -u ]
	then
		UsuarioEs=$(getent passwd {1000..60000} | cut -d: -f1 | grep -o "$2" | uniq)
		HomeUsuariosEs=$(getent passwd {1000..60000} | grep "$2" | cut -d: -f6)
                NumeroFicherosPro=$(find $HomeUsuariosEs -type f -user $UsuarioEs | wc -l)
                NumeroFicherosMod=$(find $HomeUsuariosEs -type f -user $UsuarioEs -perm -u+w | wc -l)
                NumeroFicherosAb=$( lsof -u $UsuarioEs 2> /dev/null | wc -l)
                FicheroAntiguo=$(ls $HomeUsuariosEs -tr -R | head -n2 | tail -n 1)
                FicheroMasReciente=$(ls $HomeUsuariosEs -t -R | head -n2 | tail -n 1)
		FicheroMasPeque=$(find / -user $UsuarioEs -type f -printf "%s %f\0" 2>/dev/null | sort -z -n | head -z -n 1 | cut -z -d ' ' -f 2 | tr '\0' '\n')
                FicheroMasPesado=$(find / -user $UsuarioEs -type f -printf "%s %f\0" 2>/dev/null | sort -z -n | tail -z -n 1 | cut -z -d ' ' -f 1 | tr '\0' '\n')
                FicheroMedio=$(find / -user $UsuarioEs -ls 2>/dev/null | awk '{sum += $7; n++;} END {print sum/n;}')
		if [ -z $UsuarioEs ]
		then
			echo "No existe ese usuario"
		else
			NumeroFicherosPro=$(find /home/usuario -user usuario | wc -l)
			echo "Existe el usuario $UsuarioEs"
			echo "#################################################"
	                echo "Usuario:$UsuarioEs"
	                echo "Nº Ficheros de los que es propietario:$NumeroFicherosPro"
	                echo "Nº Ficheros que puede modificar:$NumeroFicherosMod"
	                echo "Nº Ficheros abiertos:$NumeroFicherosAb "
	                echo "Ficheros más antiguo del usuario:$FicheroAntiguo"
	                echo "Fichero más recientemente modificado:$FicheroMasReciente"
	                echo "Tamaño fichero más pequeño:$FicheroMasPeque"
	                echo "Tamaño medio de fichero:$FicheroMedio"
	                echo "Tamaño fichero más grande:$FicheroMasPesado"
	                echo "Tipo de fichero más usual: Sin concretar"
	                echo "#################################################"
	                read pause

		fi
	elif [ $1 = -c ]
	then
		UsuariosConectados=$(who | cut -d" " -f1)
		for UsuarioCo in $UsuariosConectados
		do
                	HomeUsuariosCo=$(getent passwd {1000..60000} | grep "$UsuarioCo" | cut -d: -f6)
                	NumeroFicherosPro=$(find $HomeUsuariosCo -type f -user $UsuarioCo | wc -l)
               		NumeroFicherosMod=$(find $HomeUsuariosCo -type f -user $UsuarioCo -perm -u+w | wc -l)
               		NumeroFicherosAb=$( lsof -u $UsuarioCo 2> /dev/null | wc -l)
                	FicheroAntiguo=$(ls $HomeUsuariosCo -tr -R | head -n2 | tail -n 1)
                	FicheroMasReciente=$(ls $HomeUsuariosCo -t -R | head -n2 | tail -n 1)
			FicheroMasPeque=$(find / -user $UsuarioCo -type f -printf "%s %f\0" 2>/dev/null | sort -z -n | head -z -n 1 | cut -z -d ' ' -f 2 | tr '\0' '\n')
                	FicheroMasPesado=$(find / -user $UsuarioCo -type f -printf "%s %f\0" 2>/dev/null | sort -z -n | tail -z -n 1 | cut -z -d ' ' -f 1 | tr '\0' '\n')
                	FicheroMedio=$(find / -user $UsuarioCo -ls 2>/dev/null | awk '{sum += $7; n++;} END {print sum/n;}')

			echo "#################################################"
                        echo "Usuario:$UsuarioCo"
                        echo "Nº Ficheros de los que es propietario:$NumeroFicherosPro"
                        echo "Nº Ficheros que puede modificar:$NumeroFicherosMod"
                        echo "Nº Ficheros abiertos:$NumeroFicherosAb "
                        echo "Ficheros más antiguo del usuario:$FicheroAntiguo"
                        echo "Fichero más recientemente modificado:$FicheroMasReciente"
                        echo "Tamaño fichero más pequeño:$FicheroMasPeque"
                        echo "Tamaño medio de fichero:$FicheroMedio"
                        echo "Tamaño fichero más grande:$FicheroMasPesado"
                        echo "Tipo de fichero más usual: Sin concretar"
                        echo "#################################################"
                        read pause

			sleep 2
		done
	fi
fi
