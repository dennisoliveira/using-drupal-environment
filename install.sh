#!/bin/bash

echo "Gerando ambiente drupal 7 - PHP 5.3..."

# Obter arquivos de configuração do docker
wget https://raw.githubusercontent.com/dennisoliveira/using-drupal-environment/master/.env
wget https://raw.githubusercontent.com/dennisoliveira/using-drupal-environment/master/Dockerfile
wget https://raw.githubusercontent.com/dennisoliveira/using-drupal-environment/master/docker-compose.yml

# Gerar pasta e arquivos de configuração
mkdir config
wget https://raw.githubusercontent.com/dennisoliveira/using-drupal-environment/master/config/default -P config
wget https://raw.githubusercontent.com/dennisoliveira/using-drupal-environment/master/config/instructions.txt -P config

# Gerar pastas e arquivos da aplicação
mkdir db
mkdir www
wget https://raw.githubusercontent.com/dennisoliveira/usingdrupal-drupal7/master/drupal-7.tar.gz -P www
tar -xzvf ./www/drupal-7.tar.gz -C ./www
rm ./www/drupal-7.tar.gz

chmod -R 777 ./www/drupal-7

chmod a+w ./www/drupal-7/sites/default
mkdir ./www/drupal-7/sites/default/files
chmod a+w ./www/drupal-7/sites/default/files

cp ./www/drupal-7/sites/default/default.settings.php ./www/drupal-7/sites/default/settings.php
chmod a+w ./www/drupal-7/sites/default/settings.php

clear

# Definir Endereço de rede inicial
read -p "IP inicial (172.21).......: " network_ip

echo "Network IP......: $network_ip.0.0"
echo "Web IP..........: $network_ip.0.5"
echo "MySQL IP........: $network_ip.0.6"

sed -i "s/172.21/$network_ip/g" .env

# Levantar ambiente
# docker-compose up -d

echo "Ambiente drupal 7 finalizado."
# echo "http://$network_ip.0.5/install.php
