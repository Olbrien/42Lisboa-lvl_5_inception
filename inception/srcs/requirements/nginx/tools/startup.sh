# This NGINX version doesn't accept env variables inside the .conf
# I substitute them here

sed -i "s/__SCHOOL_USERNAME__/$SCHOOL_USERNAME/g" /etc/nginx/sites-enabled/default


# Tests purpose, to delete
sed -i 's/nginx/tisantos and skrillex/g' /var/www/html/index.nginx-debian.html