#!/bin/sh
apt update -y
apt install -y docker docker-compose git wget
git clone https://github.com/Algap02/VIR2-Photoblog-2.git
sed -i 's/localhost/db/g' /php/classes/db.php
cd VIR2-Photoblog-2
docker-compose up -d
docker-compose exec -T websrv docker-php-ext-install mysql
docker-compose exec -T websrv /etc/init.d/apache2 reload
