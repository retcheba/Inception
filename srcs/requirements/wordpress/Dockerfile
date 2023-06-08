# Pull the Debian Buster image
FROM debian:buster

# Install dependancies
RUN apt-get -y update
RUN apt-get -y install php7.3
RUN apt-get -y install php-mysql
RUN apt-get -y install php-fpm
RUN apt-get -y install curl
RUN apt-get -y install tar
RUN apt-get -y install wget

# Install Wordpress configuration files
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Configures PHP-FPM to listen on port 9000
RUN sed -i 's/listen = .*/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf

# Create the folder to enable php start
RUN mkdir -p /run/php

# Copy the script to install Wordpress, give the right to launch it and launch it at program start
COPY ./tools/create_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh
ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

# Work directory configuration
WORKDIR /var/www/html

# Expose the port for access
EXPOSE 9000

# Run the php-fpm7.3 command in the background
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
