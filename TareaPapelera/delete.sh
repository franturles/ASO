#!/bin/bash
UsuarioActual=$(whoami)
HomeUsuarioActual=$(getent passwd | grep $UsuarioActual | cut -d: -f6)
if [ -z $1 ]
then
	echo "Debes decirme un parametro"
else
	if [ -d $HomeUsuarioActual/CarpetaReciclaje ]
	then
		echo "Carpeta de reciclaje creada"
	else
		echo "Creando carpeta de reciclaje"
		mkdir $HomeUsuarioActual/CarpetaReciclaje
	fi
	mv $1 $HomeUsuarioActual/CarpetaReciclaje/$1
	echo "$1 Borrado"
fi
