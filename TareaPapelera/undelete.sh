#!/bin/bash
UsuarioActual=$(whoami)
HomeUsuarioActual=$(getent passwd | grep $UsuarioActual | cut -d: -f6)
if [ -d $HomeUsuarioActual/CarpetaReciclaje ]
then
	echo "Carpeta de reciclaje detectada"
	sleep 2
	echo "Comprobando la carpeta de reciclaje en $HomeUsuarioActual/CarpetaReciclaje"
	sleep 1
	echo "Encontrado los siguientes ficheros"
	ls -l $HomeUsuarioActual/CarpetaReciclaje
	echo "¿Desea recuperarlos?(Y/N)"
	read Respuesta
	Respuesta=$(echo $Respuesta | tr [[:lower:]] [[:upper:]])
	if [ $Respuesta = "Y" ]
	then
		echo "Recuperando..."
		mv $HomeUsuarioActual/CarpetaReciclaje/* $HomeUsuarioActual
		echo "Listo"
	elif [ $Respuesta = "N" ]
	then
		echo "No se recupero nada"
		sleep 2
		echo "Que tenga un buen dia"
	else
		echo "Por favor elija Y o N"
	fi
else
	echo "No existe la carpeta de reciclaje"
fi
