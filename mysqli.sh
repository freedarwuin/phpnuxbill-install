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

# Despues de instalar mysql, le damos la configiracion inicial.
sudo mysql_secure_installation

# Creamos un nuevo usuario
sudo mysql --user=root --password
create user admin@'%' identified by 'p0o9i8u7';
grant all privileges on *.* to admin@localhost;
FLUSH PRIVILEGES;
exit;

# Instalamos phpmyadmin
sudo apt install phpmyadmin

# Enlazamos phpmyadmin con mysql
sudo phpenmod mysqli
sudo service apache2 restart

# Cambios en el archivo de configuracion de MYSQL para admitir conexiones remotas
#sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf
#Cambiar bind-address a 0.0.0.0
#Aumentar ficheros de entrada en /etc/php/7.3/apache2/php.ini
#â€“ max_execution_time = 3000
#Para aumentar el tamaÃ±o de datos POST:
#â€“ post_max_size = 16M
#Para aumentar el tamaÃ±o de archivo
#â€“ upload_max_filesize = 20M
#Para aumentar el tiempo de datos de entrada
#â€“ max_input_time = 1000

