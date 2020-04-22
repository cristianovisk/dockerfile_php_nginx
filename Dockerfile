FROM php:7.2-fpm-alpine3.11
LABEL maintainer=Cristianovisk
RUN apk add --no-cache nginx \
	supervisor
COPY nginx.ini /etc/supervisor.d/nginx.ini
COPY default.conf /etc/nginx/conf.d/default.conf
COPY index.php /var/www/html
RUN sed -i 's/\;nodaemon\=false/nodaemon\=true/g' /etc/supervisord.conf ;\
    sed -i 's/user nginx\;/user www\-data\;/' /etc/nginx/nginx.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
