#!/bin/bash

saludar(){
    read -p "Hola, ingresa tu nombre: " nombre

    if [[ -n "${nombre}" ]]
    then
        echo "Hola ${nombre}, como estas, tiempo que no te veo por aqui"
    else
        echo "No ingresaste ningun nombre"
    fi
}

fecha_actual(){
    date
}

crear_carpeta(){
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
}

end_all(){
    echo "Saliendo del programa..."
    break
}

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
        saludar

    elif [[ "${opcion}" == "2" ]]
    then
        fecha_actual

    elif [[ "${opcion}" == "3" ]]
    then
        crear_carpeta

    elif [[ "${opcion}" == "0" ]]
    then
        end_all

    else
        echo "Opcion no valida"
    fi
done