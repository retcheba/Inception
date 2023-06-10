# Pull the Debian Buster image
FROM debian:buster

# Expose the port for access
EXPOSE 3306

# Install MariaDB
RUN apt-get update
RUN apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client

# # Create the folder et give the right to enable mysqld start
RUN mkdir -p /var/run/mysqld/
RUN chown -R mysql:mysql /var/run/mysqld/
RUN chmod -R 777 /var/run/mysqld/

# Copy the script to install Mysql, give the right to launch it and launch it at program start
COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh
ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

# Start MySQL server with the option to allow connections from outside the container
CMD ["/usr/sbin/mysqld", "--bind-address=0.0.0.0"]