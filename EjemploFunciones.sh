#!/bin/bash
clear
function Listado() {
	ListUsers=$(getent passwd {1000..60000} | cut -d: -f1 | grep "$1")
	if [ -z $ListUsers ]
	then
		echo "$1 no existe"
	else
		UIDU=$(id -u $ListUsers)
		GUIDU=$(id -g $ListUsers)
		homeu=$(getent passwd {1000..60000} | cut -d: -f1,6 | grep "$1" | cut -d: -f2)
		echo -e "--------------------"
		echo -e "| Nombre:$ListUsers "
		echo -e "| UID:$UIDU         "
		echo -e "| GUID:$GUIDU       "
		echo -e "| Directorio Home: $homeu"
		echo -e "--------------------"
	fi
}
if [ $# -eq 0 ]
then
	echo "Debes darme un parametro pendejo"
else
	Listado "$1"
fi

