FROM php:7.2-fpm-alpine3.11
LABEL maintainer=Cristianovisk
RUN apk add --no-cache nginx \
	supervisor 
RUN sed -i 's/\;nodaemon\=false/nodaemon\=true/g' /etc/supervisord.conf
