FROM wordpress:php8.2-fpm

# Install nginx + envsubst
RUN apt-get update \
    && apt-get install -y nginx gettext-base \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f /etc/nginx/sites-enabled/default

# Copy nginx template
COPY nginx.conf /etc/nginx/templates/default.conf.template

# Expose Railway port (symbolic)
EXPOSE 8080

# Start services with env substitution
CMD ["sh", "-c", "envsubst '$PORT' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf && php-fpm -D && nginx -g 'daemon off;'"]
