# This NGINX version doesn't accept env variables inside the .conf
# I substitute them here

sed -i "s/__SCHOOL_USERNAME__/$SCHOOL_USERNAME/g" /etc/nginx/sites-enabled/default
sed -i "s/__NGINX_WORDPRESS_CONTAINER_NAME__/$NGINX_WORDPRESS_CONTAINER_NAME/g" /etc/nginx/sites-enabled/default
sed -i "s/__NGINX_WORDPRESS_PORT__/$NGINX_WORDPRESS_PORT/g" /etc/nginx/sites-enabled/default

