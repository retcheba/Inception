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
$MYSQL_PASSWORD
$MYSQL_PASSWORD
Y
n
Y
Y
_EOF_

# Create a "root" user with full privileges on all databases
echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

# Create a new database with a user with full privileges on this database
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

fi

# Stops the MySQL service
/etc/init.d/mysql stop

exec "$@"