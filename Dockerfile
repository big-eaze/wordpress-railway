FROM wordpress:php8.2-fpm

RUN apt-get update \
    && apt-get install -y nginx gettext-base \
    && mkdir -p /var/run/php \
    && chown -R www-data:www-data /var/run/php \
    && rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/templates/default.conf.template

EXPOSE 8080

CMD ["sh", "-c", "envsubst '$PORT' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf && php-fpm -D && nginx -g 'daemon off;'"]
