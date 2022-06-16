#!/bin/sh
apt update -y
apt install -y docker docker-compose git wget
sed -i 's/localhost/db/g' /php/classes/db.php
git clone https://github.com/Algap02/VIR-2-PHOTOBLOG.git
docker-compose up -d
docker-compose exec -T websrv docker-php-ext-install mysql
docker-compose exec -T websrv /etc/init.d/apache2 reload
