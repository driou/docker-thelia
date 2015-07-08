FROM driou/lemp-stack
MAINTAINER Adrien Bourroux <a.bourroux@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
# Updating Package List

RUN chown -R www-data. /usr/share/nginx/html/ && \
	chmod -R 755 /usr/share/nginx/html/

ADD supervisor/php5-fpm.conf /etc/supervisor/conf.d/php5-fpm.conf
ADD supervisor/nginx.conf /etc/supervisor/conf.d/nginx.conf
ADD supervisor/mysql.conf /etc/supervisor/conf.d/mysql.conf

WORKDIR /usr/share/nginx/html/thelia/

VOLUME /etc/nginx/sites-enabled/
VOLUME /etc/php5/fpm/
VOLUME /usr/share/nginx/html/

EXPOSE 80
CMD ["/usr/bin/supervisord", "--nodaemon", "-c", "/etc/supervisor/supervisord.conf"]
