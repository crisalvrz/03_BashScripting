#!/bin/bash

read -p "Introduce el directorio en el que deseas cambiar los permisos: " directorio

if [ ! -d "$directorio" ]; then
    echo "El directorio no existe."
    exit 1
fi

echo "Estableciendo permisos para archivos (644) y carpetas (755)..."
find "$directorio" -type f -exec chmod 644 {} \;
find "$directorio" -type d -exec chmod 755 {} \;

echo "Permisos actualizados correctamente."
