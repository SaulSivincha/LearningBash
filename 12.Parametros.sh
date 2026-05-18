#!/bin/bash

crear_carpeta(){
    mkdir "${1}"
    cd "${1}"

    for ((i=1; i<="${2}"; i++))
    do
        touch "${i}.${1}_notas.txt"
    done

    cd ../
}

eliminar_carpeta(){
    rm -r "${1}"
}

if [[ $# -ne 2 ]]
then
    echo "Ingrese los parametros correctamente"
    echo "Uso: ./12.Parametros.sh nombreCarpeta cantidadArchivos"
    exit 1
fi

crear_carpeta "${1}" "${2}"

read -p "Ingresa 'si', si quieres eliminar todo: " respuesta

if [[ "${respuesta}" == "si" ]]
then
    eliminar_carpeta "${1}"
fi