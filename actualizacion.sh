#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Por favor, ejecuta este script como usuario root o con sudo."
    exit 1
fi

echo "Actualizando lista de paquetes..."
apt update -y

echo "Actualizando paquetes instalados..."
apt upgrade -y

echo "Eliminando paquetes innecesarios..."
apt autoremove -y

echo "Limpieza de caché de paquetes..."
apt clean

echo "Actualización del sistema completada."

