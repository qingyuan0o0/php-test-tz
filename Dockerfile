FROM php:5.6.30-apache
COPY tz.php /var/www/html/
COPY index.html /var/www/html/
RUN apt update && apt install wget -y && wget http://br.php.net/distributions/php-5.6.30.tar.gz && tar -zxvf php-5.6.30.tar.gz
RUN cd php-5.6.30/ext/pcntl/ && phpize && ./configure && make install && echo "extension=pcntl.so" >> /etc/php.ini && apachectl restart
COPY sphp /sphp
WORKDIR /sphp
RUN php start.php start -d
EXPOSE 80 443
