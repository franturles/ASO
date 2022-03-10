#!/bin/bash
id -u Manuel
        if [ $? -ne 0 ]
        then
        useradd Manuel -m -d /home/Manuel
        echo "El usuario $CrearUser ha sido creado de forma satisfactoria"
        else
        echo "El usuario ya Existe"
	usermod -l Manu -s /bin/sh -m -d /home/manolito Manuel
        fi

