#!/bin/bash

read -p "Introduce el directorio para buscar duplicados: " directorio

if [ ! -d "$directorio" ]; then
    echo "El directorio no existe."
    exit 1
fi

declare -A hashes

for archivo in "$directorio"/*; do
    if [ -f "$archivo" ]; then
        hash=$(md5sum "$archivo" | awk '{print $1}')
        if [[ -n "${hashes[$hash]}" ]]; then
            echo "Duplicado encontrado: $archivo"
            echo "Eliminando duplicado..."
            rm "$archivo"
        else
            hashes[$hash]="$archivo"
        fi
    fi
done

echo "Eliminación de duplicados completada."
