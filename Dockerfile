FROM debian:stretch
MAINTAINER Lazy Pivoteam

# Installing
RUN	apt-get update \
	&& apt-get install nginx php-fpm php-mysql wget rsync -y \
	&& cd /var/www/html \
	&& rm * \
	&& wget https://wordpress.org/latest.tar.gz \
	&& tar -xzvf latest.tar.gz \
	&& rm latest.tar.gz \
	&& rsync -avP wordpress/ . \
	&& rm -rf wordpress \
	&& cd / \
	&& chown -R www-data:www-data /var/www/html \
	&& rm /etc/nginx/sites-available/* \
        && rm /etc/nginx/sites-enabled/*

COPY nginx.conf /etc/nginx/sites-available/
COPY start.sh start.sh
RUN chmod 775 start.sh

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled

EXPOSE 80

CMD ["./start.sh"] 
