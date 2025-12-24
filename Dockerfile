# Use PHP-FPM WordPress image
FROM wordpress:php8.2-fpm

# Install Nginx and remove default site
RUN apt-get update \
    && apt-get install -y nginx \
    && rm -f /etc/nginx/sites-enabled/default \
    && rm -rf /var/lib/apt/lists/*

# Copy custom Nginx config
COPY nginx.conf /etc/nginx/sites-enabled/default

# Expose port 80
EXPOSE 80

# Start PHP-FPM and Nginx in foreground
CMD ["sh", "-c", "php-fpm && nginx -g 'daemon off;'"]
