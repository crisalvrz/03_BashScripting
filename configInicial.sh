#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Por favor, ejecuta este script como usuario root o con sudo."
    exit 1
fi

echo "Actualizando sistema..."
apt update -y && apt upgrade -y

echo "Instalando paquetes esenciales..."
apt install -y curl wget git vim net-tools htop build-essential

echo "Configurando SSH..."
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart ssh

echo "Estableciendo configuraciones básicas..."
timedatectl set-timezone America/Mexico_City
echo "vm.swappiness=10" >> /etc/sysctl.conf
sysctl -p

echo "Configuración inicial completada. Reinicia la máquina para aplicar cambios."

