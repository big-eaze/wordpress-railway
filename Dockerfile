FROM wordpress:php8.2-fpm

RUN apt-get update \
 && apt-get install -y nginx \
 && rm -f /etc/nginx/sites-enabled/default

COPY nginx.conf /etc/nginx/sites-enabled/default

EXPOSE 80

CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
