# Penultimate Debian:Buster version 
# https://wiki.debian.org/DebianBuster
FROM debian:10.11

# update needed to use apt-get install
# apt-utils and dialog is to surpress annoying warning
# -yq: say yes to every installation and is also quiet
RUN apt-get update -yq
#RUN apt-get install apt-utils -yq
#RUN apt-get install dialog -yq

# These ones are to delete
# Just for tests
RUN apt-get install nginx -yq
#RUN apt-get install mariadb-server -yq

# Necessary Libraries and Packages
RUN apt-get install cron -yq
RUN apt-get install vim -yq
#RUN apt-get install php-cli php-fpm php-mysql php-json php-opcache php-mbstring php-xml \
#                    php-gd php-curl -yq

# Add files to the container
ADD tools .

# Configure Crontab to run boot.sh every time the container restarts
RUN echo @reboot /tmp/boot.sh >> /var/spool/cron/crontabs/root


ENTRYPOINT [ "tail", "-f", "/dev/null" ]