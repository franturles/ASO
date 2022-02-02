#!/bin/bash
clear
if [ $# -ge 1 ]
	then
	grupo=$(cut -f1 -d ',' $1)
	NumeroUS=$(cut -f2 -d ',' $1)
	for var in $grupo
	do
		groupdel $var 2> /dev/null
		groupadd $var 2> /dev/null
		echo "Se ha creado el grupo $var"
		echo "Creando Usuarios para el grupo $var"
		sleep 3
		for var2 in $NumeroUS
		do
			number=1
			while [ "$number" -le "$var2" ]
			do
				#NombreUsuario=$($var'-'$number)
				userdel -r $var-$number 2> /dev/null
				#useradd $var-$number -m -d /home/$var-$number -G $var
				echo "Se ha creado el usuario $var-$number"
				number=$(($number+1))
			done
			sleep 2
		done
	done

else
	echo "Debes pasar un fichero"
fi
