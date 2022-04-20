#### ######## #### #### ######## #### #### ######## #### #### ######## #### #### ######## ####

all:	up

up:
	@if [ -f srcs/.env ]; then \
		cd srcs && docker-compose up --build -d; \
		cd .. && sudo bash hosts.sh add; \
	else \
		printf "\n\033[1;22m!! You need to add the .env variable !! \e[0m \n\n"; \
	fi

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
