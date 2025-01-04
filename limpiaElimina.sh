#!/bin/bash

read -p "Introduce el directorio que quieres limpiar: " directorio

if [ ! -d "$directorio" ]; then
    echo "El directorio no existe. Por favor, verifica la ruta."
    exit 1
fi

echo "Limpieza en progreso en el directorio: $directorio"

echo "Eliminando archivos temporales..."
find "$directorio" -type f -name "*.tmp" -exec rm -v {} \;

echo "Eliminando archivos vacíos..."
find "$directorio" -type f -empty -exec rm -v {} \;

echo "Eliminando directorios vacíos..."
find "$directorio" -type d -empty -exec rmdir -v {} \;

echo "Limpieza completada."
