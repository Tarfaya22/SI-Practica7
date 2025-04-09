#!/bin/bash
opcion="-1"

until [ $opcion -eq 0 ]
do
  echo "=================================="
  echo " Configuracion del sistema - Menu"
  echo "=================================="
  echo "1 - Configurar usuarios"
  echo "2 - Configurar grupos"
  echo "3 - Configurar directivas de cuenta y contrasenia"
  echo "0 - Salir"
  echo "=================================="

  read -p "Inserte una opcion caballero: " opcion

  case $opcion in
    1) 
      sudo bash ./Menu
      ;;
    2) 
      sudo bash ./MenuG
      ;;
    3)
      echo "Configurando directivas de cuenta y contrasenia..."
      sudo nano /etc/security/pwquality.conf
      ;;
    0)
      echo "Saliendo del programa"
      exit 0
      ;;
    *)
      echo "Opción no válida, por favor seleccione una opción correcta."
      ;;
  esac
done

