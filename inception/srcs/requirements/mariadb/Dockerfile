# Penultimate Debian:Buster version 
# https://wiki.debian.org/DebianBuster
FROM debian:10.11

# update needed to use apt-get install
# -yq: say yes to every installation and is also quiet
RUN apt-get update -yq

# Necessary Libraries and Packages
RUN apt-get install vim -yq
RUN apt-get install mariadb-client -yq
RUN apt-get install mariadb-server -yq

# Put the date correct
RUN ln -sf /usr/share/zoneinfo/Europe/Lisbon /etc/localtime

# Add files to the container
COPY /tools/ /tmp/

# MariaDB Port
EXPOSE 3306

ENTRYPOINT ["sh","-c", "/bin/bash /tmp/startup.sh; tail -f /dev/null"]