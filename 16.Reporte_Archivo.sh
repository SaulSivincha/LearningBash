#!/bin/bash

if [[ $# -eq 1 && -f "${1}" ]]
then
    read -p "Ingresa la palabra que quieres buscar: " palabra

    if [[ -z "${palabra}" ]]
    then
        echo "Ingresa una palabra"
        exit 1
    else
        echo "Archivo analizado: ${1}" > "Reporte.txt"
        echo "Fecha del reporte:" >> "Reporte.txt"
        date >> "Reporte.txt"

        echo "Cantidad de lineas:" >> "Reporte.txt"
        wc -l "${1}" >> "Reporte.txt"

        echo "Cantidad de palabras:" >> "Reporte.txt"
        wc -w "${1}" >> "Reporte.txt"

        echo "Palabra buscada: ${palabra}" >> "Reporte.txt"

        echo "Cantidad de lineas donde aparece la palabra:" >> "Reporte.txt"
        grep "${palabra}" "${1}" | wc -l >> "Reporte.txt"

        echo "Lineas donde aparece la palabra:" >> "Reporte.txt"
        grep -n "${palabra}" "${1}" >> "Reporte.txt"

        cat "Reporte.txt"
        exit 0
    fi
else
    echo "Debes ingresar un solo archivo existente"
    echo "Uso: ./16.ReporteArchivo.sh archivo.txt"
    exit 1
fi