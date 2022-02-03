#!/bin/bash
clear
archivo=$(cat $1)
if [ $# -ge 1 ]
        then
         for var in $archivo
         do
                grupo=$(echo $var | cut -d, -f1)
                usuarios=$(echo $var | cut -d, -f2)
                groupdel $grupo 2> /dev/null
                groupadd $grupo 2> /dev/null
                echo "Se ha creado el grupo $grupo"
                echo "Creando Usuarios para el grupo $grupo"
                sleep 3
                for var2 in $usuarios
                do
                        number=1
                        while [ "$number" -le "$var2" ]
                        do
                                #NombreUsuario=$($var'-'$number)
                                userdel -r $grupo-$number 2> /dev/null
                                useradd $grupo-$number -m -d /home/$grupo-$number -G $grupo
                                echo "Se ha creado el usuario $grupo-$number"
                                number=$(($number+1))
                        done
                        break
                        sleep 2
                done
        done

else
        echo "Debes pasar un fichero"
fi

