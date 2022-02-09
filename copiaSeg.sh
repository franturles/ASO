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
                if [ $# = 0 ]
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
					echo "Detectado fichero configurable en $HomeDeUsuarios"
					FicheroOculto=$(grep ^[^#] $HomeDeUsuarios/.copiaSeg.dar)
                                        NumeroDeCopias=$(grep ^[^#] $HomeDeUsuarios/.copiaSeg.dar | head -n1 | cut -d= -f2)
                                        Directorios=$(grep ^[^#] $HomeDeUsuarios/.copiaSeg.dar | tail -n1 | cut -d= -f2)
                                        echo "Se va a realizar $NumeroDeCopias copias de $Directorios"
                                        sleep 5

        			else
                			echo "Ningun fichero configurable detectado en $HomeDeUsuarios"
					sleep 3
					echo "Siguiendo con la ejecucion del programa"
					sleep 2
					clear
	                                echo "Creando copia de $HomeDeUsuarios a $Usuario"
					sleep 2
					mkdir /Backups/$Usuario
                        	        tar -cvf /Backups/$Usuario/$Usuario.$Fecha.tar $HomeDeUsuarios
					echo "Copia de $Usuario realizada con exito"
                                	sleep 5

			        fi
                        done
                elif [ $# > 2 ]
		then
			if [ $1 = -u ]
			then
				UsuarioEs=$(getent passwd {1000..60000} | cut -d: -f1 | grep $2)
				HomeDeUsuarioEs=$(getent passwd {1000..60000} | grep $2 | cut -d: -f6)
				if [ -z $UsuarioEs ]
				then
	        			echo "No existe el usuario $2"
				else
					if [ -f $HomeDeUsuarioEs/.copiaSeg.dar ]
	                                then
						IFS=$'\n'
	                                        echo "Detectado fichero configurable en $HomeDeUsuarioEs"
						FicheroOculto=$(grep ^[^#] $HomeDeUsuarioEs/.copiaSeg.dar)
						NumeroDeCopias=$(grep ^[^#] $HomeDeUsuarioEs/.copiaSeg.dar | head -n1 | cut -d= -f2)
						Directorios=$(grep ^[^#] $HomeDeUsuarioEs/.copiaSeg.dar | tail -n1 | cut -d= -f2 | tr ":")
						Archivos=$(echo $Directorios | tr ":")
						echo $Directorios
						echo "Haciendo copia de los siguientes directorios: $Directorios"
						#while [ "$number" -le "" ]
						#echo tar -cvf /Backups/$2/$2.$Fecha.tar $HomeDeUsuarioEs/$Directorios

	                                else
	                                        echo "Ningun fichero configurable detectado en $HomeDeUsuarioEs"
	                                        sleep 3
	                                        echo "Siguiendo con la ejecucion del programa"
						sleep 2
						clear
		        			echo "Creando copia de $HomeDeUsuarioEs a $UsuarioEs"
						sleep 2
						mkdir /Backups/$2
		                                tar -cvf /Backups/$2/$2.$Fecha.tar $HomeDeUsuarioEs
						echo "Copia de $2 realizada con exito"
					fi
				fi
			else
				echo "El primer parametro es -u"
			fi

                fi
else
        echo "No eres root"
fi


