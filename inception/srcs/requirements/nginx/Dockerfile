# Penultimate Debian:Buster version 
# https://wiki.debian.org/DebianBuster
FROM debian:10.11

# update needed to use apt-get install
# -yq: say yes to every installation and is also quiet
RUN apt-get update -yq

# Necessary Libraries and Packages
RUN apt-get install nginx -yq
RUN apt-get install vim -yq
RUN apt install openssl -yq

# Put the date correct
RUN ln -sf /usr/share/zoneinfo/Europe/Lisbon /etc/localtime

# Create SSL Key
RUN mkdir /etc/nginx/ssl
RUN chmod 700 /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 \
                -x509 \
                -sha256 \
                -days 3650 \
                -nodes \
                -out /etc/nginx/ssl/example.crt \
                -keyout /etc/nginx/ssl/example.key \
                -subj "/C=PO/ST=Lisbon/L=Lisbon/O=42Lisboa/OU=42Lisboa/CN=tisantos.42.fr"

# Copy startup and nginx.conf to their places
COPY /tools/ /tmp/
COPY /conf/nginx.conf /etc/nginx/


ENTRYPOINT ["sh","-c", "/bin/bash /tmp/startup.sh;"]