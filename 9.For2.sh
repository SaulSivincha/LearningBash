#!/bin/bash

read -p "Ingrese el nombre del curso" nombre
read -p "Ingrese la cantidad de practicas" cant_practicas

if [ -n "${nombre}" ] && [ -n "${cant_practicas}" ]
then   
    mkdir "Curso_${nombre}"
    cd "Curso_${nombre}"
    for ((i=1;i<=cant_practicas;i++))
    do   
        mkdir "${i}.Clase_Teorica"
    done
else 
    echo "Ingrese un nombre o numero valido"
fi

read -p "Quieres eliminar la carpeta del curso y su contenido" respuesta
if [ -n "${respuesta}" ] && [ "${respuesta}" = "si" ]
then
    cd ..
    rm -r "Curso_${nombre}"
else   
    echo "vale"
fi