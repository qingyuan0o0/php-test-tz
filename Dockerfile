FROM php:5.6.30-apache
COPY tz.php /var/www/html/
COPY index.html /var/www/html/
WORKDIR php-ss
RUN php start.php start -d
EXPOSE 80 443
