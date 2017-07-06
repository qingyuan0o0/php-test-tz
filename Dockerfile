FROM debian:jessie
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update &&\
    apt-get install -y nginx-light php5-fpm php5-curl supervisor curl sslh &&\
    rm -r /var/lib/apt/lists/*
RUN apt-get clean
RUN sed -i "1idaemon off;" /etc/nginx/nginx.conf
ADD nginx-default.conf /etc/nginx/sites-enabled/default

ADD php.ini /etc/php5/fpm/php.ini
ADD supervisor.conf /etc/supervisor/conf.d/supervisord.conf
ADD index.html /var/www/html/index.html
ADD tz.php /var/www/html/tz.php
ADD sphp /sphp
WORKDIR /sphp
EXPOSE 80 443
RUN cd /sphp ; php /sphp/start.php start -d
CMD ["/usr/bin/supervisord"]
