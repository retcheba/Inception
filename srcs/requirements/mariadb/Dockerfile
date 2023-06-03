FROM debian:buster

EXPOSE 3306

# Installation de MariaDB Server
RUN apt-get update
RUN apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client

# Copie du fichier de configuration personnalisé
# RUN rm /etc/mysql/my.cnf
# COPY conf/my.cnf /etc/mysql/my.cnf

RUN mkdir -p /var/run/mysqld/
RUN chown -R mysql:mysql /var/run/mysqld/
RUN chmod -R 777 /var/run/mysqld

RUN chown -R mysql:mysql /var/lib/mysql

RUN chown -R mysql:mysql /usr/bin/mysql

USER mysql

# Démarrage du service MariaDB
# RUN service mysql stop
# RUN service mysql start

# RUN mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'caca' WITH GRANT OPTION; FLUSH PRIVILEGES;"

CMD ["/usr/sbin/mysqld", "--bind-address=0.0.0.0"]