#!/bin/bash

crear_carpeta(){
    if [[ -d "${1}" ]]
    then
        echo "Esta carpeta ya existe"
        exit 1
    else
        if [[ "${2}" =~ ^[0-9]+$ && "${2}" -gt 0 ]]
        then
            mkdir "${1}"
            cd "${1}"

            for ((i=1; i<="${2}"; i++))
            do
                touch "${i}.${1}_notas.txt"
            done

            cd ../
            echo "Carpeta creada correctamente con ${2} archivos"
        else
            echo "El segundo parametro del script debe ser un numero entero positivo"
            exit 1
        fi
    fi
}

eliminar_carpeta(){
    if [[ -d "${1}" ]]
    then
        rm -r "${1}"
        echo "Carpeta eliminada correctamente"
    else
        echo "No se puede eliminar algo que no existe"
        exit 1
    fi
}

if [[ $# -eq 2 ]]
then
    crear_carpeta "${1}" "${2}"

    read -p "Ingresa 'si', si quieres eliminar todo: " respuesta

    if [[ "${respuesta}" == "si" ]]
    then
        eliminar_carpeta "${1}"
        exit 0
    fi
else
    echo "Ingrese los parametros correctamente"
    echo "Uso: ./12.Parametros.sh nombreCarpeta cantidadArchivos"
    exit 1
fi