#!/bin/bash
imagenes=$(docker images -q)
for imagen in $imagenes; do
    docker pull "$imagen"
done

contenedores=$(docker ps -q)
for contenedor in $contenedores; do
    docker stop "$contenedor"
    docker start "$contenedor"
done

echo "Ya han sido actualizados."
