#!/bin/bash
#este script usa bc para la calculadora
mostrar_menu() {
    echo "============================"
    echo "   Calculadora en Bash"
    echo "============================"
    echo "1. Suma"
    echo "2. Resta"
    echo "3. Multiplicación"
    echo "4. División"
    echo "5. Potencia"
    echo "6. Raíz cuadrada"
    echo "7. Logaritmo (base 10)"
    echo "8. Seno"
    echo "9. Coseno"
    echo "10. Salir"
    echo "============================"
    echo -n "Selecciona una opción: "
}

while true; do
    mostrar_menu
    read opcion

    case $opcion in
        1) 
            echo -n "Introduce el primer número: "
            read num1
            echo -n "Introduce el segundo número: "
            read num2
            result
