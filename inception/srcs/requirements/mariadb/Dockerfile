# Penultimate Debian:Buster version 
# https://wiki.debian.org/DebianBuster
FROM debian:10.11

# update needed to use apt-get install
# -yq: say yes to every installation and is also quiet
RUN apt-get update -yq

# Necessary Libraries and Packages
RUN apt-get install vim -yq
RUN apt-get install procps -yq
RUN apt-get install mariadb-server -yq

# Put the date correct
RUN ln -sf /usr/share/zoneinfo/Europe/Lisbon /etc/localtime

# Add files to the container
COPY /tools/ /tmp/
COPY /conf/wordpress.sql /tmp/

# Configure MariaDB
COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN mysql_install_db

ENTRYPOINT ["sh","-c", "/bin/bash /tmp/startup.sh;"]