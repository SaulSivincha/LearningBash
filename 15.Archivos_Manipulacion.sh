#!/bin/bash

if [[ $# -ne 1 ]]
then
    echo "Uso correcto: ./14.BuscarEnArchivo.sh archivo.txt"
    exit 1
fi

if [[ -f "${1}" ]]
then   
    echo "Contenido del archivo:"
    cat "${1}"

    echo "Cantidad de lineas:"
    wc -l "${1}"

    echo "Buscando la palabra xd:"
    grep "xd" "${1}"

    echo "Buscando la palabra xd con numero de linea:"
    grep -n "xd" "${1}"
else
    echo "Este archivo no existe"
    exit 1
fi