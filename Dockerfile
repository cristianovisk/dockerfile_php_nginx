FROM php:7.2-fpm-alpine3.11
LABEL maintainer=Cristianovisk
RUN apk add --no-cache nginx \
	supervisor
COPY nginx.ini /etc/supervisor.d/nginx.ini
RUN sed -i 's/\;nodaemon\=false/nodaemon\=true/g' /etc/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]