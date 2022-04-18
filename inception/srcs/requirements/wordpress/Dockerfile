FROM debian:10.11

# Update Debian
# Needed to use apt-get install
# apt-utils is to surpress annoying warning
RUN apt-get update -yq
RUN apt-get install apt-utils -yq
RUN apt-get install dialog -yq

# These ones are to delete
# Just for tests
RUN apt-get install nginx -yq
RUN apt-get install mariadb-server -yq

# Necessary Libraries and Packages
# apt-utils is to surpress annoying warning
# -yq: say yes to every installation and is also quiet
RUN apt-get install vim -yq
RUN apt-get install php-cli php-fpm php-mysql php-json php-opcache php-mbstring php-xml \
                php-gd php-curl -yq

ENTRYPOINT [ "tail", "-f", "/dev/null" ]