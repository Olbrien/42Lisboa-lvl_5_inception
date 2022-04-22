# Start MariaDB first.
# If you don't wait, when you try to access to mysql, with the below commands 'mysql -e' etc...
# it won't work because mysql service hasn't started yet.
service mysql start;
sleep 2;

# Create User and Database
# Check if database has already been created (in case of reboot of server to not
#                                             throw an error).

if [ -d /var/lib/mysql/${MYSQL_DATABASE} ]; then
    echo "Database ${MYSQL_DATABASE} has already been created!"
else    
    mysql -e "CREATE DATABASE ${MYSQL_DATABASE} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
    mysql -e "CREATE USER ${MYSQL_USER}@localhost IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'localhost';"
    mysql -e "FLUSH PRIVILEGES;"

    mysql -uroot -p${MYSQL_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
fi