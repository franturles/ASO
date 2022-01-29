#!/bin/bash
clear
var=0
while [ $var -lt 11 ]
do
	Multiplicacion=$((6*$var))
	touch TablaDel6.txt
	echo "6 x $var = $Multiplicacion"
	sleep 1
	echo "6 x $var = $Multiplicacion" >> TablaDel6.txt
	var=$(($var+1))
done
echo "¿Quieres ver la tabla completa en un .txt? (Contesta con Y o N)"
read pregunta
pregunta=$(echo $pregunta | tr  [[:upper:]] [[:lower:]])
if [ $pregunta = "y" ]
then
gedit TablaDel6.txt
rm TablaDel6.txt
echo "Adios Muy buenas"
else
echo "Adios Muy buenas"
fi
