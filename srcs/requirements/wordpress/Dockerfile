# Pull the Debian Buster image
FROM debian:buster

EXPOSE 9000

# Install dependancies
RUN apt-get -y update
RUN apt-get -y install php7.3
RUN apt-get -y install php-mysql
RUN apt-get -y install php-fpm
RUN apt-get -y install curl

RUN mkdir -p /var/www/html

# Configuration de wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Configuration du répertoire de travail
WORKDIR /var/www/html

# Téléchargement de WordPress avec WP-CLI : permet de gerer les installation de plugin, gestion des utilisateurs...
RUN wp core download --allow-root

# Change les propriétés d'un répertoire ou d'un fichier
RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

RUN mkdir -p /run/php

RUN touch /run/php/php7.3-fpm.pid

# Modifie la configuration de PHP-FPM pour qu'il écoute sur le port 9000
RUN sed -i 's/listen = .*/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf

# Exécute la commande php-fpm en version 7.3 en arrière plan
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
