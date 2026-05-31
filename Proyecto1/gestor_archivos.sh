#!/bin/bash

# funcion 8
guardar_historial () {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ${1}" >> historial.log
}

ver_historial () {
    if [[ -f "historial.log" ]]
    then
        cat historial.log
    else
        echo "Todavia no hay historial"
    fi
}

# funcion 1
mostrar_opciones () {
    echo "1. Mostrar información general de la carpeta"
    echo "2. Listar archivos por extensión"
    echo "3. Analizar un archivo de texto"
    echo "4. Buscar una palabra en todos los .txt"
    echo "5. Generar reporte general"
    echo "6. Crear backup de la carpeta"
    echo "7. Eliminar archivos vacíos"
    echo "8. Ver historial de acciones"
    echo "9. Limpiar pantalla"
    echo "0. Salir"
}

cantidad_carpetas () {
    contador=0

    for elemento in "${1}"/*
    do
        if [[ -d "${elemento}" ]]
        then
            ((contador++))
        fi
    done

    echo "${contador}"
}

cantidad_archivos () {
    contador=0

    for elemento in "${1}"/*
    do 
        if [[ -f "${elemento}" ]]
        then
            ((contador++))
        fi
    done

    echo "${contador}"
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
            contador_subcarpeta=$(cant_archivos_carpeta "${elemento}")
            contador=$((contador + contador_subcarpeta))
        fi
    done  

    echo "${contador}"      
}

mostrar_info_general () {
    echo "Ruta actual:"
    pwd

    echo "Fecha actual:"
    date 

    echo "Cantidad de carpetas directas:"
    cantidad_carpetas "${1}"

    echo "Cantidad de archivos directos:"
    cantidad_archivos "${1}"

    echo "Cantidad total de archivos contando subcarpetas:"
    cant_archivos_carpeta "${1}"
}

# funcion 2
listar_archivos () {
    find "${1}" -maxdepth 10 -type f -name "*.${2}"
}

# funcion 3
analizar_archivo_txt () {
    if [[ -f "${1}" && "${1}" == *.txt ]]
    then
        echo "Primeras 5 lineas:"
        head -n 5 "${1}"

        echo "Ultimas 5 lineas:"
        tail -n 5 "${1}"

        echo "Cantidad de lineas:"
        wc -l "${1}"

        echo "Cantidad de palabras:"
        wc -w "${1}"
    else
        echo "El archivo no existe o no es un archivo .txt"
    fi
}

# funcion 4
buscar_palabra_txt () {
    echo "Palabra buscada: ${1}"
    echo "Cantidad de coincidencias encontradas:"
    grep -rio --include="*.txt" "${1}" "${2}" | wc -l
}

# funcion 5
reporte_general () {
    mkdir -p "Reportes"

    archivo_reporte="Reportes/reporte_general_$(date +%Y-%m-%d_%H-%M-%S).txt"

    echo "Carpeta Analizada: ${1}" > "${archivo_reporte}"
    echo "Fecha: $(date)" >> "${archivo_reporte}"
    echo "Cantidad de carpetas directas: $(cantidad_carpetas "$1")" >> "${archivo_reporte}"
    echo "Cantidad de archivos directos: $(cantidad_archivos "$1")" >> "${archivo_reporte}"
    echo "Cantidad total de archivos contando subcarpetas: $(cant_archivos_carpeta "$1")" >> "${archivo_reporte}"

    echo "Archivo generado en: ${archivo_reporte}"
}

# funcion 6
crear_backup () {
    mkdir -p "Backups"

    nombre_backup="Backups/backup_$(date +%Y-%m-%d_%H-%M-%S).tar"

    tar -cvf "${nombre_backup}" "${1}"

    echo "Backup creado en: ${nombre_backup}"
}

# funcion 7
eliminar_archivos_vacios () {
    echo "Archivos vacios encontrados:"
    find "${2}" -type f -name "*.${1}" -empty

    read -p "Desea eliminarlos? Escriba si para confirmar: " respuesta

    if [[ "${respuesta}" == "si" ]]
    then
        find "${2}" -type f -name "*.${1}" -empty -delete
        echo "Archivos eliminados"
    else
        echo "No se elimino ningun archivo"
    fi
}

# validacion principal
if [[ $# -eq 1 ]]
then
    if [[ -d "${1}" ]]
    then
        while true
        do
            echo
            echo "Que deseas hacer con este directorio?"
            mostrar_opciones

            read -p "Elige una opcion: " opcion

            if ! [[ "${opcion}" =~ ^[0-9]+$ ]]
            then
                echo "Debe ingresar un numero"
                continue
            fi

            if [[ "${opcion}" -eq 1 ]]
            then
                mostrar_info_general "${1}"
                guardar_historial "Se mostro la informacion general de la carpeta"

            elif [[ "${opcion}" -eq 2 ]]
            then
                read -p "Ingresa la extension de los archivos, por ejemplo txt, pdf o sh: " terminacion
                echo "Archivos encontrados:"
                listar_archivos "${1}" "${terminacion}"
                guardar_historial "Se listaron los archivos con extension ${terminacion}"

            elif [[ "${opcion}" -eq 3 ]]
            then
                read -p "Ingresa la ruta del archivo de texto que quieres analizar: " archivo
                analizar_archivo_txt "${archivo}"
                guardar_historial "Se analizo el archivo ${archivo}"

            elif [[ "${opcion}" -eq 4 ]]
            then
                read -p "Ingresa la palabra que buscaremos: " palabra
                buscar_palabra_txt "${palabra}" "${1}"
                guardar_historial "Se busco la palabra ${palabra}"

            elif [[ "${opcion}" -eq 5 ]]
            then
                echo "Generando reporte general..."
                reporte_general "${1}"
                guardar_historial "Se genero el reporte general"

            elif [[ "${opcion}" -eq 6 ]]
            then
                echo "Creando backup..."
                crear_backup "${1}"
                guardar_historial "Se creo el backup"

            elif [[ "${opcion}" -eq 7 ]]
            then
                read -p "Ingresa la extension de los archivos vacios que quieres eliminar: " terminacion
                eliminar_archivos_vacios "${terminacion}" "${1}"
                guardar_historial "Se revisaron archivos vacios con extension ${terminacion}"

            elif [[ "${opcion}" -eq 8 ]]
            then  
                echo "Historial de acciones:"
                ver_historial

            elif [[ "${opcion}" -eq 9 ]]
            then
                clear

            elif [[ "${opcion}" -eq 0 ]]
            then
                echo "Saliendo..."
                break

            else
                echo "Opcion no valida"
            fi
        done
    else
        echo "Ingrese un directorio que exista"
        exit 1
    fi
else 
    echo "Ingrese unicamente un solo directorio"
    exit 1
fi