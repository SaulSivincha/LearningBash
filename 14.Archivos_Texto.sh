#!/bin/bash

crear_carpeta(){
    if [[ -d "${1}" ]]
    then
        echo "Este directorio ya existe"
    else 
        mkdir "${1}"
        echo "Directorio creado correctamente"
    fi
}

crear_archivo(){
    if [[ -f "${1}" ]] 
    then
        echo "Este archivo ya existe"
    else
        touch "${1}"
        echo "Archivo creado correctamente"
    fi
}

escribir_archivo(){
    echo "Fecha actual:" >> "${1}"
    date >> "${1}"

    echo "Ruta actual:" >> "${1}"
    pwd >> "${1}"

    echo "Hola mundo, estoy escribiendo esto al final" >> "${1}"
}

if [[ $# -eq 2 ]]
then
    crear_carpeta "${1}"

    cd "${1}"

    crear_archivo "${2}"
    escribir_archivo "${2}"

    echo "Contenido del archivo:"
    cat "${2}"

    read -p "Quieres eliminar el archivo? " rpta

    if [[ "${rpta}" == "si" ]]
    then
        if [[ -f "${2}" ]]
        then
            rm "${2}"
            echo "Archivo eliminado correctamente"
        else
            echo "El archivo no existe"
        fi
    fi

else
    echo "Tiene que ingresar solamente dos parametros"
    echo "Uso: ./13.ArchivosTexto.sh nombreCarpeta nombreArchivo.txt"
    exit 1
fi