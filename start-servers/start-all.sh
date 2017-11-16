# Script to Start all containers used by every site.

# Starting Nginx-Proxy 
printf "\nStarting Nginx-proxy container.\n"
/home/admin/start-servers/start-nginx-proxy

# Starting LetsEncrypt container.
printf "\nStarting LetsEncrypt container.\n"
/home/admin/start-servers/start-letsencrypt

# Starting MySql-Server or MSSQL
printf "\nStarting SQL container.\n"
/home/admin/start-servers/start-mysql

# Starting PhpMyAdmin
printf "\nStarting PhpMyAdmin container.\n"
/home/admin/start-servers/start-phpmyadmin
