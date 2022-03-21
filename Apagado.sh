#!/bin/bash
clear
echo "Selecciona una de las siguientes opciones:"
echo "----------- Menu -----------"
echo "1.Apagar"
echo "2.Reiniciar"
echo "3.Salir"
echo "----------------------------"
read op
case $op in
	1)
	clear
	echo "Seccion Apagar"
	echo "----------- Menu -----------"
        echo "1.Apagado inmediato"
        echo "2.Cuenta atras para el apagado"
        echo "3.Salir"
        echo "----------------------------"
        read op2
        case $op2 in
                        1)
                        clear
                        echo "Apagando..."
                        sleep 3
                        shutdown now
                        ;;

                        2)
                        clear
                        echo "Digame en cuantos minutos quiere hasta que se apague"
                        read tiempo
                       	shutdown -h +$tiempo
                        echo "El equipo se apagara en $tiempo minutos"
                        sleep 2
                        ;;

                        3)
                        clear
                        echo "Saliendo..."
                        sleep 3
                        exit
                        break
                        ;;
        esac
	;;

	2)
	clear
	echo "Seccion Reiniciar"
	echo "----------- Menu -----------"
        echo "1.Reinicio inmediato"
        echo "2.Cuenta atras para el reinicio"
        echo "3.Salir"
        echo "----------------------------"
        read op3
	case $op3 in
		  1)
		  clear
		  echo "Reiniciando..."
		  reboot
		  ;;

		  2)
		  clear
		  echo "Digame en cuantos minutos quiere hasta que se reinicie"
		  read tiempo
		  reboot -h +$tiempo
		  ;;

		  3)
		  clear
		  echo "Saliendo..."
		  exit
                  ;;

	esac
	;;

	3)
	clear
	echo "Saliendo..."
	exit
	;;
esac
