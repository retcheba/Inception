all:
	@echo "command lines accepted:\033[1;97m make up && make down\033[0m"

build:
	@docker compose -f srcs/docker-compose.yml build

up:
	@docker compose -f srcs/docker-compose.yml up

down:
	@docker compose -f srcs/docker-compose.yml down

clean: down
	@docker system prune -af
	@docker image prune -af
	@docker volume prune -af
	@docker network prune -f

re: clean build up

.PHONY: all build up down clean re
