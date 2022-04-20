# This NGINX version doesn't accept env variables inside the .conf
# I substitute them here

sed -i "s/__SCHOOL_USERNAME__/$SCHOOL_USERNAME/g" /etc/nginx/sites-enabled/default
