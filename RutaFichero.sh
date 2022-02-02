#!/bin/bash
clear
if [ $# -ge 1 ]
then
        for var in $*
                do
                localizacion=$(find /home -name $var)
                echo "Selecciona una de estas opciones para $var:"
                echo "1. Ver ruta de archivo o directorio"
                echo "2. Ver el contenido de archivo o directorio"
                echo "3. Ver permisos de archivo o directorio"
                read op
                while true; do
                clear
                case $op in
                        1) echo "Ruta"
                        if [ -f "$localizacion" ]
                                then
                                echo "$var es un fichero"
                                find / -name $var 2> /dev/null
                                sleep 2
                                clear
                                break
                        elif [ -d "$localizacion" ]
                                then
                                echo "$var es un directorio"
                                find / -name $var 2> /dev/null
                                clear
                                break
                        fi
                                ;;

                        2) echo "Contenido"
                        if [ -f "$localizacion" ]
                                then
                                echo "$var es un fichero"
                                cat $localizacion
                                sleep 2
                                clear
                                break
                        elif [ -d "$localizacion" ]
                                then
                                echo "$var es un directorio"
                                tree $localizacion
                                sleep 2
                                clear
                                break
                        fi
                                ;;

                        3)
                        echo "Permisos"
                        if [ -f "$localizacion" ]
                                then
                                echo "$var es un fichero"
                                ls -l $localizacion
                                sleep 2
                                clear
                                break
                        elif [ -d "$localizacion" ]
                                then
                                echo "$var es un directorio"
                                ls -l $localizacion
                                sleep 2
                                clear
                                break
                        fi
                                ;;
                esac
                done
        done
else
        clear
        echo "Tienes que poner como minimo 1 parametro"
fi






