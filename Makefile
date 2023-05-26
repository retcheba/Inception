all:
	@echo "command lines accepted:\033[1;97m make up && make down\033[0m"

up:
	@docker-compose -f srcs/docker-compose.yml up -d

down:
	@docker-compose -f srcs/docker-compose.yml down

.PHONY: all build down
