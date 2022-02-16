#!/bin/bash
if [ -z $1 ]
then
	echo "Debes decirme un parametro"
else
	echo "Borrando fichero $1..."
	UsuarioActual$(whoami)
	HomeUsuarioActual=$(getent passwd | grep '$UsuarioActual' | cut -d: -f6)
	if [ -d $UsuarioActual/CarpetaReciclaje ]
	then
		echo "Carpeta de reciclaje creada"
	else
		echo "Creando carpeta de reciclaje"
		mkdir $UsuarioActual/CarpetaReciclaje
	fi
	mv $1 $UsuarioActual/CarpetaReciclaje/$1
	echo "$1 Borrado"
fi
