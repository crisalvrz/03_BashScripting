#!/bin/bash

read -p "Introduce el directorio con los archivos a organizar: " directorio

if [ ! -d "$directorio" ]; then
    echo "El directorio no existe."
    exit 1
fi

for archivo in "$directorio"/*; do
    if [ -f "$archivo" ]; then
        extension="${archivo##*.}"
        subdirectorio="$directorio/$extension"

        [ ! -d "$subdirectorio" ] && mkdir "$subdirectorio"

        mv "$archivo" "$subdirectorio/"
    fi
done

echo "Organización completada."
