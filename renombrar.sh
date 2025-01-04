#!/bin/bash

read -p "Introduce el directorio con los archivos a renombrar: " directorio
read -p "Introduce el prefijo o sufijo que deseas agregar: " texto
read -p "Deseas agregar el texto como [1] Prefijo o [2] Sufijo? (1/2): " opcion
if [ ! -d "$directorio" ]; then
    echo "El directorio no existe."
    exit 1
fi

for archivo in "$directorio"/*; do
    nombre_base=$(basename "$archivo")
    ruta_dir=$(dirname "$archivo")

    if [ "$opcion" == "1" ]; then
        mv "$archivo" "$ruta_dir/$texto$nombre_base"
    elif [ "$opcion" == "2" ]; then
        mv "$archivo" "$ruta_dir/${nombre_base%.*}$texto.${nombre_base##*.}"
    else
        echo "Opción no válida."
        exit 1
    fi
done

echo "Renombrado completado."
