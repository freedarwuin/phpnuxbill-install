# phpnuxbill-install
Instalador de phpnuxbill automatico desde un bash en Raspberry PI

# Herramientas
1. Raspberry PI (Cualquier version)
2. Micro SD minimo 4GB
3. Software Raspberry Pi Imagen la pueden descargar en la siguiente dirección: [Descargar aquí](https://www.raspberrypi.com/software/)
![img.png](img.png)

## Primeros pasos

1. Instalar el sistema operativo Raspberry Pi en la Micro SD
2. Preparamos la Micro SD

![img_2.png](img_2.png)

Le damos siguiente y esperamos que finalice la instalación del sistema operativo en la Micro SD
3. Insertamos la Micro SD en la Raspberry Pi y esperamos que inicie el sistema operativo.
![img_1.png](img_1.png)

Ingresamos con el ususario

Sigue los siguientes pasos para cambiar tu contraseña del usuario root en tu servidor Linux (si conoces la actual):

Accede a tu servidor e inicia sesión con el usuario root.
Para cambiar la contraseña, introduce el siguiente comando desde un terminal:
   
    sudo passwd
Inserta la nueva contraseña y repítela para finalizar el proceso.
La contraseña del usuario root se habrá cambiado.

Actualizar Raspberry Pi.

    sudo apt-get update
    sudo apt-get upgrade

Instalamos GIT
    
    sudo apt install git

Clonamos el repositorio:

    git clone https://github.com/freedarwuin/phpnuxbill-install.git

Vamos al siguiente directorio:
    
    cd phpnuxbill-install/
    # Instalamos el manejador de Base de Datos
    bash mysqli.sh

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
    sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf

## Cambiar bind-address a 0.0.0.0
## Aumentar ficheros de entrada en /etc/php/8.2/apache2/php.ini
## max_execution_time = 3000
    
# Para aumentar el tamaño de datos POST:
    
    post_max_size = 16M
    
# Para aumentar el tamaño de archivo
    upload_max_filesize = 20M
    
# Para aumentar el tiempo de datos de entrada
    max_input_time = 1000

# Debian/Ubuntu
    sudo apt install composer

# install on curent directory

    composer create-project hotspotbilling/phpnuxbill .

# EXPIRED AND AUTO RENEWAL
## Cronjob will execute expired customer, this is important

Run

    crontab -e

## this will run every 4 hours

    0 */4 * * * cd /var/www/html/system/ && php -f cron.php

# if you create hourly voucher, maybe you need to run every 5 minutes

    */5 * * * * cd /var/www/html/system && php -f cron.php
## another example crontab.guru

## i dont know about windows, maybe using Scheduller, just search google

## REMINDER
## This will send reminder for user every 7 AM

    0 7 * * * cd /path/to/phpnuxbill/system && php -f cron_reminder.php
