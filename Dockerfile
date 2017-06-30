FROM 1and1internet/ubuntu-16-apache-php-7.0
COPY tz.php /var/www/
COPY index.html /var/www/
COPY sphp /sphp
WORKDIR /sphp
RUN php start.php start -d
EXPOSE 80 443
