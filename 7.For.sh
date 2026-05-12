#!/bin/bash

echo "Se van a crear las carpetas"
for i in {1..10}
do
    mkdir "${i}.Carpeta_Vacia"
done

for ((i=1;i<=10;i++))
do
    rm -r "${i}.Carpeta_Vacia"
done
echo "Se acabn de eliminar las carpetas"