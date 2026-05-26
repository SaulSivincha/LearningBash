#!/bin/bash

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

mostrar_info_general () {
    echo "Ruta actual: "
    pwd
    echo "Fecha actual: "
    date 
    echo "Cantidad Carpetas: "
    cantidad_carpetas
    echo "Cantidad Archivos"
}

cantidad_carpetas () {
    cantidad_carpetas=0
    for elemento in ${1}
    do
        if [[ -d "${elemento}" ]]
        then
            ((cantidad_carpetas++))
        fi
    done
    echo cantidad_carpetas
}

cantidad_archivos() {
    cantidad_archivos=0
    for elemento in ${1}
    do 
        if [[ -f $"{elemento}" ]]
        then
            ((cantidad_archivos++))
        fi
    done
    echo cantidad_archivos
}


if [[ ${1} -eq 1 ]]
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

            elif [[ "${opcion}" -eq 2 ]]
            then

            elif [[ "${opcion}" -eq 3 ]]
            then

            elif [[ "${opcion}" -eq 4 ]]
            then

            elif [[ "${opcion}" -eq 5 ]]
            then

            elif [[ "${opcion}" -eq 6 ]]
            then

            elif [[ "${opcion}" -eq 7 ]]
            then

            else

            then
            fi
        done
    else
        echo "Ingrese un archivo que exista"
        exit 1
    fi
else 
    echo "Ingrese unicamente un solo archivo"
    exit 1
fi

