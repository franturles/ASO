#!/bin/bash
archivo=$(cat $1)

for Usuario in $archivo
do
	userdel -r -f $Usuario
        sleep 2
done

