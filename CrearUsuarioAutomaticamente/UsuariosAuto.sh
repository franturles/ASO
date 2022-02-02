#!/bin/bash
if [ $# -ge 1 ]
	then
	grupo=$(cut -f1 -d ',' $1)
	Numero=$(cut -f2 -d ',' $1)
		for var in $grupo
		do
		groupdel $var 2> /dev/null
		groupadd $var
		echo "Se ha creado el grupo $var"
		for var2 in $Numero
		do
			number=0
			while [ "$number" -lt "$var2" ]
			do
				NombreUsuario=$($var-$number)
				echo "$NombreUsuario"
				number=$(($number+1))
			done

		done
	done

else
	echo "Debes pasar un fichero"
fi
