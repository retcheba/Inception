all:
	@echo "\033[1;97mcommand lines accepted:\n- make up (to start)\n- make down (to stop)\n- make build (to build)\n- make clean (to erase)\033[0m"

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
