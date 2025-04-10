# SI-Practica7
![imagen de sistemas](https://cdn-icons-png.flaticon.com/512/12539/12539895.png)
## Descripción
Esta es la practica 7 de sistemas, la práctica trarta sobre la creacion de usuarios grupos y directivas. Esta formada por un pdf donde esta el video explicativo y una carpeta donde estan todos los comando y los scripts

---
## Esta formado por:
### Main.sh
```sh
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
```
---
## Estaformado por:
### Menu
```sh
#!/bin/bash
opcion="-1"

until [ $opcion -eq 0 ]
do
  echo "============================="
  echo " Gestion de usuarios - Menu"
  echo "============================="
  echo "1 - Crear usuario"
  echo "2 - Eliminar usuario"
  echo "3 - Bloquear usuario"
  echo "4 - Desbloquear usuario"
  echo "5 - Listar usuarios"
  echo "0 - Salir"
  echo "============================="

  read -p "Inserte una opcion caballero" opcion

  case $opcion in
    1) 
      read -p "Ingrese un nombre de usuario: " usuario
      sudo useradd "$usuario" 
      echo "Usuario creado"
      ;;
    2) 
      read -p "Ingrese el nombre del usuario a eliminar: " usuario
      sudo userdel "$usuario"
      echo "Usuario eliminado"
      ;;
    3) 
      read -p "Bloquear a qué usuario: " usuario
      sudo usermod -L "$usuario"
      echo "Bloqueando el usuario: $usuario"
      ;;
    4) 
      read -p "A qué usuario desbloqueo: " usuario
      	sudo usermod -U "$usuario"  # Desbloquear la cuenta
	read -sp "Ingrese la nueva contraseña para el usuario $usuario: " password
	echo "$usuario:$password" | sudo chpasswd  # Establecer una nueva contraseña
	echo "Usuario desbloqueado y contraseña establecida"
      ;;
    5) 
      echo "Lista de usuarios:"
      cut -d: -f1 /etc/passwd
      ;;
    0) 
      echo "Saliendo del programa"
      exit 0
      ;;
    *) 
      echo "Tiene que ser un valor entre 0 y 5"
      ;;
  esac

done
```
---
### MenuG
```sh
#!/bin/bash
opcion="-1"

until [ $opcion -eq 0 ]
do

echo "============================="
echo " Gestion de grupos - Menu"
echo "============================="
echo "1 - Crear grupo"
echo "2 - Eliminar grupo"
echo "3 - Modificar nombre del grupo"
echo "4 - Listar grupos"
echo "0 - Salir"
echo "============================="

read -p "Inserte una opcion caballero: " opcion

case $opcion in
1) 
   read -p "Ingrese el nombre del grupo a crear: " grupo
   sudo groupadd "$grupo"
   echo "Grupo '$grupo' creado"
   ;;
2) 
   read -p "Ingrese el nombre del grupo a eliminar: " grupo
   sudo groupdel "$grupo"
   echo "Grupo '$grupo' eliminado"
   ;;
3) 
   read -p "Ingrese el nombre del grupo a modificar: " grupo_antiguo
   read -p "Ingrese el nuevo nombre del grupo: " grupo_nuevo
   sudo groupmod -n "$grupo_nuevo" "$grupo_antiguo"
   echo "Nombre del grupo cambiado de '$grupo_antiguo' a '$grupo_nuevo'"
   ;;
4) 
   echo "Listado de grupos:"
   sudo getent group
   ;;
0) 
   echo "Saliendo del programa"
   exit 0
   ;;
*) 
   echo "Debe insertar un valor entre 0 y 4"
   ;;
esac

done
```



