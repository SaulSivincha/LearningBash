#!/bin/bash

read -p "Dime como te llamas" nombre
# i love you
if [ -n "$nombre" ] && [ $nombre == "daniel" ]
then 
    read -p "tienes tu furrsuit" respuesta
    if [ -n $respuesta ] && [ $respuesta = si ]
    then
        echo "Efectivamente, eres un furro"
    else
        echo "Pueda que en realidad seas un Therian"
    fi
else 
    echo "Quiza te has curado"
fi
