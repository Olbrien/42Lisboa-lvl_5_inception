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
RUN mkdir ssl
RUN openssl req -newkey rsa:4096 \
                -x509 \
                -sha256 \
                -days 3650 \
                -nodes \
                -out /ssl/example.crt \
                -keyout /ssl/example.key \
                -subj "/C=PO/ST=Lisbon/L=Lisbon/O=42Lisboa/OU=42Lisboa/CN=tisantos.42.fr"

# Copy tools inside the container
COPY /tools/ /tmp/
COPY /conf/ /etc/nginx/sites-enabled

ENTRYPOINT ["sh","-c", "/bin/bash /tmp/startup.sh; service nginx start; tail -f /dev/null"]
#CMD ["nginx", "-g", "daemon off;"]