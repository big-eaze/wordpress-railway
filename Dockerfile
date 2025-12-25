FROM wordpress:php8.2-fpm

# Install nginx
RUN apt-get update \
    && apt-get install -y nginx \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f /etc/nginx/sites-enabled/default

# Copy nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Railway uses dynamic ports
EXPOSE 8080

# Start both services correctly
CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
