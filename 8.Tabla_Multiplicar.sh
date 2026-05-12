#!/bin/bash

read -p "Ingresa el numero" numero

if [ -n $numero ]
then
    for ((i=0; i<=15; i++))
    do
        producto=$((i * numero))
        echo "${numero} x ${i} = ${producto}"
    done
else
    echo "Ejecuta de nuevo e ingresa un numero"
fi