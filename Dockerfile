FROM wordpress:php8.2-fpm

RUN apt-get update \
    && apt-get install -y nginx gettext-base \
    && sed -i 's|^listen = .*|listen = 127.0.0.1:9000|' /usr/local/etc/php-fpm.d/www.conf \
    && rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/templates/default.conf.template

EXPOSE 8080

CMD ["sh", "-c", "echo \"PORT=$PORT\" && envsubst '$PORT' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -t && php-fpm -D && nginx -g 'daemon off;'"]
