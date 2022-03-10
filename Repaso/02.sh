#!/bin/bash
clear
ListadoUsuarios=$(getent passwd {1000..60000} | cut -d: -f1)
for user in $ListadoUsuarios
do
	Info=$(chage -l $user | sed '4,7d')
	Exp=$(chage -l $user | sed '4,7d'| cut -d: -f2 | sed '2,3d' )
	ExpPas=$(chage -l $user | sed '4,7d'| cut -d: -f2 | sed -e "1d" | sed -e "2d")
	echo "--------------------------------"
	echo "Nombre: $user"
	echo "Fecha de expiracion de la cuenta: $Exp"
	echo "Fecha de expiracion de la contraseña: $ExpPas"
	echo "--------------------------------"
	read pause
done
