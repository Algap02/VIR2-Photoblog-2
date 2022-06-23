#!/bin/sh
apt update -y
apt upgrade -y
apt install -y docker docker-compose git

wget -nc https://raw.githubusercontent.com/Algap02/VIR2-Photoblog-2/main/docker-compose.yaml
wget -nc https://raw.githubusercontent.com/Algap02/VIR2-Photoblog-2/main/dockerfile

git clone https://github.com/7ric/Photoblog.git /php
sed -i 's/localhost/db/g' /php/classes/db.php

docker-compose up -d
docker-compose exec -T websrv docker-php-ext-install mysql
docker-compose exec -T websrv /etc/init.d/apache2 reload


docker build -t dockerfile .
docker run -it dockerfile bash
