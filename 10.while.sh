#!/bin/bash

while true
do
    echo "MENU BASICO"
    echo "1. Saludar"
    echo "2. Mostrar fecha"
    echo "3. Crear carpeta random"
    echo "0. Salir"

    read -p "Bienvenido, ingresa una opcion: " opcion

    if [[ "${opcion}" == "1" ]]
    then
        read -p "Hola, ingresa tu nombre: " nombre

        if [[ -n "${nombre}" ]]
        then
            echo "Hola ${nombre}, como estas, tiempo que no te veo por aqui"
        else
            echo "No ingresaste ningun nombre"
        fi

    elif [[ "${opcion}" == "2" ]]
    then
        date

    elif [[ "${opcion}" == "3" ]]
    then
        mkdir -p "Carpeta Random"
        echo "Carpeta creada correctamente"
        ls

        read -p "Quieres borrarla? escribe si o no: " borrar

        if [[ "${borrar}" == "si" ]]
        then
            rm -r "Carpeta Random"
            echo "Carpeta eliminada"
        else
            echo "La carpeta no fue eliminada"
        fi

    elif [[ "${opcion}" == "0" ]]
    then
        echo "Saliendo del programa..."
        break

    else
        echo "Opcion no valida"
    fi

done