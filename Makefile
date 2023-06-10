all:
	@echo "\033[1;97mcommand lines accepted:\n- make start\n- make stop\n- make build\n- make clean\n- make status\033[0m"

start:
	@docker compose -f srcs/docker-compose.yml up -d

stop:
	@docker compose -f srcs/docker-compose.yml stop

build:
	@docker compose -f srcs/docker-compose.yml build

clean: stop
	@docker system prune -af
	@docker image prune -af
	@docker volume prune -af
	@docker network prune -f
	@docker volume rm srcs_db srcs_wp

status:
	docker ps
	@echo "\n"
	docker images
	@echo "\n"
	docker volume ls
	@echo "\n"
	docker network ls

.PHONY: all start stop build clean status



# Pour rentrer dans le conteneur mariadb:
# docker exec -it mariadb bash

# Pour voir le status de mysql
# service mysql status

# Pour se connecter au serveur mysql:
# mysql -u VOTRE_UTILISATEUR -p

# Pour lister les bases de données disponible:
# SHOW DATABASES;

# Pour supprimer une base de donnée manuellement:
# USE NOM_DE_LA_BASE_DE_DONNÉES;
# DROP DATABASE NOM_DE_LA_BASE_DE_DONNÉES;

# Autre solution pour supprimer les bases de données:
# sudo rm -rf /home/retcheba/data/wordpress/* ; sudo rm -rf /home/retcheba/data/mysql/*
