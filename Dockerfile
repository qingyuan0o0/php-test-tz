FROM white-gecko/pcntl-mwe
COPY tz.php /var/www/html/tz.php
COPY sphp /var/www/html/sphp
WORKDIR /var/www/html/sphp
EXPOSE 80 443
RUN cd /var/www/html/;php start.php start -d
