all:
	@echo "command lines accepted:\033[1;97m make up && make down\033[0m"

up:
	@docker-compose -f srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f srcs/docker-compose.yml down

clean: down
	@docker system prune -af

re: clean up

.PHONY: all build down clean re
