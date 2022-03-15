#!/bin/bash
sudo useradd -m -s /bin/bash Cristian -p abc123.
if [ $? -ne 0 ]
then
	echo "Ya existe el usuario $Usuario"
else
	echo ""
fi

