#### ######## #### #### ######## #### #### ######## #### #### ######## #### #### ######## ####

all:	up

up:
	cd srcs && docker-compose up --build -d
	sudo bash hosts.sh add

down:
	cd srcs && docker-compose down
	sudo bash hosts.sh delete

clean:
	cd srcs && docker-compose down
	cd srcs && docker system prune -a --volumes
	sudo bash hosts.sh delete

fclean:	clean

re:		fclean up

#### ######## #### #### ######## #### #### ######## #### #### ######## #### #### ######## ####
