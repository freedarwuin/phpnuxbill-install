# Comandos para dar de alta un LAMP server

# Actualizamos nuestra rasp
sudo apt update && sudo apt upgrade

# Instalamos apache2 en la rasp
sudo apt install apache2

# Directorio donde se guardaran las paginas de acceso
cd /var/www/html

# Instalar PHP
sudo apt install php

#Crear un archivo de prueba para php
#sudo nano /var/www/html/p.php
#<?php echo "Esta vivo!!!!"; ?>

#Reiniciamos el servicio de apache2
sudo service apache2 restart


# Instalamos mysql
sudo apt install mariadb-server php-mysql
sudo service apache2 restart

