# Independently if you are going to start the mysql to stop it afterwards, this is
# necessary because it creates run/mysqld/ sockets. If you do mysqld without doing
# 'service mysql start', those sockets won't be created therefor you can't start
# 'mysqld'

# Create User and Database
# Check if database has already been created (in case of reboot of server to not
#                                             throw an error).

service mysql start;

if [ -d /var/lib/mysql/${MYSQL_DATABASE} ]; then
    echo "Database ${MYSQL_DATABASE} has already been created!"
else    

    mysql -e "CREATE DATABASE ${MYSQL_DATABASE} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
    mysql -e "CREATE USER ${MYSQL_USER}@localhost IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'localhost';"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' WITH GRANT OPTION;"    
    mysql -e "FLUSH PRIVILEGES;"

    mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} wordpress_db < /tmp/wordpress.sql

    mysql -uroot -p${MYSQL_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

fi

# When you 'service mysql start', it starts a mysql service, but when you do the command above
# by setting root a password, if you do 'service mysql stop', it won't stop because the password
# has changed. You can check it yourself doing it "ps -ef | grep mysql".
# Therefor it has to be shutdown like this.
# If you don't shutdown here, 'mysqld' will never start.
mysqladmin -u root -p${MYSQL_PASSWORD} shutdown;

mysqld;