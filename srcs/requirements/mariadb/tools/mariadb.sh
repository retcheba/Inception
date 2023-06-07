#!/bin/sh

# Initialize MySQL database installation
mysql_install_db

# Starts the MySQL service
/etc/init.d/mysql start

# Check if the database exists
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 

	echo "Database already exists"
else

# Secure installation of MySQL
mysql_secure_installation << _EOF_

Y
root4life
root4life
Y
n
Y
Y
_EOF_

# Create a "root" user with full privileges
echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

# Create a new database with a user with full privileges on this database
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root

# Import the wordpress.sql file into the database
mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql

fi

# Stops the MySQL service
/etc/init.d/mysql stop

exec "$@"