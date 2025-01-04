#!/bin/bash

# Obtener todas las imágenes
imagenes=$(docker images -q)

# Actualizar las imágenes
for imagen in $imagenes; do
    docker pull "$imagen"
done

# Reiniciar contenedores con nuevas imágenes
contenedores=$(docker ps -q)
for contenedor in $contenedores; do
    docker stop "$contenedor"
    docker start "$contenedor"
done

echo "Todas las imágenes y contenedores han sido actualizados."
