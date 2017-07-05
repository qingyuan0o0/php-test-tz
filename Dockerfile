FROM debian:jessie
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update &&\
    apt-get install -y nginx-light php5-fpm php5-curl supervisor &&\
    rm -r /var/lib/apt/lists/*

RUN sed -i "1idaemon off;" /etc/nginx/nginx.conf
ADD nginx-default.conf /etc/nginx/sites-enabled/default

ADD php.ini /etc/php5/fpm/php.ini
ADD supervisor.conf /etc/supervisor/conf.d/supervisord.conf
COPY tz.php /var/www/html/tz.php
COPY sphp /sphp
WORKDIR /sphp
EXPOSE 80 443
RUN cd /var/www/html/ ; php -r "readfile('https://getcomposer.org/installer');" 

CMD ["/usr/bin/supervisord"]
