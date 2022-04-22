#### ######## #### #### ######## #### #### ######## #### #### ######## #### #### ######## ####

all:	up

up: create_volumes
	@if [ -f srcs/.env ]; then \
		sudo echo "Up!"; \
		cd srcs && docker-compose up --build -d; \
		cd .. && sudo bash hosts.sh add; \
	else \
		printf "\n\033[1;22m!! You need to add the .env variable !! \e[0m \n\n"; \
	fi

down:
	@sudo echo "Down!";
	@cd srcs && docker-compose down
	@sudo bash hosts.sh delete

clean: delete_volumes
	@sudo echo "Clean!";
	@cd srcs && docker-compose down
	@cd srcs && docker system prune -a --volumes
	@sudo bash hosts.sh delete

fclean:	clean delete_volumes

re:		fclean up

create_volumes:
	@sudo mkdir -p /home/${USERNAME}/data/mariadb-volume
	@sudo mkdir -p /home/${USERNAME}/data/wordpress-volume
	@sudo mkdir -p /home/${USERNAME}/data/nginx-volume

delete_volumes:
	@sudo rm -fr /home/${USERNAME}/data/mariadb-volume
	@sudo rm -fr /home/${USERNAME}/data/wordpress-volume
	@sudo rm -fr /home/${USERNAME}/data/nginx-volume

#### ######## #### #### ######## #### #### ######## #### #### ######## #### #### ######## ####
