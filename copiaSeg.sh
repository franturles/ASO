#!/bin/bash
clear
echo "Creando mundo..."
ListarUsuarios=$(getent passwd {1000..60000} | cut -d: -f1)
HomeDeUsuarios=$(getent passwd {1000..60000} | cut -d: -f6)
Fecha=$(date +%m-%b-%Y_%H:%M)
if [ -d /Backups ];then
echo "Carpeta Backups ya establecida"
else
echo "Carpeta Backups no establecida"
sleep 1
mkdir /Backups
echo "Carpeta Backuos creada con exito"
clear
fi
if [ $EUID = 0 ]; then
	echo "Vale, eres root"
		if [ -z $1 ]
		then
			echo "No hay ningun parametro"
			sleep 2
			echo "Procediendo a la copia de seguridad de todos los usuarios"
			sleep 2
			for Usuario in $ListarUsuarios
			do
				echo "Creando copìa de $Usuario"
				tar -cvf /Backups/$Usuario.$Fecha.tar /home/$Usuario
				sleep 2
				if [ $? = 0 ]
				then
					clear
					echo "El usuario $Usuario no tiene carpeta de trabajo"
				else
					echo "Copia de Seguridad creada con exito"
				fi
				sleep 2
			done
		else
			echo "El parametro es $1"
		fi
else
	echo "No eres root"
fi

