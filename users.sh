#!/bin/bash

read -p "Introduce el archivo con la lista de usuarios: " archivo_usuarios


if [ ! -f "$archivo_usuarios" ]; then
    echo "El archivo no existe."
    exit 1
fi

# Crear usuarios en masa
while IFS= read -r usuario; do
    if id "$usuario" &>/dev/null; then
        echo "El usuario $usuario ya existe. Omitiendo..."
    else
        # Crear usuario
        contraseña=$(openssl rand -base64 12)
        useradd -m -s /bin/bash "$usuario"
        echo "$usuario:$contraseña" | chpasswd
        echo "Usuario $usuario creado con contraseña: $contraseña"
    fi
done < "$archivo_usuarios"

echo "Gestión de usuarios completada."
