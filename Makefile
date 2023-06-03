all:
	@echo "command lines accepted:\033[1;97m make up && make down\033[0m"

up:
	@docker compose -f srcs/docker-compose.yml up -d

down:
	@docker compose -f srcs/docker-compose.yml down

build:
	@docker compose -f srcs/docker-compose.yml build

clean: down
	@docker system prune -af
	@docker image prune -af
	@docker volume prune -af
	@docker network prune -f

re: clean build up

.PHONY: all up down build clean re
