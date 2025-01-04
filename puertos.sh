#!/bin/bash

if command -v ss &> /dev/null; then
    herramienta="ss"
else
    herramienta="netstat"
fi

echo "Verificando puertos abiertos usando $herramienta..."
if [ "$herramienta" == "ss" ]; then
    ss -tuln
else
    netstat -tuln
fi

echo "Verificación completada."

