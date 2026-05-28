#!/bin/bash

#funcion 1
mostrar_opciones () {
    echo "1. Mostrar información general de la carpeta"
    echo "2. Listar archivos .txt"
    echo "3. Analizar un archivo de texto"
    echo "4. Buscar una palabra en todos los .txt"
    echo "5. Generar reporte general"
    echo "6. Crear backup de la carpeta"
    echo "7. Eliminar archivos vacíos"
    echo "8. Ver historial de acciones"
    echo "0. Salir"
}

cantidad_carpetas () {
    cantidad_carpetas=0
    for elemento in ${1}/*
    do
        if [[ -d "${elemento}" ]]
        then
            ((cantidad_carpetas++))
        fi
    done
    echo "${cantidad_carpetas}"
}

cantidad_archivos () {
    cantidad_archivos=0
    for elemento in ${1}/*
    do 
        if [[ -f "${elemento}" ]]
        then
            ((cantidad_archivos++))
        fi
    done
    echo "${cantidad_archivos}"
}

cant_archivos_carpeta () {
    contador=0
    for elemento in "${1}"/*
    do
        if [[ -f "${elemento}" ]]
        then 
            ((contador++))
        elif [[ -d "${elemento}" ]]
        then
            contador_again=$(cant_archivos_carpeta "${elemento}")
            contador=$((contador + contador_again))
        fi
    done  
    echo "${contador}"      
}

mostrar_info_general () {
    echo "Ruta actual: "
    pwd
    echo "Fecha actual: "
    date 
    echo "Cantidad Carpetas: "
    cantidad_carpetas "${1}"
    echo "Cantidad Archivos"
    cant_archivos_carpeta "${1}"
}

#funcion 2
listar_archivos () {
    find "${1}" -maxdepth 10 -type f -name "*.${2}"
}

#funcion 3
analizar_archivo_txt () {
    if [[ "${1}" == *.txt ]]
    then
        echo "Primeras 5 lineas"
        head -n 5 "${1}"
        echo "Ultimas 5 lineas"
        tail -n 5 "${1}"
        echo "Cantidad de lineas"
        wc -l "${1}"
        echo "Cantidad de palabras"
        wc -w ${1}
    else
        echo "No es un archivo de texto"
    fi
}

#funcion 4
buscar_palabra_txt () {
    echo "Palabra buscada ${1}"
    grep -rio --include="*.txt" "${1}" "${2}" | wc -l
}

#funcion 5
reporte_general () {
    mkdir "Reportes"
    touch reporte_general.txt
    echo "Carpeta Analizada: ${1}" >> reporte_general.txt
    echo "Fecha: $(date)" >> reporte_general.txt
    echo "Cantidad de carpetas $(cantidad_carpetas "$1")" >> reporte_general.txt
    echo "Cantidad de archivos $(cantidad_archivos "$1")" >> reporte_general.txt
    mv reporte_general.txt ./Reportes
    echo "Archivo generado en el directorio Reportes"
}



if [[ $# -eq 1 ]]
then
    if [[ -d ${1} ]]
    then
        while (true)
        do
            echo "Que deseas hacer con este directorio?"
            mostrar_opciones
            read -p "Elige una opción: " opcion
            if [[ "${opcion}" -eq 1 ]]
            then
                echo "Cantidad de carpetas:"
                cantidad_carpetas "${1}"
                echo "Cantidad de archivos"
                cantidad_archivos "${1}"

            elif [[ "${opcion}" -eq 2 ]]
            then
                read -p "Ingresa la terminacion de los archivos:" terminacion
                echo "Listar archivos completos"
                listar_archivos "${1}" "${terminacion}"

            elif [[ "${opcion}" -eq 3 ]]
            then
                read -p "Ingresa el archivo de texto que quieres analziar" archivo
                echo "Ingresa el directorio en el cual lo buscara"
                analizar_archivo_txt "${archivo}" "${1}"

            elif [[ "${opcion}" -eq 4 ]]
            then
                read -p "Ingresa la palabra que buscaremos" palabra
                echo "Ingresa el directorio"
                buscar_palabra_txt "${palabra}" "${1}"

            elif [[ "${opcion}" -eq 5 ]]
            then
                echo "Generando reporte general"
                reporte_general "${1}"

            elif [[ "${opcion}" -eq 6 ]]
            then

            elif [[ "${opcion}" -eq 7 ]]
            then

            else
                echo "Saliendo..."
                break
            fi
        done
    else
        echo "Ingrese un directorio que exista"
        exit 1
    fi
else 
    echo "Ingrese unicamente un solo archivo"
    exit 1
fi

