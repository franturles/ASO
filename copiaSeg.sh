#!/bin/bash
clear
echo "Iniciando programa..."
ListadoUsuarios=$(getent passwd {1000..60000} | cut -d: -f1,6)
Fecha=$(date +%m-%b-%Y_%H:%M)
if [ -d /Backups ]
then
        echo "Carpeta Backups ya establecida"
else
        echo "Carpeta Backups no establecida"
        sleep 2
        mkdir /Backups
        echo "Carpeta Backups creada con exito"
	sleep 2
        clear
fi
if [ $EUID = 0 ]
then
        echo "Vale, eres root"
                if [ -z $1 ]
                then
                        echo "No hay ningun parametro"
                        sleep 2
                        echo "Procediendo a la copia de seguridad de todos los usuarios"
                        sleep 2
                        for Usuarios in $ListadoUsuarios
                        do
                                Usuario=$(echo $Usuarios | cut -d: -f1)
                                HomeDeUsuarios=$(echo $Usuarios | cut -d: -f2)
				clear
				if [ -f $HomeDeUsuarios/.copiaSeg.dar ]
        			then
					echo "Detectado fichero"
					for var in $HomeDeUsuarios/.copiaSeg.dar
					do
					Linea1=$(cat $HomeDeUsuarios/.copiaSeg.dar)
					cat $var
					done
                			sleep 5
        			else
                			echo "Ningun fichero configurable detectado"
					sleep 3
					echo "Siguiendo con la ejecucion del programa"
			        fi

                                echo "Creando copia de $HomeDeUsuarios a $Usuario"
				sleep 2
				mkdir /Backups/$Usuario
                                tar -cvf /Backups/$Usuario/$Usuario.$Fecha.tar $HomeDeUsuarios
				echo "Copia de $Usuario realizada con exito"
                                sleep 5
                        done
                else
			UsuarioEs=$(getent passwd {1000..60000} | cut -d: -f1 | grep $1)
			HomeDeUsuarioEs=$(getent passwd {1000..60000} | grep $1 | cut -d: -f6)
			if [ -z $UsuarioEs ]
			then
        			echo "No existe el usuario $1"
			else
				if [ -f $HomeDeUsuarioEs/.copiaSeg.dar ]
                                then
                                        echo "Detectado fichero"
                                        for var in $HomeDeUsuarioEs/.copiaSeg.dar
                                        do
                                        Linea1=$(cat $HomeDeUsuarioEs/.copiaSeg.dar)
					cat $var
                                        done
                                        sleep 5

                                else
                                        echo "Ningun fichero configurable detectado"
                                        sleep 3
                                        echo "Siguiendo con la ejecucion del programa"
                                fi


        			echo "Creando copia de $HomeDeUsuarioEs a $UsuarioEs"
				mkdir /Backups/$1
                                tar -cvf /Backups/$1/$1.$Fecha.tar $HomeDeUsuarioEs
				echo "Copia de $1 realizada con exito"
			fi

                fi
else
        echo "No eres root"
fi


