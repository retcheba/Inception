FROM debian:buster

EXPOSE 3306

# Installation de MariaDB
RUN apt-get update
RUN apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client

RUN mkdir -p /var/run/mysqld/
RUN chown -R mysql:mysql /var/run/mysqld/
RUN chmod -R 777 /var/run/mysqld

COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

CMD ["/usr/sbin/mysqld", "--bind-address=0.0.0.0"]