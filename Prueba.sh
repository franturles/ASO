#!/bin/bash
NumeroDeCopias=$(grep ^[^#] /home/Paco/.copiaSeg.dar | head -n1 | cut -d= -f2)
Directorio=$(echo /Prueba/)
ContadorDir=$(ls $Directorio | wc -l)
if [ "$NumeroDeCopias" -le "$ContadorDir" ]
then
	echo "hay que borrar directorios"
		ListarViejos=$(ls -t $Directorio)
		echo $Directorio
		for var in $ListarViejos
		do
			while [ "$NumeroDeCopias" -le "$ContadorDir" ]
			do
			rm -r $Directorio$var
			ContadorDir=$(ls $Directorio | wc -l)
			done
		done
else
	echo "No hay que borrar nada"
fi
