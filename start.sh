#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then
  WORDPRESS_DB="wordpress"
  WORDPRESS_HOST="mysql-server"
  WORDPRESS_USER="root"
  WORDPRESS_PASSWORD="root"

  cp /var/www/wp-site1/html/wp-config-sample.php /var/www/html/wp-config.php

  sed -i "s/database_name_here/$WORDPRESS_DB/
  s/username_here/$WORDPRESS_USER/
  s/localhost/$WORDPRESS_HOST/
  s/password_here/$WORDPRESS_PASSWORD/" /var/www/html/wp-config.php

  chown www-data:www-data /var/www/html/
fi

service php7.0-fpm start

service nginx start
tail -f /dev/null
