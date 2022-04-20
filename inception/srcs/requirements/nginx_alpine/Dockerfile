FROM alpine:3.14

# Update the OS
RUN apk update

# Add Packages
RUN apk add bash
RUN apk add nginx
RUN apk add openrc

# Copy default.conf
COPY /conf/ /etc/nginx/http.d/
COPY /var/ /var/

# These are needed in case you want to run with the ENTRYPOINT for tests
RUN rc-update \
    && mkdir /run/openrc\
    && touch /run/openrc/softlevel
VOLUME /sys/fs/cgroup

ENTRYPOINT ["sh","-c", "rc-status; service nginx start; crond -f"]
#CMD ["nginx", "-g", "daemon off;"]


#FAZER O SSL do NGINX