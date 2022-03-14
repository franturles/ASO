#!/bin/bash
clear
archivo=$(cat $1)
archivoOrdenado=$(sort -r $1 | head -n 4)
Contador=0
if [ $# -ge 1 ]
        then
	echo "Fichero detectado"
	clear
	echo "Selecciona una de estas opciones:"
	echo "1.Crear los usuarios con contraseña abc123."
	echo "2.Crear los últimos 4 usuarios y avisar de únicamente la creación de estos. "
	echo "3.Crear los 2 primeros usuarios y meterlos en un grupo llamado IES. El resto de usuarios crearlos y bloquearlos. "
	read op
	while true;do
	clear
	case $op in
		1) echo "Creando con contraseña preestablecida"
		for Usuario in $archivo
		do
			sudo useradd -m -s /bin/bash $Usuario -p abc123. 2>/dev/null
			echo "Creado con exito el usuario $Usuario"
			sleep 2
		done
		break
		;;

		2) echo "Creaccion limitada"
		for Usuario in $archivoOrdenado
                do
                        sudo useradd -m -s /bin/bash $Usuario -p abc123. 2>/dev/null
                        echo "Creado con exito el usuario $Usuario"
                        sleep 2

                done
		break
		;;

		3) echo "Creaccion con grupos"
		for Usuario in $archivo
                do
			Contador=$((Contador+1))
			if [ $Contador -le 2 ]
			then
                        	sudo useradd -m -s /bin/bash $Usuario -p abc123. -G IES 2>/dev/null
                        	echo "Creado con exito el usuario $Usuario grupo IES"
			else
				sudo useradd -m -s /bin/bash $Usuario -p abc123. 2>/dev/null
				sudo passwd -l $Usuario
				echo "Creado con exito usuario normal $Usuario"
			fi
                        sleep 2

                done
		break
		;;
	esac
	done

else
	clear
	echo "Tiene que pasar un fichero"
fi

