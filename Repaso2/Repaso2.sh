#!/bin/bash
clear
Contador=0
ListadoUsuarios=$(getent passwd {1000..60000} | cut -d: -f1)

if [ $# -eq 1 ] && [ -f $1 ]
then
	archivo=$(cat $1)
	archivoOrdenado=$(sort -r $1 | head -n 4)
	echo "Fichero detectado"
	sleep 1
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
			if [ $? -ne 0 ]
			then
        			echo "Ya existe el usuario $Usuario"
				sleep 2

			else
        			echo "Creado con exito el usuario $Usuario"
				sleep 2
			fi
		done
		break
		;;

		2) echo "Creaccion limitada"
		for Usuario in $archivoOrdenado
                do
			sudo useradd -m -s /bin/bash $Usuario -p abc123. 2>/dev/null
			if [ $? -ne 0 ]
                        then
                                echo "Ya existe el usuario $Usuario"
                                sleep 2

                        else
                                echo "Creado con exito el usuario $Usuario"
                                sleep 2
                        fi
                done
		break
		;;

		3) echo "Creaccion con grupos"
		sudo groupadd IES 2> /dev/null
                if [ $? -ne 0 ]
		then
			echo "El grupo IES ya esta establecido"
		else
			echo "Grupo IES no encontrado"
			sleep 2
			echo "Creado con exito el grupo IES"
		fi

		for Usuario in $archivo
                do
			Contador=$((Contador+1))
			if [ $Contador -le 2 ]
			then
		     		sudo useradd -m -s /bin/bash $Usuario -p abc123. -G IES 2>/dev/null
	                        if [ $? -ne 0 ]
        	                then
                	                echo "Ya existe el usuario $Usuario"
                        	        sleep 2

                       		else
                                	echo "Creado con exito el usuario $Usuario para el grupo IES"
                                	sleep 2
                        	fi

			else
				sudo useradd -m -s /bin/bash $Usuario -p abc123. 2>/dev/null
	                        if [ $? -ne 0 ]
	                        then
	                                echo "Ya existe el usuario $Usuario"
	                                sleep 2

	                        else
	                                echo "Creado con exito el usuario $Usuario"
	                                sleep 2
	                        fi
					sudo passwd -l $Usuario > /dev/null 2>&1
			fi

                done
		break
		;;
	esac
	done

else
	echo "Tiene que pasar solo un fichero"
	sleep 1
fi

