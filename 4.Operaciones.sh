#!/bin/bash

read -p "Ingresa un numero" primer_numero
read -p "Ingresa otro numero" segundo_numero

suma=$(($primer_numero + $segundo_numero))
resta=$(($primer_numero - $segundo_numero))
multiplicacion=$(($primer_numero * $segundo_numero))
division=$(($primer_numero / $segundo_numero))

echo "La suma es: $suma"
echo "La resta es: $resta"
echo "La multiplicacion es: $multiplicacion"
echo "La division es: $division"
