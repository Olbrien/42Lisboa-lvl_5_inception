# This script should only be ran by Makefile
# It adds hosts to /etc/hosts so you can run login.42.fr on your browser
# In my case, tisantos.42.fr

if [ $# -eq 0 ]
  then
    echo "This program is to be ran with Makefile!"
	exit 1
fi

if [ $1 == "add" ]
  then
  
    # Gets the IP address of the Nginx container
    # Saves it on a variable
    echo -n `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nginx` > nginx.txt 

    NGINX_DOCKER_IP=$(head -n 1 nginx.txt)
    echo nginx container ip is $NGINX_DOCKER_IP

    rm nginx.txt  

    # Removing extra 42.fr lines
    sudo sed -i '/42.fr/d' /etc/hosts

    # Appending to /etc/host
    sudo sed -i '1i'$NGINX_DOCKER_IP' '$USERNAME'.42.fr' /etc/hosts
    sudo sed -i '1i'$NGINX_DOCKER_IP' www.'$USERNAME'.42.fr' /etc/hosts
    sudo sed -i '1i'$NGINX_DOCKER_IP' https://www.'$USERNAME'.42.fr' /etc/hosts

fi

if [ $1 == "delete" ]
  then

    # Removing extra 42.fr lines
    sudo sed -i '/42.fr/d' /etc/hosts

fi
