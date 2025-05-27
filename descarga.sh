#!/bin/bash

url="https://example.com/archivo.zip"

# Destino
directorio_destino="$HOME/descargas"

if command -v wget &> /dev/null; then
    herramienta="wget"
elif command -v curl &> /dev/null; then
    herramienta="curl"
else
    echo "Ni wget ni curl están instalados. Por favor, instala uno de ellos."
    exit 1
fi

mkdir -p "$directorio_destino"

echo "Descargando archivo desde $url..."
if [ "$herramienta" == "wget" ]; then
    wget -P "$directorio_destino" "$url"
else
    curl -o "$directorio_destino/$(basename "$url")" "$url"
fi

echo "Descarga completada. Archivo guardado en $directorio_destino."

