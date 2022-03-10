#/bin/bash
clear
echo "Digame el nombre de un usuario"
read user
id -u $user 2>/dev/null
	if [ $? -ne 0 ]
        then
        echo "No existe el usuario $user"
        else
	uid=$(id $user | cut -d" " -f1)
	gid=$(id $user | cut -d" " -f2)
	home=$(getent passwd {1000..60000} | cut -d: -f6 | grep "$user" | uniq)
        echo "El usuario $user existe"
	echo "-------------------------------"
	echo "Nombre: $user"
	echo "$uid"
	echo "$gid"
	echo "$home"
	echo "------------------------------"
        fi


