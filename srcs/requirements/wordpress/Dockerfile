# Pull the Debian Buster image
FROM debian:buster

# Expose the port for access
EXPOSE 9000

# Install dependancies
RUN apt-get -y update
RUN apt-get -y install php7.3
RUN apt-get -y install php-mysql
RUN apt-get -y install php-fpm
RUN apt-get -y install curl

# Wordpress configuration
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Work directory configuration
RUN mkdir -p /var/www/html
WORKDIR /var/www/html

# Download WordPress with WP-CLI
RUN wp core download --allow-root

# Changes working directory properties
RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

RUN mkdir -p /run/php

# Configures PHP-FPM to listen on port 9000
RUN sed -i 's/listen = .*/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf

# Removes files after package installation to reduce the size of the container image
RUN rm -rf /var/lib/apt/lists/*

# Exécute la commande php-fpm en version 7.3 en arrière plan
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
