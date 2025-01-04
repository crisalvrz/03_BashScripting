#!/bin/bash

archivo_log="/var/log/auth.log"

if [ ! -f "$archivo_log" ]; then
    echo "El archivo de registro $archivo_log no existe."
    exit 1
fi

echo "Analizando intentos de inicio de sesión fallidos..."
grep "Failed password" "$archivo_log" | awk '{print $1, $2, $3, $11, $13}' | sort | uniq -c | sort -nr > intentos_fallidos.txt

echo "Análisis completado. Resultados guardados en 'intentos_fallidos.txt'."
cat intentos_fallidos.txt

