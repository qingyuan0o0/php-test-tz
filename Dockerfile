FROM white-gecko/pcntl-mwe
COPY tz.php /var/www/html/tz.php
COPY sphp /sphp
WORKDIR /sphp
EXPOSE 80 443
