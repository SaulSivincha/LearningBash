#!/bin/bash

read -p "Ingresa tu edad" edad
if [ $edad -ge 18 ]
then
    echo "Puedes ingresar a esta pagina gore"
else
    echo "No puedes ingresar"
    break
fi