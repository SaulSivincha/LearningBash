#!/bin/bash

if [[ $# -eq 1 && -f "${1}" ]]
then
    echo "5 primeras lineas:"
    head -n 5 "${1}"

    echo "5 ultimas lineas:"
    tail -n 5 "${1}"

    echo "Contenido del archivo:"
    cat "${1}"

    echo "Contenido del archivo despues de ordenar:"
    sort "${1}" 

    echo "Contar lineas repetidas:"
    sort "${1}" | uniq -c

    read -p "Palabra antigua: " antigua
    read -p "Palabra nueva: " nueva

    echo "Texto con reemplazo:"
    sed "s/${antigua}/${nueva}/g" "${1}"

    exit 0
else
    echo "Uso correcto: ./16.ProcesarTexto.sh archivo.txt"
    exit 1
fi