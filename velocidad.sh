#!/bin/bash

url="http://speedtest.tele2.net/10MB.zip"

if command -v wget &> /dev/null; then
    herramienta="wget"
elif command -v curl &> /dev/null; then
    herramienta="curl"
else
    echo "Ni wget ni curl están instalados. Por favor, instala uno de ellos."
    exit 1
fi

echo "Realizando prueba de velocidad de red usando $herramienta..."
if [ "$herramienta" == "wget" ]; then
    wget --output-document=/dev/null --report-speed=bits "$url"
else
    curl -o /dev/null --progress-bar --speed-time 1 "$url"
fi

echo "Prueba de velocidad completada."
